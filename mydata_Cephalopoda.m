function mydata_Cephalopoda(fig)
% figures for KooyAugu2021 on cephalopods

if ~exist('fig','var')
   fig = 1:18;
end
% nm_C = select('Cephalopoda'); nm_B = select('Bivalvia'); nm_G = select('Gastropoda'); nm_P = select('Polyplacophora');
% nm_pars = {'p_Am', 'v', 's_M', 'p_M', 'kap'};
% pars_C = read_stat(nm_C,nm_pars); pars_B = read_stat(nm_B,nm_pars); pars_G = read_stat(nm_G,nm_pars); pars_P = read_stat(nm_P,nm_pars);

llegend = {... % Mollusca
  {'-', 2, [0 0 0]}, 'Polyplacophora'; ....
  {'-', 2, [0 0 1]}, 'Bivalvia'; ....
  {'-', 2, [1 0 1]}, 'Gastropoda'; ....
  {'-', 2, [1 0 0]}, 'Cephalopoda'; ....
 };

 legend = {... % Cephalopoda
    % Nautiloidea: edge black
    {'o', 8, 3, [0 0 0], [0 0 0]}, 'Nautilida'; ...
    % Decapodiformes: edge blue
    {'o', 8, 3, [0 0 1], [0 0 0]}, 'Idiosepida'; ....   
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Myopsida'; ....
    {'o', 8, 3, [0 0 1], [1 0 1]}, 'Oegopsida'; ....
    {'o', 8, 3, [0 0 1], [1 0 0]}, 'Sepiida'; ....     
    {'o', 8, 3, [0 0 1], [1 1 1]}, 'Spirulida'; ....  
    % Octopodiformes: edge red
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Octopoda'; ....
    {'o', 8, 3, [1 0 0], [1 1 1]}, 'Vampyromorpha'; ....
    % other molluscs
    {'.', 8, 8, [0 0 0], [0 0 0]}, 'Polyplacophora'; ...
    {'.', 8, 8, [0 0 1], [0 0 1]}, 'Bivalvia'; ...
    {'.', 8, 8, [1 0 1], [1 0 1]}, 'Gastropoda'; ...
 };

 close all
 shstat_options('default');
 shstat_options('y_label', 'on'); 
 shstat_options('x_label', 'off'); 
 path = '';
 
 for i=1:length(fig)
 
 switch fig(i)
   case 1
     shstat_options('x_transform', 'log10');
     hp_Am = shstat({'p_Am'}, llegend); 
     figure(hp_Am)
     xlabel('_{10}log spec assimilation rate, \{p_{Am}\}, J/d.cm^2')
     %saveas(hp_Am, [path, 'pAm.png'])
     exportgraphics(hp_Am, [path,'pAm.png'], 'Resolution',1200); % 1a

   case 2
     shstat_options('x_transform', 'log10');
     hv = shstat({'v'}, llegend); 
     figure(hv)
     xlabel('_{10}log energy conductance, v, cm/d')
     %saveas(hv, [path, 'v.png'])
     exportgraphics(hv, [path,'v.png'], 'Resolution',1200); % 1b

   case 3
     shstat_options('x_transform', 'none');
     hkap = shstat({'kap'}, llegend);
     figure(hkap)
     xlabel('allocation fraction to soma, \kappa, -')
     %saveas(hkap, [path, 'kap.png'])
     exportgraphics(hkap, [path,'kap.png'], 'Resolution',1200); % 1c

   case 4
     shstat_options('x_transform', 'log10');
     hp_M = shstat({'p_M'}, llegend); 
     figure(hp_M)
     xlabel('_{10}log vol-spec somatic maint, [p_M], J/d.cm^3')
     %saveas(hp_M, [path, 'pM.png'])
     exportgraphics(hp_M, [path,'pM.png'], 'Resolution',1200); % 1d
     
   case 5
     shstat_options('x_transform', 'log10');
     ha_m = shstat({'a_m'}, llegend); 
     figure(ha_m)
     xlabel('_{10}log age at death, a_m, d')
     %saveas(ha_m, [path, 'am.png'])
     exportgraphics(ha_m, [path,'am.png'], 'Resolution',1200); % 1e
     
   case 6
     shstat_options('x_transform', 'log10');
     hE_m = shstat({'E_m'}, llegend); 
     figure(hE_m)
     xlabel('_{10}log reserve capacity, [E_m], J/cm^3')
     %saveas(hE_m, [path, 'Em.png'])
     exportgraphics(hE_m, [path,'Em.png'], 'Resolution',1200); % 1f

   case 7
     shstat_options('x_transform', 'log10');
     hs_Hbp = shstat({'s_Hbp'}, llegend); 
     figure(hs_Hbp)
     xlabel('_{10}log precociality coeff, s_H^{bp}, -')
     %saveas(hs_Hbp, [path, 'sHbp.png'])
     exportgraphics(hs_Hbp, [path,'sHbp.png'], 'Resolution',1200); % 1g

   case 8
     shstat_options('x_transform', 'log10');
     hs_M = shstat({'s_M'}, llegend); 
     figure(hs_M)
     xlabel('_{10}log acceleration factor, s_M, -')
     %saveas(hs_M, [path, 'sM.png'])
     exportgraphics(hs_M, [path,'sM.png'], 'Resolution',1200); % 1h
 
   case 9
     shstat_options('x_transform', 'log10');
     hs_s = shstat({'s_s'}, llegend); 
     figure(hs_s)
     xlabel('_{10}log supply stress, s_s, -')
     %saveas(hs_s, [path, 'ss.png'])
     exportgraphics(hs_s, [path,'ss.png'], 'Resolution',1200); % 1i

   case 10
     shstat_options('x_transform', 'log10');
     Wwi_P = read_stat(select('Polyplacophora'),{'Ww_i'}); 
     Wwi_B = read_stat(select('Bivalvia'),{'Ww_i'}); 
     Wwi_G = read_stat(select('Gastropoda'),{'Ww_i'}); 
     Wwi_C = get_Wwam(select('Cephalopoda'));
     hWw_i= shstat(Wwi_P, {'k', 'k'});   
     shstat(Wwi_B, {'b', 'b'}, [], hWw_i);   
     shstat(Wwi_G, {'m', 'm'}, [], hWw_i);   
     shstat(Wwi_C, {'r', 'r'}, [], hWw_i);   
     
     shstat({'Ww_b'}, llegend, [], hWw_i);
     figure(hWw_i)
     xlabel('_{10}log wet weight at birth, death, W_b^w, W_\infty^w, g')
     %saveas(hWw_i, [path, 'Wwi.png'])
     exportgraphics(hWw_i, [path,'Wwi.png'], 'Resolution',1200); % 1j

   case 11
     shstat_options('x_transform', 'log10');
     WdW_P = read_stat(select('Polyplacophora'),{'W_dWm','dWm','c_T'}); WdW_P = WdW_P(:,2) ./ WdW_P(:,1) ./ WdW_P(:,3);
     WdW_B = read_stat(select('Bivalvia'),{'W_dWm','dWm','c_T'});       WdW_B = WdW_B(:,2) ./ WdW_B(:,1) ./ WdW_B(:,3);
     WdW_G = read_stat(select('Gastropoda'),{'W_dWm','dWm','c_T'});     WdW_G = WdW_G(:,2) ./ WdW_G(:,1) ./ WdW_G(:,3);
     WdW_C = read_stat(select('Cephalopoda'),{'W_dWm','dWm','c_T'});    WdW_C = WdW_C(:,2) ./ WdW_C(:,1) ./ WdW_C(:,3);
     hWdW = shstat(WdW_P, {'k', 'k'});   
     shstat(WdW_B, {'b', 'b'}, [], hWdW);   
     shstat(WdW_G, {'m', 'm'}, [], hWdW);   
     shstat(WdW_C, {'r', 'r'}, [], hWdW);   
     figure(hWdW)
     xlabel('_{10}log maximum spec growth, r_m, g/d.g')
     %saveas(hWdW, [path, 'WdW.png'])
     exportgraphics(hWdW, [path,'WdW.png'], 'Resolution',1200); % 1k

   case 12
     shstat_options('x_transform', 'log10');
     JOiW_P = read_stat(select('Polyplacophora'),{'J_Oi','Ww_i','c_T'}); JOiW_P = JOiW_P(:,1) ./ JOiW_P(:,2) ./ JOiW_P(:,3);
     JOiW_B = read_stat(select('Bivalvia'),{'J_Oi','Ww_i','c_T'});       JOiW_B = JOiW_B(:,1) ./ JOiW_B(:,2) ./ JOiW_B(:,3);
     JOiW_G = read_stat(select('Gastropoda'),{'J_Oi','Ww_i','c_T'});     JOiW_G = JOiW_G(:,1) ./ JOiW_G(:,2) ./ JOiW_G(:,3);
     JOiW_C = read_stat(select('Cephalopoda'),{'J_Oi','Ww_i','c_T'});    JOiW_C = JOiW_C(:,1) ./ JOiW_C(:,2) ./ JOiW_C(:,3);
     hJOiW = shstat(JOiW_P, {'k', 'k'});   
     shstat(JOiW_B, {'b', 'b'}, [], hJOiW);   
     shstat(JOiW_G, {'m', 'm'}, [], hJOiW);   
     shstat(JOiW_C, {'r', 'r'}, [], hJOiW);   
     figure(hJOiW)
     xlabel('_{10}log specific O_2 consumption at death, j_O^m, mol/d.g')
     %saveas(hJOiW, [path, 'JOiW.png'])
     exportgraphics(hJOiW, [path,'JOiW.png'], 'Resolution',1200); % 1l

   case 13
     shstat_options('x_transform', 'log10');
     shstat_options('y_transform', 'log10');
     WJO = read_allStat({'Ww_i', 'J_Oi','c_T'}); WJO(:,2) = WJO(:,2) ./ WJO(:,1) ./ WJO(:,3);
     WJO(select_01('Cephalopoda'),1) = get_Wwam(select('Cephalopoda'));
     [hWwi_JOiW, hC]= shstat(WJO, legend);   
     figure(hWwi_JOiW)
     xlabel('_{10}log wet weight at death, g')
     ylabel('_{10}log spec O_2 consumption, mol/d.g')
     %saveas(hWwi_JOiW, [path, 'Wwi_JOiW.png'])
     %saveas(hC, [path, 'legend_Ceph.png'])
     exportgraphics(hWwi_JOiW, [path,'Wwi_JOiW.png'], 'Resolution',1200); % 2a
     exportgraphics(hC, [path,'legend_Ceph.png'], 'Resolution',1200); % 2b

   case 14
     shstat_options('x_transform', 'log10');
     shstat_options('y_transform', 'log10');
     vsEE = read_allStat({'v', 's_M', 'E_Hb', 'E_Hj', 'E_Hp'}); 
     vs = vsEE(:,1) .* vsEE(:,2); 
     s_Hbp = vsEE(:,3) ./ vsEE(:,5); s_Hjp = vsEE(:,4) ./ vsEE(:,5);
     s_Hjp(isnan(s_Hjp)) = s_Hbp(isnan(s_Hjp));
     hvs_s_Hjp = shstat([vs, s_Hjp], legend);   
     figure(hvs_s_Hjp)
     xlabel('_{10}log post-accel energy cond., v s_M, cm/d')
     ylabel('_{10}log maturity ratio, s_H^{jp}, -')
     %saveas(hvs_s_Hjp, [path, 'vsM_sHjp.png'])
     exportgraphics(hvs_s_Hjp, [path,'vsM_sHjp.png'], 'Resolution',1200); % 2c

   case 15
     shstat_options('x_transform', 'log10');
     shstat_options('y_transform', 'log10');
     vs = read_allStat({'v', 's_M'}); 
     v = vs(:,1); vs = vs(:,1) .* vs(:,2); 
     hv_vs = shstat([v, vs], legend);   
     figure(hv_vs)
     xlabel('_{10}log energy conductance, v, cm/d')
     ylabel('_{10}log post-accel energy cond., v s_M, cm/d')
     %saveas(hv_vs, [path, 'v_vsM.png'])
     %exportgraphics(hv_vs, [path,'v_vsM.png'], 'Resolution',1200); 

    case 16
     shstat_options('x_transform', 'none');
     shstat_options('y_transform', 'log10');
     kNWWa = read_allStat({'kap', 'N_i', 'Ww_b', 'Ww_i', 'a_m' , 'c_T'}); 
     kNWWa(select_01('Cephalopoda'), 4) = get_Wwam(select('Cephalopoda'));
     kap = kNWWa(:,1); R = kNWWa(:,2) ./ kNWWa(:,5) ./ kNWWa(:,6);
     hkap_R = shstat([kap, R], legend);   
     figure(hkap_R)
     xlabel('allocation fraction to soma, \kappa, -')
     ylabel('_{10}log total fecundity/ life span, #/d')
     %saveas(hkap_R, [path, 'kap_R.png'])
     exportgraphics(hkap_R, [path,'kap_R.png'], 'Resolution',1200); % 3a
    
   case 17
     shstat_options('x_transform', 'none');
     shstat_options('y_transform', 'log10');
     kNWWa = read_allStat({'kap', 'N_i', 'Ww_b', 'Ww_i', 'a_m', 'c_T'}); 
     kNWWa(select_01('Cephalopoda'), 4) = get_Wwam(select('Cephalopoda'));
     kap = kNWWa(:,1); RWW = kNWWa(:,2) .* kNWWa(:,3) ./ kNWWa(:,5) ./ kNWWa(:,4) ./ kNWWa(:,6);
     hkap_RWW = shstat([kap, RWW], legend);   
     figure(hkap_RWW)
     xlabel('allocation fraction to soma, \kappa, -')
     ylabel('_{10}log spec offspring prod./ life span, #/d')
     %saveas(hkap_RWW, [path, 'kap_RWW.png'])
     exportgraphics(hkap_RWW, [path,'kap_RWW.png'], 'Resolution',1200); % 3b

   case 18
     shstat_options('x_transform', 'log10');
     shstat_options('y_transform', 'log10');
     WdW = read_allStat({'W_dWm','dWm','c_T'}); WdW = WdW(:,2) ./ WdW(:,1) ./ WdW(:,3);
     r = read_popStat('f1.thin1.f.r') ./ read_popStat('c_T'); 
     
     hWdW_r = shstat([WdW, r], legend);   
     figure(hWdW_r)
     plot([-1 -4.5], [-1 -4.5], 'k')
     xlabel('_{10}log max spec growth, r_m, g/d.g')
     ylabel('_{10}log max spec pop growth, r_N, 1/d')
     %saveas(hWdW_r, [path, 'WdW_r.png'])
     exportgraphics(hWdW_r, [path,'WdW_r.png'], 'Resolution',1200); % 4
     
   case 19
     %legend = [legend, {{'.', 8, 8, [0 1 0], [0 1 0]}, 'Actinopterygii'}];

     shstat_options('x_transform', 'log10');
     shstat_options('y_transform', 'log10');
     WdW = read_allStat({'Ww_i','W_dWm','dWm','c_T'}); WdW = [WdW(:,2), WdW(:,3) ./ WdW(:,2) ./ WdW(:,4)];
     
     hWdWm_dWm = shstat(WdW, legend);   
     figure(hWdWm_dWm)
     %plot([-7 4], [1 -1.75], 'k', 'linewidth', 2) % slope -1/4
     xlabel('_{10}log weight at max growth, g')
     ylabel('_{10}log max spec growth, r_m, g/d.g')
     %saveas(hWwi_WdW, [path, 'WdWm_dWm.png'])
     exportgraphics(hWdWm_dWm, [path,'WdWm_dWm.png'], 'Resolution',1200); % 4

     WWN = read_allStat({'Ww_i','Ww_b','N_i','c_T'}); WN = [WWN(:,1), WWN(:,2) .* WWN(:,3) ./ WWN(:,4)];
     WN(select_01('Cephalopoda'),1) = get_Wwam(select('Cephalopoda'));

     hWwi_NiWb = shstat(WN, legend);   
     figure(hWwi_NiWb)
     plot([-3 5], [-3 5] - 1.5, 'k', 'linewidth', 2) % slope -1/4
     xlabel('_{10}log max maximum weight, W_w^{max}, g')
     ylabel('_{10}log neonate mass prod, g')
     %saveas(hWwi_WdW, [path, 'Wwi_WdW.png'])
     exportgraphics(hWwi_NiWb, [path,'Wwi_NiWb.png'], 'Resolution',1200); % 4

 end
 end
end

 function Ww_am = get_Wwam(my_pets)
        
     persistent allStat
     
     if isempty(allStat)
       load('allStat');
     end
     
     n = length(my_pets);
     Ww_am = zeros(n,1);
     for i=1:n
       vars_pull(allStat.(my_pets{i}));
       L_am = L_i - (L_i - L_j) * exp(- r_B * (a_m  - (a_j - a_b)));  
       Ww_am(i) = L_am^3 * (1 + f * ome);     % g, wet weight at death
     end
 end