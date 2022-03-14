function repair_par

WD = cdCur; cd('../../deblab/add_my_pet/entries_web/Daphnia_magna');
txt = ['<script src="../../sys/ftiens4.js"></script>', char(10)];
entries = select; n_entries = length(entries);

for i=1:n_entries
  cd(['../',entries{i}])
  res = fileread([entries{i},'_par.html']);
  res = strrep(res, txt, [txt, '  <script src="../../sys/specJump.js"></script>', char(10)]);
  oid = fopen([entries{i},'_par.html'], 'w+'); fprintf(oid, '%s', res); fclose(oid);
  fprintf([entries{i}, '\n'])
end

cd(WD);