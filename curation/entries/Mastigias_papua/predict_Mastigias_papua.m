function [prdData, info] = predict_Mastigias_papua(par, data, auxData)
  
global tT

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  tTC = [tT(:,1), tempcorr(tT(:,2), T_ref, T_A)]; % vector of T in time
  TC_LJO = tempcorr(temp.LJO, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
 [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  
  % metamorphosis
  L_j = L_m * l_j;      % cm, structural length at metam
  Lw_j = L_j/ del_M;    % cm, physical length at metam at f
  aT_j = t_j / k_M/ TC_aj;   % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj  = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  
  % uni-variate data
  
  % time-length
  r_j = rho_j * k_M; r_B = rho_B * k_M; % 1/d, exponential, von Bert growth rate
  [t LH] = ode45(@dget_LH, tL(:,1), [L_b; E_Hb], [], tTC, E_Hj, r_j, r_B, L_b, L_j, L_i, v, g, kap, k_J, E_m, f); 
  ELw = LH(:,1)/ del_M; % cm, bell diameter
 
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  
  % respiration 
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  pACSJGRD = p_ref * scaled_power_j(LJO(:,1) * del_M, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJO = - 32000 * J_M(3,:)' * TC_LJO; % mg O2/d, O2 consumption 

  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
  prdData.LJO = EJO;
  
end

function dLH = dget_LH(t, LH, tTC, E_Hj, r_j, r_B, L_b, L_j, L_i, v, g, kap, k_J, E_m, f)
  L = LH(1); E_H = LH(2); % cm, J: structural length, maturity
  s_M = min(L, L_j)/ L_b; % -, acceleration factor
  r = v * s_M * (f/ L - 1/ L_i)/ (f + g); % 1/d, spec growth rate
  p_C = L^3 * E_m * f * (s_M * v/ L - r); % J/d, mobilisation rate
  dE_H = (1 - kap) * p_C - k_J * E_H; % change in maturity at T_ref
  if E_H < E_Hj
    dL = L * r_j/3; % cm/d, change in length before metam at T_ref
  else
    dL = r_B * (L_i - L); % cm/d, change in length after metam at T_ref
  end
  dLH = spline1(t, tTC) * [dL; dE_H]; % cm/d, J/d: changes at T
end