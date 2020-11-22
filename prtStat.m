%% prtStat
% Print parameter or stastistic of selected entries names and values 

%%
function [nm, val, units, label] = prtStat(taxa, var, in)
  % created by Bas Kooijman 2017/08/20, modified 2017/11/24, 2017/12/14
  
  %% Syntax 
  % [nm, val, units, label] = <../prtStat.m *prtStat*>(taxa, var, in)
  
  %% Description
  % Print parameter or statistic values for selected entries to screen. 
  %
  % Input:
  %
  % * taxa: cell-string with taxa
  % * var: character string with parameter or statistic
  % * in:  optional scalar with indicator for ordering increasing (1), decreasing (-1), no printing to screen (0); default: no ordering and printing to screen (empty)
  %
  % Output
  %
  % * nm: n-cellstring with names of entries
  % * val: n-vector with values for parameter or statistic
  % * units: charactore string with units
  % * label: charactore string with label
  
  %% Remarks
  % See <pedigree.html *pedigree*> for lists with tree

  
  %% Example of use 
  % prtStat({'Paridae','Cyprinidae'}, 'p_M');
    
  [val nm units label] = read_allStat(var); 
  sel = select_01(taxa); 

  if ~(length(val) == length(sel))
    fprintf('Warning from prtStat: entries in allStat.mat do not correspond with those in returned by select \n');  
  end
      
  nm = nm(sel); val = val(sel);
  
  if ~exist('in', 'var') % yes or no sorting
    in = NaN;
  end
  
  switch in
    case -1
      [val i] = sort(val, 'descend'); nm = nm(i);
    case 1
      [val i] = sort(val, 'ascend'); nm = nm(i);
  end
    
  units = units{1}; label = label{1};
  
  if ~(in == 0)
    printpar(nm, val, [], [label, ': ', units])
  end
