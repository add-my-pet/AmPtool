function get_av(my_pet)
% only used for birds
fprintf('ITIS = %s\n', get_id_ITIS(my_pet));
fprintf('EoL  = %s\n', get_id_EoL(my_pet));
fprintf('Taxo = %s\n', get_id_Taxo(my_pet));
fprintf('ADW  = %s\n', get_id_ADW(my_pet));
% open in browser
% Wiki, avibase, bow, birdlife, wikispecies, CoL