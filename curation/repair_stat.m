function repair_stat

WD = cdCur; cd ../../add_my_pet/entries_web/Daphnia_magna

nm = select; n = length(nm); 
for i=1:n
    eval(['cd ../', nm{i}]);
    fnm = [nm{i}, '_stat.html'];
    f = fileread(fnm);
    fn = strrep(f, '<div w3-include-html="../../add_my_pet/sys/footer_amp.html"></div>', '<div w3-include-html="../../sys/footer_amp.html"></div>');
    oid = fopen(fnm, 'w+');
    fprintf(oid, '%s', fn);
    fclose(oid);
end
cd(WD)
