function repair_toolbar

WD = cdCur;
entries = select; n_entries = length(entries);
cur2ew = '../../deblab/add_my_pet/entries_web/'; % path from AmPtool/curation to entries_web

for i=1:n_entries
  cur2ewmp = [cur2ew, entries{i},'/']; % path from AmPtool/curation to entries_web/my_pet
  prt_my_pet_toolbar(entries{i}, cur2ewmp); 
  fprintf([entries{i}, '\n'])
end

cd(WD);