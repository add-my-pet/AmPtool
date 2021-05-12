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
% * my_pets: cell-string of AmP entry names
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
% The distance measures are DEBtool_M/lib/regr/lossfuction_sb or lossfuction_sb.

%% Example of use
% dist = dist_traits(select('Ctenophora'),{'p_M';'v';'a_b'});

  global lossfunction

  if ~exist('norm','var') || isempty(norm) || norm==0 
    lossfunction = 'sb';
  else 
    lossfunction = 'su';
  end

  % initiate output
  n_pets = length(my_pets); dist = zeros(n_pets);
  if n_pets == 1
    dist = 0; val = []; return
  end

  % traits and weights
  if size(traits,2) == 2
    weights = traits{:,2}; traits = traits(:,1); n_traits = length(traits);
  else
    traits = traits(:,1); n_traits = length(traits); weights = ones(n_traits,1);
  end
  val = read_stat(my_pets, traits); % trait-value matrix
  for j = 1:n_traits % set weight-structure
    wght.((traits{j})) = weights(j);    
  end
  % compose structures for input in loss function
  for i = 1:n_pets
    for j = 1:n_traits
      data.(my_pets{i}).(traits{j}) = val(i,j);
    end
  end
  
  % compute distances
  for i = 1:n_pets
    for j = i+1:n_pets
      dist(i,j) = lossfun(data.(my_pets{i}), data.(my_pets{j}), wght);
    end
  end
  
  dist = dist + dist';
  
end
