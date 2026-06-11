%% shstat
% plots statistics and/or parameters

%%
function [Hfig, Hleg, val, entries, missing] = shstat(vars, legend, label_title, Hfig)
% created 2016/04/23 by Bas Kooijman; modified 2017/04/20, 2017/10/14, 2018/01/22

%% Syntax
% [Hfig, Hleg, val, entries, missing] =  <../shstat.m *shstat*>(vars, legend, label_title, Hfig)

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

  opts = merge_with_defaults(getappdata(0, 'shstat_opts'));
  x_transform  = opts.x_transform;
  y_transform  = opts.y_transform;
  z_transform  = opts.z_transform;
  x_label      = opts.x_label;
  y_label      = opts.y_label;
  z_label      = opts.z_label;
  FS                = opts.font_size;
  marker_alpha      = opts.marker_alpha;
  marker_size_scale = opts.marker_size_scale;
  marker_edge_color = opts.marker_edge_color;
  grid_opt          = opts.grid;
  color_scheme      = opts.color_scheme;
  legend_location   = opts.legend_location;
  datacursor_opt    = opts.datacursor;

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
      case 2
        [val entries units label] = read_allStat(vars{1},vars{2});
        units_x = units{1}; units_y = units{2}; label_x = label{1}; label_y = label{2};
      case 3
        [val entries units label] = read_allStat(vars{1},vars{2},vars{3});
        units_x = units{1}; units_y = units{2}; units_z = units{3}; label_x = label{1}; label_y = label{2}; label_z = label{3};       
    end
    n_entries = length(entries); 
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
      label_x = ['_{10}log ', label_x, ', ', symbol_x, ', ', units_x];
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
      label_y = ['_{10}log ', label_y, ', ', symbol_y, ', ', units_y];
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
      label_z = ['_{10}log ', label_z, ', ', symbol_z, ', ', units_z];
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
        
      set(gca, 'FontSize', FS, 'Box', 'on', 'YTick', 0:0.2:1)
      if strcmp(grid_opt, 'on'), grid on; end
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
        h_lines = gobjects(n_taxa, 1);
        for j = 1:n_taxa
          i = n_taxa - j + 1; % reverse sequence of plotting to get crossings of lines natural
          line = legend{i,1}; LT = line{1}; LW = line{2}; LC = line{3};
          x_median = median(val_plot(sel(:,i)==1,1)); x_min = min(val_plot(sel(:,i)==1,1)');
          surv_x = surv(val_plot(sel(:,i)==1, 1));
          plot([x_min; x_median; x_median], [0.5;0.5;0], '-', 'Color',LC, 'Linewidth',1.5, 'LineStyle',':')
          h_lines(j) = plot(surv_x(:,1), surv_x(:,2), LT, 'Color',LC, 'Linewidth',LW, 'LineStyle','-');
          xlim_min = min(xlim_min,min(surv_x(:,1)));
        end
        xlim([xlim_min inf])
        if strcmp(legend_location, 'separate')
          Hleg = shllegend(legend);
          position_legend(Hleg, Hfig);
        else
          taxon_labels = strrep(legend(end:-1:1, 2), '_', ' ');
          Hleg = embed_legend(h_lines, taxon_labels, legend_location, FS);
        end
      end
      

    case 2
      h_marks = gobjects(n_taxa, 1);
      for j = 1:n_taxa % scan taxa
        i = n_taxa - j + 1; % reverse sequence of plotting in case markers overlap
        marker = legend{i,1}; T = marker{1}; MS = marker{2} * marker_size_scale; LW = marker{3}; MEC = marker{4}; MFC = marker{5};
        if ~isempty(marker_edge_color), MEC = marker_edge_color; end
        if sum(sel(:,i)>0)
          h_marks(j) = plot(val_plot(sel(:,i)==1,1), val_plot(sel(:,i)==1,2), T, 'MarkerSize',MS, 'LineWidth',LW, 'MarkerFaceColor',MFC, 'MarkerEdgeColor',MEC);
        end
        if marker_alpha < 1 && isprop(h_marks(j), 'MarkerFaceAlpha'), h_marks(j).MarkerFaceAlpha = marker_alpha; end
      end
      set(gca, 'FontSize',FS, 'Box','on')
      if strcmp(grid_opt, 'on'), grid on; end
      xlabel(label_x)
      ylabel(label_y)

      if strcmp(datacursor_opt, 'on')
        h = datacursormode(Hfig);
        entries_txt = strrep(entries, '_', ' ');
        h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries_txt, val_plot);
        datacursormode on % mouse click on plot
      end

      if strcmp(legend_location, 'separate')
        if iscell(legend{1,2})
          Hleg = shlegend(legend,[],[],label_legend);
        else
          Hleg = shlegend(legend);
        end
        position_legend(Hleg, Hfig);
      else
        taxon_labels = strrep(legend(end:-1:1, 2), '_', ' ');
        Hleg = embed_legend(h_marks, taxon_labels, legend_location, FS);
      end
          
    case 3
      h_marks3 = gobjects(n_taxa, 1);
      z_range = [];
      if length(legend{1,1}) == 5 % all markers within a taxon are identical
        for j = 1:n_taxa % scan taxa
          i = n_taxa - j + 1; % reverse sequence of plotting in case markers overlap
          marker = legend{i,1}; T = marker{1}; MS = marker{2} * marker_size_scale; LW = marker{3}; MEC = marker{4}; MFC = marker{5};
          if ~isempty(marker_edge_color), MEC = marker_edge_color; end
          h_marks3(j) = plot3(val_plot(sel(:,i)==1,1), val_plot(sel(:,i)==1,2), val_plot(sel(:,i)==1,3), T, 'MarkerSize', MS, 'LineWidth', LW, 'MarkerFaceColor', MFC, 'MarkerEdgeColor', MEC);
        end
      else % length(legend{1,1}) == 3, markers within a taxon differ in color, set by third variable
        % global z-range across all taxa so colours are consistent
        all_ok = any(sel, 2) & ~any(isnan(val_plot), 2);
        all_v3 = val_plot(all_ok, 3);
        z_range = [min(all_v3), 1.1 * max(all_v3)];
        for j = 1:n_taxa % scan taxa
          i = n_taxa - j + 1; % reverse sequence of plotting in case markers overlap
          marker = legend{i,1}; T = marker{1}; MS = marker{2} * marker_size_scale; LW = marker{3};
          ok = sel(:,i)==1 & ~any(isnan(val_plot),2); % exclude NaN rows
          v1 = val_plot(ok,1); v2 = val_plot(ok,2); v3 = val_plot(ok,3);
          [v3, ind] = sort(v3); v1 = v1(ind); v2 = v2(ind); % sort by v3 for z-order
          color = shstat_colormap(color_scheme, (v3 - z_range(1)) / (z_range(2) - z_range(1)));
          val_plot(ok,:) = [v1, v2, v3];
          h3 = scatter3(v1, v2, v3, MS^2, color, T, 'filled', 'LineWidth', LW, 'MarkerEdgeColor', 'none');
          if marker_alpha < 1, h3.MarkerFaceAlpha = marker_alpha; end
          h_marks3(j) = h3;
        end
      end
      set(gca, 'FontSize', FS, 'Box', 'on')
      if strcmp(grid_opt, 'on'), grid on; end
      xlabel(label_x)
      ylabel(label_y)
      zlabel(label_z)

      if strcmp(datacursor_opt, 'on')
        h = datacursormode(Hfig);
        entries_txt = strrep(entries, '_', ' ');
        h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries_txt, val_plot);
        datacursormode on % mouse click on plot
      end

      if strcmp(legend_location, 'separate')
        Hleg = shlegend(legend);
        position_legend(Hleg, Hfig);
      else
        taxon_labels = strrep(legend(end:-1:1, 2), '_', ' ');
        Hleg = embed_legend(h_marks3, taxon_labels, legend_location, FS);
      end
      if ~isempty(z_range)
        show_color_scale(color_scheme, z_range, label_z, FS);
      end

  end

