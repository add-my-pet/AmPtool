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
  index = 1:13; i_close = true;
end
n = length(index);  

for i = 1:n
  switch index(i)

    case 1 % Fig 1: log W-log J_O
      shstat_options('default');
      shstat_options('x_label', 'on');
      shstat_options('y_label', 'on');

      cWJO = read_allStat('c_T', 'Ww_i', 'J_Oi'); c_T = cWJO(:,1); W = cWJO(:,2); JO = cWJO(:,3);
      [Hfig, Hleg] = shstat([W, JO ./ c_T], legend_RSED, {datestr(datenum(date),'yyyy/mm/dd'),'Animalia'}); 

      xlabel('_{10}log max adult weight, g')      
      ylabel('_{10}log O_2 consumption, mol/d')

      saveas(Hfig,'W_JO.png'); 
      saveas(Hleg,'legend_RSED.png'); cropWhite('legend_RSED') 

    case 2 % Fig 2: log W - log dW
      shstat_options('default');
      shstat_options('x_label', 'on');
      shstat_options('y_label', 'on');

      cWdW = read_allStat('c_T', 'W_dWm', 'dWm'); c_T = cWdW(:,1); W = cWdW(:,2); dW = cWdW(:,3);
      [Hfig, Hleg] = shstat([W, dW ./ c_T], legend_sauria, {datestr(datenum(date),'yyyy/mm/dd'),'Sauropsida'}); 

      xlabel('_{10}log weight at max growth, g')      
      ylabel('_{10}log max growth, g/d')

      saveas(Hfig, 'W_dW.png')
      saveas(Hleg, 'legend_sauria.png'); cropWhite('legend_sauria')

    case 3 % Fig 3: log {p_Am} - log [E_m] ({p_Am} is given at T_ref)
      shstat_options('default');
      
      [Hfig, Hleg] = shstat({'p_Am', 'E_m'}, legend_RSED, {datestr(datenum(date),'yyyy/mm/dd'),'Animalia'});     
      xlabel('_{10}log spec assimilation, \{p_{Am}\}, J/d.cm^2')      
      ylabel('_{10}log max reserve capacity, [E_m], J/cm^3')

      saveas(Hfig, 'pAm_Em.png')
      %saveas(Hleg, 'legend_RSED.png'); cropWhite('legend_RSED')

    case 4 % Fig 4: log V_m - log [p_M] ([p_M] is given at T_ref)
      shstat_options('default');

      LipM = read_allStat('L_i', 'p_M'); L_i = LipM(:,1); p_M = LipM(:,2); 
      [Hfig, Hleg] = shstat([L_i.^3, p_M], legend_RSED, {datestr(datenum(date),'yyyy/mm/dd'),'Animalia'});     
      xlabel('_{10}log ultimate structural volume, cm^3')      
      ylabel('_{10}log spec som maint, J/d.cm^3')

      saveas(Hfig, 'V_pM.png')
      %saveas(Hleg, 'legend_RSED.png'); cropWhite('legend_RSED')

    case 5 % Fig 5: log p_M for lophotrochozoa
                      
      llegend_loph = {... % Lophotrochozoa
        {'-', 2, [0 0 0]}, 'Lophophorata'; ....
        {'-', 2, [0 0 1]}, 'Bivalvia'; ....
        {'-', 2, [0 1 1]}, 'Gastropoda'; ....
        {'-', 2, [1 0 1]}, 'Cephalopoda'; ....
        {'-', 2, [1 0 0]}, 'Annelida'; ....
      };
      
      shstat_options('default');
      shstat_options('y_transform', 'none'); 
      
      [Hfig_pM, Hleg_pM] = shstat({'p_M'}, llegend_loph, {['lophotrochozoa @ ',datestr(datenum(date),'yyyy/mm/dd')], 'Lophotrochozoa'}); 
      xlabel('_{10}log spec somatic maint [p_M], J/d.cm^3')
      ylabel('survivor function')

      saveas(Hfig_pM,'pM_loph.png')
      saveas(Hleg_pM,'llegend_loph.png'); cropWhite('llegend_loph')
      
    case 6 % Fig 6: log p_M for mammals
        
      llegend_mam = {...
        {'-', 2, [0 0 0]}, 'plant, leaves/shoots'; ....
        {'-', 2, [0 0 1]}, 'plant, seeds/fruits'; ....
        {'-', 2, [1 0 1]}, 'animal, invertebrates'; ....
        {'-', 2, [1 0 0]}, 'animal, vertebrates'; ....
      };
      shllegend(llegend_mam,[],[0.9 0.2],'food of mammals',[],'llegend_mam_food');

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
      grid 'on'
      set(gca, 'FontSize',15, 'Box','on')

      saveas(gcf,'pM_mam_food.png')

    case 7 % Fig 7: kap_ss_fmin for invertebrates
        
      legend_invert_0 = {... % for projection of points on (kap,ss)-plane
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Radiata'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Xenacoelomorpha'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Spiralia'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Ecdysozoa'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Echinodermata'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Cephalochordata'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Tunicata'
      };

      shstat_options('default');
      shstat_options('x_transform', 'none');
      shstat_options('y_transform', 'none');
      shstat_options('z_transform', 'none');

      sskap = read_allStat({'s_s','kap',}); ss = sskap(:,1); kap = sskap(:,2); fmin = (ss./kap.^2./(1-kap)).^(1/3);   
      kap_ss_fmin = [kap, ss, fmin]; kap_ss_0 = kap_ss_fmin; kap_ss_0(:,3) = 0; % for projections

      Hfig = shstat(kap_ss_0, legend_invert_0); % projections of points first
      n = length(select); n_vert = length(select('Vertebrata')); n_invert = n - n_vert;
      [Hfig, Hleg] = shstat(kap_ss_fmin, legend_invert, {[num2str(n_invert), ' invertebrates @ ',datestr(datenum(date),'yyyy/mm/dd')],'Invertebrata'},Hfig);    

