%% get_addStat
% adds all pars and stats to allStat.mat for specified entries

%%
function allStat = get_addStat(entries, T, f)
% created 2016/04/22 by Bas Kooijman, modified 2022/02/21

%% Syntax
% allStat = <get_addStat *get_addStat*> (taxa, T, f)

%% Description
% gets model, MRE, SMSE, CLOMPLETE, author, date_subm, date_acc, all parameters and statistics of specified entries.
% Parameters are always expressed at T_ref, i.e. C2K(20), irrespective of input T.
%
% Input:
%
% * entries: cell string with taxa to be added
% * T: optional scalar with body temperature in Kelvin for ststistics (default T_typical, which is entry-specific)
% * f: optional scalar with scaled functional response (default 1)
%
% Output:
% 
% * allStat: structure with all parameters and statistics values

%% Remarks
% * Data are extracted and added in <addStat.html *addStat*>
% * Meant to be used in combination with <write_addStat.html *write_addStat*>, which checks presence in sister-directory entries.
% * The units and labels are given in AmPdata/allUnits and allLabel

%% Example of use
% see write_addStat
  
  if ~exist('T', 'var') || isempty(T)
    set_T = 0; % identifier for temperature setting
  else 
    set_T = 1;
  end
 
  if ~exist('f', 'var') || isempty(f) 
    f = 1;
  end

  load allStat
  
  ne = length(entries);
  WD = cdCur; % store current path and goto AmP/curation
  cd(['../../deblab/add_my_pet/entries/',entries{1}]) % goto entries

  try
    for i = 1:ne
      cd (['../', entries{i}])
      fprintf([num2str(i), ': ', entries{i}, '\n']); % show progress on screen (takes some time)

      allStat.(entries{i}) = addStat(entries{i}); 
    end
  catch 
    disp(['Warning from get_addStat: Statistics of entry ', entries{i},' could not be extracted'])
    keyboard
  end
   
  cd(WD)                   % goto original path
end
