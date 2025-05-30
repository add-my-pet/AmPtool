function [prdData, info] = predict_Cassiopea_xamachana(par, data, auxData)
  
global tT

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
 [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = tau_b/ kT_M;                 % d, age at birth at f and T
  
  % metamorphosis
  L_j = L_m * l_j;      % cm, structural length at metam
  Lw_j = L_j/ del_M;    % cm, physical length at metam at f
  aT_j = (tau_j-tau_b) / kT_M ;   % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  aT_p = t_p/ kT_M;                % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate bell diameter
  Ww_i = L_i^3*(1+f*ome);           % cm, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj  = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tau = max(0, tL(:,1))*kT_M; tf = [5 f_D8_05; 10 f_D8_10; 20 f_D8_20; 30 f_D8_30]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf, [], tau);
  ELw_D8 = L_m * tvel(:,4)/ del_MR; % cm, bell diameter
  %
  tf = [5 f_D4_05; 10 f_D4_10; 20 f_D4_20; 30 f_D4_30; 40 f_D4_40]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf, [], tau);
  ELw_D4 = L_m * tvel(:,4)/ del_MR; % cm, bell diameter
  %
  tf = [5 f_L8_05; 10 f_L8_10; 20 f_L8_20; 30 f_L8_30; 40 f_D4_40]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf, [], tau);
  ELw_L8 = L_m * tvel(:,4)/ del_MR; % cm, bell diameter
  %
  tf = [5 f_L4_05; 10 f_L4_10; 20 f_L4_20; 30 f_L4_30; 40 f_D4_40]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf, [], tau);
  ELw_L4 = L_m * tvel(:,4)/ del_MR; % cm, bell diameter
  %
  tf = [5 f_L2_05; 10 f_L2_10; 20 f_L2_20; 30 f_L2_30; 40 f_D4_40]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf, [], tau);
  ELw_L2 = L_m * tvel(:,4)/ del_MR; % cm, bell diameter
  %
  tf = [5 f_L0_05; 10 f_L0_10; 20 f_L0_20; 30 f_L0_30; 40 f_D4_40]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf, [], tau);
  ELw_L0 = L_m * tvel(:,4)/ del_MR; % cm, bell diameter
 
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  
  % pack to output
  prdData.tL = [ELw_D8 ELw_D4 ELw_L8 ELw_L4 ELw_L2 ELw_L0];
  prdData.LW = EWw;
  
end
