%% get_id_Taxo
% gets id of species name in the Taxonomicon
%%
function id_Taxo = get_id_Taxo(my_pet, open)
% created 2018/01/31 by Bas Kooijman

%% Syntax
% id_Taxo = <../get_id_Taxo.m *get_id_Taxo*>(my_pet, open)

%% Description
% Gets identifier for a species name in the Taxonomicon
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id_Taxo: character string of id in Taxonomicon

%% Remarks
% Outputs empty string if identification was not successful.
% Used in lineage_Taxo to get the lineage

%% Example of use
% id_Taxo = get_id_Taxo('Daphnia_magna', 1)

address = 'http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id=';
if ~exist('open','var')
  open = 0;
end

if ~isempty(strfind(my_pet, ' '));
  my_pet = strrep(my_pet,' ','_');
end

url = urlread(['http://taxonomicon.taxonomy.nl/TaxonList.aspx?subject=Entity&by=ScientificName&search=', my_pet]);
ind = strfind(url,'TaxonName.aspx?id=');
if isempty(ind)
  my_pet = get_synonym(get_id_CoL(my_pet));
  if isempty(my_pet)
    id_Taxo = []; return
  else
    url = urlread(['http://taxonomicon.taxonomy.nl/TaxonList.aspx?subject=Entity&by=ScientificName&search=', my_pet]);
    ind = strfind(url,'TaxonName.aspx?id=');
    if isempty(ind)
      id_Taxo = []; return
    end
    url(1:(17 + strfind(url,'TaxonName.aspx?id='))) = [];
    id_Taxo = url(1:(strfind(url,'&') - 1)); return
  end
else
  url(1:(17 + strfind(url,'TaxonName.aspx?id='))) = [];
  id_Taxo = url(1:(strfind(url,'&') - 1)); 
end

if open
  web([address, id_Taxo],'-browser');
end

