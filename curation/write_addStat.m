%% write_addStat
% writes a structure with all pars and stats for selected entries

%%
function [allStat, info] = write_addStat(taxa, T, f)
% created 2016/11/18 by Bas Kooijman, modified 2017/08/16

%% Syntax
% [allStat, info] = <write_addStat *write_addStat*> (taxa, T, f)

%% Description
% Appends/overwrites result of <get_addStat.html *get_addStat*> to file allStat.mat, which is loaded and overwritten.
% Members of taxa should also be members of select.
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
% * info: boolean for species in taxa present in  lists-of-lists (1), or not (0)

%% Remarks
% * See <write_allStat.html *write_allStat*> for writing allStat from fresh for all entries.
% * See <read_allStat.html *read_allStat*> for extracting values from allStat.mat.

%% Example of use
% write_addStat('Regulus_regulus') or write_addStat('Etheostoma') 
  
  clear global

  if ischar(taxa)  && isempty(strfind(taxa,'_'))
    taxa = select(taxa);
  elseif ischar(taxa)
    taxa = {taxa};
  end
  
  % check if all members of taxa are in select('Animalia')
  n = length(taxa); taxa_src = select; absent = 0; info = true;
  for i = 1:n
    if ~(strcmp(taxa_src, taxa{i}))
      fprintf([taxa{i}, ' is not in select\n']);
      absent = absent + 1;
    end
  end
  if absent > 0
    info = false; allStat = []; return
  end
  
  % write number of entries in lists-of-lists in Amtool/taxa/n_taxa.mat; this avoids the need to run length(select)
  n_entries = length(taxa_src); WD = cdCur; cd ../taxa; save('n_entries.mat', 'n_entries'); cd(WD);

  % check if some members of taxa are already in allStat
  WD = cdAmPdata; load allStat.mat % load allUnits allLabel;
  present = isfield(allStat, taxa);
  if any(present)
    fprintf('Warning from write_addStat: Not all members of taxa are absent in existing allStat.mat\n');
  end
  
  % check if all members of taxa are in entries
  absent = 0; cd(['../entries/', taxa{1}]);
  for i = 1:n
    try % goto entries
      cd(['../', taxa{i}]) 
    catch
      fprintf(['Warning from write_addStat: ', taxa{i}, ' does not occur in sister-directory entries\n']);
      absent = absent + 1;
    end
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
  
  % check if length of allStat corresponds with number of entries in lists-of-lists
  n_entries = length(taxa_src); taxa_fld = fields(allStat); n_allStat = length(taxa_fld);
  if ~(n_allStat == n_entries)
    fprintf(['Warning from write_addStat:  allStat has ', num2str(n_allStat), ' fields, but lists-of-lists have ', num2str(n_entries), ' entries\n']);
    diff = setdiff(taxa_src, taxa_fld);
      fprintf('present in lists-of-lists, but not in allstat\n');
    if ~isempty(diff)
      diff
    end
    diff = setdiff(taxa_fld, taxa_src);
    if ~isempty(diff)
      fprintf('present in allstat, but not in lists-of-lists\n');
      diff
    end
    return
  end
  allStat = orderfields(allStat, taxa_src); % re-order fields in allStat to match lists-of-lists

  cdAmPdata; 
  save('allStat.mat','allStat'); 
  %save('allUnits.mat','allUnits'); save('allLabel.mat','allLabel'); 
  cd(WD); % overwrite allStat.mat
  