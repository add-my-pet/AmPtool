%% get_id_msw3
% gets id in Mammal Species of the World, 3rd ed

%%
function id = get_id_msw3(my_pet, show_in_browser)
% created 2021/08/01 by Bas Kooijman

%% Syntax
% id = <../get_id_msw.m *get_id_msw*>(my_pet, show_in_browser)

%% Description
% Gets identifier for Mammal Species of the World, 3rd edition
%
% Input:
%
% * my_pet: character string with name of a species
% * show_in_browser: optional boolean for opening in browser (defaul: 0)
%
% Output:
%
% * id: cell string with id's in msw3 (including all subspecies)

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_msw('Mus_musculus')

address = 'https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id=';
if ~exist('show_in_browser','var')
  show_in_browser = 0;
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
  if show_in_browser && sel(i)
    web([address, id{i}],'-browser');
  end
end
id = id(sel);

