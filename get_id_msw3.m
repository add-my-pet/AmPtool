%% get_id_MSW3
% gets id in Mammal Species of the World, 3rd ed

%%
function [id, id_all]= get_id_MSW3(my_pet, open)
% created 2021/08/01 by Bas Kooijman

%% Syntax
% [id, id_all] = <../get_id_MSW3.m *get_id_MSW3*>(my_pet, open)

%% Description
% Gets identifier for Mammal Species of the World, 3rd edition
%
% Input:
%
% * my_pet: character string with name of a species
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in msw3
% * id_all: cell string with all id's in msw3 (including all subspecies)

%% Remarks
% Outputs empty string if identification was not successful.

%% Example of use
% id = get_id_msw('Mus_musculus', 1)

address = 'https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id=';
if ~exist('open','var')
  open = 0;
end

if ~isempty(strfind(my_pet, '_'));
  nm = strsplit(my_pet,'_'); % genus, species
elseif ~isempty(strfind(my_pet, ' '));
  nm = strsplit(my_pet,' '); % genus, species
end

genus = ['"', nm{1}, '"']; species = ['"', nm{2}, '"'];
msw3 = strsplit(fileread('msw3-all.csv'),',');

ind = 1:length(msw3); 
i_species = ind(ismember(msw3, species)); 
i_species = i_species(ismember(msw3(i_species - 2), genus));
id = msw3(i_species - 10); n_id = length(id); sel = true(n_id,1);

% clean-up codes to uncover id's 
for i=1:n_id
  code = id{i}; in = strfind(code,'"'); sel(i) = length(in) == 4;
  id{i} = code(in(end-1)+1:in(end)-1);
end
if isempty(id)
  id = ''; id_all = ''; return
end
id_all = id(sel); id = id{1}; 

if open
  web([address, id],'-browser');
end


