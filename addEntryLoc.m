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
% This function assumes that the file results_my_pet.mat exists in the local directory, where my_pet is replaced with the name of your entry.
% It also assumes that the species is already added to the lists-of-lists.
% This function does not change AmPdata.zip, allUnits, allLabel 
% Warning: this function replaces AmPdata/allStat.mat, popStat.mat and AmPtool/taxa/n_entries.mat.
% See the AmPtool manual for further instructions.

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

WD = pwd; % store current working directory

cdCur; cd ../taxa; % go to AmPtool/curation/taxa
% write number of entries in lists-of-lists in Amtool/taxa/n_taxa.mat; this avoids the need to run length(select)
n_entries = length(select); save('n_entries.mat', 'n_entries'); % write AmPtool/taxa/n_entries.mat

% go to AmPdata and check if my_pet is already in allStat
cdAmPdata; clear allStat; % These structures are persistent and need to be removed to replace
load allStat.mat % load allUnits allLabel;
if isfield(allStat, my_pet)
  fprintf('Warning from addEntryLoc: %s already exists allStat.mat\n', my_pet);
  return
end

cd(WD);
allStat.(my_pet) = addStat(my_pet); % use T_typical and f=1
cdAmPdata; save('allStat.mat','allStat'); % write add_my_pet/AmPdata/popStat.mat

try % prepare adding to popStat
  clear popStat; load popStat
  par.reprodCode = metaData.ecoCode.reprod; par.genderCode = metaData.ecoCode.gender;
  [stat, Hfig_surv, Hfig_stab] = popStatistics_st(metaPar.model, par);
  popStat.(my_pet) = stat; popStat.(my_pet).T = metaData.T_typical; 
  popStat.(my_pet).model = metaPar.model; popStat.(my_pet).par = par; 
  save('popStat.mat','popStat'); % write add_my_pet/AmPdata/popStat.mat
catch
  fprintf('Warning from addEntryLoc: addition to popstat was failed\n');
end

cd(WD); % return to original directory
