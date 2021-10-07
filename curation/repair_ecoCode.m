%% repair_ecoCode
% loads a mydata-file in the Matlab editor and saves files 

%%
function repair_ecoCode(my_pet)
% created 2021/09/26 by Bas Kooijman

%% Syntax
% <repair_id *repair_ecoCode*>(my_pet)

%% Description
% loads mydata_my_pet to allow editing ecoCodes, saves results_my_pet.mat,
%   my_pet_res.html, my_pet_date.zip and updates allStat and saves allStat and AmPdata.zip
%
% Input:
%
% * my_pet: string with name of existing entry

%% Remarks
% Still needs syncing with server afterwards

%% Example
% repair_ecoCode('Ceriodaphnia_dubia')

  % path setting for curators 
  WD = cdCur;
  cdEntr(my_pet);
     
  % edit mydata_my_pet.m file
  edit(['mydata_', my_pet, '.m']);
  fprintf('type dbcont to proceed or dbquit \n'); keyboard
                       
  % write my_pet_res-page, results_my_pet.mat and zip file
  run_collection(my_pet)
  
  % update allStat
  write_addStat(my_pet); % this adds/modifies allStat for selected entries
        
  % write add_my_pet/AmPdata/AmPdata.zip
  cdAmPdata; zip('AmPdata', {'allStat.mat','popStat.mat','cdAmPdata.m'}); cdCur; 

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
