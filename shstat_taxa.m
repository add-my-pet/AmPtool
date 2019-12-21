%% shstat_taxa
% plots statistics and/or parameters for a taxon as function of taxonomic distance

function [Hfig Hleg val entries missing] = shstat_taxa(vars, legend, label_title, Hfig)
% created 2017/04/22 by Bas Kooijman

%% Syntax
% [Hfig val entries] =  <../shstat_taxa.m *shstat_taxa*>(vars, legend, label_title, Hfig)

%% Description
% Plots statistics and/or parameters using allStat.mat as source (which must exist) for a taxon specified in legend{end,2} as function of normalised taxonomic distance.
% These distances are computed with <dist_taxa.html *dist_taxa*>, on the basis of the classification, as specified in the lists-of-lists for subsequent pairs of entries.
%
% Input vars can also be a numerical (n,k)-matrix for n = length(select) and f = size(vars,2), but the labels on the yxis are then empty and output val equals input vars.
% In that case, read_allStat is bypassed and labels must be set by user afterwards, see mydata_shstat.
%
% Input:
%
% * vars: k-cell string with name(s) of independent variables, or (n,k) matrix of values with n = length(select) 
% * legend: (m,2)-array with legend: (marker, taxon)-pairs; taxon legend{end,2) must include all other taxa
% * label_title: optional string or k-cell string for title of figure
% * Hfig: optional k-vector with figure handles (to get the plot in a specified figure). Default 1,2,.,k
%
% Output
%
% * Hfig: k-vector with figure handles for plots (equal to input, if specified there)
% * Hleg: scalar with figure handle for legend 
% * val: (n,k)-matrix with untransformed y-values (depending on the spefication of vars)
% * entries: n-cell string with names of entries
% * missing: cell string with names of entries that should have been plotted, but are missing (because of lack of data in allStat.mat) 

%% Remarks
% The computation of taxonomic distances might take some time.
% Legend can be set/modified with <../../DEBtool_M/taxa/html/select_legend.html *select_legend*>.  
% In the case that a taxon is included in another one, double plotting is suppressed from first-to-last column of selection matrix, and plotting is done for last-to-first column.
% So, if Aves and Animalia are in legend in this sequence, Animalia-markers are not plotted for Aves, and Aves-markers are on top of Animalia-markers in case of crowding.
% If Animalia is in legend before Aves, no Aves-markers are shown.
%
% No transformation is done in this function, so, if required, do it outside and use numerical mode.
%
% Make sure that allStat has been generated at the correct temperature (for times and rates); all parameters are at T_ref, but statistics at T_typical.
% Make sure that allStat is consistent with select('Animalia'); can be done via <write_allStat.html *write_allStat*>.
%
% Set options with <shstat_options,.html *shstat_options*> (such as logarithmic transformation of axes).
% Symbols and units are always plotted on the axes in non-numerical mode, but descriptions only if x_label, and/or y_label and/or z_label is 'on'.
%
% See shstat for further details

%% Example of use
% shstat_taxa({'kap', 'p_M', 'v'}, legend_actino)
% kvp = read_allStat({'kap', 'p_M', 'v'}); kvp(:,[2 3]) = log10(kvp(:,[2 3]); shstat_taxa( kvp, legend_actino)

  % get x-values, label
  taxon = legend{end,2}; i_sel = select_01('Animalia', taxon);
  %TD = 1:length(select(taxon));
  TD = dist_taxa(taxon);
  dist = zeros(length(i_sel),1); dist(i_sel) = TD; % expand distances to size of Animalia
  label_x = ['relative taxon distances for ', taxon];

  % get y-values, units, label
  if isnumeric(vars) % numerical mode, read_allStat is bypassed
    val = vars;
    [n_entries n_vars] = size(vars); 
    units_y = []; label_y = [];
    entries = select;
    if ~(n_entries == length(entries))
      fprintf('Warning from shstat_taxa: number data-points is not equal to number of entries\n');
    end
  else % read values of variables, units and labels using read_allStat
    n_vars = length(vars);
    [val entries units_y label_y] = read_allStat(vars);
    n_entries = length(entries); 
  end

  % compose selection matrix, missing entries
  missing = entries(isnan(val)); % determine missing entries
  n_taxa = size(legend, 1); % number of taxa to be plotted  
  if n_taxa > 1
    sel = zeros(n_entries, n_taxa);
    [sel(:,1) entries_sel] = select_01('Animalia', legend{1,2});
    if ~isequaln(entries, entries_sel)
      fprintf('Error in shstat_taxa: entries in allStat do not correspond with entries in select(''Animalia'')\n')
      Hfig = []; missing = []; return
    end
    for i = 2:n_taxa
      sel(:,i) = select_01('Animalia', legend{i,2});
    end
  end     

  % edit y-label symbol as text on y-axis
  if isnumeric(vars)
    symbol_y = []; label_y = []; units_y = [];
  else
    symbol_y = vars;  % initiate text for symbols
    for i = 1:n_vars
      [nm1 nm2] = strtok(symbol_y{i},'_');
      if ~isempty(nm2)
        symbol_y{i} = [nm1, '_{', nm2(2:end), '}'];
      end
      label_y{i} = [label_y{i}, ', ', symbol_y{i}, ', ', units_y{i}];
    end
  end
  
  if ~exist('Hfig','var') || isempty(Hfig)
    Hfig = 1:n_vars; % assign handles
  end

  ssel = sum(sel,2) ~= 0; % sum select
  
  for k = 1:n_vars
    figure(Hfig(k))
    hold on
    for j = 1:n_taxa % scan taxa
      i = n_taxa - j + 1; % reverse sequence of plotting in case markers overlap
      marker = legend{i,1}; T = marker{1}; MS = marker{2}; LW = marker{3}; MEC = marker{4}; MFC = marker{5};  
      plot(dist(sel(:,i)==1), val(sel(:,i)==1,k), T, 'MarkerSize', MS, 'LineWidth', LW, 'MarkerFaceColor', MFC, 'MarkerEdgeColor', MEC)
    end
    set(gca, 'FontSize', 15, 'Box', 'on')
    xlabel(label_x)  
    ylabel(label_y{k})
      
    h = datacursormode(Hfig(k));
    data = [dist, val(:,k)]; 
    h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries(ssel), data(ssel,:));
    datacursormode on % mouse click on plot
  end

  Hleg = shlegend(legend);
