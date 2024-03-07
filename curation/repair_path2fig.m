function repair_path2fig

WD = cdCur; cd ../../deblab/add_my_pet/entries_web/Daphnia_magna;
nm = select; n = length(nm); 

for i=1:n
    eval(['cd ../', nm{i}]); % goto dir nm{i}
    fnm = [nm{i} ,'_res.html'];
    res = fileread(fnm);
    res = strrep(res,'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/','../../');
    res = strrep(res,'target = ','target='); res = strrep(res,'href = ','href='); res = strrep(res,'id = ','id=');
    id = fopen(fnm, 'w+'); fprintf(id, '%s', res); fclose all;
    fprintf(' %g : %s \n', i, nm{i}); % report progress to screen 
end
cd(WD)
