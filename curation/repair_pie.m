function repair_pie

load allStat

WD = cdCur; cd ../../add_my_pet/entries_web/Daphnia_magna;
nm = select; n = length(nm); 

for i=1:n
    eval(['cd ../', nm{i}]);
    eval(['load ../../entries/', nm{i}, '/results_', nm{i}, '.mat'])
    stat = statistics_st(allStat.(nm{i}).model, par, metaData.T_typical, 1);
    pie_SGGJR (metaData.species, allStat.(nm{i}).model, par, stat, './');
    fprintf(' %g : %s \n', i, nm{i}); % report progress to screen 
end
cd(WD)
