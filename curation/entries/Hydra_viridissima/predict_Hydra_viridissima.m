function [prdData, info] = predict_Hydra_viridissima(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
%  TC_tN = tempcorr(temp.tN, T_ref, T_A);
  TC_tA = tempcorr(temp.tAs, T_ref, T_A);
  TC_tV = tempcorr(temp.tVs, T_ref, T_A);
  TC_AN = tempcorr(temp.AN, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp]; info = 1;
  [t_p, t_b, l_p, l_b] = get_tp_foetus(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  V_b = 1e3 * L_b^3 * (1 + f * w);  % mm^3, dvolume at birth at f 
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;% d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  V_p = 1e3 * L_p^3 * (1 + f * w);  % mm^3, volume at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  V_i = 1e3 * L_i^3 * (1 + f * w);  % mm^3, ultimate volume
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_foetus(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Vb = V_b;
  prdData.Vp = V_p;
  prdData.Vi = V_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % t-A and t-V data
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;      % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - TC_tA * r_B * tAs(:,1)); % cm, expected length at time
  EA = 1e2 * (L/ del_M).^2;                           % mm^2, surface area
  L = L_i - (L_i - L_b) * exp( - TC_tV * r_B * tVs(:,1)); % cm, expected length at time
  EV = 1e3 * L.^3 * (1 + f * w);                      % mm^3, volume  
  
  % A-R -data
  L = del_M * (1e-2 * AN(:,1)) .^ 0.5;                % cm, structural length
  RT = TC_AN * reprod_rate_foetus(L, f, pars_R);      % #/d, reproduction rate at L
  ER = RT * a_b;                                      % #, no of buds
  
  % t-N data
%   rT = fzero(@(r)1 + exp(-r * tT_p) - exp(r * aT_b), 0); % 1/d, spec pop growth rate
%   EN = exp(rT * tN(:,1));
  
  % pack to output
  prdData.tVs = EV;
  prdData.tAs = EA;
%  prdData.tN = EN;
  prdData.AN = ER;
  