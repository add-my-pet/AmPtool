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

try
  url = urlread(['http://taxonomicon.taxonomy.nl/TaxonList.aspx?subject=Entity&by=ScientificName&search=', my_pet]);
  ind = strfind(url,'TaxonName.aspx?id=');
  if isempty(ind)
    my_pet_syn = get_synonym(get_id_CoL(my_pet));
    if isempty(my_pet_syn)
      id_Taxo = ''; 
    else
      url = urlread(['http://taxonomicon.taxonomy.nl/TaxonList.aspx?subject=Entity&by=ScientificName&search=', my_pet_syn]);
      ind = strfind(url,'TaxonName.aspx?id=');
      if isempty(ind)
        id_Taxo = '';
      else
        url(1:(17 + strfind(url,'TaxonName.aspx?id='))) = '';
        id_Taxo = url(1:(strfind(url,'&') - 1)); 
      end
    end
  else
    url(1:(17 + strfind(url,'TaxonName.aspx?id='))) = '';
    id_Taxo = url(1:(strfind(url,'&') - 1)); 
  end
  if isempty(id_Taxo)
    nm = strsplit(my_pet,'_'); nm = nm{1};
    url = urlread(['http://taxonomicon.taxonomy.nl/TaxonList.aspx?subject=Entity&by=ScientificName&search=', nm]);
    ind = strfind(url,'TaxonName.aspx?id=');
    if isempty(ind)
      id_Taxo = ''; return
    end
    url(1:(17 + strfind(url,'TaxonName.aspx?id='))) = '';
    id_Taxo = url(1:(strfind(url,'&') - 1)); 
  end

  if open
    web([address, id_Taxo],'-browser');
  end
catch
  if ~isempty(strfind(my_pet, '_'))
   fprintf('Warning from get_id_Taxo: species not found, now try genus\n');
   my_pet = strsplit(my_pet, '_'); my_pet = my_pet{1}; id_Taxo = get_id_Taxo(my_pet); return
  else
   fprintf('Warning from get_id_Taxo: Unable to contact server or genus not found\n');
  end
  id_Taxo = [];
end

