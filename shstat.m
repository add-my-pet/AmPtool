%% shstat
% plots statistics and/or parameters

%%
function [Hfig, Hleg, val, entries, missing] = shstat(vars, legend, label_title, Hfig)
% created 2016/04/23 by Bas Kooijman; modified 2017/04/20, 2017/10/14, 2018/01/22

%% Syntax
% [Hfig val entries missing] =  <../shstat.m *shstat*>(vars, legend, label_title, Hfig)

%% Description
% plots statistics and/or parameters using allStat.mat as source (which must exist). 
%
% Input vars can be a cell-string with names of parameters and/or statistics, 
%   but can also be a numerical (n,1)- or (n,2)- or (n,3)-matrix for n = length(select), but the labels on the axis are then empty and output val equals input vars.
% In that case, read_allStat is bypassed and labels must be set by user afterwards, see mydata_shstat.
%
% If the number of variables as specified in vars equals 1, legend is optional and specifies the colors of the survivor function and median (default: {'b','r'}). 
% If legend is an (n,2)-cell array with color specs of survivor functions and medians, n survival curves are plotted.
% If the marker specifications in the legend are cell strings of length 3, the number of variables must be 3 and the third one is used to set colors using the lava color scheme.
%
% Input:
%
% * vars: cell string with name(s) of 1, 2 or 3 parameters and/or statistics or a data  array
% * legend: (m,2)-array with legend: (marker, taxon)-pairs; optional for 1 independent variable
% * label_title: optional string for title of figure, 
%     or cell-string with second cell for title of legend
% * Hfig: optional figure handle (to get the plot in a specified figure)
%
% Output
%
% * Hfig: figure handle for plot (equal to input, if specified there)
% * Hleg: figure handle for legend 
% * val: (n,1 or 2 or 3)-matrix with untransformed x or (x,y) or (x,y,z)-values (depending on the spefication of vars)
% * entries: n-cell string with names of entries
% * missing: cell string with names of entries that should have been plotted, but are missing (because of lack of data in allStat.mat) 

%% Remarks
% Legend can be set/modified for taxa with <select_legend.html *select_legend*> and for eco-codes with <select_legend_eco.html *select_legend_eco*>. 
% These are (n,2)-cell arrays with as as colums, character strings for taxa or cell-strings for eco-codes.
% Be aware that the sequence of rows in legend matters. 
% shstat composes a selection-of-entries matrix with first-to-last colum corresponding to taxa in first-to-last row of legend. 
% In the case that a taxon is included in another one, double plotting is suppressed from first-to-last column of selection matrix, and plotting is done for last-to-first column.
% So, if Aves and Animalia are in legend in this sequence, Animalia-markers are not plotted for Aves, and Aves-markers are on top of Animalia-markers in case of crowding.
% If Animalia is in legend before Aves, no Aves-markers are shown.
%
% If the marker specs have length 3 and there are 3 variables, points with a larger value for the third variable will be plotted on top of the ones with a smaller value.
% The third variable is then used to set the colors of the markers
%
% If eco-codes are used, the third input is treated as taxon specification, and the title is set by default; it be overwritten afterwards.
% The number of variables should then be larger than 1.
%
% Set options with <shstat_options.html *shstat_options*> (such as logarithmic transformation of axes).
% Symbols and units are always plotted on the axes in non-numerical mode, but descriptions only if x_label, and/or y_label and/or z_label is 'on'.
%
% In case of 1 variable: ylabel 'survivor function' is plotted if y_label = 'on'; input legend is then optional.
%  Legend should alternatively be specified as:
%    = a 2-cell string, the cells represent color specs for survivor function and median. 
%    = a line-legend (composed with select_llegend), the variable are plotted as several survivor functions, with median values in the same colors.
%
% In case of 2 variables: xy-labels are linked to markers (click on them to see entry-names).
%
% In case of 3 variables: hit rotation in the toolbar of the figure.
%
% Shstat recognises ecocodes in legend by the cell-strings in the second column. 
% Fields of ecocodes are coded as: C climate, E ecozone, H habitat, B, embryo, M migrate, F food, G gender, R reprod.
% <../mydata_shstat.m *mydata_shstat*> gives an example. So 'B.Tnp' stands for code Tnp in the field embryo-environment.
%
% Make sure that allStat has been generated at the correct temperature (for times and rates); all parameters are at T_ref.
% Make sure that allStat is consistent with select('Animalia')

