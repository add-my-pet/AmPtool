%% repair_order
% updates order field in mydata-files

%%
function repair_order(pets, order_old, order_new)
% created 2024/05/20 by Bas Kooijman

%% Syntax
% <repair_order *repair_order*>(my_pets, order_old, order_new)

%% Description
% replaces order field in mydata in entries and entries_web, makes a new zip, replaces order fields in allStat, rewrites species_list
%
% Input:
%
% * pets: (cell) string with name of existing entry

%% Remarks
% does not do any recalculations and replaces all occurneces of order_old

%% Example
% repair_order('Adamussium colbecki','Ostreoida','Pectinida')

  clear global
  load allStat
  WD = pwd; 
  
  if ~iscell(pets); pets = {pets}; end
  n = length(pets);
       
  for i = 1:n
    my_pet = pets{i}; cdEntr(my_pet);
    fnm = ['mydata_',my_pet,'.m']; mydata = fileread(fnm); mydata = strrep(mydata, order_old, order_new);
    id_mydata = fopen(fnm, 'w+'); fprintf(id_mydata, '%s', mydata); fclose(id_mydata);
    
    cd('../../entries_zip'); zip_my_pet(my_pet, '../entries'); 

    cd (['../entries_web/',my_pet]);
    fnm = [my_pet,'_res.html']; res = fileread(fnm); res = strrep(res,order_old, order_new);
    id_res = fopen(fnm, 'w+'); fprintf(id_res, '%s', res); fclose(id_res); 
    
    allStat.(my_pet).order = order_new;
  end       
  
  cdAmPdata; save('allStat.mat','allStat'); 

  cdCur; prt_species_list; % add_my_pet/species_list.html
  cd(WD);

end

