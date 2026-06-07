%% dist_traits
% computes a symmetric matrix of trait-distances between selected species

%%
function [dist, val] = dist_traits(my_pets, traits, norm)
% created 2021/05/12 by Bas Kooijman

%% Syntax
% [dist, val] = <../dist_traits.m *dist_traits*> (my_pets, traits, norm) 

%% Description
% computes a symmetric matrix of trait-distances between selected species (zero diagonal)
%
% Input:
%
% * my_pets: cell-string of n AmP entry names
% * traits: (n, 1 or 2)-cell array with names of traits and optional weights (default all weights equal to 1)
% * norm: optional boolean for loss function F_sb (0, default) or F_su (1) as distance measure
%
% Output:
%
% * dist: square symmetric matrix of distances, with zero diagonal
% * val: trait values with species in rows, traits in columns

%% Remarks
% The traits must be in allStat for all my_pets (not all traits are present for all models in allStat and NaN's can occur). 
% See DEBtool_M/lib/pet/statistics_st for possible traits.
% The distance measures are DEBtool_M/lib/regr/lossfuction_sb or lossfuction_su.
% The traits are at T_typical, but at T_ref for primary parameters

%% Example of use
% dist = dist_traits(select('Ctenophora'),{'p_M';'v';'a_b'});

  % weights
  if size(traits,2) == 2
    weights = traits{:,2}; traits = traits(:,1); 
  else
    weights = ones(length(traits),1);
  end
  
  % traits
  val = read_stat(my_pets, traits); % species-trait matrix with values
  
  % initiate distance matrix
  n_pets = length(my_pets); dist = zeros(n_pets);
  if n_pets == 1
    dist = 0; val = []; return
  end

  % fill distance matrix — vectorised over species pairs, loop only over traits
  n_traits = size(val, 2);
  if ~exist('norm','var') || isempty(norm)  % loss function symmetric bounded (F_sb)
    for k = 1:n_traits
      v    = val(:,k);
      dist = dist + weights(k) * (v - v').^2 ./ (v.^2 + v'.^2);
    end
  else                                       % loss function symmetric unbounded (F_su)
    for k = 1:n_traits
      v    = val(:,k);
      dist = dist + weights(k) * (v - v').^2 .* (1./v.^2 + 1./v'.^2);
    end
  end
  dist(1:n_pets+1:end) = 0;  % ensure exact zero diagonal (guards against 0/0 for zero-valued traits)
  
end
