%% lineage_CoL
% gets lineage of a species in Catolog of Life

%%
function [lineage rank id_CoL] = lineage_CoL(my_pet)
% created 2018/01/05 by Bas Kooijman, modified 2021/04/01

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
url = url(i_0:i_1(end)); % substring between <classification>...</classification>

i_0 = 6 + strfind(url,'<name>'); i_1 = strfind(url,'</name>') - 1; 
j_0 = 6 + strfind(url,'<rank>'); j_1 = strfind(url,'</rank>') - 1; 
n = length(i_0); lineage = cell(n+1,1); rank = cell(n+1,1);

for i = 1:n % scan ranks
  nm = url(i_0(i):i_1(i)); % substring between <name>...</name>
  if ~strcmp(nm, 'Not assigned')
    lineage(n-i+1) = {nm}; 
  end
  nm = url(j_0(i):j_1(i)); % substring between <rank>...</rank>
  if ~strcmp(nm, 'Not assigned')
    rank(n-i+1) = {nm}; 
  end
end
lineage(1) = []; rank(1) = []; % remove Biota
lineage(end) = {my_pet}; rank(end) = {'Species'};

