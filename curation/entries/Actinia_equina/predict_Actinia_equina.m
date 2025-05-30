function [prdData, info] = predict_Actinia_equina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp]; 
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, pedal disk diameter at puberty
  Ww_p = L_p^3 * (1 + ome * f);     % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate pedal disk diameter
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R); % #/d, max repord rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am  = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-wet weight
  L_0 = (Ww0/(1+f_tW*ome))^(1/3); L_i = f_tW * L_m; %cm,  struct length
  rT_B = TC * k_M/ 3/ (1 + f_tW/ g);      % 1/d, von Bert growth rate
  L = L_i - (L_i - L_0) * exp( - rT_B * tW(:,1));  % cm, struc length
  EWw = L.^3*(1+f_tW*ome); % g, wet weight
  
  % wet weight-dry weight
  EWd = d_V*WW(:,1); % g, dry weight
  
  % length-wet weight
  EWw_L = (LW(:,1)*del_M).^3*(1+f*ome); % wet weight
   
  % pack to output
  prdData.tW = EWw;
  prdData.WW = EWd;
  prdData.LW = EWw_L;
  