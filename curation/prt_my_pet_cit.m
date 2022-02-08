%% prt_my_pet_cit
% read results_my_pet.mat to write my_pet_cit.html

%%
function prt_my_pet_cit(metaData, doi, destinationFolder)
% created 2018/08/17 by Bas Kooijman

%% Syntax
% <../prt_my_pet_cit.m *prt_my_pet_cit*> (metaData, doi, destinationFolder) 

%% Description
% Prints my_pet_cit.html with citation from results_my_pet.mat
%
% Input:
%
% * metaData:  structure with fields species, author, author_mod* and date_acc
% * doi:  character string with doi
% * destinationFolder : optional string with destination folder the files are printed to (default: current folder)

%% Remarks
% metaData is found from loading results_my_pet.mat

%% Example of use
% load('results_my_pet.mat');
% prt_my_pet_cit(metaData, doi) if you wish to print in the current folder
% else prt_my_pet_cit(metaData, doi, '../myFolder/') 

species = metaData.species; txt_species = strrep(species, '_', ' ');
date = metaData.date_acc;
txt_date_acc = datestr(datenum(date), 'yyyy/mm/dd'); 

author = metaData.author(:);  % initiate author list
% modifications
if isfield(metaData,'author_mod')
  author = [author; metaData.author_mod(:)];
end
for i = 1:100 % identify latest modification
  mod = ['author_mod_', num2str(i)];
  if isfield(metaData, mod)
    authormod = metaData.(mod);
    author = [author; authormod(:)];
  else
    break
  end
end
author = unique(author, 'stable'); n_author = length(author);
txt_author = author{1}; for i=2:n_author; txt_author = [txt_author, ' ,',author{i}]; end 

% write citation
if exist('destinationFolder','var')
  fileName = [destinationFolder, species, '_cit.html'];
else
  fileName = [species, '_cit.html'];    
end
oid = fopen(fileName, 'w+'); % open file for reading and writing, delete existing content

fprintf(oid, '%s. %s. AmP <i>%s</i>, version %s.\n', txt_author, num2str(date(1)), txt_species, txt_date_acc);
%fprintf(oid, ['<a href="http://www.doi.org/', doi, '">doi: ', doi, '</a>\n']);

fclose(oid);

