%% addEntryLoc
% adds an entry to allStat and popStat outside the AmP website 

%%
function addEntryLoc(my_pet)
% created 2023/01/20 by  Bas Kooijman 

%% Syntax
% <../addEntryLoc.m *addEntryLoc*> (my_pet)

%% Description
% Overwrites AmPdata/allStat and popStat using local results_my_pet.mat.
%
% Input:
%
% * my_pet: string with name of entry to be added
%
% Output:
%
% * no explicit output

%% Remarks
% This function assumes that the file results_my_pet.mat exists in the
% local directory, where my_pet is replaced with the name of your entry.
% It also assumes that the species is already added to the lists-of-lists.
% This function does not change AmPdata.zip, allUnits, allLabel 
% Warning: this function uses clear all to replace AmPdata/allStat.mat, popStat.mat and AmPtool/n_entries.mat.

%% Example of use
% addEntryLoc('my_pet'), where my_pet is replaced with the name of your entry.

% check required inputs
if isempty(select(my_pet))
  fprintf('Warning from addEntryLoc: name %s is not found in lists-of-lists\n', my_pet);
  return
end
source = ['results_', my_pet, '.mat'];
try
  load(source); % load results_my_pet.mat 
catch
  fprintf('Warning from addEntryLoc: file %s is not found in local directory\n', source);
  return
end

WD = pwd;

cdCur; % go to AmPtool/curation
% write number of entries in lists-of-lists in Amtool/taxa/n_taxa.mat; this avoids the need to run length(select)
n_entries = length(select); WD = cdCur; cd ../taxa; save('n_entries.mat', 'n_entries'); cd(WD);

% go to AmPdata and check if my_pet is already in allStat
cdAmPdata; clear all; load allStat.mat % load allUnits allLabel;
if isfield(allStat, my_pet)
  fprintf('Warning from addEntryLoc: %s already exists allStat.mat\n', my_pet);
  return
end
% write add_my_pet/AmPdata/allStat.mat and popStat.mat
[allStat, info] = write_addStat(my_pet); % this adds/modifies allStat for selected entries
if ~info 
   fprintf('Warning from addEntryLoc: addition to allStat.mat was unsuccessful\n');
   return
end

% prepare adding to popStat
load popStat
[stat, Hfig_surv, Hfig_stab] = popStatistics_st(model, par, T, f);
popStat.(my_pet) = stat; popStat.(my_pet).T = T; 
popStat.(my_pe).model = model; popStat.(my_pet).par = par; 
save('popStat.mat','popStat'); 

cd(WD); % return to original directory
