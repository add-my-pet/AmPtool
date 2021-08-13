%% get_id_spider
% gets id of accepted species name in World Spider Catalog
%%
function id = get_id_spider(my_pet, open)
% created 2021/08/13 by Bas Kooijman

%% Syntax
% id = <../get_id_spider.m *get_id_spider*>(my_pet, open)

%% Description
% Gets identifier for World Spider Catalog
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in World Spider Catalog

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_spider('Aglaoctenus_lagotis',1)

address = 'https://wsc.nmbe.ch/species/';
if ~exist('open','var')
  open = 0;
end

if ~isempty(strfind(my_pet, ' '));
  my_pet = strrep(my_pet,' ','_');
end

my_pet_CoL = strrep(my_pet, '_', '+');

url = urlread(['http://webservice.catalogueoflife.org/col/webservice?name=', my_pet_CoL]);

i_0 = strfind(url, 'https://wsc.nmbe.ch/species/');
if isempty(i_0)
  id = ''; return
end
i_0 = i_0 + 28; i_1 = strfind(url(i_0:end),'</online') - 2 + i_0;
id = url(i_0:i_1);

try
  urlread([address, id]);
catch
  id = ''; return
end

if open
  web([address, id],'-browser');
end

