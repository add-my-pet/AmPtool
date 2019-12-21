%% write_addStat
% writes a structure with all pars and stats for all entries

%%
function allStat = write_addStat(taxa, T, f)
% created 2016/11/18 by Bas Kooijman, modified 2017/08/16

%% Syntax
% allStat = <write_addStat *write_addStat*> (T, f)

%% Description
% Appends result of <get_addStat.html *get_addStat*> to file allStat.mat, which is loaded and overwritten.
% Members of taxa should also be members of select and do not exist yet in allStat.
% They should occur in sister-directory entries.
% If T and f are specified, all members of taxa are added with the same values; consider multiple calls otherwise.
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
% See <write_allStat.html *write_allStat*> for writing allStat from fresh for all entries.
% See <read_allStat.html *read_allStat*> for extracting values from allStat.mat.

%% Example of use
% write_addStat({'Regulus_regulus'})

  % check if all members of taxa are in select('Animalia')
  n = length(taxa); taxa_src = select; absent = 0;
  for i = 1:n
    if ~(strcmp(taxa_src, taxa{i}))
      fprintf([taxa{i}, ' is not in select\n']);
      absent = absent + 1;
    end
  end
  if absent > 0
    return
  end
  
  % check if some members of taxa are already in allStat
  load allStat.mat
  present = isfield(allStat, taxa);
  if sum(present) > 0
    fprintf('Not all members of taxa are absent in existing allStat.mat\n');
    taxa = taxa{present};
    return
  end
  
  % check if all members of taxa are in entries
  WD = pwd;                % store current path
  absent = 0;
  for i = 1:n
    try % goto entries
      cd(['../../entries/', taxa{i}]) 
    catch
      fprintf([taxa{i}, ' does not occur in sister-directory entries\n']);
      absent = absent + 1;
    end
    cd(WD)                 % goto original path
  end
  if absent > 0
    return
  end
  
  % get data from get_addStat
  if ~exist('f', 'var') 
    if ~exist('T', 'var')
      allStat = get_addStat(taxa);
    else
      allStat = get_addStat(taxa, T);
    end
  else
    allStat = get_addStat(taxa, T, f);
  end

  curation = which('write_allStat');   
  cd(curation(1:end - 15))                         
  save('../../AmPdata/allStat.mat','allStat') % overwrite allStat.mat
  cd(WD)