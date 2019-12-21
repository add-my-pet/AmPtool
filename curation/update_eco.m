%% update_eco
% updates eco-codes in existing my_pet_res.html file

%%
function update_eco(varargin)
% created 2018/05/05 by Bas Kooijman

%% Syntax
% <update_eco *update_eco*>(varargin)

%% Description
% Updates eco-codes in existing my_pet_res.html file on the server and writes results in entries_web/my_pet/my_pet_res.html, using current get_eco.
% Updates are only functional if get_eco changed since the creation of the result-files. Only the eco-codes and labels are updated.
%
% Input:
%
% * varargin: optional cell array with entry names, or character string with entry or node names (default 'Animalia')
%
% Output:
%
% * 1 html-file is written per my_pet: ../entries_web/my_pet/my_pet_res.html 

%% Remarks
% Copies model, COMPLETE, MRE, SMSE (in this sequence) from existing my_pet_res.html file.
% Only updates eco-codes and assumes spacing details in res-file and texts "Model: </a>", "COMPLETE</a> = ", "MRE</a> = ", "SMSE</a> = ".
% To finalize eco-updates, the files in entries_web must be copied to the server, using overwrite.
% Make sure that AmPeco.html on the server has the latest version and that get_eco_type is run since then.

if isempty(varargin)
  varargin = select('Animalia');
elseif ~iscell(varargin{1}) && isempty(strfind(varargin{1},'_'))
  varargin = select(varargin{1});
elseif iscell(varargin{1})    
  varargin = varargin{:};  % unpack cell string  
end

nargin = length(varargin); % number of entries to scan    

for i=1:nargin
  destinationFolder = ['../../entries_web/', varargin{i},'/']; % target for html and png files
  mkdir(destinationFolder);
  %fprintf([varargin{i},'\n']); % not necessary, since progress is fast
  
  % get head, tail and old table from my_pet_res.html
  my_pet_res = urlread(['https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/', varargin{i}, '/', varargin{i},'_res.html']);
  table_start = strfind(my_pet_res,'<table>'); head = my_pet_res(1:table_start - 7); % notice removal of leading spaces to get outline correct
  table_end = 8 + strfind(my_pet_res,'</table>'); tail = my_pet_res(table_end:end);
  table_old = my_pet_res(table_start:table_end); % text with old table only
    
  % get model, COMPLETE, MRE, and SMSE from old table; notice that pieces of text are deleted after reading
  % model 
  index = 10 + strfind(table_old,'Model: </a>');     table_old(1:index) = []; model = table_old(1: strfind(table_old, '</td>') - 1);
  % COMPLETE
  index = 14 + strfind(table_old,'COMPLETE</a> = '); table_old(1:index) = []; COMPLETE = str2num(table_old(1: strfind(table_old, '</td>') - 1));
  % MRE
  index = 10 + strfind(table_old,'MRE</a> = ');      table_old(1:index) = []; MRE = str2num(table_old(1: strfind(table_old, '</td>') - 1));
  % SMSE
  index = 11 + strfind(table_old,'SMSE</a> = ');     table_old(1:index) = []; SMSE = str2num(table_old(1: strfind(table_old, '</td>') - 1));
 
  % write updated my_pet_res.html
  fileName = [destinationFolder, varargin{i}, '_res.html'];   
  % head
  oid = fopen(fileName, 'w+');   % open file for reading and writing, delete existing content
  fprintf(oid, head);
  fclose(oid);
  % table
  prt_my_pet_eco(varargin{i}, model, COMPLETE, MRE, SMSE, destinationFolder); % write new table
  % tail
  oid = fopen(fileName, 'a');    % open file for appending
  tail = strrep(tail, '%','%%'); % replace any % in tail, since writing stops at %
  fprintf(oid, tail);
  fclose(oid);

  % check if result does not deviate in length, compared to original
  oid = fopen(['../../entries_web/', varargin{i}, '/', varargin{i}, '_res.html']);
  n_old = length(my_pet_res); n_new = length(fread(oid));
  fclose(oid);
  %
  if n_new < n_old
    fprintf(['Warning from update_eco for ', varargin{i},': length old res-file = ', num2str(n_old), ', while new length = ', num2str(n_new), '\n']);
  end

end
