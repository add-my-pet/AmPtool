%% mydata_shstat: demo script for using plotting tool shstat
% see prt_pars for more examples of 1D plotting
%
% Make sure that the lists-of-lists correspond with allStat.mat.
% Generate updated allStat.mat if necessary (for curators only)
%   write_allStat(C2K(20),1); % notice that default allStat is at T=T_typical and f=1
% allStat has fields for the temp-correction c_T, so divide rates by c_T to go from T_typical to T_ref
%
% Compose/modify your legend if you wish. You can also do this on-the-fly by selecting an empty legend.
% mylegend = select_legend; replace legend_* by mylegend in the examples below, to activate this.
% If your desired legend is close to an existing one, e.g. legend_fish, you can modify it by: mylegend = select_legend(legend_fish)

close all    % remove any existing figure

example = 14; % edit this number to see the various examples
switch example
  case 1 % 2D: use default settings
    shstat_options('default');
    shstat({'E_Hp', 'E_Hb'}, legend_RSED); 

  case 2 % 2D: more tricks: no transformation (default is log10), description enabled, adding items to the figure
    shstat_options('default');
    shstat_options('x_transform', 'none');
    shstat_options('y_transform', 'none');
    shstat_options('x_label', 'on');
    shstat_options('y_label', 'on');
    [Hfig Hleg] = shstat({'s_s', 'kap'}, legend_vert, date); % set title, output handle for adding items
    
    figure(Hfig) % add items to figure
    kap = linspace(0, 1, 100); ss = kap.^2 .* (1 - kap); 
    plot(ss, kap, 'k', 'Linewidth', 2)
    xlim([0 4/27]); ylim([0 1]);

  case 3 % 2D: like 2, but with logarithmic transformation on independent variable only
    shstat_options('default');
    shstat_options('y_transform', 'none');
    shstat_options('x_label', 'on');
    shstat_options('y_label', 'on');
    [Hfig Hleg] = shstat({'s_s', 'kap'}, legend_RSED); % output handle for adding items

    figure(Hfig) % add items to figure
    kap = linspace(1e-6,1,100); ss = kap.^2 .* (1 - kap); 
    plot(log10(ss), kap, 'k', 'Linewidth', 2)
    ylim([0 1]);
    
  case 4 % 3D: hit rotation-tool in the toolbar of the figure    
    shstat_options('default');
    shstat_options('x_transform', 'none');
    shstat_options('y_transform', 'none');
    shstat_options('z_transform', 'none');
    [Hfig Hleg] = shstat({'kap', 'ep_min', 's_s'}, legend_vert); % output handle for adding items

    figure(Hfig) % add items to figure
    kap = linspace(0, 1, 15)'; f = kap'; ss = kap.^2 .* (1 - kap) * f.^3; % set x,y,z values
    mesh(kap, f, ss'); % add surface to figure
    % define colormap for mesh: k->b->m->r->white
    Colmap = [0 0 0; 0 0 .5; 0 0 1; .5 0 1; 1 0 1; 1 0 .5; 1 0 0; 1 .25 .25; 1 .5 .5; 1 .75 .75];
    colormap(Hfig, Colmap) % set color map to add_my_pet colors 
    zlim([0 4/27])

  case 5 % 2D: numerical mode because of computations: setting of xlabel and ylabel required
    shstat_options('default');
    shstat_options('x_transform', 'none');
    shstat_options('y_transform', 'none');
    essk = read_allStat('ep_min', 's_s', 's_M', 'kap'); ep_min = essk(:,1); s_s = essk(:,2); s_M = essk(:,3);  kap = essk(:,4);
    [Hfig Hleg] = shstat([ep_min, (s_s ./ (kap.^2 .* (1 - kap))) .^(1/3)], legend_vert); % output handle for setting labels

    figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
    xlabel('e_p^{min}, -')      
    ylabel('max e_p^{min}, -')
   
  case 6 % 1D: single variable with default colors
    shstat_options('default');
    shstat_options('x_transform', 'none');
    shstat_options('y_label', 'on'); % if 'off' (default), no `survivor function' shown on yaxis
    shstat({'kap'});      

  case 7 % 1D: numerical mode because of computations: setting of xlabel required
    vsM = read_allStat('v', 's_M'); sM = vsM(:,2); vj = prod(vsM,2); v = vj(sM == 1); vj = vj(sM > 1);
    shstat_options('default');
    shstat_options('y_label', 'on'); % if 'off' (default), no `survivor function' shown on yaxis
    Hfig = shstat(vj, {'r', 'r'});   % output handle for adding items to same figure and set colors
    shstat(v, {'b', 'b'}, 'post-metam v at T_{ref} and f=1, without and with acceleration', Hfig);
    % setting of figure handle not required, because legend is not shown in new figure, and first figure is still active
    xlabel('_{10}log v, cm/d') 
 
  case 8 % 1D: single variable for several taxa with line specs specified by llegend_ACP
    shstat_options('default');
    shstat_options('x_transform', 'none');
    shstat_options('y_label', 'on'); % if 'off' (default), no `survivor function' shown on yaxis
    shstat({'kap'}, llegend_ACP);      
        
  case 9 % 2D: selection of different model types, rather than taxa; bypass shstat
      
    % type, size, linewidth, edge color and face color of a marker, model
    legend = {...
      {'o', 8, 3, [0 0 0], [0 0 0]}, 'hep'; ...
      {'o', 8, 3, [0 0 1], [0 0 1]}, 'hex'; ...
      {'o', 8, 3, [0 0 1], [0 0 0]}, 'abj'; ...
      {'o', 8, 3, [0 0 1], [1 0 1]}, 'asj'; ....
      {'o', 8, 3, [0 0 1], [1 0 0]}, 'sbp'; ....
      {'o', 8, 3, [1 0 1], [1 0 1]}, 'abp'; ....
      {'o', 8, 3, [1 0 1], [1 0 0]}, 'ssj'; ....
      {'o', 8, 3, [1 0 0], [0 0 0]}, 'stx'; ....
      {'o', 8, 3, [1 0 0], [0 0 1]}, 'stf'; ....
      {'.', 8, 3, [0 0 0], [0 0 0]}, 'std'; ....
    };  
    n_model = size(legend,1);
    
    vars = read_allStat('kap','v','s_M'); val_plot = [vars(:,1), log10(vars(:,2) .* vars(:,3))];
    model = read_allStat('model'); % don't combine num and str in 1 call to read_allStat
    entries = select; % assign entry names for clicking in plot
    
    Hfig = 1; % set figure handle
    figure(Hfig)
    hold on

    for j=1:n_model
      i = n_model - j + 1; % reverse sequence of plotting in case markers overlap
      marker = legend{i,1}; T = marker{1}; MS = marker{2}; LW = marker{3}; MEC = marker{4}; MFC = marker{5};  
      sel = strcmp(model, legend{i,2}); % select model type
      plot(val_plot(sel,1), val_plot(sel,2), T, 'MarkerSize', MS, 'LineWidth', LW, 'MarkerFaceColor', MFC, 'MarkerEdgeColor', MEC)
    end
        
    set(gca, 'FontSize', 15, 'Box', 'on')
    xlabel('\kappa, -')  
    ylabel('_{10}log v at T_{ref} post metam, cm/d')

    h = datacursormode(Hfig); % write entry names under plot coordinates
    h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, val_plot);
    datacursormode on % mouse click on plot

    Hleg = shlegend(legend);

  case 10 % 2D, numerical mode
    shstat_options('default');
    LmEm = read_allStat('L_m', 'E_m'); L_m = LmEm(:,1); E_m = LmEm(:,2);

    [Hfig, Hleg] = shstat([L_m.^3, E_m], legend_fish, 'Data at T_{typical}'); 
    figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
    xlabel('_{10} log max structural volume, L^3, cm^3')      
    ylabel('_{10} log max reserve capacity, [E_m], J/cm^3')

  case 11 % 2D
    shstat_options('default');
    LmpM = read_allStat('L_m', 'p_M'); L_m = LmpM(:,1); p_M = LmpM(:,2);

    [Hfig, Hleg] = shstat([L_m.^3, p_M], legend_RSED, 'Data at T_{typical}'); 
    figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
    xlabel('_{10} log max structural volume, cm^3')      
    ylabel('_{10} log spec som maintenance, J/d.cm^3')

  case 12 % 2D
    shstat_options('default');
    shstat_options('x_transform', 'none');
    kEmdV = read_allStat('kap', 'E_m', 'd_V'); kap = kEmdV(:,1); E_m = kEmdV(:,2); d_V = kEmdV(:,3);

    [Hfig, Hleg] = shstat([kap, E_m./d_V], legend_fish); 
    figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
    xlabel('kappa, -')      
    ylabel('_{10}log [E_m]/d_V , J/g')

  case 13 % 3D/2D
    shstat_options('default'); % log10 transform for all 3 variables
    pM_pAm_Li = read_allStat('p_M', 'p_Am', 'L_i', 's_M'); p_M = pM_pAm_Li(:,1); p_Am = pM_pAm_Li(:,2) .* pM_pAm_Li(:,4); L_i = pM_pAm_Li(:,3);
    [Hfig, Hleg] = shstat([p_M, p_Am, L_i], {{'^', 7, 2}, 'Sauropsida'; {'v', 7, 2}, 'Mammalia'; {'o', 7, 2}, 'Chordata'}); % define colorless legend on the fly
    figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
    xlabel('_{10}log [p_M], J/d.cm^3')      
    ylabel('_{10}log \{p_{Am}\}, J/d.cm^2')  
    zlabel('_{10}log L_\infty , cm')         
    
   case 14 % 2D for eco-codes (because col 2 in legend is cell string, not character string)
    shstat_options('default');
    % B. stands for "Embryo environment" (see shstat); for codes, see AmPtool eco page (CONTEXT dropdown)
    legend_eco = {...  
    {'o', 8, 3, [0 1 0], [0 1 0]}, {'B.Tnp','B.Tnw'}; ....       % nest in shrubs, trees
    {'o', 8, 3, [1 0 0], [1 0 0]}, {'B.Tnc'}; ...                % nest on rock, cliffs
    {'o', 8, 3, [0 0 1], [0 0 1]}, {'B.Tnf'}; ...                % nest on fresh water
    {'o', 8, 3, [0 0 0], [0 0 0]}, {'B.Tnt','B.Tns','B.Tl'}; ... % nest in/on soil, under leaves
    };

    % Plot maturity ratio at birth/puberty (S_Hbp) as function of age at puberty (ap), for birds (Aves) 
    [Hfig, Hleg, val, entries, missing] = shstat({'a_p','s_Hbp'}, legend_eco, 'Aves'); 
end