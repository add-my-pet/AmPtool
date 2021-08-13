%% get_id_collembola
% gets id of species name in collembola

%%
function id = get_id_collembola(my_pet, open)
% created 2021/08/12 by Bas Kooijman

%% Syntax
% id = <../get_id_collembola.m *get_id_collembola*>(my_pet, open)

%% Description
% Gets identifier for collembola
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in collembola

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_collembola('Isotoma_viridis',1)

address = 'https://www.collembola.org/taxa/';
if ~exist('open','var')
  open = 0;
end

my_pet = strrep(my_pet,' ','+');
my_pet = strrep(my_pet,'_','+');
genus = strsplit(my_pet, '+'); genus = genus{1};

my_pet_CoL = strrep(my_pet, '_', '+');
url = urlread(['http://webservice.catalogueoflife.org/col/webservice?name=', my_pet]);
i_0 = strfind(url, 'http://www.collembola.org/taxa/');
if isempty(i_0)
  id = ''; return
end
i_0 = i_0 + 31; i_1 = strfind(url(i_0(1):end),'</online_resource>') - 2 + i_0(1);
id = [url(i_0(1):i_1(1)), '#', genus];

try
  urlread([address, id]);
catch
  id = ''; return
end

if open
  web([address, id],'-browser');
end