end

function position_legend(Hleg, Hfig)
  if isempty(Hleg) || ~isvalid(Hleg), return; end
  scr      = get(0, 'ScreenSize');           % [1 1 w h] in pixels
  main_pos = Hfig.Position;                  % [x y w h]
  leg_pos  = Hleg.Position;
  new_x    = main_pos(1) + main_pos(3) + 10;
  new_x    = min(new_x, scr(3) - leg_pos(3));  % clamp to screen right edge
  new_y    = max(main_pos(2), 1);               % clamp to screen bottom
  Hleg.Position(1) = new_x;
  Hleg.Position(2) = new_y;
end

function opts = merge_with_defaults(stored)
  opts = shstat_defaults();
  if isempty(stored), return; end
  f = fieldnames(stored);
  for k = 1:numel(f)
    if isfield(opts, f{k}), opts.(f{k}) = stored.(f{k}); end
  end
end

function Hleg = embed_legend(handles, labels, loc, fs)
  Hleg = legend(handles, labels, 'Location', loc, 'FontSize', fs);
end

function color = shstat_colormap(scheme, f)
switch scheme
  case 'viridis', color = color_viridis(f);
  case 'plasma',  color = color_plasma(f);
  case 'cividis', color = color_cividis(f);
  otherwise,      color = color_lava(f);
end
end

function show_color_scale(scheme, range, lbl, FS)
% Separate figure showing a colour gradient with data-range tick labels.
% Replicates shcolor_lava behaviour for any colour scheme.
  n = 256;
  f = linspace(0, 1, n)';
  switch scheme
    case 'viridis', cmap = color_viridis(f);
    case 'plasma',  cmap = color_plasma(f);
    case 'cividis', cmap = color_cividis(f);
    otherwise,      cmap = color_lava(f);
  end
  figure;
  ax = axes('Position', [0.25 0.05 0.2 0.9]);
  image(ax, permute(cmap, [1 3 2]));   % n-by-1-by-3 truecolor image
  set(ax, 'YDir', 'normal', 'XTick', [], 'FontSize', FS);
  n_ticks = 5;
  tf = linspace(0, 1, n_ticks);
  set(ax, 'YTick', 1 + tf * (n - 1), ...
          'YTickLabel', arrayfun(@(v) sprintf('%.3g', range(1) + v*(range(2)-range(1))), tf, 'UniformOutput', false));
  ylabel(ax, lbl, 'FontSize', FS);
end
