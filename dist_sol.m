%% dist_sol
% computes a symmetric matrix of solution-distances of the mmea method

%%
function [dist, val, parnms] = dist_sol(solutionSet, norm)
% created 2021/06/16 by Bas Kooijman

%% Syntax
% [dist, val, parnms] = <../dist_sol.m *dist_sol*> (solutionSet, norm) 

%% Description
% computes a symmetric matrix of solution-distances between free parameters (zero diagonal)
% weights are set at default 1
%
% Input:
%
% * solutionSet: .mat file in local directory
% * norm: optional boolean for loss function F_sb (0, default) or F_su (1) as distance measure
%
% Output:
%
% * dist: square symmetric matrix of distances, with zero diagonal
% * val: solution-parameter matrix with solutions in rows, parameters in columns
% * parnms: cell string with names of free parameters

%% Remarks
% All free parameters are used. 
% The distance measures are DEBtool_M/lib/regr/lossfuction_sb or lossfuction_su.

%% Example of use
% dist = dist_traits(select('Ctenophora'),{'p_M';'v';'a_b'});

  global lossfunction

  if ~exist('norm','var') || isempty(norm) || norm==0 
    lossfunction = 'sb';
  else 
    lossfunction = 'su';
  end
  
  load(solutionSet);
  parnms = solutions_set.parnames; n_par = length(parnms);
  weights = ones(n_par,1);
  sol = solutions_set.results; solnms = fields(sol);
  solnms = solnms(Contains(solnms,'solution_')); n_sol = length(solnms);
  val = NaN(n_sol,n_par); dist = zeros(n_sol); % initiate output
  
  for i = 1:n_sol
    for j = 1: n_par
      val(i,j) = solutions_set.results.(solnms{i}).par.(parnms{j});
    end
  end
          
  % traits and weights
  for j = 1:n_par % set weight-structure
    wght.((parnms{j})) = weights(j);    
  end
  % compose structures for input in loss function
  for i = 1:n_sol
    for j = 1:n_par
      data.(solnms{i}).(parnms{j}) = val(i,j);
    end
  end
  
  % compute distances
  for i = 1:n_sol
    for j = i+1:n_par
      dist(i,j) = lossfun(data.(solnms{i}), data.(solnms{j}), wght);
    end
  end
  
  dist = dist + dist';
  
  close all
  [y, e] = cmdscale(dist,3);
  plot3(y(:,1),y(:,2),y(:,3),'.r','MarkerSize',10)
  
end

function sel = Contains(nm, str)
  % this fuction is the same as Matlab built-in-function contains, but the R2016a version does not work with cell input
  n = length(nm); sel = true(n,1);
  for i=1:n
    sel(i) = ~isempty(strfind(nm{i}, str));
  end
end

