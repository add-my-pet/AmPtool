%% mydata_mds_Austrodyptornithes
% example of how to use dist_traits in classic multidimensional scaling, using 3 dimensions
% 2021/05/13 by Bas Kooijman
% Click on points to see species, but only before you click on rotation
% Click on rotation in toolbar of figure to rotate figure by grabbing it
% If you did not yet run read_stat this Matlab session, the first time you run this script might take a while; next trials are faster.
% If the matlab command window give red warnings, please type "clear all"

close all

species = select('Austrodyptornithes');
% traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'; 'v'; 'kap'; 'E_Hb'; 'E_Hx'; 'E_Hp'};
traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'};
% traits = {'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'};

% first compute distance-matrix and pass it to cmdscale using 3 dimensions
y = cmdscale(dist_traits(species, traits),3);

  legend_Austrodyptornithes = {...
    % Sphenisciformes, red edge
    {'o', 8, 3, [1 0 0], [0 0 0]}, 'Aptenodytes'; ...
    {'o', 8, 3, [1 0 0], [1 1 1]}, 'Spheniscus'; ...
    {'o', 8, 3, [1 0 0], [0 0 1]}, 'Eudyptula'; ...
    {'o', 8, 3, [1 0 0], [1 0 1]}, 'Eudyptes'; ...
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Pygoscelis'; ...
    % Procellariiformes, blue edge
    {'v', 8, 3, [0 0 1], [0 0 0]}, 'Pterodroma'; ....
    {'^', 8, 3, [0 0 1], [0 0 0]}, 'Fulmarini'; ....
    {'<', 8, 3, [0 0 1], [0 0 0]}, 'Procellariini'; ....
    {'>', 8, 3, [0 0 1], [0 0 0]}, 'Puffini'; ....
    {'o', 8, 3, [0 0 1], [0 0 0]}, 'Procellariidae'; ....
    
    {'o', 8, 3, [0 0 1], [1 1 1]}, 'Diomedeidae'; ....
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Hydrobatidae'; ....
    {'o', 8, 3, [0 0 1], [1 0 0]}, 'Oceanitidae'; ....
  };

% make sure that the number of rows of data matches the number of entries
data = NaN(length(select),3); data(select_01('Austrodyptornithes'),:) = y;

% plot with legend in second figure
Hfig = shstat(data, legend_Austrodyptornithes, 'MDS for Austrodyptornithes');

% connect the points for subclades
connect_subclade(Hfig, y, 'Austrodyptornithes', 'Hydrobatidae');
connect_subclade(Hfig, y, 'Austrodyptornithes', 'Diomedeidae');
connect_subclade(Hfig, y, 'Austrodyptornithes', 'Eudyptes');
connect_subclade(Hfig, y, 'Austrodyptornithes', 'Pygoscelis');
connect_subclade(Hfig, y, 'Austrodyptornithes', 'Spheniscus');
connect_subclade(Hfig, y, 'Austrodyptornithes', 'Pterodroma');
%connect_subclade(Hfig, y, 'Austrodyptornithes', 'Procellariini');
% the 2 outliers belong to the genus Procellaria

