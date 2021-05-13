%% example of how to use dist_traits in classic multidimensional scaling, using 3 dimensions
% 2021/05/13 by Bas Kooijman
% Click on rotation in toolbar of figure to rotate figure by grabbing it
% If you did not yet run read_stat this Matlab session, the first time might take a while; next trial are faster.

species = select('Carnivora');
traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'};
% first compute distance-matrix and pass it to cmdscale
y = cmdscale(dist_traits(species, traits),3);

  legend_Carnivora = {...
    % Feliformia, red edge
    {'o', 8, 3, [1 0 0], [0 0 0]}, 'Feloidea'; ...
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Viverroidea'; ...
    {'o', 8, 3, [1 0 0], [0 0 1]}, 'Eupleridae'; ...
    % Caniformia, blue edge
    {'o', 8, 3, [0 0 1], [0 0 0]}, 'Canidae'; ....
    {'o', 8, 3, [0 0 1], [1 0 0]}, 'Ursidae'; ....
    {'o', 8, 3, [0 0 1], [1 0 1]}, 'Musteloidea'; ....
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Pinnipedia'; ....
  };

% make sure that the number of rows of data matches the number of entries
data=NaN(length(select),3); data(select_01('Carnivora'),:) = y;

% plot with legend in second figure
shstat(data, legend_Carnivora, 'MDS for Carnivora');