function [prdData, info] = predict_Metridium_senile(par, data, auxData)
  
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
  Ww_p = L_p^3 * (1 + ome * f);     % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am  = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % t-A data
  rT_B = TC * k_M/ 3/ (1 + f/ g);      % 1/d, von Bert growth rate
  EA = ((L_i - (L_i - L_b) * exp( - rT_B * (t_0 + tA(:,1))))/ del_M).^2;  % cm^2, pedal disc surface area
  
  % A-Ww data
  EWw = (AW(:,1).^0.5 * del_M).^3 * (1 + ome*f); % g, wet weight
  
  % W-WR data
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EWw_R = TC * 365 * reprod_rate((WWR(:,1)/(1 + f * ome)).^(1/3), f, pars_R) * Ww_b; % g, gonad wet weight
  
  % pack to output
  prdData.tA = EA;
  prdData.AW = EWw;
  prdData.WWR = EWw_R;