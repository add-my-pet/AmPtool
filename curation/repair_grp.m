%% repair_grp

%%
function WD = repair_grp(entries)
% created 2022/03/11 by Bas Kooijman

%% Syntax
% WD = <repair_grp *repair_grp*>(entries)

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
% repair_grp(select('Mus'));

function WD = repair_grp(entries)

WD = cdCur;
% path setting for curators 
cur2ew = '../../deblab/add_my_pet/entries_web/'; % path from AmPtool/curation to entries_web
cur2e = '../../deblab/add_my_pet/entries/'; % path from AmPtool/curation to entries

if ~iscell(entries)
  entries = {entries};
end
n_entries = length(entries);

for i=1:n_entries
  cur2ewmp = [cur2ew, entries{i},'/']; % path from AmPtool/curation to entries_web/my_pet
  cur2emp = [cur2e, entries{i},'/']; % path from AmPtool/curation to entries/my_pet

  cd(cur2emp); % goto entry i in dir entries
  edit(['mydata_',entries{i},'.m'])
  fprintf('%g: %s; type dbcont to proceed or dbquit \n',i,entries{i}); keyboard
  feval(['run_', entries{i}]); close all;
  load(['results_', entries{i}, '.mat']); % load results_my_pet.mat 
  [data, auxData, metaData, txtData] = feval(['mydata_',metaData.species]); % run mydata_* to create data files
  prdData = feval(['predict_',metaData.species], par, data, auxData); % run predict_* to compute predictions
  prdData = predict_pseudodata(par, data, prdData); % appends new field to prdData with predictions for the pseudo data:  
  cdCur;
  bib2html([metaData.species, '_bib'], cur2ewmp);                                 % my_pet_bib.html 
  prt_my_pet_bib(metaData.species, metaData.biblist, cur2ewmp);                   % my_pet_bib.bib 
  delete('*.cache', '*.wn', '*.asv', '*.bib', '*.bbl', '*.html') % delete unwanted and bib files
  cd('../../deblab/add_my_pet/entries_zip'); % goto add_my_pet/entries_zip from  AmPtool/curation
  zip_my_pet(entries{i}, '../entries'); % zip the entry and save
  cdCur;
  prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar, cur2ewmp);   % my_pet_res.html
end

cd(WD);