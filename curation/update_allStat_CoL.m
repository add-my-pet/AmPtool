%% update_allStat_CoL
% updates allStat with current id_CoL 

%%
function update_allStat_CoL(pets)
% created 2021/08/04 by Bas Kooijman

%% Syntax
% <update_allStat_CoL *update_allStat_CoL*>(pets)

%% Description
% overwrites field allStat.my_pet.id_CoL with current id_CoL results_my_pet.mat files.
%
% Input:
%
% * pets: cell array with names of existing entries

%% Example
% update_allStat_CoL (select)

  WD = cdCur;
  

  load allStat
  n = length(pets); 
  
   for i = 1:n
     cdEntr(pets{i});
     load(['results_', pets{i},'.mat'], 'metaData');
     allStat.(pets{i}).id_CoL = metaData.links.id_CoL; 
     
     % write toolbar
     cdCur; prt_my_pet_toolbar(pets{i}, ['../../deblab/add_my_pet/entries_web/', pets{i},'/']);                                  

   end
   
   cdAmPdata;   
   save('allStat.mat', 'allStat');
   zip('AmPdata', {'allStat.mat','popStat.mat','cdAmPdata.m'}); 
   
   cd(WD);

