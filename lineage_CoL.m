%% lineage_CoL
% gets lineage of a species in Catolog of Life

%%
function [lineage rank id_CoL] = lineage_CoL(my_pet)
% created 2018/01/05 by Bas Kooijman

%% Syntax
% [lineage rank id_CoL] = <../lineage_CoL.m *lineage_CoL*>(my_pet)

%% Description
% Gets lineage of species from the Catolog of Life: kingdom, phylum, class, order, family, genus, species. 
% To this end, the identifier for the accepted taxon name in CoL is obtained with <get_id_CoL.html *get_id_CoL*> 
%
% Input:
%
% * my_pet: character string with name of an entry
%
% Output:
%
% * lineage: (n,1) cell array with lineage
% * rank: (n,1) cell array with ranks
% * id_CoL: identifier for species in CoL

%% Remarks
% <lineage.html *lineage*> gives a similar result for AmP entries

%% Example of use
% lineage_CoL('Daphnia_magna')

[id_CoL my_pet] = get_id_CoL(my_pet);
if isempty(id_CoL)
  lineage = []; rank = [];
  return
end

url = urlread(['http://webservice.catalogueoflife.org/col/webservice?id=', id_CoL, '&response=full']);
i_0 = 17 + strfind(url, '<classification>'); i_1 = strfind(url, '</classification>') - 1;
url = url(i_0:i_1); % substring between <classification>...</classification>

i_0 = 8 + strfind(url,'<taxon>'); i_1 = strfind(url,'</taxon>') - 1; 
n = length(i_0); lineage = cell(n+1,1); rank = cell(n+1,1);

for i = 1:n % scan ranks
  res_i = url(i_0(i):i_1(i)); % substring between <taxon>...</taxon>
  
  j_0 = 6 + strfind(res_i,'<name>'); j_1 = strfind(res_i,'</name>') - 1; 
  nm = res_i(j_0:j_1); % substring between <name>...</name>
  if ~strcmp(nm, 'Not assigned')
    lineage(i) = {nm}; 
  end
  
  j_0 = 6 + strfind(res_i,'<rank>'); j_1 = strfind(res_i,'</rank>') - 1; 
  nm = res_i(j_0:j_1); % substring between <rank>...</rank>
  if ~strcmp(nm, 'Not assigned')
    rank(i) = {nm}; 
  end

end

lineage(end) = {my_pet}; rank(end) = {'Species'};

