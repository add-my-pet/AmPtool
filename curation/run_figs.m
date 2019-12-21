%% run_figs

WD = pwd;
nm = select;
cd('../../entries/Homo_sapiens');
n = length(nm);
for i=1:n
  cd (['../',nm{i}])
  eval(['run_', nm{i}]);
end
cd(WD)