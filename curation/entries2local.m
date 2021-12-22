%% entries2local
% copies all of add_my_pet/entries to local directoy entries

%%
function  entries2local
% created 2021/12/21 by Bas Kooijman

%% Syntax
% <entries2local *entries2local*>

%% Description
% copies the 4 m-files of add_my_pet/entries to local directoy entries and stores download date in file entries/date_download.mat.
% Creates local directory entries, if not existing


%% Remarks
% about 250 Mb and needs updating after each change in add_my_pet/entries on the web. 

%% Example
% entries2local

  path_entries = [set_path2server, 'add_my_pet/entries/'];         
  
  species = select;
  n_spec = length(species);
  
  mkdir('entries'); cd('entries'); 
  date_download = date; save('date_download.mat','date_download');
  
  for i=1:n_spec
    mkdir(species{i}); cd(species{i});
    if ismac || isunix
      system(['wget -O mydata_', species{i}, '.m ', path_entries, species{i}, '/mydata_', species{i}, '.m']);
      system(['wget -O pars_init_', species{i}, '.m ', path_entries, species{i}, '/pars_init_', species{i}, '.m']);
      system(['wget -O predict_', species{i}, '.m ', path_entries, species{i}, '/predict_', species{i}, '.m']);
      system(['wget -O run_', species{i}, '.m ', path_entries, species{i}, '/run_', species{i}, '.m']);
    else
      system(['powershell wget -O mydata_', species{i}, '.m ', path_entries, species{i}, '/mydata_', species{i}, '.m']);
      system(['powershell wget -O pars_init_', species{i}, '.m ', path_entries, species{i}, '/parsinit_', species{i}, '.m']);
      system(['powershell wget -O predict_', species{i}, '.m ', path_entries, species{i}, '/predict_', species{i}, '.m']);
      system(['powershell wget -O run_', species{i}, '.m ', path_entries, species{i}, '/run_', species{i}, '.m']);
    end
    cd('../')
  end
  cd('../') % go back to original directory