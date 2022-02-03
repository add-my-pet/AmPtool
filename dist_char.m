%% dist_char
% computes a symmetric matrix of characteristic distances given a symmetric matrix of distances

function cdist = dist_char(dist, taxa)
% created 2021/07/10 by Bas Kooijman

%% Syntax
% mdist = <../dist_mean.m *dist_mean*> (dist, taxa) 

%% Description
% computes a symmetric matrix of characteristic distances between selected taxa (non-zero diagonal) given a symmetric matrix of distances of species
% All species that are member of the taxa must be in the  species-distances
%
% Input:
%
% * dist: symmetrix square species-distance matrix
% * taxa: (n, 1)-cell array with names of taxa
%
% Output:
%
% * cdist: square symmetric matrix of characteristic taxa-distances, with non-zero diagonal

%% Remarks
% <lineage.html *lineage*> is used to identify the taxon that was used to create the species-distance matrix.
% All members of taxa must be members of this taxon.
% Diagonal elements are only zero for a taxon if that taxon has only 1 member species.

%% Example of use
% dist = dist_traits(select('Squalomorphi', {'p_M';'v';'a_b'}));
% cdist = dist_char(dist,{'Squatiniformes','Pristiophoriformes','Squaliformes','Hexanchiformes'});
% see mydata_seq

% identify taxon that belongs to dist
lin = lineage(taxa{1}); n_lin = length(lin); i = 1; n_dist = size(dist,2);
while i < n_lin
  n_taxon = length(select(lin{n_lin - i}));
  if n_dist == n_taxon
    taxon = lin{n_lin - i};
    break
  elseif n_dist < n_taxon
    fprintf('Warning from dist_mean: no taxon found for distance matrix\n')
    cdist = []; return
  end
  i = i + 1;
end
if i == n_lin
  fprintf('Warning from dist_mean: no taxon found for distance matrix\n')
  cdist = []; return
end

% identify the species-indices of members of taxa in dist
spec = select(taxon); ind = 1:n_dist; 
n_taxa = length(taxa); ind_taxa = cell(n_taxa,1);
for i = 1:n_taxa
  speci = select(taxa{i});
  ind_taxa{i} = ind(ismember(speci, spec));
  if isempty(ind_taxa{i})
    fprintf('Warning from dist_mean: taxon %s is not found in distance matrix\n', taxa{i})
    cdist = []; return
  end
end

% fill the mean distance matrix
cdist = zeros(n_taxa);
for i = 1:n_taxa
  for j = i : n_taxa
    d = dist(ind_taxa{i}, ind_taxa{j}); % sub-matrix of distances
    if isempty(ind_taxa{i}) || isempty(ind_taxa{j}) 
      x=1;
    end
    cdist(i,j) = char_su(d(:));
    cdist(j,i) = cdist(i,j);
  end
end
