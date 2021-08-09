function run_prt_toolbar(nm)
WD = cdCur;
cur2ew = '../../deblab/add_my_pet/entries_web/'; % path from AmPtool/curation to entries_web

n = length(nm);
for i = 1:n
  cdCur;
  prt_my_pet_toolbar(nm{i}, [cur2ew, nm{i}, '/']); % my_pet_toolbar.html
end
cd(WD);