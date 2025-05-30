function [prdData, info] = predict_Haliclona_oculata(par, data, auxData)
  
  global tX tT

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_lp = [g k l_T v_Hb v_Hp];
  [l_p, l_b, info] = get_lp(pars_lp, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = f * L_m;                    % cm, ultimate structural length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  

  % time-volume 
  eV0 = [tX(1,2)/ (K + tX(1,2)); V0]; 
  [t eV] = ode45(@fn_tV, tV(:,1) - tV(1,1) - 1e-3, eV0, [], tX, tT, T_ref, T_A, K, v, g, L_m);
  EV = eV(:,2);
  
  % pack to output
  prdData.tV = EV;
end

function deV = fn_tV(t, eV, tX, tT, T_ref, T_A, K, v, g, L_m)
  X = spline1(t, tX); f = X/ (K + X); 
  TC = tempcorr(C2K(spline1(t, tT)), T_ref, T_A); vT = v * TC;

  e = eV(1); V = eV(2); L = V^(1/3);

  dV = V * vT * (e/L - 1/ L_m)/ (e + g);
  de = (f - e) * vT/ L;
  deV = [de; dV];
end