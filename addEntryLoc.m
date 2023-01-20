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
% It also assumes that your entry is already added to the lists-of-lists.

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

return

WD = cdCur; % go to AmPtool/curation

if ~exist('entries','var')
  entries = select;
end

% allStat and popStat are made persistent and must be overwritten
clear all; load('temporary.mat'); 

% write add_my_pet/AmPdata/allStat.mat and popStat.mat
[allStat, info] = write_addStat(my_pet); % this adds/modifies allStat for selected entries
if ~info; return; end
write_popStat_loc(my_pet); % collects entries_web/my_pet_pop.mat files in structure popStat

cd(WD); % return to original directory
