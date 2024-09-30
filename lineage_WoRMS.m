%% lineage_WoRMS
% gets lineage of a species in WoRMS

%%
function [lineage, rank] = lineage_WoRMS(my_pet)
% created 2018/01/30 by Bas Kooijman

%% Syntax
% [lineage, rank] = <../lineage_WoRMS.m *lineage_WoRMS*>(my_pet)

%% Description
% Gets lineage of species from WoRMS
%
% Input:
%
% * my_pet: character string with name of an entry
%
% Output:
%
% * lineage: (5,1) cell array with {phylum;class;order;family;genus}
% * rank: (5,1) cell array with {'Phylum';'Class';'Order';'Family';'Genus'}

%% Remarks
%
% * <lineage.html *lineage*> gives a similar result for AmP entries, and <lineage_CoL.html *lineage_CoL*> for the Catalog of Life
% * <lineage_Taxo.html *lineage_Taxo*> gives a similar result for the Taxonomicon

%% Example of use
% [lin, rank] = lineage_WoRMS('Daphnia_magna')

if ~isempty(strfind(my_pet, ' '));
  my_pet = strrep(my_pet,' ','_');
end

rank = {'Phylum';'Class';'Order';'Family';'Genus'}; lineage = cell(5,1);

try
  url = webread(['https://www.marinespecies.org/rest/AphiaRecordsByName/', strrep(my_pet, '_', '%20'), '?marine_only=0&like=false']);

  lineage{1} = url.phylum; 
  lineage{2} = url.class; 
  lineage{3} = url.order; 
  lineage{4} = url.family; 
  lineage{5} = url.genus; 
  
catch
  fprintf('Warning from lineage_WoRMS: species not found\n');
end

end