function [prdData, info] = predict_Mnemiopsis_leidyi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_R78 = tempcorr(temp.R78, T_ref, T_A);
  TC_LR2 = tempcorr(temp.LR2, T_ref, T_A);
  TC_LR = tempcorr(temp.LR, T_ref, T_A);
  TC_WwR = tempcorr(temp.WwR, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_ts = [g k l_T v_Hb v_Hs v_Hj v_Hp];
  [t_s, t_j, t_p, t_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_ts(pars_ts, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_MOA;              % cm, oral-aboral length at birth at f
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;% d, age at birth at f and T

  % start acceleration
  L_s = L_m * l_s;                  % cm, structural length at start acceleration
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_MOA;              % cm, oral-aboral length at metam at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_MTL;              % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_MOA;              % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction 
  pars_R  = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hs; U_Hj; U_Hp]; % compose parameter vector at T
  [R_78, U_E0] = reprod_rate_s((27/(1+f*w))^(1/3), f, pars_R); % #/d, reproduction rate at 27 g
  RT_78 = R_78 * TC_R78;                % #/d, reprod rate
  Wc_0 = 1e6 * U_E0 * p_Am * 12/ mu_E; % µg, initial carbon weight

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wc0 = Wc_0;
  prdData.Wwi = Ww_i;
  prdData.R78 = RT_78;
  
  % uni-variate data
  
  EV  = (LV(:,1) * del_MOA/ 10).^3 * (1 + f * w);    % cm^3, volume
  EWw  = (LWw(:,1) * del_MOA/ 10).^3 * (1 + f * w);  % g, wet mass
  EWC = 1e3 * (LWC(:,1) * del_MTL * 1e-1).^3 * (1 + f * w) * d_V * 12/ w_V;  % mg, carbon mass

  ERT_L  = TC_LR * reprod_rate_s(LR(:,1) * del_MOA/ 10, f, pars_R); % #/d, reprod rate
  ERT_W = TC_WwR * reprod_rate_s((WwR(:,1)./ (1 + f * w)).^(1/3), f , pars_R);  % #/d, reproduction rate
  ERT_L2  = TC_LR2 * reprod_rate_s(LR2(:,1) * del_MTL/ 10, f, pars_R); % #/d, reprod rate
 
  % tL, tN data
  [EN L] = cum_reprod_s(tL(:,1) * TC_tL, f_tL, pars_R);
  ELw = 10 * L/ del_MTL;  
  
  % pack to output
  prdData.LWw = EWw;
  prdData.LV = EV;
  prdData.LR = ERT_L;
  prdData.WwR = ERT_W;
  prdData.LR2 = ERT_L2;
  prdData.tL = ELw;
  prdData.tN = EN;
  prdData.LWC = EWC;
