%% prt_patterns
% generates  plots for patterns for display on patterns.html

%%
function prt_patterns(index)
%% created 2016/12/31 by Bas Kooijman
% modified 2021/02/20

%% Syntax
% <../prt_patterns *prt_patterns*>

%% Description
% generates plots for patterns for display on patterns.html
%
% Input:
%
% * index: optional vector with patterns numbers (default 1:6)
%
% Output: 
%
% * png-files written in ../../deblab/add_my_pet/img/patterns/

%% Remarks
%
% * All figures are closed automatically if input is not specified. 
% * For presentation on the web, write png files in 
% /home/websites/www.bio.vu.nl/webroot/thb/deb/deblab/add_my_pet/img/patterns
% * Display in entries_admin/patterns.html

WD = cdCur; % set work directory and goto AmP/curation
cd('../../deblab/add_my_pet/img/patterns/');

close all

if exist('index','var')
  i_close = false;
else
  index = 1:6; i_close = true;
end
n = length(index);  

for i = 1:n
  switch index(i)

    case 1 % Fig 1: log W-log J_O
      shstat_options('default');
      shstat_options('x_label', 'on');
      shstat_options('y_label', 'on');
      shlegend(legend_RSED,[],[0.9 0.2]);
      saveas(gcf,'legend_RSED.png'); 
      cropWhite('legend_RSED.png');

      cWJO = read_allStat('c_T', 'Ww_i', 'J_Oi'); c_T = cWJO(:,1); W = cWJO(:,2); JO = cWJO(:,3);
      [Hfig, Hleg] = shstat([W, JO ./ c_T], legend_RSED, datestr(datenum(date),'yyyy/mm/dd')); 
      set(gca, 'FontSize', 15, 'Box', 'on')

      figure(Hfig) 
      xlabel('_{10}log max adult weight, g')      
      ylabel('_{10}log O_2 consumption, mol/d')

    case 2 % Fig 2: log W - log dW
      shstat_options('default');
      shstat_options('x_label', 'on');
      shstat_options('y_label', 'on');
      shlegend(legend_sauria,[],[0.9 0.2]);
      saveas(gcf,'legend_sauria.png'); 
      cropWhite('legend_sauria.png');

      cWdW = read_allStat('c_T', 'W_dWm', 'dWm'); c_T = cWdW(:,1); W = cWdW(:,2); dW = cWdW(:,3);
      Hfig = shstat([W, dW ./ c_T], legend_sauria, datestr(datenum(date),'yyyy/mm/dd')); 
      set(gca, 'FontSize', 15, 'Box', 'on')

      figure(Hfig) 
      xlabel('_{10}log weight at max growth, g')      
      ylabel('_{10}log max growth, g/d')

      saveas(Hfig, 'W_dW.png')

    case 3 % Fig 3: log {p_Am} - log [E_m] ({p_Am} is given at T_ref)
      shstat_options('default');
      
      Hfig = shstat({'p_Am', 'E_m'}, legend_RSED, datestr(datenum(date),'yyyy/mm/dd')); 
    
      figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
      xlabel('_{10}log spec assimilation, \{p_{Am}\}, J/d.cm^2')      
      ylabel('_{10}log max reserve capacity, [E_m], J/cm^3')

      saveas(Hfig, 'pAm_Em.png')

    case 4 % Fig 4: log V_m - log [p_M] ([p_M] is given at T_ref)
      shstat_options('default');

      LipM = read_allStat('L_i', 'p_M'); L_i = LipM(:,1); p_M = LipM(:,2); 
      Hfig = shstat([L_i.^3, p_M], legend_RSED, datestr(datenum(date),'yyyy/mm/dd')); 
    
      figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
      xlabel('_{10}log ultimate structural volume, cm^3')      
      ylabel('_{10}log spec som maint, J/d.cm^3')

      saveas(Hfig, 'V_pM.png')

    case 5 % Fig 5: log p_M for lophotrochozoa
                      
      llegend_mol = {... % Lophotrochozoa
        {'-', 2, [0 0 0]}, 'Lophophorata'; ....
        {'-', 2, [0 0 1]}, 'Bivalvia'; ....
        {'-', 2, [0 1 1]}, 'Gastropoda'; ....
        {'-', 2, [1 0 1]}, 'Cephalopoda'; ....
        {'-', 2, [1 0 0]}, 'Annelida'; ....
      };
      shllegend(llegend_mol,[],[0.9 0.2]);
      saveas(gcf,'llegend_mol.png'); cropWhite('llegend_mol');
      
      % p_M
      shstat_options('default');
      shstat_options('y_transform', 'none'); 
      %
      Hfig_pM = shstat({'p_M'}, llegend_mol); 
      figure(Hfig_pM)
      xlabel('_{10}log spec somatic maint [p_M], J/d.cm^3')
      ylabel('survivor function')
      title(['\it Lophotrochozoa @ ',datestr(datenum(date),'yyyy/mm/dd')], 'FontSize',15, 'FontWeight','normal'); 
      saveas(gcf,'pM_mol.png')

    case 6 % Fig 6: log p_M for mammals
        
      llegend_mam = {...
        {'-', 2, [0 0 0]}, 'plant, leaves/shoots'; ....
        {'-', 2, [0 0 1]}, 'plant, seeds/fruits'; ....
        {'-', 2, [1 0 1]}, 'animal, invertebrates'; ....
        {'-', 2, [1 0 0]}, 'animal, vertebrates'; ....
      };
      shllegend(llegend_mam,[],[0.9 0.2],'food of mammals');
      saveas(gcf,'llegend_mam_food.png'); cropWhite('llegend_mam_food');

      nm = select('Mammalia'); 
      p_M = read_stat(nm,{'p_M'});
      food = read_eco(nm, 'food');
      [~, sel] = food2color(food);

      figure
      surv_pM = surv(p_M(sel(:,1))); plot(log10(surv_pM(:,1)), surv_pM(:,2), 'k', 'LineWidth', 2); hold on
      surv_pM = surv(p_M(sel(:,2))); plot(log10(surv_pM(:,1)), surv_pM(:,2), 'b', 'LineWidth', 2);
      surv_pM = surv(p_M(sel(:,3))); plot(log10(surv_pM(:,1)), surv_pM(:,2), 'm', 'LineWidth', 2);
      surv_pM = surv(p_M(sel(:,4))); plot(log10(surv_pM(:,1)), surv_pM(:,2), 'r', 'LineWidth', 2);
      xlabel('_{10}log spec somatic maint [p_M], J/d.cm^3')
      ylabel('survivor function, -')
      title(['\it mammalia @ ',datestr(datenum(date),'yyyy/mm/dd')], 'FontSize',15, 'FontWeight','normal'); 
      xlim([0.7 4])
      set(gca, 'FontSize', 15, 'Box', 'on')
      saveas(gcf,'pM_mam_food.png')

    case 7 % Fig 7: kap_ss_kapRA: kapRA = pRi/ pAi for invertebrates
        
      shlegend(legend_invert,[],[0.9 0.2],'Invertebrata');
      saveas(gcf,'legend_invert.png'); cropWhite('legend_invert.png');

      shstat_options('default');
      shstat_options('x_transform', 'none');
      shstat_options('y_transform', 'none');
      shstat_options('z_transform', 'none');
      kapRA = get_kapRA(read_allStat({'p_Am','p_M','k_J','E_Hp','s_M','kap','L_i'})); 
      kap_ss_kapRA = [read_allStat({'kap','s_s'}),kapRA(:,1)];

      Hfig_invert = shstat(kap_ss_kapRA, legend_invert, ['invertebrates @ ',datestr(datenum(date),'yyyy/mm/dd')]); % set title, output handle for adding items   
      figure(Hfig_invert) % add items to figure
      xlabel('\kappa, -'); ylabel('s_s, -'); zlabel('\kappa_R^A, -');
      kap = linspace(.005,1,50)'; ss = linspace(1e-8, 4/27, 50); kapRA = 1 - kap*ones(1,50) - kap.^-2*ss; % set x,y,z values
      mesh(kap,ss,kapRA'); % add surface to figure
      kap_xy = linspace(0,1,100)'; ss_xy= kap_xy.^2.*(1-kap_xy); plot3(kap_xy,ss_xy,0*kap_xy); % curve in kapRA=0 plane
      plot3(kap_xy,ss_xy,0*kap_xy); % curve in kapRA=0 plane
      xlim([0 1]); ylim([0 4/27]); zlim([0 1]);
      % define colormap for mesh: k->b->m->r->white
      Colmap = [0 0 0; 0 0 .5; 0 0 1; .5 0 1; 1 0 1; 1 0 .5; 1 0 0; 1 .25 .25; 1 .5 .5; 1 .75 .75];
      colormap(Hfig_invert, Colmap) % set color map to add_my_pet colors 
      caxis([0 1]) % range for colormap
      view(150,18)
      set(gca, 'FontSize',25, 'Box','on')
      set(gcf, 'WindowState','maximized')
      pause(0.5);  % wait for the resize to actually happen
      % saveas(gcf,'kap_ss_kapRA_invert.fig')
      saveas(gcf,'kap_ss_kapRA_invert.png')
       
    case 8 % Fig 8: kap_ss_kapRA: kapRA = pRi/ pAi for vertebrates
        
      Hleg = shlegend(legend_vert,[],[0.9 0.2],'Vertebrata');
      print(Hleg,'legend_vert.png', '-dpng','-r300'); cropWhite('legend_vert.png');

      shstat_options('default');
      shstat_options('x_transform', 'none');
      shstat_options('y_transform', 'none');
      shstat_options('z_transform', 'none');
      kapRA = get_kapRA(read_allStat({'p_Am','p_M','k_J','E_Hp','s_M','kap','L_i'})); 
      kap_ss_kapRA = [read_allStat({'kap','s_s'}),kapRA(:,1)];
       
      Hfig_vert = shstat(kap_ss_kapRA, legend_vert, ['vertebrates @ ',datestr(datenum(date),'yyyy/mm/dd')]); % set title, output handle for adding items   
      figure(Hfig_vert) % add items to figure
      xlabel('\kappa, -'); ylabel('s_s, -'); zlabel('\kappa_R^A, -');
      kap = linspace(.005,1,50)'; ss = linspace(1e-8, 4/27, 50); kapRA = 1 - kap*ones(1,50) - kap.^-2*ss; % set x,y,z values
      mesh(kap,ss,kapRA'); % add surface to figure
      kap_xy = linspace(0,1,100)'; ss_xy= kap_xy.^2.*(1-kap_xy); plot3(kap_xy,ss_xy,0*kap_xy); % curve in kapRA=0 plane
      xlim([0 1]); ylim([0 4/27]); zlim([0 1]);
      % define colormap for mesh: k->b->m->r->white
      Colmap = [0 0 0; 0 0 .5; 0 0 1; .5 0 1; 1 0 1; 1 0 .5; 1 0 0; 1 .25 .25; 1 .5 .5; 1 .75 .75];
      colormap(Hfig_vert, Colmap) % set color map to add_my_pet colors 
      caxis([0 1]) % range for colormap
      view(150,18)
      set(gca, 'FontSize',25, 'Box','on')
      set(gcf, 'WindowState','maximized')
      pause(0.5);  % wait for the resize to actually happen
      %saveas(gcf,'kap_ss_kapRA_vert.fig')
      saveas(gcf,'kap_ss_kapRA_vert.png')

   case 9 % Fig 9: ss distribution in food chains
     llegend = {...
       {'-', 2, [0 0 0]}, 'Crustacea'; ....
       {'-', 2, [0 0 1]}, 'Clupeiformes'; ....
       {'-', 2, [1 0 0]}, 'Selachii'; ....
     };
     shllegend(llegend,[],[0.9 0.2]); 
     saveas(gcf,'llegend_CrusClupSela.png'); cropWhite('llegend_CrusClupSela.png');
     
     shstat_options('default');
     shstat_options('x_transform', 'none');
     shstat_options('y_label', 'on'); % if 'off' (default), no `survivor function' shown on yaxis
     %
     Hfig_ss = shstat({'s_s'}, llegend); 
     figure(Hfig_ss)
     xlabel('supply stress, s_s')
     title(['\it aquatic chain @ ',datestr(datenum(date),'yyyy/mm/dd')], 'FontSize',15, 'FontWeight','normal'); 
     set(gca, 'FontSize', 15, 'Box', 'on')
     xlim([0,4/27]); ylim([0,1]);
     saveas(gcf,'ss_CrusClupSela.png')

   case 10 % Fig 10: ss distribution in food chains
     llegend = {...
       {'-', 2, [0 0 0]}, 'Hexapoda'; ....
       {'-', 2, [0 0 1]}, 'Passeriformes'; .... % this includes seed eaters
       {'-', 2, [1 0 0]}, 'Hieraves'; ....
     };
     shllegend(llegend,[],[0.9 0.2]);
     saveas(gcf,'llegend_HexaPassHier.png'); cropWhite('llegend_HexaPassHier')
     llegend(2,:) = []; % remove Passeriformes

     [taxa, sel_food] = select_eco('food', {'Ci'});
     sel_pass = select_01('Passeriformes'); s_s = read_allStat('s_s');
     ss_pass_Ci = s_s(sel_food & sel_pass);
     fprintf([num2str(length(ss_pass_Ci)), ' invertebrate-eating Passeriformes\n'])
     
     shstat_options('default');
     shstat_options('x_transform', 'none');
     shstat_options('y_label', 'on'); % if 'off' (default), no `survivor function' shown on yaxis
     %
     Hfig_ss = shstat({'s_s'}, llegend);  
     shstat(ss_pass_Ci, {'b','b'}, '', Hfig_ss);
     figure(Hfig_ss)
     xlabel('supply stress, s_s')
     title(['\it terrestrial chain @ ',datestr(datenum(date),'yyyy/mm/dd')], 'FontSize',15, 'FontWeight','normal'); 
     set(gca, 'FontSize', 15, 'Box', 'on')
     xlim([0,4/27]); ylim([0,1]);
     saveas(gcf,'ss_HexaPassHier.png'); 
     
   case 11 % Fig 11: ss distribution in food chains
     llegend_rodent = {...
       {'-', 2, [0 0 1]}, 'Rodentia'; ....
       {'-', 2, [1 0 0]}, 'Carnivora'; ....
     };
     get_n(llegend_rodent(:,2));
     shllegend(llegend_rodent,[],[0.9 0.2]);
     saveas(gcf,'llegend_rodent.png'); cropWhite('llegend_rodent')
     %
     shstat_options('default');
     shstat_options('x_transform', 'none');
     shstat_options('y_label', 'on'); % if 'off' (default), no `survivor function' shown on yaxis
     Hfig_ss = shstat({'s_s'}, llegend_rodent); 
     figure(Hfig_ss)
     title(['\it rodents & carnivorans @ ',datestr(datenum(date),'yyyy/mm/dd')], 'FontSize',15, 'FontWeight','normal'); 
     xlabel('supply stress, s_s')
     xlim([0,4/27]); ylim([0,1]);
     saveas(gcf,'ss_rodent.png')
 
  end
end

if i_close
  close all
end

cd(WD) % return to work directory

end

function [color, sel] = food2color(food)
   n = length(food); color = NaN(n,3); sel = false(n,4);
   for i = 1:n
     if any(contains(food{i},'Hl')); color(i,:) = [0 0 0]; sel(i,1) = true; end
     if any(contains(food{i},'Hs')); color(i,:) = [0 0 1]; sel(i,2) = true; end
     if any(contains(food{i},'Ci')); color(i,:) = [1 0 1]; sel(i,3) = true; end
     if any(contains(food{i},'Cv')); color(i,:) = [1 0 0]; sel(i,4) = true; end
   end
end