%% Example of use
% see <../mydata_shstat.m *mydata_shstat*>

  global x_transform y_transform z_transform  x_label y_label z_label

  % get (x,y,z)-values, units, label
  if isnumeric(vars) % numerical mode, read_allStat is bypassed
    val = vars;
    [n_entries, n_vars] = size(vars); 
    units_x = []; units_y = []; units_z = [];
    label_x = []; label_y = []; label_z = [];
    entries = select;
%     if ~(n_entries == length(entries)) 
%       fprintf('Warning from shstat: number data-points is not equal to number of entries\n');
%     end
  else % read values of variables, units and labels using read_allStat
    n_vars = length(vars);
    switch n_vars
      case 1
        [val entries units label] = read_allStat(vars{1});
        units_x = units{1}; label_x = label{1}; 
        n_entries = length(entries); 
      case 2
        [val entries units label] = read_allStat(vars{1},vars{2});
        units_x = units{1}; units_y = units{2}; label_x = label{1}; label_y = label{2};
        n_entries = length(entries); 
      case 3
        [val entries units label] = read_allStat(vars{1},vars{2},vars{3});
        units_x = units{1}; units_y = units{2}; units_z = units{3}; label_x = label{1}; label_y = label{2}; label_z = label{3};
        n_entries = length(entries); 
    end
  end

  % compose selection matrix, missing entries
  if n_vars == 1 % only one variable to plot
    missing = entries(isnan(val)); % determine missing entries
    if exist('legend','var') 
      n_taxa = size(legend, 1); % number of taxa to be plotted  
      if n_taxa > 1 % for m == 1, legend means color survivor funfunction, color median
        sel = zeros(n_entries, n_taxa);
        [sel(:,1) entries_sel] = select_01('Animalia', legend{1,2});
        if ~isequaln(entries, entries_sel)
          fprintf('Error in shstat: entries in allStat do not correspond with entries in select(''Animalia'')\n')
          Hfig = []; missing = []; return
        end
        for i = 2:n_taxa
          sel(:,i) = select_01('Animalia', legend{i,2});
        end
      end 
    else
      n_taxa = 1;
    end

  else % n_vars > 1
    if ~exist('legend','var') || isempty(legend)
      legend = select_legend;
    end
    
    if iscell(legend{1,2}) % eco-code legend
      % select taxon
      if ~exist('label_title', 'var') || isempty(label_title)
        sel_taxon = ones(n_entries,1); label_title = 'Animalia';
      else
        sel_taxon = select_01(label_title); % label_title should specify a valid taxon
      end
      % select codes
      types = {'climate', 'ecozone', 'habitat', 'embryo', 'migrate', 'food', 'gender', 'reprod'};
      n_eco = size(legend, 1); n_taxa = n_eco; % number of eco-codes to be plotted, copy to n_taxa for actual plotting section
      sel = zeros(n_entries, n_eco); % initiate selection matrix
      for i = 1:n_eco % scan legend rows
       code = legend{i,2}; n_code = length(code); type = code{1}; type = types{strfind('CEHBMFR',type(1))}; 
       for j = 1:n_code % remove type-specification from codes
         c = code{j}; c(1:2) = []; code{j} = c; 
       end
       [taxa, sel_eco] = select_eco (type, code); 
       sel(:,i) =  sel_eco & sel_taxon;
      end
      if sum(sum(sel)) == 0
        fprintf('No points to plot\n')
        return
      end
      missing = entries(isnan(sum(val(any(sel,2),:),2))); % determine missing entries
      label_legend = [label_title, ' ',type];            % append date to default legend title
      label_title = [label_title, ' ', datestr(date,26)]; % append date to default figure title

    else                   % taxa legend
      n_taxa = size(legend, 1); % number of taxa to be plotted
      sel = zeros(n_entries, n_taxa);
      [sel(:,1), entries_sel] = select_01('Animalia', legend{1,2});
      if ~isempty(setdiff(entries_sel, entries))
        fprintf('Error in shstat: entries in allStat do not correspond with entries in select(''Animalia'')\n')
        Hfig = []; missing = []; return
      end
      for i = 2:n_taxa
        sel(:,i) =  select_01('Animalia', legend{i,2});
      end
      sel = once(sel);    % remove double selections  
      missing = entries(isnan(sum(val(any(sel,2),:),2))); % determine missing entries
    end
  end
  
  n_missing = length(missing);
  if ~(n_missing == 0)
    fprintf(['Warning from shstat: ', num2str(n_missing), ' entries are missing in the figure\n'])
  end

  % edit symbol as text on axis
  if isnumeric(vars)
    symbol_x = []; symbol_y = []; symbol_z = [];
  else
    symbol_x = vars{1};  % initiate text for symbols
    [nm1 nm2] = strtok(symbol_x,'_');
    if ~isempty(nm2)
      symbol_x = [nm1, '_{', nm2(2:end), '}'];
    end
    if n_vars > 1
      symbol_y = vars{2};
      [nm1, nm2] = strtok(symbol_y,'_');
      if ~isempty(nm2)
        symbol_y = [nm1, '_{', nm2(2:end), '}'];
      end  
    end
    if n_vars > 2
      symbol_z = vars{3};
      [nm1, nm2] = strtok(symbol_z,'_');
      if ~isempty(nm2)
        symbol_z = [nm1, '_{', nm2(2:end), '}'];
      end  
    end
  end
  
  % transformation, xlabel, ylabel, zlabel
  val_plot = val; % copy (x,y,z)-values to values to be plotted
  if strcmp (x_transform, 'log10')
    val_plot(:,1) = log10(val_plot(:,1));
    if strcmp(x_label, 'on')
      label_x = [label_x, ', _{10}log ', symbol_x, ', ', units_x];
    else
      label_x = ['_{10}log ', symbol_x, ', ', units_x];
    end
  else
    if strcmp(x_label, 'on')
      label_x = [label_x, ', ', symbol_x, ', ', units_x];
    else
      label_x = '';
    end
  end
  if n_vars > 1 && strcmp (y_transform, 'log10')
    val_plot(:,2) = log10(val_plot(:,2));
    if strcmp(y_label, 'on')
      label_y = [label_y, ', _{10}log ', symbol_y, ', ', units_y];
    else
      label_y = '';
    end
  elseif n_vars > 1
    if strcmp(y_label, 'on')
      label_y = [label_y, ', ', symbol_y, ', ', units_y];
    else
      label_y = '';
    end
  end
  if n_vars > 2 && strcmp (z_transform, 'log10')
    val_plot(:,3) = log10(val_plot(:,3));
    if strcmp(z_label, 'on')
      label_z = [label_z, ', _{10}log ', symbol_z, ', ', units_z];
    else
      label_z = '';
    end
  elseif n_vars > 2
    if strcmp(z_label, 'on')
      label_z = [label_z, ', ', symbol_z, ', ', units_z];
    else
      label_z = '';
    end
  end
    
  % actual plotting
  if exist('Hfig', 'var')
    Hfig = figure(Hfig); Hleg = [];
  else
    Hfig = figure; Hleg = [];
  end
  
  if exist('label_title', 'var') && ~isempty(label_title)
    title(label_title)
  end

  hold on
  switch n_vars
    case 1
        
      set(gca, 'FontSize', 15, 'Box', 'on', 'YTick', 0:0.2:1)
      xlabel(label_x)
      ylim([0 1]);
      if strcmp(y_label, 'on')
        ylabel('survivor function')
      end

      if n_taxa <= 1
        % set colors for survivor function and median
        if ~exist('legend','var') || isempty(legend)
          colfn = 'b'; colmed = 'r';
        else
          colfn = legend{1}; colmed = legend{2};
        end
        x_median = median(val_plot); x_min = min(val_plot);
        surv_x = surv(val_plot); 
        plot([x_min; x_median; x_median], [0.5;0.5;0], colmed, 'LineWidth', 1.5, 'LineStyle', ':')
        plot(surv_x(:,1), surv_x(:,2), colfn, 'LineWidth', 2, 'LineStyle', '-')
        xlim([min(surv_x(:,1)) inf]);
        
      elseif n_taxa > 1 
        xlim_min = inf;
        for j = 1:n_taxa
          i = n_taxa - j + 1; % reverse sequence of plotting to get crossings of lines natural
          line = legend{i,1}; LT = line{1}; LW = line{2}; LC = line{3};  
          x_median = median(val_plot(sel(:,i)==1,1)); x_min = min(val_plot(sel(:,i)==1,1));
          surv_x = surv(val_plot(sel(:,i)==1, 1)); 
          plot([x_min; x_median; x_median], [0.5;0.5;0], '-', 'Color', LC, 'Linewidth', 1.5, 'LineStyle', ':')
          plot(surv_x(:,1), surv_x(:,2), LT, 'Color', LC, 'Linewidth', LW, 'LineStyle', '-')
          xlim_min = min(xlim_min,min(surv_x(:,1))); 
        end
        xlim([xlim_min inf])
        Hleg = shllegend(legend); % show line-legend
      end
      

    case 2
      for j = 1:n_taxa % scan taxa
        i = n_taxa - j + 1; % reverse sequence of plotting in case markers overlap
        marker = legend{i,1}; T = marker{1}; MS = marker{2}; LW = marker{3}; MEC = marker{4}; MFC = marker{5};  
        plot(val_plot(sel(:,i)==1,1), val_plot(sel(:,i)==1,2), T, 'MarkerSize', MS, 'LineWidth', LW, 'MarkerFaceColor', MFC, 'MarkerEdgeColor', MEC)
      end
      set(gca, 'FontSize', 15, 'Box', 'on')
      xlabel(label_x)  
      ylabel(label_y)
      
      h = datacursormode(Hfig); entries_txt = entries;
      for i=1:n_entries; entries_txt{i} = strrep(entries_txt{i}, '_' , ' '); end
      h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries_txt, val_plot);
      datacursormode on % mouse click on plot
      
      if iscell(legend{1,2})
        Hleg = shlegend(legend,[],[],label_legend);
      else
        Hleg = shlegend(legend);
      end
          
    case 3
      if length(legend{1,1}) == 5 % all markers within a taxon are identical
        for j = 1:n_taxa % scan taxa
          i = n_taxa - j + 1; % reverse sequence of plotting in case markers overlap
          marker = legend{i,1}; T = marker{1}; MS = marker{2}; LW = marker{3}; MEC = marker{4}; MFC = marker{5};  
          plot3(val_plot(sel(:,i)==1,1), val_plot(sel(:,i)==1,2), val_plot(sel(:,i)==1,3), T, 'MarkerSize', MS, 'LineWidth', LW, 'MarkerFaceColor', MFC, 'MarkerEdgeColor', MEC)
        end
      else % length(legend{1,1}) == 3, markers within a taxon differ in color, set by third variable
        for j = 1:n_taxa % scan taxa
          i = n_taxa - j + 1; % reverse sequence of plotting in case markers overlap
          marker = legend{i,1}; T = marker{1}; MS = marker{2}; LW = marker{3};
          v1 = val_plot(sel(:,i)==1,1); v2 = val_plot(sel(:,i)==1,2); v3 = val_plot(sel(:,i)==1,3); n_taxai = length(v1);
          [v3, ind] = sort(v3); v1 = v1(ind); v2 = v2(ind); % sort according to v3 to handle overlapping marker plots within a taxon
          range = [min(v3) 1.1 * max(v3)]; color = color_lava((v3 - range(1))/ (range(2) - range(1))); % set colors accoring to v3
          val_plot = [v1, v2, v3];
          for i = 1:n_taxai
            plot3(v1(i), v2(i), v3(i), T, 'MarkerSize', MS, 'LineWidth', LW, 'MarkerFaceColor', color(i,:), 'MarkerEdgeColor', color(i,:))
          end
        end    
      end
      set(gca, 'FontSize', 15, 'Box', 'on')
      xlabel(label_x)  
      ylabel(label_y)
      zlabel(label_z)
  
      h = datacursormode(Hfig); entries_txt = entries;
      for i=1:n_entries; entries_txt{i} = strrep(entries_txt{i}, '_' , ' '); end
      h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries_txt, val_plot);
      datacursormode on % mouse click on plot

      Hleg = shlegend(legend);
      if length(legend{1,1}) == 3
        shcolor_lava(range); 
      end
      
  end
  
end
