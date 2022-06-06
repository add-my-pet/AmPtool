%% repair_id
% loads a mydata-file in the Matlab editor and saves files 

%%
function repair_id(my_pet)
% created 2021/08/14 by Bas Kooijman

%% Syntax
% <repair_id *repair_id*>(my_pet)

%% Description
% loads mydata_my_pet to allow editing links, saves results_my_pet.mat, my_pet_date.zip and my_pet_toolbar.html
%
% Input:
%
% * my_pet: string with name of existing entry

%% Remarks
% * AmP supports 23 websites: 7 general, 16 taxon-specific. 
% * Print table with id's with <prt_id.html *prt_id*>.
% * Still needs syncing with server afterwards

%% Example
% repair_id('Ceriodaphnia_dubia')


  WD = cdCur;
  cdEntr(my_pet);
     
  % edit mydata_my_pet.m file
  edit(['mydata_', my_pet, '.m']);
  [my_pet, ' ', get_id_Taxo(my_pet)]
  fprintf('type dbcont to proceed or dbquit \n'); keyboard
        
  run_repair(my_pet); % write results_my_pet.mat file
         
  % write zip file
  cd('../../entries_zip'); % goto add_my_pet/entries_zip from  add_my_pet/entries/my_pet
  zip_my_pet(my_pet, '../entries'); % zip the entry and save
         
  % write toolbar
  cdCur; prt_my_pet_toolbar(my_pet, ['../../deblab/add_my_pet/entries_web/', my_pet,'/']);                                  
        
  cd(WD);

end

function run_repair(my_pet)
% use estim_pars for writing results_my_pet.mat file
global pets 

pets = {my_pet}; 

estim_options('default'); 
estim_options('pars_init_method', 2); 
estim_options('results_output', 0); 
estim_options('method', 'no'); 

estim_pars; 
end
