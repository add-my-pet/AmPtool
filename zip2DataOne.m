%% zip2DataOne
% inserts a DOI into the mydata file of an AmP entry zip, re-zips, and uploads to DataONE

%%
function doi = zip2DataOne(zip_path, token)
% created 2026/06/15 by Bas Kooijman

%% Syntax
% doi = <../zip2DataOne.m *zip2DataOne*>(zip_path, token)

%% Description
% Unpacks an AmP entry zip file, writes the DOI into the mydata file
% (as metaData.doi), re-zips, then uploads to the KNB member node of
% DataONE. The DOI encodes the species name and version date from the
% filename, e.g. Abatus_cordatus_20190117.zip yields
%   doi:10.5063/AmP.Abatus_cordatus.20190117
%
% Input:
%
% * zip_path: character string with full path to the zip file
% * token:    character string with DataONE authentication token
%
% Output:
%
% * doi: character string with the minted DOI, or empty string on failure

%% Remarks
% Requires a DataONE account and API token from https://search.dataone.org.
% The KNB member node (https://knb.ecoinformatics.org) is used as the
% upload target; its DOI prefix is 10.5063.
% A temporary directory is created and removed after upload.

%% Example of use
% doi = zip2DataOne('C:\...\entries_zip\Abatus_cordatus_20190117.zip', token)

  doi = '';

  % --- parse species name and date from filename --------------------------
  [zip_dir, fname] = fileparts(zip_path);
  tokens = regexp(fname, '^(.+)_(\d{8})$', 'tokens');
  if isempty(tokens)
    fprintf('Warning from zip2DataOne: cannot parse name/date from "%s"\n', fname);
    return
  end
  species = tokens{1}{1};   % e.g. Abatus_cordatus
  date    = tokens{1}{2};   % e.g. 20190117

  doi = ['doi:10.5063/AmP.' species '.' date];

  if ~isfile(zip_path)
    fprintf('Warning from zip2DataOne: file not found: %s\n', zip_path);
    doi = ''; return
  end

  % --- unzip to temp directory --------------------------------------------
  tmp_dir = fullfile(tempdir, ['zip2DataOne_' species '_' date]);
  if exist(tmp_dir, 'dir'); rmdir(tmp_dir, 's'); end
  mkdir(tmp_dir);
  try
    unzip(zip_path, tmp_dir);
  catch ME
    fprintf('Warning from zip2DataOne: unzip failed for %s\n  %s\n', fname, ME.message);
    doi = ''; rmdir(tmp_dir, 's'); return
  end

  % --- locate mydata file -------------------------------------------------
  mydata_file = fullfile(tmp_dir, species, ['mydata_' species '.m']);
  if ~isfile(mydata_file)
    fprintf('Warning from zip2DataOne: mydata file not found: %s\n', mydata_file);
    doi = ''; rmdir(tmp_dir, 's'); return
  end

  % --- insert doi into mydata file ----------------------------------------
  lines = readlines(mydata_file, 'EmptyLineRule', 'preserve');
  doi_line = sprintf("metaData.doi = '%s';", doi);

  % check if doi is already present
  already = any(contains(lines, 'metaData.doi'));
  if already
    % update existing line
    idx = find(contains(lines, 'metaData.doi'), 1);
    lines(idx) = doi_line;
  else
    % insert after metaData.date_acc
    idx = find(contains(lines, 'metaData.date_acc'), 1);
    if isempty(idx)
      fprintf('Warning from zip2DataOne: metaData.date_acc not found in %s\n', mydata_file);
      doi = ''; rmdir(tmp_dir, 's'); return
    end
    lines = [lines(1:idx); doi_line; lines(idx+1:end)];
  end

  writelines(lines, mydata_file);

  % --- re-zip -------------------------------------------------------------
  new_zip = fullfile(zip_dir, [fname '.zip']);
  entry_dir = fullfile(tmp_dir, species);
  entry_files = dir(fullfile(entry_dir, '*'));
  entry_files = entry_files(~[entry_files.isdir]);
  file_paths = fullfile({entry_files.folder}, {entry_files.name});
  try
    zip(new_zip, file_paths);
  catch ME
    fprintf('Warning from zip2DataOne: re-zip failed for %s\n  %s\n', fname, ME.message);
    doi = ''; rmdir(tmp_dir, 's'); return
  end

  % --- build system metadata (sysmeta) XML --------------------------------
  file_info = dir(new_zip);
  file_size = file_info.bytes;
  checksum  = compute_md5(new_zip);
  now_str   = datestr(datetime('now', 'TimeZone', 'UTC'), 'yyyy-mm-ddTHH:MM:SSZ');

  sysmeta = sprintf([ ...
    '<?xml version="1.0" encoding="UTF-8"?>\n' ...
    '<ns3:systemMetadata xmlns:ns3="http://ns.dataone.org/service/types/v2.0">\n' ...
    '  <serialVersion>1</serialVersion>\n' ...
    '  <identifier>%s</identifier>\n' ...
    '  <formatId>application/zip</formatId>\n' ...
    '  <size>%d</size>\n' ...
    '  <checksum algorithm="MD5">%s</checksum>\n' ...
    '  <submitter>AmP</submitter>\n' ...
    '  <rightsHolder>AmP</rightsHolder>\n' ...
    '  <accessPolicy>\n' ...
    '    <allow><subject>public</subject><permission>read</permission></allow>\n' ...
    '  </accessPolicy>\n' ...
    '  <dateUploaded>%s</dateUploaded>\n' ...
    '  <dateSysMetadataModified>%s</dateSysMetadataModified>\n' ...
    '</ns3:systemMetadata>\n'], doi, file_size, checksum, now_str, now_str);

  % --- upload to DataONE KNB member node ----------------------------------
  mn_url   = 'https://knb.ecoinformatics.org/knb/d1/mn/v2/object';
  boundary = '----AmPDataOneBoundary';

  body_text = [ ...
    sprintf('--%s\r\n', boundary) ...
    'Content-Disposition: form-data; name="pid"\r\n\r\n' ...
    sprintf('%s\r\n', doi) ...
    sprintf('--%s\r\n', boundary) ...
    'Content-Disposition: form-data; name="sysmeta"; filename="sysmeta.xml"\r\n' ...
    'Content-Type: application/xml\r\n\r\n' ...
    sysmeta sprintf('\r\n') ...
    sprintf('--%s\r\n', boundary) ...
    sprintf('Content-Disposition: form-data; name="object"; filename="%s.zip"\r\n', fname) ...
    'Content-Type: application/zip\r\n\r\n'];

  fid = fopen(new_zip, 'rb');
  zip_bytes = fread(fid, inf, '*uint8');
  fclose(fid);

  body_end  = uint8(sprintf('\r\n--%s--\r\n', boundary));
  body_full = [uint8(body_text); zip_bytes; body_end];

  opts = weboptions( ...
    'Timeout',      60, ...
    'ContentType',  'text', ...
    'MediaType',    ['multipart/form-data; boundary=' boundary], ...
    'HeaderFields', {'Authorization', ['Bearer ' token]});

  try
    webwrite(mn_url, body_full, opts);
    fprintf('zip2DataOne: uploaded %s -> %s\n', fname, doi);
  catch ME
    fprintf('Warning from zip2DataOne: upload failed for %s\n  %s\n', fname, ME.message);
    doi = '';
  end

  % --- clean up temp directory --------------------------------------------
  rmdir(tmp_dir, 's');

end

%% compute_md5
function md5 = compute_md5(file_path)
  import java.security.MessageDigest
  import java.io.FileInputStream
  md  = MessageDigest.getInstance('MD5');
  fis = FileInputStream(file_path);
  buf = javaArray('byte', 8192);
  n   = fis.read(buf);
  while n > 0
    md.update(buf, 0, n);
    n = fis.read(buf);
  end
  fis.close();
  bytes = typecast(md.digest(), 'uint8');
  md5   = sprintf('%02x', bytes);
end
