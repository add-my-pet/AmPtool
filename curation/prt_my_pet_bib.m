%% prt_my_pet_bib
% read results_my_pet.mat to write my_pet_bib.bib

%%
function prt_my_pet_bib(species, biblist, destinationFolder)
% created 2015/07/17 by Starrlight; modified 2016/11/03 Starrlight, 2017/05/18, 2018/08/17, 2022/02/10 Bas Kooijman

%% Syntax
% <../prt_my_pet_bib.m *prt_my_pet_bib*> (species, biblist, destinationFolder) 

%% Description
% Prints my_pet_bib.bib with the entry's bibliography from results_my_pet.mat
%
% Input:
%
% * species: string with latin name of species 
% * biblist:  structure with each field containing a reference in bibtext format. 
% * destinationFolder : optional string with destination folder the files are printed to (default: current folder)

%% Remarks
% The name of the key corresponds to the bibtex key. The structure metaData.biblist is output from mydata_my_pet file
% If you load results_my_pet.mat then species is found in metaData.species and biblist is metaData.biblist. 

%% Example of use
% load('results_my_pet.mat');
% prt_my_pet_bib(metaData.species,metaData.biblist) if you wish to print in the current folder
% else prt_my_pet_bib(metaData.species,metaData.biblist, '../myFolder/') 

if exist('destinationFolder','var') && isempty('destinationFolder')
  oid = [];
elseif exist('destinationFolder','var') 
  oid = fopen([destinationFolder, species, '_bib.bib'], 'w+'); % open file for reading and writing and deletes old content
else
  oid = fopen([species, '_bib.bib'], 'w+');                    % open file for reading and writing and deletes old content   
end

[nm, nst] = fieldnmnst_st(biblist);

for j = 1:nst 
  try
    str = biblist.(nm{j}); str(1) = []; str(end) = []; str(end) = []; 
    str = strrep(str,'},', ['},', char(10)]); str= strrep(str, '�', '-');
    index = strfind(str,','); first = index(1); str = [str(1:first), char(10), str(first+1:end)];  
    index = strfind(str,'}}'); last = index(end); str = [str(1:last-1), '}', char(10), '}'];
    if ~isempty(oid)
      fprintf(oid, '%s \n\n', str);
    end
  catch
    fprintf('Error in prt_my_pet_bib, item %s: check closing }\n', num2str(j));
    if ~isempty(oid)
      fclose(oid);
    end
    return
  end
end
    
fclose(oid); % close my_pet_bib.bib  
