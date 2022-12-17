function repair_pop

WD = cdAmPdata; load('popStat.mat','popStat');pop_allStat = popStat;
cdCur; cd('../../deblab/add_my_pet/entries_web/Daphnia_magna');
entries = select; n_entries = length(entries);

for i=1:n_entries
  cd(['../',entries{i}])
  fprintf([num2str(i), ': ', entries{i}, '\n'])% print progress to screen
  load([entries{i}, '_pop.mat'])
  popStat.(entries{i}).pwd
  
end

cdAmPdata; save('popStat.mat','popStat');
cd(WD);