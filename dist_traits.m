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

  % fill distance matrix
  if ~exist('norm','var') || isempty(norm)  % lossfuction symmetric bounded
    for i = 1:n_pets
      for j = i+1:n_pets
        dist(i,j) = (val(i,:) - val(j,:)).^2 ./ (val(i,:).^2 + val(j,:).^2) * weights;
      end
    end
  else % lossfuction symmetric unbounded
    for i = 1:n_pets
      for j = i+1:n_pets
        dist(i,j) = (val(i,:) - val(j,:)).^2 .* (1./val(i,:).^2 + 1./val(j,:).^2) * weights;
      end
    end     
  end

  dist = dist + dist';
  
end
