%% repair_bib
% edit mydata_my_pet, write results_my_pet.mat, save zip, writes my_pet_bib.bib and my_pet_bib.html

%%
function repair_bib(my_pet)
% created 2020/05/21 by Bas Kooijman, modified 2021/10/02

%% Syntax
% <repair_bib *repair_bib*>(my_pet)

%% Description
% edit mydata_my_pet, write results_my_pet.mat, save zip, write my_pet_bib.bib and my_pet_bib.html
%
% Input:
%
% * my_pet: character string with entry

%% Remarks
% Requires syncing with servers when done

%% Example
% repair_bib('Schiffornis_turdina')

my_pet = strrep(my_pet,' ','_');

WD = cdEntr(my_pet); % store current work directory and cd to add_my_pet/entries/my_pet
     
% edit mydata_my_pet.m file
edit(['mydata_', my_pet, '.m']);
fprintf('type dbcont to proceed or dbquit \n'); keyboard
eval(['[data, auxdata, metaData, txtData] = mydata_', my_pet, ';']); % run mydata_my_pet
feval(['[par, metaPar, txtPar] = pars_init_', my_pet, '(metaData)']);
feval(['prdData = predict_',metaData.species], par, data, auxData); % run predict_* to compute predictions
prdData = predict_pseudodata(par, data, prdData); % appends new field to prdData with predictions for the pseudo data: 

run_repair(my_pet); % write results_my_pet.mat

cd('../../entries_zip'); % goto add_my_pet/entries_zip from  add_my_pet/entries/my_pet
zip_my_pet(my_pet, '../entries'); % zip the entry and save

cd(['../entries_web/', my_pet]); % goto add_my_pet/entries_web from add_my_pet/entries_zip
prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar, cur2ewmp);  
prt_my_pet_bib(metaData.species, metaData.biblist); % write my_pet_bib.bib
bib2html([metaData.species, '_bib']); % write my_pet_bib.html

cd(WD)
end

function run_repair(my_pet)
% use estim_pars for writing results_my_pet.mat file
global pets 

pets = {my_pet}; 

estim_options('default'); 
estim_options('pars_init_method', 2); 
estim_options('results_output', 0); 
estim_options('method', 'no'); 

estim_pars; 
end
