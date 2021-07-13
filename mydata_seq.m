%% mydata_seq
% example of how to use dist_char in seqlinkage
% 2021/07/10 by Bas Kooijman
% If the matlab command window gives red warnings, please type "clear all"

close all

species = select('Squalomorphi');
% traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'; 'v'; 'kap'; 'E_Hb'; 'E_Hp'};
traits = {'v'; 'l_p'; 'l_b'; 'E_m'; 'R_i'; 's_s'; 's_Hbp'; 'k_M'};
% traits = {'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'};
taxa = {'Squatiniformes'
        'Pristiophoriformes'
        'Squaliformes'
        'Hexanchiformes'
       };

% first compute distance-matrix and pass it to seqlinkage
dist_spec = dist_traits(species, traits);
dist_taxa = dist_char(dist_spec, taxa);

clado_taxa = seqlinkage(dist_taxa, 'average', taxa); view(clado_taxa);
clado_spec = seqlinkage(dist_spec, 'average', species); view(clado_spec);