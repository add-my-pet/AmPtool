function [prdData, info] = predict_Pelagia_noctiluca(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_TJO = tempcorr(C2K(TJO(:,1)), T_ref, T_A);
  TC_TJN = tempcorr(C2K(TJN(:,1)), T_ref, T_A);
  TC_LR = tempcorr(C2K(spline1(LR(:,1),temp.LR)), T_ref, T_A);
  TC_tWw = tempcorr(temp.tWwA, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E0 = U_E0 * p_Am;                  % J, initial energy in egg
  V_egg = E0 * w_E/ (mu_E * d_E)/ del_Y^3; % cm^3, volume of egg, Augustine, Litvak & Kooijman 2011
  Lw_0= V_egg^(1/3);                 % cm, diameter of egg
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M1;               % cm, total length at birth at f
  a_b = t_b/ k_M;                   % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M1;               % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M1;               % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  %pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  %t_m = get_tm_s(pars_tm, f);  % -, scaled mean life span at T_ref
  pars_tm = [g; k; v_Hb; v_Hj; v_Hp; h_a/k_M^2; s_G]; 
  t_m = get_tm_mod('abj', pars_tm, f);  % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % Respiration quotient, assuming ammonia as N-waste (4.55) of DEB3 with nCN = 0
  n = n_HN - 2 * n_ON; % (4.36), Kooy2010
  RQ = 1/ (1 + n_HV/4 - n_OV/2 - n * n_NV/ 4/ n_NN);

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.RQ = RQ;
  
  % uni-variate data  
  
  Eab = a_b ./ TC_Tab; % age at birth at different temperatures
  EWw = (LWw(:,1) * del_M1/ 10).^3 * (1 + f * w); % g, wet mass
  EWd = del_W * (LWd(:,1) * del_M1/ 10).^3 * d_V * (1 + f * w); % g, dry mass
  ER  = reprod_rate_j(LR(:,1) * del_M1/ 10, f, pars_R) .* TC_LR;    % #/ d, temperature corrected reproduction rate
  EWd_MC = del_W * 1e6 * (LWd_MC(:,1) *  del_M2/ 10).^3 * d_V * (1 + f * w); % mug, dry mass

  % ---------------- length to carbon mass *MorraCarr1987*
  L = LWC(:,1) * del_M2/ 10; % cm, structural length
  EWC = 1e6 * d_VC * L.^3 * (1 + (E_m * 12 * n_O(1,3))/(d_VC * mu_E) * f); % mug, carbon mass 
  % --------------- length to nitrogen mass *MorraCarr1987*
  L = LWN(:,1) * del_M2/ 10; % cm, structural length
  EWN = 1e6 * d_VN * L.^3 * (1 + (E_m * 14 * n_O(4,3))/(d_VN * mu_E) * f); % mug, nitrogen mass 
  
  % wet mass against time *Lars1987*, assuming is post metamorphosis
  % ----------   INDIVIDUAL A ---------------------------
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_A);
  rT_B = rho_B * k_M * TC_tWw; L_i = l_i * L_m; L_0 = (W0A / (1 + f_A * w)).^(1/ 3); 
  L   = L_i - (L_i - L_0) * exp( - rT_B * tWwA(:,1)); % cm, structural length
  EWwA = L.^3 * (1 + f_A * w );                       % g, wet mass
  % ----------   INDIVIDUAL B ---------------------------
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_B);
  rT_B = rho_B * k_M * TC_tWw; L_i = l_i * L_m; L_0 = (W0B / (1 + f_B * w)).^(1/ 3); 
  L   = L_i - (L_i - L_0) * exp( - rT_B * tWwB(:,1)); % cm, structural length
  EWwB = L.^3 * (1 + f_B * w );                       % g, wet mass
   % ----------   INDIVIDUAL C ---------------------------
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_C);
  rT_B = rho_B * k_M * TC_tWw; L_i = l_i * L_m; L_0 = (W0C / (1 + f_C * w)).^(1/ 3); 
  L   = L_i - (L_i - L_0) * exp( - rT_B * tWwB(:,1)); % cm, structural length
  EWwC = L.^3 * (1 + f_C * w );                       % g, wet mass
  
  % respiration & excretion  at different temperatures
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  L = (Wd0/ del_W/ d_V/ (1 + f * w)).^(1/ 3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
  EJO = - 1e6 * J_M(3,:)' .* TC_TJO/ Wd0;     % mumol O2/d. g dry mass
  EJN = 1e6 * J_M(4,:)' .* TC_TJN/ Wd0;       % mumol NH3/d.g dry mass

  % pack to output
  prdData.LWw = EWw;
  prdData.LWd = EWd;
  prdData.Tab = Eab;
  prdData.LR = ER;
  prdData.tWwA = EWwA;
  prdData.tWwB = EWwB;
  prdData.tWwC = EWwC;
  prdData.LWN = EWN;
  prdData.LWC = EWC;
  prdData.LWd_MC = EWd_MC;
  prdData.TJO = EJO;
  prdData.TJN = EJN;
