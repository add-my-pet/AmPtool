%% mydata_mds_Carnivora
% example of how to use dist_traits in classic multidimensional scaling, using 3 dimensions
% 2021/05/13 by Bas Kooijman
% Click on points to see species, but only before you click on rotation
% Click on rotation in toolbar of figure to rotate figure by grabbing it
% If you did not yet run read_stat this Matlab session, the first time you run this script might take a while; next trials are faster.
% If the matlab command window gives red warnings, please type "clear all"  and retry

close all

species = select('Carnivora');
% traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'; 'v'; 'kap'; 'E_Hb'; 'E_Hx'; 'E_Hp'};
traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'};
% traits = {'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'};

% first compute distance-matrix and pass it to cmdscale
[y, e] = cmdscale(dist_traits(species, traits)); % configuration matrix, eigenvalues
n_traits= length(traits); E = e(n_traits)/e(1);
fprintf(['With ', num2str(n_traits), ' traits the ', num2str(n_traits), '-th eigenvalue as fraction of the first one is ', num2str(E), '\n'])
%return

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
data = NaN(length(select),3); data(select_01('Carnivora'),:) = y(:,1:3);

% plot with legend in second figure
shstat_options('default');
shstat_options('x_transform', 'none');
shstat_options('y_transform', 'none');
shstat_options('z_transform', 'none');
[Hfig, Hleg] = shstat(data, legend_Carnivora, ['Carnivora ', num2str(length(species)), ' @ ', datestr(date,26)]);

fig(Hleg)
title('Carnivora');
%print -r1200 -dpng CarnivoraLegend.png

fig(Hfig)
% connect the points for subclades
connect_subclade(Hfig, y(:,1:3), 'Carnivora', 'Canidae');
connect_subclade(Hfig, y(:,1:3), 'Carnivora', 'Pinnipedia');
%print -r1200 -dpng CarnivoraMds.png

% print correlations between traits and first 2 eigenvectors 
prt_tab({traits,corr(read_stat(species, traits),y(:,1:2))},{'trait', 'axis 1', 'axis 2'}, 'Carnivora');

figure % plot eigenvalues
n_e = length(e); n_t = length(traits);
plot(1:n_t, e(1:n_t), '*b', n_t+1:n_e, e(n_t+1:n_e), '*r')
xlabel('rank');
ylabel('eigenvalue');
title('MDS for Carnivora');
set(gca, 'FontSize', 15, 'Box', 'on');
%print -r1200 -dpng CarnivoraEigen.png

