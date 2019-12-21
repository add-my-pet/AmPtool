%% prt_run_my_pet
% writes run_my_pet.m

%%
function prt_run_my_pet(species, destinationFolder)
% created 2019/06/10 by Bas Kooijman

%% Syntax
% <../prt_my_pet_run.m *prt_my_pet_run*> (species, destinationFolder) 

%% Description
% Prints run_my_pet.m with script to run an estimation
%
% Input:
%
% * species: string with latin name of species or taxon 
% * destinationFolder : optional string with destination folder the files are printed to (default: current folder)

%% Remarks
% uses default setting for parameter estimation and input/output

%% Example of use
% prt_run_my_pet('Daphnia') if you wish to print in the current folder
% else prt_run_my_pet('Daphnia', '../../entries_run/') if you wish to print in sister dir of parent with name entries_run

species = select(species);
n_species = length(species);

for i = 1:n_species
if exist('destinationFolder', 'var') && isempty('destinationFolder')
  oid = [];
elseif exist('destinationFolder', 'var') 
  mkdir(destinationFolder, species{i});
  oid = fopen([destinationFolder, '/', species{i}, '/run_', species{i}, '.m'], 'w+'); % open file for reading and writing and deletes old content
else
  oid = fopen(['run_', species{i}, '.m'], 'w+');                    % open file for reading and writing and deletes old content   
end                      

fprintf(oid, '%s \n', 'close all;'); 
fprintf(oid, '%s \n\n', 'global pets'); 

fprintf(oid, '%s \n', ['pets = {''', species{i}, '''};']);
fprintf(oid, '%s \n\n', 'check_my_pet(pets);');  

fprintf(oid, '%s \n', 'estim_options(''default'');'); 
fprintf(oid, '%s \n', 'estim_options(''max_step_number'', 5e2);'); 
fprintf(oid, '%s \n\n', 'estim_options(''max_fun_evals'', 5e3);');  

fprintf(oid, '%s \n', 'estim_options(''pars_init_method'', 2);');
fprintf(oid, '%s \n', 'estim_options(''results_output'', 3);');
fprintf(oid, '%s \n\n', 'estim_options(''method'', ''no'');');

fprintf(oid, '%s \n', 'estim_pars;'); 

fclose(oid); % close run_my_pet.m 
end