%       % mesh
%       xlabel('\kappa, -'); ylabel('s_s, -'); zlabel('f_{min}, -');
%       kap = linspace(.005,1,50)'; ss = linspace(1e-8, 4/27, 50); 
%       fmin = (ones(50,1)*ss./(kap.^2.*(1-kap)*ones(1,50))).^(1/3); % set x,y,z values
%       mesh(kap,ss-0.005,fmin'); % add surface to figure, avoid that points disappear behind the mesh
%       kap_xy = linspace(0,1,100)'; ss_xy= kap_xy.^2.*(1-kap_xy); plot3(kap_xy,ss_xy,0*kap_xy); % isocline for kapRA=0 in (kap,ss)-plane 
%       plot3(kap_xy,ss_xy,0*kap_xy, 'k-'); % curve in fmin=0 plane
%       plot3(kap_xy,ss_xy,1+0*kap_xy, '-', 'color',[1 .8 .8]); % curve in fmin=1 plane

      % mesh
      xlabel('\kappa, -'); ylabel('s_s, -'); zlabel('f_{min}, -'); n=50;
      fmin = linspace(0,1,n)'; kap = linspace(0,1,n)';
      for j=1:n
        ss = kap.^2 .* (1 - kap) * fmin(j)^3; 
        plot3(kap,ss,fmin(j)*ones(n,1), 'color',color_lava(fmin(j)), 'LineWidth',1)
        ss = kap(j)^2 * (1 - kap(j)) * fmin.^3; 
        for k=1:10; ind = max(1,5*(k-1)+(0:5)); plot3(kap(j)*ones(6,1),ss(ind),fmin(ind), 'color',color_lava(fmin(ind(3))), 'LineWidth',1); end
      end
      kap_xy = linspace(0,1,100)'; ss_xy= kap_xy.^2.*(1-kap_xy); plot3(kap_xy,ss_xy,0*kap_xy); % isocline for kapRA=0 in (kap,ss)-plane 
      plot3(kap_xy,ss_xy,0*kap_xy, 'k-'); % curve in fmin=0 plane
      plot3(kap_xy,ss_xy,1+0*kap_xy, '-', 'color',[1 0.7 0.7], 'LineWidth',2); % curve in fmin=1 plane

      % max curve on mesh plus curtain
      ss = linspace(1e-8, 4/27, 100); kap = 2/3; fmin = (ss./kap^2/(1-kap)).^(1/3); % max curve on mesh
      for j=1:20; ind=max(1,(j-1)*5+(0:5)); plot3(kap*ones(6,1),ss(ind),fmin(ind), '-', 'color',color_lava(fmin(ind(3))), 'LineWidth',2); end
      plot3(kap*ones(100,1),ss,0*fmin, ':k'); % projection of max curve in (kap,ss)-plane      
      ss = linspace(1e-8, 4/27, 50); kap = 2/3; cur = ones(6,1); % prepare curtain
      for j=1:50 % plot curtain
        fmin = linspace(0,(ss(j)/kap^2/(1-kap)).^(1/3),50);
        for k=1:10
         ind=max(1,(k-1)*5+(0:5)); 
         plot3(kap*cur,ss(j)*cur,fmin(ind), ':', 'color',color_lava(fmin(ind(3)))); 
        end
      end
      plot3([0;1],[0;0],[0;0], ':k'); 
      
      xlim([0 1]); ylim([0 4/27]); zlim([0 1]);
      % define colormap for mesh: k->b->m->r->white
      Colmap = [0 0 0; 0 0 .5; 0 0 1; .5 0 1; 1 0 1; 1 0 .5; 1 0 0; 1 .25 .25; 1 .5 .5; 1 .75 .75];
      colormap(Hfig, Colmap) % set color map to add_my_pet colors 
      caxis([0 1]) % range for colormap
      view(125,18) % set the azimuth and elevation angles
      set(gca, 'FontSize',25, 'Box','on')
      set(gcf, 'WindowState','maximized') % first full screen to reduce rel marker size
      pause(0.5);  % wait for the resize to actually happen

      % saveas(Hfig,'kap_ss_fmin_invert.fig') % allows to be rotated on screen
      saveas(Hfig,'kap_ss_fmin_invert.png')
      %saveas(Hleg,'legend_invert.png'); cropWhite('legend_invert')
       
    case 8 % Fig 8: kap_ss_kapRA: kapRA = pRi/ pAi for invertebrates
        
      legend_invert_0 = {... % for projection of points on (kap,ss)-plane
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Radiata'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Xenacoelomorpha'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Spiralia'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Ecdysozoa'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Echinodermata'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Cephalochordata'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Tunicata'
      };

      shstat_options('default');
      shstat_options('x_transform', 'none');
      shstat_options('y_transform', 'none');
      shstat_options('z_transform', 'none');

      kapRA = get_kapRA(read_allStat({'p_Am','p_M','k_J','E_Hp','s_M','kap','L_i'})); 
      kap_ss_kapRA = [read_allStat({'kap','s_s'}),kapRA(:,1)];
      kap_ss_0 = kap_ss_kapRA; kap_ss_0(:,3) = 0; % for projections

      Hfig = shstat(kap_ss_0, legend_invert_0); % projections of points first
      n = length(select); n_vert = length(select('Vertebrata')); n_invert = n - n_vert;
      [Hfig, Hleg] = shstat(kap_ss_kapRA, legend_invert, {[num2str(n_invert), ' invertebrates @ ',datestr(datenum(date),'yyyy/mm/dd')],'Invertebrata'},Hfig);    

      xlabel('\kappa, -'); ylabel('s_s, -'); zlabel('\kappa_R^A, -');
      kap = linspace(.005,1,50)'; ss = linspace(1e-8, 4/27, 50); kapRA = 1 - kap*ones(1,50) - kap.^-2*ss; % set x,y,z values
      mesh(kap,ss,kapRA'); % add surface to figure
      kap_xy = linspace(0,1,100)'; ss_xy= kap_xy.^2.*(1-kap_xy); plot3(kap_xy,ss_xy,0*kap_xy); % isocline for kapRA=0 in (kap,ss)-plane 
      plot3(kap_xy,ss_xy,0*kap_xy, 'k-'); % curve in kapRA=0 plane

      % max curve on mesh plus curtain
      ss = linspace(1e-8, 4/27, 100); kap = (2*ss).^(1/3); kapRA = 1 - kap - ss./kap.^2; % max curve on mesh
      for j=1:20; ind=max(1,(j-1)*5+(0:5)); plot3(kap(ind),ss(ind),kapRA(ind), '-', 'color',color_lava(kapRA(ind(3)))); end
      plot3(kap,ss,0*kapRA, ':k'); % projection of max curve in (kap,ss)-plane      
      ss = linspace(1e-8, 4/27, 50); kap = (2*ss).^(1/3); cur = ones(6,1); % prepare curtain
      for j=1:50 % plot curtain
        kapRA = linspace(0,1 - kap(j) - ss(j)/kap(j)^2,50);
        for k=1:10
         ind=max(1,(k-1)*5+(0:5)); 
         plot3(kap(j)*cur,ss(j)*cur,kapRA(ind), ':', 'color',color_lava(kapRA(ind(3)))); 
        end
      end
      plot3([0;1],[0;0],[0;0], ':k'); 
      
      xlim([0 1]); ylim([0 4/27]); zlim([0 1]);
      % define colormap for mesh: k->b->m->r->white
      Colmap = [0 0 0; 0 0 .5; 0 0 1; .5 0 1; 1 0 1; 1 0 .5; 1 0 0; 1 .25 .25; 1 .5 .5; 1 .75 .75];
      colormap(Hfig, Colmap) % set color map to add_my_pet colors 
      caxis([0 1]) % range for colormap
      view(150,18) % set the azimuth and elevation angles
      set(gca, 'FontSize',25, 'Box','on')
      set(gcf, 'WindowState','maximized') % first full screen to reduce rel marker size
      pause(0.5);  % wait for the resize to actually happen

      % saveas(Hfig,'kap_ss_kapRA_invert.fig') % allows to be rotated on screen
      saveas(Hfig,'kap_ss_kapRA_invert.png')
      saveas(Hleg,'legend_invert.png'); cropWhite('legend_invert')
       
    case 9 % Fig 9: kap_ss_fmin for vertebrates
      legend_vert_0 = {... % for projection of points on (kap,ss)-plane
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Cyclostomata'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Chondrichthyes'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Actinopterygii'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Latimeria'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Dipnoi'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Amphibia'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Lepidosauria'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Aves'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Archelosauria'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Mammalia'
      };
        
      shstat_options('default');
      shstat_options('x_transform', 'none');
      shstat_options('y_transform', 'none');
      shstat_options('z_transform', 'none');

      sskap = read_allStat({'s_s','kap',}); ss = sskap(:,1); kap = sskap(:,2); fmin = (ss./kap.^2./(1-kap)).^(1/3);   
      kap_ss_fmin = [kap, ss, fmin]; kap_ss_0 = kap_ss_fmin; kap_ss_0(:,3) = 0; % for projections
      [Hfig, Hleg] = shstat(kap_ss_0, legend_vert_0); % projections of points first
      
      % mesh
      xlabel('\kappa, -'); ylabel('s_s, -'); zlabel('f_{min}, -'); n=50;
      fmin = linspace(0,1,n)'; kap = linspace(0,1,n)';
      for j=1:n
        ss = kap.^2 .* (1 - kap) * fmin(j)^3; 
        plot3(kap,ss,fmin(j)*ones(n,1), 'color',color_lava(fmin(j)), 'LineWidth',1)
        ss = kap(j)^2 * (1 - kap(j)) * fmin.^3; 
        for k=1:10; ind = max(1,5*(k-1)+(0:5)); plot3(kap(j)*ones(6,1),ss(ind),fmin(ind), 'color',color_lava(fmin(ind(3))), 'LineWidth',1); end
      end
      kap_xy = linspace(0,1,100)'; ss_xy= kap_xy.^2.*(1-kap_xy); plot3(kap_xy,ss_xy,0*kap_xy); % isocline for kapRA=0 in (kap,ss)-plane 
      plot3(kap_xy,ss_xy,0*kap_xy, 'k-'); % curve in fmin=0 plane
      plot3(kap_xy,ss_xy,1+0*kap_xy, '-', 'color',[1 .8 .8], 'LineWidth',2); % curve in fmin=1 plane

      % max curve on mesh plus curtain
      ss = linspace(1e-8, 4/27, 100); kap = 2/3; fmin = (ss./kap^2/(1-kap)).^(1/3); % max curve on mesh
      for j=1:20; ind=max(1,(j-1)*5+(0:5)); plot3(kap*ones(6,1),ss(ind),fmin(ind), '-', 'color',color_lava(fmin(ind(3))), 'LineWidth',2); end
      plot3(kap*ones(100,1),ss,0*fmin, ':k'); % projection of max curve in (kap,ss)-plane      
      ss = linspace(1e-8, 4/27, 50); kap = 2/3; cur = ones(6,1); % prepare curtain
      for j=1:50 % plot curtain
        fmin = linspace(0,(ss(j)/kap^2/(1-kap)).^(1/3),50);
        for k=1:10
         ind=max(1,(k-1)*5+(0:5)); 
         plot3(kap*cur,ss(j)*cur,fmin(ind), ':', 'color',color_lava(fmin(ind(3)))); 
        end
      end
      plot3([0;1],[0;0],[0;0], ':k'); 
     
      % actual plotting of points
      n_vert = length(select('Vertebrata')); 
      [Hfig, Hleg] = shstat(kap_ss_fmin, legend_vert, {[num2str(n_vert), ' vertebrates @ ',datestr(datenum(date),'yyyy/mm/dd')],'Vertebrata'}, Hfig); 

      xlabel('\kappa, -'); ylabel('s_s, -'); zlabel('f_{min}, -');
      xlim([0 1]); ylim([0 4/27]); zlim([0 1]); % clip
      % define colormap for mesh: k->b->m->r->white
      Colmap = [0 0 0; 0 0 .5; 0 0 1; .5 0 1; 1 0 1; 1 0 .5; 1 0 0; 1 .25 .25; 1 .5 .5; 1 .75 .75];
      colormap(Hfig, Colmap) % set color map to add_my_pet colors 
      caxis([0 1]) % range for colormap
      view(125,18) % set the azimuth and elevation angles
      set(gca, 'FontSize',25, 'Box','on')
      set(gcf, 'WindowState','maximized') % first full screen to reduce rel marker size
      pause(0.5);  % wait for the resize to actually happen
      
      %saveas(Hfig,'kap_ss_fmin_vert.fig') % allows to be rotated on screen
      saveas(Hfig,'kap_ss_fmin_vert.png')
      %saveas(Hleg,'legend_vert.png'); cropWhite('legend_vert');

    case 10 % Fig 10: kap_ss_kapRA: kapRA = pRi/ pAi for vertebrates
      legend_vert_0 = {... % for projection of points on (kap,ss)-plane
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Cyclostomata'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Chondrichthyes'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Actinopterygii'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Latimeria'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Dipnoi'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Amphibia'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Lepidosauria'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Aves'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Archelosauria'
        {'o', 4, 1, [0.8 0.8 0.8], [0.8 0.8 0.8]}, 'Mammalia'
      };
        
      shstat_options('default');
      shstat_options('x_transform', 'none');
      shstat_options('y_transform', 'none');
      shstat_options('z_transform', 'none');

      kapRA = get_kapRA(read_allStat({'p_Am','p_M','k_J','E_Hp','s_M','kap','L_i'})); 
      kap_ss_kapRA = [read_allStat({'kap','s_s'}),kapRA(:,1)];
      kap_ss_0 = kap_ss_kapRA; kap_ss_0(:,3) = 0; % for projections
       
      [Hfig, Hleg] = shstat(kap_ss_0, legend_vert_0); % projections of points first 
      kap = linspace(.005,1,50)'; ss = linspace(1e-8, 4/27, 50); kapRA = 1 - kap*ones(1,50) - kap.^-2*ss; % set x,y,z values
      mesh(kap,ss,kapRA'); % add surface to figure
      kap_xy = linspace(0,1,100)'; ss_xy= kap_xy.^2.*(1-kap_xy); plot3(kap_xy,ss_xy,0*kap_xy, 'k-'); % isocline for kapRA=0 in (kap,ss)-plane 
      
      % max curve on mesh plus curtain
      ss = linspace(1e-8, 4/27, 100); kap = (2*ss).^(1/3); kapRA = 1 - kap - ss./kap.^2; % max curve on mesh
      for j=1:20; ind=max(1,(j-1)*5+(0:5)); plot3(kap(ind),ss(ind),kapRA(ind), '-', 'color',color_lava(kapRA(ind(3)))); end
      plot3(kap,ss,0*kapRA, ':k'); % projection of max curve in (kap,ss)-plane
      ss = linspace(1e-8, 4/27, 50); kap = (2*ss).^(1/3); cur = ones(6,1); 
      for j=1:50 
        kapRA = linspace(0,1 - kap(j) - ss(j)/kap(j)^2,50);
        for k=1:10
         ind=max(1,(k-1)*5+(0:5)); 
         plot3(kap(j)*cur,ss(j)*cur,kapRA(ind), ':', 'color',color_lava(kapRA(ind(3)))); 
        end
      end
      plot3([0;1],[0;0],[0;0], ':k') 
      
      % actual plotting of points
      n_vert = length(select('Vertebrata')); 
      [Hfig, Hleg] = shstat(kap_ss_kapRA, legend_vert, {[num2str(n_vert), ' vertebrates @ ',datestr(datenum(date),'yyyy/mm/dd')],'Vertebrata'}, Hfig); 

      xlabel('\kappa, -'); ylabel('s_s, -'); zlabel('\kappa_R^A, -');
      xlim([0 1]); ylim([0 4/27]); zlim([0 1]); % clip
      % define colormap for mesh: k->b->m->r->white
      Colmap = [0 0 0; 0 0 .5; 0 0 1; .5 0 1; 1 0 1; 1 0 .5; 1 0 0; 1 .25 .25; 1 .5 .5; 1 .75 .75];
      colormap(Hfig, Colmap) % set color map to add_my_pet colors 
      caxis([0 1]) % range for colormap
      view(150,18) % set the azimuth and elevation angles
      set(gca, 'FontSize',25, 'Box','on')
      set(gcf, 'WindowState','maximized') % first full screen to reduce rel marker size
      pause(0.5);  % wait for the resize to actually happen
      
      %saveas(Hfig,'kap_ss_kapRA_vert.fig') % allows to be rotated on screen
      saveas(Hfig,'kap_ss_kapRA_vert.png')
      saveas(Hleg,'legend_vert.png'); cropWhite('legend_vert');

   case 11 % Fig 11: ss distribution in food chains
     llegend = {...
       {'-', 2, [0 0 0]}, 'Crustacea'; ....
       {'-', 2, [0 0 1]}, 'Clupeiformes'; ....
       {'-', 2, [1 0 0]}, 'Selachii'; ....
     };
     
     shstat_options('default');
     shstat_options('x_transform', 'none');
     shstat_options('y_label', 'on'); % if 'off' (default), no `survivor function' shown on yaxis
     
     [Hfig, Hleg] = shstat({'s_s'}, llegend, ['aquatic chain @ ',datestr(datenum(date),'yyyy/mm/dd')]); 

     xlabel('supply stress, s_s')
     xlim([0,4/27]); ylim([0,1]);
     
     saveas(Hfig,'ss_CrusClupSela.png')
     saveas(Hleg,'llegend_CrusClupSela.png'); cropWhite('llegend_CrusClupSela');

   case 12 % Fig 12: ss distribution in food chains
     llegend = {...
       {'-', 2, [0 0 0]}, 'Hexapoda'; ....
       {'-', 2, [0 0 1]}, 'Passeriformes'; .... % this includes seed eaters
       {'-', 2, [1 0 0]}, 'Hieraves'; ....
     };
     shllegend(llegend,[],[0.9 0.2],'','','llegend_HexaPassHier');
     llegend(2,:) = []; % remove Passeriformes

     [taxa, sel_food] = select_eco('food', {'Ci'});
     sel_pass = select_01('Passeriformes'); s_s = read_allStat('s_s');
     ss_pass_Ci = s_s(sel_food & sel_pass);
     fprintf([num2str(length(ss_pass_Ci)), ' invertebrate-eating Passeriformes\n'])
     
     shstat_options('default');
     shstat_options('x_transform', 'none');
     shstat_options('y_label', 'on');
     
     Hfig = shstat({'s_s'}, llegend);  
     shstat(ss_pass_Ci, {'b','b'}, ['terrestrial chain @ ',datestr(datenum(date),'yyyy/mm/dd')], Hfig);

     xlabel('supply stress, s_s')
     xlim([0,4/27]); ylim([0,1]);
     
     saveas(Hfig,'ss_HexaPassHier.png'); 
     
   case 13 % Fig 13: ss distribution in food chains
     llegend_rodent = {...
       {'-', 2, [0 0 1]}, 'Rodentia'; ....
       {'-', 2, [1 0 0]}, 'Carnivora'; ....
     };
     get_n(llegend_rodent(:,2));
     
     shstat_options('default');
     shstat_options('x_transform', 'none');
     shstat_options('y_label', 'on'); % if 'off' (default), no `survivor function' shown on yaxis

     [Hfig, Hleg] = shstat({'s_s'}, llegend_rodent, {['\it rodents & carnivorans @ ',datestr(datenum(date),'yyyy/mm/dd')],''}); 

     xlabel('supply stress, s_s')
     xlim([0,4/27]); ylim([0,1]);
     
     saveas(Hfig,'ss_rodent.png')
     saveas(Hleg,'llegend_rodent.png'); cropWhite('llegend_rodent')
     
 
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