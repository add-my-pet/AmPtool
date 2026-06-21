%% run_repair
% uses estim_pars for writing results_my_pet.mat file

%%
function run_repair(my_pet)
% created 2018/01/05 by Bas Kooijman, modified 2026/06/12

%% Syntax
% <../run_repair *run_repair*>(my_pet)

%% Description
% uses estim_pars for writing results_my_pet.mat file
%
% Input:
%
% * my_pet: character string with name of a taxon
%
% Output:
%
% * no explicit output

%% Remarks
% used in repair_bib and run_collection

%% Example of use
% cdEntr('Daphnia_magna'); run_repair('Daphnia_magna')

global pets 

pets = {my_pet}; 

estim_options('default'); 
estim_options('pars_init_method', 2); 
estim_options('results_output', 0); 
estim_options('method', 'no'); 

estim_pars; 
end
