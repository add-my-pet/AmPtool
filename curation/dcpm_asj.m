%% dcpm_asj
% changes in cohort states for asj model

%%
function dXvars = dcpm_asj(t, Xvars, E_Hp, E_Hj, E_Hs, E_Hb, tTC, tJX, V_X, h_D, h_J, q_b, h_Ab, h_Bbs, h_Bsj, h_Bjp, h_Bpi, h_a, s_G, thin, S_b, a_b, ...
    L_b, L_s, L_j, L_m, E_m, k_J, k_JX, v, g, p_M, p_Am, J_X_Am, K, kap, kap_G, del_X)
% created 2020/03/15 by Bob Kooi & Bas Kooijman
  
%% Syntax
% dXvars = <../dcpm_asj.m *dcpm_asj*> (t, Xvars, E_Hp, E_Hj, E_Hs,  E_Hb, tTC, tJX, V_X, h_D, h_J, q_b, h_Ab, h_Bbs, h_Hjp, h_Bjp, h_Bpi, h_a, s_G, thin, S_b, a_b, ...
%   L_b, L_j, L_s, L_m, E_m, k_J, k_JX, v, g, p_M, p_Am, J_X_Am, K, kap, kap_G, del_X))
  
%% Description
%  ode's for changes in cohorts with asj model
%
% Input:
%
% * t: time, with 0<t<t_R
% * Xvars: vector with states of cohorts
% * par: structure with parameter values
% * tTC: (nT,2)-array with time and temperature correction factors
% * tJX: (nX,2)-array with time and food supply 
%
% Output:
%
% * dXvars: changes in states of cohorts

%% Remarks
% aT_b < t_R should apply; changes in embryo states are evaluated separately, and embryo states are set at birth values in the cohort changes 
    
  [X, q, h_A, L, L_max, E, E_R, E_H, N] = cpm_unpack(Xvars);  % all vars >=0
  E_H = min(E_Hp, E_H); E = min(E, E_m); e = E/ E_m; L2 = L .* L; L3 = L .* L2; 
  
  if t < a_b % set embryos at birth value, since changes are too fast, below the embryo changes are set to 0
    q(1) = q_b; h_A(1) = h_Ab; L(1) = L_b; L_max(1) = L_b; E(1) = E_m; E_R(1) = 0; E_H(1) = E_Hb; N(1) = N(1) * S_b;
    e(1) = 1; L2(1) = L(1) * L(1); L3(1) = L(1) * L2(1); 
  end
  
  if length(tJX) == 1
    J_XI = tJX;
  else
    J_XI = spline1(t, tJX); % food supply flux
  end
  if length(tTC) == 1
    TC = tTC;
  else
    TC = spline1(t, tTC); % temperature correction factor
  end
    
  % temp correction
  kT_J = k_J * TC; kT_JX = k_JX * TC; 
  hT_D = h_D * TC; hT_J = TC * h_J; hT_a = h_a * TC^2; 
  % account for acceleration
  s_M = min(L_j, max(L, L_s))/ L_s;
  vT = TC * v .* s_M;
  pT_Am = TC * p_Am .* s_M;
  JT_X_Am = TC * J_X_Am .* s_M; 

  f = X/ (X + K); % -, scaled func response
  dX = J_XI/ V_X - hT_D * X - f .* sum((E_H > E_Hb) .* JT_X_Am .* N .* L.^2)/ V_X; % food dynamics
    
  kapG = max(kap_G, e >= L ./ s_M / L_m); % kap_G if shrinking, else 1
  p_A = (E_H > E_Hb) .* pT_Am * f .* L2;
  dE = p_A ./ L3 - vT .* E ./ L; % J/d.cm^3, change in reserve density
  r = vT .* (e./ L - 1 ./ s_M/ L_m) ./ (e + kapG * g);  % 1/d, spec growth rate of structure
  r = r .* (E_R <= 0) + max(0, r) .* (E_R > 0); % don't shrink on non-empty reprod buffer
  dL = r .* L/ 3; % cm/d, growth rate of structure
  dL_max = max(0, dL);
  
  p_J = kT_J * E_H;             % J/d, maturity maintenance
  p_C = L3 .* E .* (vT ./ L - r); % J/d, reserve mobilisation rate
  p_R = (1 - kap) * p_C - p_J;  % J/d, flux to maturation/ reprod
  
  if 1 % omit shrinking module
    dE_H = max(0, p_R) .* (E_H < E_Hp);
    dE_R = p_R .* (E_H >= E_Hp);
  else % use shrinking module
    dE_H = max(0, p_R) .* (E_H < E_Hp) - kT_JX * E_H .* (p_R < 0) .* (E_R <= 0);
    % rejuvenate if E_R = 0 and p_R < 0
    dE_R = p_R .* (E_H >= E_Hp) + min(0, kap * p_C - p_M * L3) .* (E_R > 0);
    % 2nd term accounts for paying som maint from reprod buffer, if necessary and possible
  end
  
  % aging
  dq = (q * s_G .* L3 ./ (s_M * L_m).^3 + hT_a) .* e .* (vT ./ L - r) - r .* q;
  dh_A = q - r .* h_A; % 1/d, aging hazard

  % stage-specific background hazards
  h_B = h_Bbs * (E_H <= E_Hs) + h_Bsj * (E_H > E_Hs) .* (E_H <= E_Hj) + h_Bjp * (E_H > E_Hj) .* (E_H < E_Hp) + h_Bpi * (E_H >= E_Hp);
  sel = (L < L_s) .* (L >= L_j); h_X = thin * r .* (sel * 2/3 + ~sel); % thinning hazard
  % using hazard of 0.01 per day in case shrinking exceeds max fraction of del_X
  h = h_A + h_B + h_X + hT_J * max(0, - p_R ./ p_J) + 0.01 * (L ./ L_max < del_X); 
  dN = - h .* N;
  
  if t < a_b % set changes of embryo states to zero
    dq(1) = 0; dh_A(1) = 0; dL(1) = 0; dL_max(1) = 0; dE(1) = 0; dE_R(1) = 0; dE_H(1) = 0; dN(1) = 0;
  end

  dXvars = [dX; dq; dh_A; dL; dL_max; dE; dE_R; dE_H; dN]; % pack output

end