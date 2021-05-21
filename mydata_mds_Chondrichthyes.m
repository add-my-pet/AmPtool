%% mydata_mds_Chondrichthyes
% example of how to use dist_traits in classic multidimensional scaling, using 3 dimensions
% 2021/05/13 by Bas Kooijman
% Click on points to see species, but only before you click on rotation
% Click on rotation in toolbar of figure to rotate figure by grabbing it
% If you did not yet run read_stat this Matlab session, the first time you run this script might take a while; next trials are faster.
% If the matlab command window gives red warnings, please type "clear all"

close all

species = select('Chondrichthyes');
% traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'; 'v'; 'kap'; 'E_Hb'; 'E_Hp'};
traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'};
% traits = {'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'};

% first compute distance-matrix and pass it to cmdscale using 3 dimensions
y = cmdscale(dist_traits(species, traits),3);

  legend_Chondrichthyes = {...
    % Chimaeriformes, black edge
    {'o', 8, 3, [0 0 0], [0 0 1]}, 'Chimaeridae'; ...
    {'o', 8, 3, [0 0 0], [1 0 0]}, 'Callorhinchidae'; ...
    % Selachii, red edge
    {'o', 8, 3, [1 0 0], [0 0 0]}, 'Squalomorphi'; ...
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Galeomorphi'; ...
    % Batoidea, blue edge
    {'o', 8, 3, [0 0 1], [0 0 0]}, 'Rajiformes'; ....
    {'o', 8, 3, [0 0 1], [1 1 1]}, 'Rhinopristiformes'; ....
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Myliobatiformes'; ....
    {'o', 8, 3, [0 0 1], [1 0 0]}, 'Torpediniformes'; ....
  };

% make sure that the number of rows of data matches the number of entries
data = NaN(length(select),3); data(select_01('Chondrichthyes'),:) = y;

% plot with legend in second figure
Hfig = shstat(data, legend_Chondrichthyes, 'MDS for Chondrichthyes');

% connect the points for subclades
connect_subclade(Hfig, y, 'Chondrichthyes', 'Chimaeriformes');


