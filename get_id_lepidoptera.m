%% get_id_lepidoptera
% gets id of species name in Global Lepidoptera Names Index

%%
function id = get_id_lepidoptera(my_pet, open)
% created 2021/08/13 by Bas Kooijman

%% Syntax
% id = <../get_id_lepidoptera.m *get_id_lepidoptera*>(my_pet, open)

%% Description
% Gets identifier for Global Lepidoptera Names Index
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in Global Lepidoptera Names Index

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_lepidoptera('Manduca_sexta',1)

address = 'http://www.nhm.ac.uk/our-science/data/lepindex/detail/?taxonno=';
if ~exist('open','var')
  open = 0;
end

my_pet = strrep(my_pet,' ','+');
my_pet = strrep(my_pet,'_','+');

try
  url = urlread(['http://webservice.catalogueoflife.org/col/webservice?name=', my_pet]);
catch
  id = ''; return
end
i_0 = strfind(url, 'lepindex/detail/?taxonno=');
if isempty(i_0)
  id = ''; return
end
i_0 = i_0(1) + 25; i_1 = strfind(url(i_0:end),'</online_resource>') - 2 + i_0(1);
id = url(i_0:i_1(1));

try
  urlread([address, id]);
catch
  id = ''; return
end

if open
  web([address, id],'-browser');
end

