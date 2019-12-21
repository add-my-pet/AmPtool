%% dist_taxa
% computes toxonomic distance between species

%%
function [TD species] = dist_taxa (taxon)
  %  created at 2017/04/22 by Bas Kooijman
  
  %% Syntax
  % [TD species] = <../dist_taxa.m *dist_taxa*> (taxon)
  
  %% Description
  % Computes a normalized cumulative taxonomic distance between subsequent pairs in an ordered list of all species that belong to a taxon.
  % The distances equal the number of nodes that the clade for that pair carries. The node-count excludes the leaves.
  % 
  % Input
  %
  % * taxon: character string with name of taxon
  %
  % Output
  %
  % * TD: n-vector with distances, with TD(1) = 0  and TD(end) = 1.
  % * species: n-vector with cells with names of members of taxon
  
  %% Example of use
  % [TD fish] = dist_taxa('Actinopterygii'); 

  list = list_taxa(taxon);
  species = select(taxon); n_spec = length(species);
  nodes = setdiff(list, species); n_nodes = length(nodes);
  
  weights = zeros(n_nodes,1);  
  for i = 1:n_nodes % get weights
    weights(i) = length(setdiff(list_taxa(nodes{i}), select(nodes{i})));
  end
  
  TD = zeros(n_spec, 1);
  for i = 2:n_spec
    [members, taxon] = clade(species([i-1, i]));
    TD(i) = weights(~isempty(strfind(nodes,taxon)));
  end
  
  TD = cumsum(TD); TD = TD/ TD(end);
  