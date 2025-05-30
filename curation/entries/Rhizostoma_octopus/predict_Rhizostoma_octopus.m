function [prdData, info] = predict_Rhizostoma_octopus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tW = tempcorr(temp.tW_p, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, bell diameter at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, bell diameter at metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, bell diameter at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate bell diameter at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
  
  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R);          % max reproduction rate
  
  % growth
  rT_B = TC * rho_B * k_M;              % 1/d, von Bert growth rate
  Lw_76 = Lw_i - (Lw_i - Lw_j) * exp(-rT_B * (76 - tT_j)); % cm, bell diater at 76 d
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L76 = Lw_76;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-bell diameter medusae
  f = f_tW;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; Lw_i = L_m * l_i/ del_M; 
  ELw= Lw_i - (Lw_i - Lw_0) * exp( - rT_B * tL(:,1)); % cm, structural length

  % time-weight polyps
  f = f_tW;
  p_Am_p = z_p * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_p = p_Am_p/ v;                   % J/cm^3, reserve capacity [E_m]
  g_p = E_G/ (kap* E_m_p);             % -, energy investment ratio
  m_Em_p = y_E_V * E_m_p/ E_G;         % mol/mol, reserve capacity 
  w_p = m_Em_p * w_E/ w_V;             % -, contribution of reserve to weight
  L_mp = v/ k_M/ g_p;                  % cm, max struct length
  L_ip = f * L_mp;                     % cm, struct length, birth & ultimate
  pars_tp = [g_p; k; l_T; v_Hb; v_Hpp];
  [t_pp, t_bp, l_pp, l_bp] = get_tp(pars_tp, f);
  kT_M = k_M * TC_tW; rT_B = kT_M/ 3/ (1 + f/g_p); L_bp = L_mp * l_bp; 
  L = L_ip - (L_ip - L_bp) * exp( - rT_B * tW_p(:,1)); % cm, structural length
  EWw = L.^3 * (1 + f * w);

  % pack to output
  prdData.tW_p = EWw;
  prdData.tL = ELw;  
end

