function [entries z pAm v kap kapR pM pT kJ EG EHb EHj EHp ha sG muE dV delM MRE COMPLETE] = old_new

  %% old values

  % read MRE, COMPLETE, entries
  sheet = 1; % species_list; xlsread in new versions of Matlab cannot read names of sheets
  FIT = xlsread('Species.xls', sheet, 'L2:L1000');  % read FIT marks
  MRE_old = 0.1 * (10 - FIT);
  COMPLETE_old = xlsread('Species.xls', sheet, 'M2:M1000'); % read COMPLETE marks
  n_old = size(COMPLETE_old,1); 
  txt_n = num2str(1+n_old); % xlsread in new versions of Matlab reads txt-columns till space-rows minus one
  [x entries_old] = xlsread('Species.xls', sheet, ['E2:E', txt_n]); % read species name
    
  
  % primary_parameters at T_ref

  sheet = 2; % primary_parameters: xlsread in new versions of Matlab cannot read names of sheets
  pars = xlsread('Species.xls', sheet , 'B2:AS1000'); % read parameters                             
  
  % unpack pars, z, pAm, v refer to neonate settings (in case of acceleration)
  TA_old   = pars(:,2);  % K, Arrhenius temp
  z_old    = pars(:,8);
  pAm_old  = pars(:,13); % pAm_j = pAm .* sM;
  v_old    = pars(:,14); % vj = v .* sM; % cm/d, energy conductance after metamorphosis
  kap_old  = pars(:,15);
  kapR_old = pars(:,16);
  pM_old   = pars(:,17);
  pT_old   = pars(:,18);
  kJ_old   = pars(:,19);
  EG_old   = pars(:,20);
  EHb_old  = pars(:,21);
  EHj_old  = pars(:,22);
  EHp_old  = pars(:,23);
  ha_old   = pars(:,24);
  sG_old   = pars(:,25);
  muE_old  = pars(:,28);
  dV_old   = pars(:,31);
  delM_old = pars(:,9);
  
  %% new values
  
  entries_new = select('Animalia');
  n_new = length(entries_new);
  TA_new = zeros(n_new,1);
  z_new = zeros(n_new,1);
  pAm_new  = zeros(n_new,1); 
  v_new    = zeros(n_new,1); 
  kap_new  = zeros(n_new,1);
  kapR_new = zeros(n_new,1);
  pM_new   = zeros(n_new,1);
  pT_new   = zeros(n_new,1);
  kJ_new   = zeros(n_new,1);
  EG_new   = zeros(n_new,1);
  EHb_new  = zeros(n_new,1);
  EHj_new  = zeros(n_new,1);
  EHp_new  = zeros(n_new,1);
  ha_new   = zeros(n_new,1);
  sG_new   = zeros(n_new,1);
  muE_new  = zeros(n_new,1);
  dV_new   = zeros(n_new,1); 
  delM_new = zeros(n_new,1); 
  MRE_new  = zeros(n_new,1); 
  COMPLETE_new = zeros(n_new,1); 
   
  WD = pwd;                % store current path
  cd(['../entries/',entries_new{1}]) % goto entries

  try
    % alphabetically arranged list of all authors
    for i = 1:n_new
      cd (['../', entries_new{i}])
      load (['results_', entries_new{i}])
      
      z_new(i)    = par.z;
      pAm_new(i)  = par.z * par.p_M/ par.kap;
      v_new(i)    = par.v; 
      kap_new(i)  = par.kap;
      kapR_new(i) = par.kap_R;
      pM_new(i)   = par.p_M;
      pT_new(i)   = par.p_T;
      kJ_new(i)   = par.k_J;
      EG_new(i)   = par.E_G;
      EHb_new(i)  = par.E_Hb;
      if exist('par.E_Hj','var') 
        EHj_new(i)  = par.E_Hj;
      else
        EHj_new(i)  = par.E_Hb;
      end
      if exist('par.E_Hp','var') 
        EHp_new(i)  = par.E_Hp;
      else
        EHp_new(i)  = par.E_Hb;
      end
      ha_new(i)   = par.h_a;
      sG_new(i)   = par.s_G;
      muE_new(i)  = par.mu_E;
      dV_new(i)   = par.d_V; 
      if exist('par.del_M','var') 
        delM_new(i)  = par.del_M;
      else
        delM_new(i)  = 1;
      end
      TA_new(i)   = par.T_A; 
      MRE_new(i)  = metaPar.MRE; 
      COMPLETE_new(i) = metaData.COMPLETE; 
    end
    
    
  catch
    disp('Name of taxon is not recognized')
  end
   
  cd(WD)                   % goto original path

  %% compare
  entries = [];
  z       = [];
  pAm     = [];
  v       = [];
  kap     = [];
  kapR    = [];
  pM      = [];
  pT      = [];
  kJ      = [];
  EG      = [];
  EHb     = [];
  EHj     = [];
  EHp     = [];
  ha      = [];
  sG      = [];
  muE     = [];
  dV      = []; 
  delM    = [];
  TA      = [];
  MRE     = [];
  COMPLETE= [];       

  for i = 1:n_old
     sel = strcmp(entries_old{i},entries_new);
     if sum(sel) == 1
       entries = [entries; entries_new(sel)];
       z       = [z; [z_old(i), z_new(sel)]];
       pAm     = [pAm; [pAm_old(i), pAm_new(sel)]];
       v       = [v; [v_old(i), v_new(sel)]];
       kap     = [kap; [kap_old(i), kap_new(sel)]];
       kapR    = [kapR; [kapR_old(i), kapR_new(sel)]];
       pM      = [pM; [pM_old(i), pM_new(sel)]];
       pT      = [pT; [pT_old(i), pT_new(sel)]];
       kJ      = [kJ; [kJ_old(i), kJ_new(sel)]];
       EG      = [EG; [EG_old(i), EG_new(sel)]];
       EHb     = [EHb; [EHb_old(i), EHb_new(sel)]];
       EHj     = [EHj; [EHj_old(i), EHj_new(sel)]];
       EHp     = [EHp; [EHp_old(i), EHp_new(sel)]];
       ha      = [ha; [ha_old(i), ha_new(sel)]];
       sG      = [sG; [sG_old(i), sG_new(sel)]];
       muE     = [muE; [muE_old(i), muE_new(sel)]];
       dV      = [dV; [dV_old(i), dV_new(sel)]]; 
       delM    = [delM; [delM_old(i), delM_new(sel)]];
       TA      = [TA; [TA_old(i), TA_new(sel)]];
       MRE     = [MRE; [MRE_old(i), MRE_new(sel)]];
       COMPLETE= [COMPLETE; [COMPLETE_old(i), COMPLETE_new(sel)]];       
     end
  
  end

  close all
   
  fig1 = figure(1);
  plot(log10(z(:,1)), log10(z(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log z, -')  
  ylabel('new _{10}log z, -')
  saveas (gca, 'z_z.png')
  h1 = datacursormode(fig1);
  h1.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(z));
  datacursormode on % mouse click on plot

  
  fig2 = figure(2);
  plot(log10(pAm(:,1)), log10(pAm(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old {_{10}log p_{Am}}, J/d.cm^2')  
  ylabel('new {_{10}log p_{Am}}, J/d.cm^2')
  saveas (gca, 'pAm_pAm.png')
  h2 = datacursormode(fig2);
  h2.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(pAm));
  datacursormode on % mouse click on plot
  
  fig3 = figure(3);
  plot(log10(v(:,1)), log10(v(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log v, cm/d')  
  ylabel('new _{10}log v, cm/d')
  saveas (gca, 'v_v.png')
  h3 = datacursormode(fig3);
  h3.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(v));
  datacursormode on % mouse click on plot

  fig4 = figure(4);
  plot(kap(:,1), kap(:,2), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old kap, -')  
  ylabel('new kap, -')
  saveas (gca, 'kap_kap.png')
  h4 = datacursormode(fig4);
  h4.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, kap);
  datacursormode on % mouse click on plot

  fig5 = figure(5);
  plot(log10(pM(:,1)), log10(pM(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log [p_M], J/d.cm^3')  
  ylabel('new _{10}log [p_M], J/d.cm^3')
  saveas (gca, 'pM_pM.png')
  h5 = datacursormode(fig5);
  h5.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(pM));
  datacursormode on % mouse click on plot

  fig6 = figure(6);
  plot(log10(kJ(:,1)), log10(kJ(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log kJ, 1/d')  
  ylabel('new _{10}log kJ, 1/d')
  saveas (gca, 'kJ_kJ.png')
  h6 = datacursormode(fig6);
  h6.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(kJ));
  datacursormode on % mouse click on plot

  fig7 = figure(7);
  plot(log10(EG(:,1)), log10(EG(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log [E_G], J/cm^3')  
  ylabel('new _{10}log [E_G], J/cm^3')
  saveas (gca, 'EG_EG.png')
  h7 = datacursormode(fig7);
  h7.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(EG));
  datacursormode on % mouse click on plot

  fig8 = figure(8);
  plot(log10(EHb(:,1)), log10(EHb(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log E_Hb, J')  
  ylabel('new _{10}log E_Hb, J')
  saveas (gca, 'EHb_EHb.png')
  h8 = datacursormode(fig8);
  h8.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(EHb));
  datacursormode on % mouse click on plot

  fig9 = figure(9);
  plot(log10(EHj(:,1)), log10(EHj(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log E_Hj, J')  
  ylabel('new _{10}log E_Hj, J')
  saveas (gca, 'EHj_EHj.png')
  h9 = datacursormode(fig9);
  h9.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(EHj));
  datacursormode on % mouse click on plot

  fig10 = figure(10);
  plot(log10(EHp(:,1)), log10(EHp(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log E_Hp, J')  
  ylabel('new _{10}log E_Hp, J')
  saveas (gca, 'EHp_EHp.png')
  h10 = datacursormode(fig10);
  h10.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(EHp));
  datacursormode on % mouse click on plot
  
  fig11 = figure(11);
  plot(log10(ha(:,1)), log10(ha(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log h_a, 1/d^2')  
  ylabel('new _{10}log h_a, 1/d^2')
  saveas (gca, 'ha_ha.png')
  h11 = datacursormode(fig11);
  h11.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(ha));
  datacursormode on % mouse click on plot

  fig12 = figure(12);
  plot(log10(sG(:,1)), log10(sG(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log s_G, -')  
  ylabel('new _{10}log s_G, -')
  saveas (gca, 'sG_sG.png')
  h12 = datacursormode(fig12);
  h12.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(sG));
  datacursormode on % mouse click on plot

  fig13 = figure(13);
  plot(log10(dV(:,1)), log10(dV(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old _{10}log d_V, g/cm^3')  
  ylabel('new _{10}log d_V, g/cm^3')
  saveas (gca, 'dV_dV.png')
  h13 = datacursormode(fig13);
  h13.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(dV));
  datacursormode on % mouse click on plot

  fig14 = figure(14);
  plot(log10(TA(:,1)), log10(TA(:,2)), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('local _{10}log TA, K')  
  ylabel('new _{10}log TA, K')
  saveas (gca, 'TA_TA.png')
  h14 = datacursormode(fig14);
  h14.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, log10(TA));
  datacursormode on % mouse click on plot

  fig15 = figure(15);
  plot(MRE(:,1), MRE(:,2), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old MRE, -')  
  ylabel('new MRE, -')
  saveas (gca, 'MRE_MRE.png')
  h15 = datacursormode(fig15);
  h15.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, MRE);
  datacursormode on % mouse click on plot

  fig16 = figure(16);
  plot(COMPLETE(:,1), COMPLETE(:,2), '.b', 'MarkerSize', 20)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('old COMPLETE, -')  
  ylabel('new COMPLETE, -')
  saveas (gca, 'COMPLETE_COMPLETE.png')
  h16 = datacursormode(fig16);
  h16.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, COMPLETE);
  datacursormode on % mouse click on plot

end

