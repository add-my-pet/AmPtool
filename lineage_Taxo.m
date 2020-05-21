%% lineage_Taxo
% gets lineage of a species in Taxonomicon

%%
function [lineage rank] = lineage_Taxo(my_pet)
% created 2018/01/30 by Bas Kooijman

%% Syntax
% [lineage rank] = <../lineage_Taxo.m *lineage_Taxo*>(my_pet)

%% Description
% Gets lineage of species from the Taxonomicon
%
% Input:
%
% * my_pet: character string with name of an entry
%
% Output:
%
% * lineage: (n,1) cell array with lineage
% * rank: (n,1) cell array with ranks

%% Remarks
% <lineage.html *lineage*> gives a similar result for AmP entries, and <lineage_CoL.html *lineage_CoL*> for the Catalog of Life

%% Example of use
% [lin rank] = lineage_Taxo('Daphnia_magna')

id_Taxo = get_id_Taxo(my_pet);
if isempty(id_Taxo)
  lineage = []; rank = []; 
  return
end

url = urlread(['http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id=', id_Taxo]);
if ~isempty(strfind(url, 'This unexpected error'))
  lineage = []; rank = []; 
  fprintf('Warning from lineage_Taxo: website Taxonomicon is presently not working properly\n')
  return
end
% remove all stuff around classification
url(1:strfind(url, '&#32;') - 1) = []; 
url(strfind(url, '<br /></p></div>'):end) = [];

ind = strfind(url, '&#32;'); % find lines for all ranks
n = length(ind); lineage = cell(n,1); rank = cell(n,1);

for i = 1:n-1 % scan lineage
  res_i = url(ind(i):ind(i+1)); % substring for 1 taxon
  rank_i = res_i((1 + strfind(res_i,'>')):(strfind(res_i,'<b>') - 1));
  if strcmp(rank_i, '"') || isempty(rank_i)
    rank_i = []; % replace empty char string by empty (there is a difference when converting to cells))
  else
    rank_i = strrep(rank_i, ' ', ''); % remove trailing spaces
  end
  rank(i) = {rank_i}; % convert char str to cell
  lineage(i) = {res_i((3 + strfind(res_i,'<i>')):(strfind(res_i,'</i>') - 1))};
end

lineage(end) = {my_pet}; rank(end) = {'Species'};

[j i] = ismember('Animalia', lineage); 
if ~j
  fprintf(['Warning from lineage_Taxo: ', my_pet, ' is not classified as belonging to Animalia\n'])
else  
  rank(1:i-1) = []; lineage(1:i-1) = [];
end

n_lin = length(lineage);
for i=1:n_lin
  lineage(i) = strrep(lineage(i), '<b>', '');
  lineage(i) = strrep(lineage(i), '</b>', '');
  rank(i) = strrep(rank(i), '<i>', '');
end