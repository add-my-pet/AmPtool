function repair_res(entries)
global pets
WD = cdCur;
estim_options('default'); estim_options('method', 'no'); estim_options('results_output', 3); estim_options('pars_init_method', 2); 
cur2ew = '../../deblab/add_my_pet/entries_web/'; % path from AmPtool/curation to entries_web
cur2e = '../../deblab/add_my_pet/entries/'; % path from AmPtool/curation to entries

if ~exist('entries','var')
  entries = select; 
end
n_entries = length(entries);

for i=1:n_entries
  cd([cur2e,entries{i}]);
  [data, auxData, metaData, txtData] = feval(['mydata_', entries{i}]);
  [par, metaPar, txtPar] = feval(['pars_init_', entries{i}], metaData);
  prdData = feval(['predict_', entries{i}], par, data, auxData);
  prdData = predict_pseudodata(par, data, prdData); % appends new field to prdData with predictions for the pseudo data:  
  load(['results_',entries{i}]);
  close all; pets = entries(i); estim_pars; % fill dataSet_nFig
  cdCur;
  prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar, [cur2ew,entries{i},'/']);
  fprintf('%g: %s\n', i, entries{i})
end

cd(WD);