%% write_allStat
% writes a structure with all pars and stats for all entries

%%
function allStat = write_allStat(T, f)
% created 2016/04/24 by Bas Kooijman, modified 2017/08/16, 2018/08/16

%% Syntax
% allStat = <write_allStat *write_allStat*> (T, f)

%% Description
% Writes result of <get_allStat.html *get_allStat*> to file allStat.mat in parent dir of curation
%
% Input:
%
% * T: optional scalar with body temperature in Kelvin (default T_typical, which is entry-specific)
% * f: optional scalar with scaled functional response (default 1)
%
% Ouput:
%
% * allStat: stucture with all parameters and statistics of all entries

%% Remarks
% See <write_addStat.html *write_addStat*> for appending a few entries to allStat.
% For a11 entries, the allStat.mat file is 2.6 Mb. and write_allStat takes 8 minutes to generate.
% See <read_allStat.html *read_allStat*> for extracting values from allStat.mat.

%% Example of use
% write_allStat;

  if ~exist('f', 'var') 
    if ~exist('T', 'var')
      allStat = get_allStat;
    else
      allStat = get_allStat(T);
    end
  else
    allStat = get_allStat(T, f);
  end
  
  % check if allStat and local dir ../../entries have the same entries
  entries_local = cellstr(ls('../../entries')); entries_local(1:2) = []; % remove '.' and '..'
  entries_allStat = fieldnames(allStat); 
  diff = setdiff(entries_allStat, entries_local);
  if ~isempty(diff)
    fprintf('warning from write_allStat: present in allStat, but not in debtool/entries\n');
    diff
  end
  %
  diff = setdiff(entries_local, entries_allStat);
  if ~isempty(diff)
    fprintf('warning from write_allStat: present in debtool/entries, but not in allStat\n');
    diff
  end


  WD = pwd;                        % store current path
  curation = which('write_allStat');   
  curation = curation(1:end - 15);         
  cd(curation)                     % goto taxa

  save('../../AmPdata/allStat.mat','allStat')
  
  cd(WD);