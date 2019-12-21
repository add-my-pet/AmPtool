%% compare_taxa
% makes graphs of survivor functions and compose median values in a table of selected quantities for selected taxa

%%
function tab = compare_taxa(llegend, nr, format)
% created 2017/11/27 by Bas kooijman

%% Syntax
% tab = <../compare_taxa.m *compare_taxa*> (llegend, nr, format) 

%% Description
% makes graphs of survivor functions of selected quantities and compose median values in a table
%
% Input:
%
% * llegend: line-legend of taxa, see Remarks
% * nr: optional n-vector with selected quantities 1 till 19, e.g. [6 2 4],  (default all)
%
%    -  1  T_typical (typical body temperature)
%    -  2  kappa (allocation fraction to soma)
%    -  3  [p_M] (spec somatic maintenance)
%    -  4  v (energy conductance)
%    -  5  [E_m] (reserve capacity)
%    -  6  E_0 (initial energy)
%    -  7  Ww_i (max wet weight)
%    -  8  r: dWm/W_dWm (max growth over weight-at-that-moment)
%    -  9  R_i/Ww_i (max reprod rate over max weight)
%    - 10  p_Ri/Ww_i (max reprod power over max weight)
%    - 11  g (energy investment ratio)
%    - 12  s_M (acceleration)
%    - 13  s_s (supply stress) 
%    - 14  s_H^bp (maturity ratio)
%    - 15  s_HL^bp (maturity density ratio)
%    - 16  h_a (aging acceleration)
%    - 17  a_m (longevity)
%    - 18  p_Mi/p_Ai (som maint over assimilation)
%    - 19  p_Ji/p_Ai (mat maint over assimilation)
% 
% * format: optional character string with format for saving graphs, such as 'jpg' or 'png' or 'fig' (default empty meaning no saving)
%
% Output:
% 
% * tab: cell-array with median values of quantities, element (1,1) gives the current date

%% Remarks
% Warning: if format is specified in a valid way, existing graphs might be overwritten in the current directory, including file llegend.format.
% The warnings produced by shstat about missing values might not apply to the selection as specified in llegend.
% Be prepared that plotting might take long if all graphs are selected.
% The rows in the table match positions in nr; the columns match positions in llegend.
% Line-legend can be composed with <select_llegend.html *select_llegend*>.
% Convert output table to numbers with cell2mat: tab(1,:) = []; tab(:,1:2) = []; cell2mat(tab)

