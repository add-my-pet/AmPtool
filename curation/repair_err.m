function repair_err(entries)

if ~exist('entries','var')
    entries = select;
end
n_entries = length(entries);
WD = cdCur; cd('../../deblab/add_my_pet/entries/');
load allStat

for i=1:n_entries
  cd(entries{i})
  fprintf('%4.4g: %s\n', i, entries{i})
  % in entries: change metaPar and store 
  load(['results_',entries{i}]) 
  
  [data, auxData, metaData, txtData, weights] = feval(['mydata_', entries{i}]);
  [par, metaPar, txtPar] = feval(['pars_init_', entries{i}], metaData);
  prdData = feval(['predict_',entries{i}], par, data, auxData); % run predict_* to compute predictions
  prdData = predict_pseudodata(par, data, prdData); % appends new field to prdData with predictions for the pseudo data:  
  [metaPar.MRE, metaPar.RE] = mre_st(['predict_', entries{i}], par, data, auxData, weights);
  [metaPar.SMAE, metaPar.SAE] = smae_st(['predict_', entries{i}], par, data, auxData, weights);
  [metaPar.SMSE, metaPar.SSE] = smse_st(['predict_', entries{i}], par, data, auxData, weights);
  save(['results_',entries{i},'.mat'], 'par', 'txtPar', 'metaPar', 'metaData')
  
  % in entries_web: change my_per_res.html
  cd(['../../entries_web/',entries{i}])
  prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar);   % my_pet_res.html
  
  % change allStat.mat
  allStat.(entries{i}).MRE = metaPar.MRE;
  allStat.(entries{i}).SMAE = metaPar.SMAE;
  allStat.(entries{i}).SMSE = metaPar.SMSE;
  
  cd('../../entries/')
end
  % write species.list.html, about.html
  cdCur;
  prt_species_list; % add_my_pet/species_list.html
  prt_about; % add_my_pet/about.html
  
  % store allStat.mat
  cdAmPdata; 
  save('allStat.mat','allStat')
  load popStat
  zip('AmPdata', {'allStat.mat','popStat.mat','cdAmPdata.m'}); 
  n_entries = length(fields(allStat)); save('n_entries.mat', 'n_entries')

cd(WD);