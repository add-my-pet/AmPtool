%% get_id_Taxo
% gets id of species name in the Taxonomicon
%%
function id_Taxo = get_id_Taxo(my_pet)
% created 2018/01/31 by Bas Kooijman

%% Syntax
% id_Taxo = <../get_id_Taxo.m *get_id_Taxo*>(my_pet)

%% Description
% Gets identifier for a species name in the Taxonomicon
%
% Input:
%
% * my_pet: character string with name of a taxon
%
% Output:
%
% * id_Taxo: character string of id in Taxonomicon

%% Remarks
% Outputs empty string if identification was not successful.
% Used in lineage_Taxo to get the lineage

%% Example of use
% id_Taxo = get_id_Taxo('Daphnia_magna')

url = urlread(['http://taxonomicon.taxonomy.nl/TaxonList.aspx?subject=Entity&by=ScientificName&search=', my_pet]);
ind = strfind(url,'TaxonName.aspx?id=');
if isempty(ind)
  id_Taxo = [];
else
  url(1:(17 + strfind(url,'TaxonName.aspx?id='))) = [];
  id_Taxo = url(1:(strfind(url,'&') - 1)); 
end

if isempty(id_Taxo)
  fprintf(['Warning from get_id_Taxo: ', my_pet, ' not found in Taxo\n']);
end