%% Example of use
%  llegend = {{'-', 2, [1 0 0]}, 'Boreogadus'; {'-', 2, [0 0 1]},  'Gadiformes'; {'-', 2, [0 0 0]}, 'Actinopterygii'}; tab = compare_taxa(llegend, [8 3]);

  if ~exist('nr', 'var') || isempty(nr)
    nr = 1:19; % edit this if new graphs are added
  end
 
  if ~exist('format', 'var') 
    format = [];
  end

  n_leg = size(llegend, 1);
  n_nr = length(nr);
  
  % initiate table
  tab = cell(n_nr+1, n_leg+1); 
  tab(1,1) = {datestr(date,26)}; tab(1,2) = {'unit'};
  for i=1:n_leg
    tab(1,2+i) = llegend(i,2);
  end
  
  % compose selection table
  [sel, nm] = select_01(llegend(1,2)); n_nm = length(nm);
  sel = [sel, false(n_nm, n_leg - 1)]; 
  for i = 2:n_leg
    sel(:,i) = select_01(llegend(i,2));
  end
  
  close all

  shstat_options('default');
  shstat_options('y_label', 'on'); % if 'off' (default), no `survivor function' shown on yaxis

  for i = 1:n_nr % scan figures
  switch nr(i)
      
    case 1 % T_typical (typical body temperature)
      fig(i); txt_var = 'T_{typical}'; unit = 'C';
      shstat_options('x_transform', 'none');
      T_typical = K2C(read_allStat({'T_typical'}));
      [Hfig, Hleg, val] = shstat(T_typical, llegend,[], i);  close(Hleg);
      fig(Hfig); xlabel([txt_var, ', ', unit])

    case 2 % kappa (allocation fraction to soma)
      fig(i); txt_var = 'kap'; unit = '-';
      shstat_options('x_transform', 'none');
      [Hfig, Hleg, val] = shstat({'kap'}, llegend,[], i); close(Hleg);
      fig(Hfig); xlabel([txt_var, ', ', unit])
 
    case 3 % [p_M] (spec somatic maintenance)
      fig(i); txt_var = '[p_M]'; unit = 'J/d.cm^3';
      shstat_options('x_transform', 'log10');
      [Hfig, Hleg, val] = shstat({'p_M'}, llegend, 'At T_{ref}', i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 4 % v (energy conductance)
      fig(i); txt_var = 'v'; unit = 'cm/d';
      shstat_options('x_transform', 'log10');
      vars = read_allStat('v', 's_M'); v = prod(vars,2);
      [Hfig, Hleg, val] = shstat(v, llegend, 'At T_{ref}, post metam', i); close(Hleg); 
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 5 % [E_m] (reserve capacity)
      fig(i); txt_var = '[E_m]'; unit = 'J/cm^3';
      shstat_options('x_transform', 'log10');
      [Hfig, Hleg, val] = shstat({'E_m'}, llegend, [], i);  close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 6 % E_0 (initial energy)
      fig(i); txt_var = 'E_0'; unit = 'J';
      shstat_options('x_transform', 'log10');
      [Hfig, Hleg, val] = shstat({'E_0'}, llegend, [], i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 7 % Ww_i (max wet weight)
      fig(i); txt_var = 'Ww_i'; unit = 'g';
      shstat_options('x_transform', 'log10');
      [Hfig, Hleg, val] = shstat({'Ww_i'}, llegend,[], i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 8 % r: dWm/W_dWm (max growth over weight-at-that-moment)
      fig(i); txt_var = 'max-r'; unit = '1/d';
      shstat_options('x_transform', 'log10');
      vars = read_allStat('dWm', 'W_dWm', 'c_T'); r = vars(:,1) ./ vars(:,2) ./ vars(:,3);
      [Hfig, Hleg, val] = shstat(r, llegend, 'At T_{ref}', i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 9 % R_i/Ww_i (max reprod rate over max weight)
      fig(i); txt_var = 'spec-R_i'; unit = '#/d.g';
      shstat_options('x_transform', 'log10');
      vars = read_allStat('R_i', 'c_T', 'Ww_i'); R_i = vars(:,1) ./ vars(:,2) ./ vars(:,3);
      [Hfig, Hleg, val] = shstat(R_i, llegend, 'At T_{ref}', i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 10 % p_Ri/Ww_i (max reprod power over max weight)
      fig(i); txt_var = 'spec-p_{Ri}'; unit = 'J/d.g';
      shstat_options('x_transform', 'log10');
      vars = read_allStat('p_Ri', 'c_T', 'Ww_i'); p_Ri = vars(:,1) ./ vars(:,2) ./ vars(:,3);
      [Hfig, Hleg, val] = shstat(p_Ri, llegend, 'At T_{ref}', i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 11 % g (energy investment ratio)
      fig(i); txt_var = 'g'; unit = '-';
      shstat_options('x_transform', 'log10');
      [Hfig, Hleg, val] = shstat({'g'}, llegend, [], i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 12 % s_M (acceleration)
      fig(i); txt_var = 's_M'; unit = '-';
      shstat_options('x_transform', 'log10');
      [Hfig, Hleg, val] = shstat({'s_M'}, llegend, [], i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 13 % s_s (supply stress) 
      fig(i); txt_var = 's_s'; unit = '-';
      shstat_options('x_transform', 'log10');
      [Hfig, Hleg, val] = shstat({'s_s'}, llegend, [], i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 14 % s_H^bp (maturity ratio)
      fig(i); txt_var = 's_H^{bp}'; unit = '-';
      shstat_options('x_transform', 'log10');
      [Hfig, Hleg, val] = shstat({'s_Hbp'}, llegend, [], i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 15 % s_HL^bp (maturity density ratio)
      fig(i); txt_var = 's_{HL}^{bp}'; unit = '-';
      shstat_options('x_transform', 'none');
      [Hfig, Hleg, val] = shstat({'s_HLbp'}, llegend, [], i); close(Hleg); 
      fig(Hfig); xlabel([txt_var, ', ', unit])

    case 16 % h_a (aging acceleration)
      fig(i); txt_var = 'h_a'; unit = '1/d^2';
      shstat_options('x_transform', 'log10');
      [Hfig, Hleg, val] = shstat({'h_a'}, llegend, 'At T_{ref}', i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 17 % a_m (longevity)
      fig(i); txt_var = 'a_m'; unit = 'd';
      shstat_options('x_transform', 'log10');
      vars = read_allStat('a_m', 'c_T'); a_m = vars(:,1) .* vars(:,2);
      [Hfig, Hleg, val] = shstat(a_m, llegend, 'At T_{ref}', i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 18 % p_Mi/p_Ai (som maint over assimilation)
      fig(i); txt_var = 's_{MA}'; unit = '-';
      shstat_options('x_transform', 'log10');
      vars = read_allStat('p_Si', 'p_Ai'); s_SA = vars(:,1) ./ vars(:,2);
      [Hfig, Hleg, val] = shstat(s_SA, llegend, [], i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

    case 19 % p_Ji/p_Ai (mat maint over assimilation)
      fig(i); txt_var = 's_{JA}'; unit = '-';
      shstat_options('x_transform', 'log10');
      vars = read_allStat('p_Ji', 'p_Ai'); s_JA = vars(:,1) ./ vars(:,2);
      [Hfig, Hleg, val] = shstat(s_JA, llegend, [], i); close(Hleg);
      fig(Hfig); xlabel(['_{10}log ', txt_var, ', ', unit])

  end % of switch
  
  % save figure, add to table
  if ~isempty(format)
    saveas(gca,[txt_var, '.', format])
  end
  tab(1+i,1) = {txt_var}; tab(1+i,2) = {unit};
  for j = 1: n_leg % scan taxa
    tab(1+i,2+j) = {median(val(sel(:,j)))};
  end

  end % of figure scan

  shllegend(llegend);
  if ~isempty(format)
    saveas(gca,['llegend', '.', format])
  end
  
 
  