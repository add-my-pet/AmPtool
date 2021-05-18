%% example of how to use dist_traits in classic multidimensional scaling, using 3 dimensions
% 2021/05/18 by Bas Kooijman
% Click on points to see species, but only before you click on rotation
% Click on rotation in toolbar of figure to rotate figure by grabbing it
% If you did not yet run read_stat this Matlab session, the first time you run this script might take a while; next trials are faster.

close all

species = select('Cephalopoda');
% traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'; 'v'; 'kap'; 'E_Hb'; 'E_Hx'; 'E_Hp'};
traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'};
% traits = {'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'};

% first compute distance-matrix and pass it to cmdscale using 3 dimensions
y = cmdscale(dist_traits(species, traits),3);

  legend_Cephalopoda = {...
    % Nautiloidea, black edge
    {'o', 8, 3, [0 0 0], [0 0 0]}, 'Nautilida'; ...
    % Octopodiformes, red edge
    {'o', 8, 3, [1 0 0], [0 0 0]}, 'Octopoda'; ...
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Vampyromorpha'; ...
    % Decapodiformes, blue edge
    {'o', 8, 3, [0 0 1], [0 0 0]}, 'Idiosepida'; ....
    {'o', 8, 3, [0 0 1], [1 1 1]}, 'Myopsida'; ....
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Oegopsida'; ....
    {'o', 8, 3, [0 0 1], [1 0 1]}, 'Sepiida'; ....
    {'o', 8, 3, [0 0 1], [1 0 0]}, 'Spirulida'; ....
  };

% make sure that the number of rows of data matches the number of entries
data = NaN(length(select),3); data(select_01('Cephalopoda'),:) = y;

% plot with legend in second figure
Hfig = shstat(data, legend_Cephalopoda, 'MDS for Cephalopoda');

% connect the points for the Sepiida
connect_subclade(Hfig, y, 'Cephalopoda', 'Sepiida');


