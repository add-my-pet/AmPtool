%% repair_bib
% edit mydata_my_pet, write results_my_pet.mat, save zip, writes my_pet_bib.bib and my_pet_bib.html

%%
function WD = repair_bib(entries)
% created 2020/05/21 by Bas Kooijman, modified 2021/10/02

%% Syntax
% <repair_bib *repair_bib*>(entries)

%% Description
% edit mydata_my_pet, write results_my_pet.mat, save zip, write my_pet_bib.bib and my_pet_bib.html
%
% Input:
%
% * entries: character or cell string with one or more entries
%
% Ouput:
%
% * WD: current path

%% Remarks
% Requires syncing with servers when done

%% Example
% repair_bib(select('Mus'))

%cur2ew = '../../deblab/add_my_pet/entries_web/'; % path from AmPtool/curation to entries_web

WD = pwd;
if ~iscell(entries)
  entries = {entries};
end
n=length(entries); 

for i=1:n
  my_pet = entries{i}; 
  fprintf('%g: %s\n', i, my_pet);
  cdEntr(my_pet); % store current work directory and cd to add_my_pet/entries/my_pet

  edit(['mydata_', my_pet, '.m']); % edit mydata_my_pet.m file
  fprintf('type dbcont to proceed or dbquit \n'); keyboard
  eval(['[data, auxData, metaData, txtData] = mydata_', my_pet, ';']); % run mydata_my_pet
  eval(['[par, metaPar, txtPar] = pars_init_', my_pet, '(metaData);']);
  eval(['prdData = predict_', my_pet, '(par, data, auxData);']); % run predict_* to compute predictions
  prdData = predict_pseudodata(par, data, prdData); % appends new field to prdData with predictions for the pseudo data: 

  run_repair(my_pet); % write results_my_pet.mat
  load(['results_', my_pet], 'metaPar'); % load metaPar to fill field MRE

  cd('../../entries_zip'); % goto add_my_pet/entries_zip from  add_my_pet/entries/my_pet
  zip_my_pet(my_pet, '../entries'); % zip the entry and save

  cd(['../entries_web/', my_pet]); % goto add_my_pet/entries_web from add_my_pet/entries_zip
  get_dataSet_nFig(data, auxData, metaData); % fill global dataSet_nFig
  prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar);  
  prt_my_pet_bib(metaData.species, metaData.biblist); % write my_pet_bib.bib
  bib2html([metaData.species, '_bib']); % write my_pet_bib.html
end
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
