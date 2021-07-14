%% trait_mean
% computes means of traits in a species-trait matrix

function mtrait = trait_mean(trait, taxa)
% created 2021/07/11 by Bas Kooijman

%% Syntax
% mtrait = <../trait_mean.m *trait_mean*> (trait, taxa) 

%% Description
% computes means of traits in a species-trait matrix
% All species that are member of the taxa must be in the trait matrix
%
% Input:
%
% * trait: (n,r)-array with species-trait matrix
% * taxa: (k,1)-cell array with names of taxa
%
% Output:
%
% * mtrait: (k,r)-array with mean traits

%% Remarks
% <lineage.html *lineage*> is used to identify the taxon that was used to create the species-trait matrix.
% All members of taxa must be members of this taxon.

%% Example of use
% trait = read_stat(select('Squalomorphi', {'p_M';'v';'a_b'}));
% mtrait = trait_mean(trait,{'Squatiniformes','Pristiophoriformes','Squaliformes','Hexanchiformes'});

% identify taxon that belongs to dist
lin = lineage(taxa{1}); n_lin = length(lin); i = 1; n_spec = size(trait,1);
while i < n_lin
  n_taxon = length(select(lin{n_lin - i}));
  if n_spec == n_taxon
    taxon = lin{n_lin - i};
    break
  elseif n_spec < n_taxon
    fprintf('Warning from trait_mean: no taxon found for trait matrix\n')
    mtrait = []; return
  end
  i = i + 1;
end
if i == n_lin
  fprintf('Warning from trait_mean: no taxon found for trait matrix\n')
  mtrait = []; return
end

% identify the species-indices of members of taxa in trait and fill mean trait
spec = select(taxon); ind = 1:n_spec; 
n_taxa = length(taxa); mtrait = zeros(n_taxa,size(trait,2));
for i = 1:n_taxa
  speci = select(taxa{i});
  ind_taxa = ind(ismember(speci, spec));
  if isempty(ind_taxa)
    fprintf('Warning from trait_mean: taxon %s is not found in trait matrix\n', taxa{i})
    mtrait = []; return
  end
  mtrait(i,:) = mean(trait(ind_taxa,:),1);
end

