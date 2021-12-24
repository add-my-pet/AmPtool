%% mydata_mds
% example of how to use dist_traits in classic multidimensional scaling
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

% first compute distance-matrix and pass it to cmdscale
distances = dist_traits(species, traits);
[y, e] = cmdscale(distances); % configuration matrix, eigenvalues

% make sure that the number of rows of data matches the number of entries
data = NaN(length(select),3); data(select_01('Chondrichthyes'),:) = y(:,1:3);

% plot with legend in second figure
Hfig = shstat(data, legend_shark, 'MDS for Chondrichthyes');

% connect the points for subclades
% connect_subclade(Hfig, y(:,1:3), 'Chondrichthyes', 'Carcharhiniformes');

% print correlations between traits and first 2 eigenvectors 
prt_tab({traits,corr(read_stat(species, traits),y(:,1:2))},{'trait', 'axis 1', 'axis 2'}, 'Chondrichthyes');

figure % plot eigenvalues
n_e = length(e); n_t = length(traits);
plot(1:n_t, e(1:n_t), '*b', n_t+1:n_e, e(n_t+1:n_e), '*r')
xlabel('rank');
ylabel('eigenvalue');

PhyloTree = seqlinkage(distances, 'average', species);
view(PhyloTree);

