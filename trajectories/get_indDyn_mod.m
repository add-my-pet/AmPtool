%% get_indDyn_mod
% Obtains predictions using parameters and environmental data

%%
function [tELHR, tWNXO, tpAMGRD, aLW, aLWc]  = get_indDyn_mod(model, par, tT, tf, isStageFood)
 % created 2023/06/01, modified 2026/07/06 by Dina Lika
 % stx model provided by Brecht Stechele 2026/05/06

   %% Syntax
  % [tELHR, tWNXO, tpAMGRD, aLW, aLWc] = <../get_indDyn_mod.m *get_indDyn_mod*>(model, par, tT, tf)
    
  %% Description
  % Obtains predictions for state trajectories and some traits for start of development till death by aging, 
  % in a possibly dynamic environment, using parameters from the AmP collection.
  % These parameter can be overwritten.
    % The code does not include spawning events, weights do not include
  % reproduction buffer.
  % Starvation allows shrinking in structural mass. For other type of
  % starvation rules the code should be modified.

  %
  % Input
  %
  % * model: character string with model (e.g. 'std', 'abj')
  % * par: structure with parameters
  % * tT: optional (nT,2)-array with time and temperature in Kelvin (default: T=T_typical)
  %     If scalar, the temperature is assumed to be constant
  % * tf: optional (nX,2)-array with time and functional response
  %     If scalar, the food density is assumed to be constant (default f=1)
  %     For the stx model, tf can also be a 1x2 vector [f_bx f_xi], where
  %     f_bx applies from birth to weaning and f_xi from weaning onwards
  % * isStageFood: optional boolean, true only when model='stx' and
  %     tf = [f_bx f_xi] should be interpreted as stage-specific food
  %  
  % Output
  %
  % * tELHR: (n,5)-array with time and simulated values for E, V, H, R
  % * tWNXO: (n,5)-array with time and simulated values for wet weight,
  % number of offspring, food consumed, O2 consumprion
  % * tpAMGRD: (n,6)-array with time and simulated values of powers (assim, maint, growth, matur/reprod, dissipation)
  % * aLW: vector with age, structural length, weight at life cycle event;
  % computed using events during integration
  % * aLWc: vector with age, structural length, weight at life cycle event
  % at mean values of temperature and food. computed using the DEBtool
  % functions

% interpret optional stage-specific food input for stx
if ~exist('isStageFood','var') || isempty(isStageFood)
    isStageFood = strcmp(model,'stx') && size(tf,1) == 1 && size(tf,2) == 2;
end

% unpack par and compute compound pars
vars_pull(par); vars_pull(parscomp_st(par)); 
  
% temperature correction parameters
par_T = T_A;
if exist('T_L','var') && exist('T_AL','var')
    par_T = [T_A; T_L; T_AL];
end
if exist('T_H','var') && exist('T_AH','var')
    par_T = [T_A; T_H; T_AH];
end
if exist('T_L','var') && exist('T_AL','var') && exist('T_H','var') && exist('T_AH','var')
    par_T = [T_A; T_L; T_H; T_AL; T_AH]; 
end

% Mean temperature correction over the simulation period
if size(tT,1) == 1
    TCmean = tempcorr(tT(1,2), T_ref, par_T);
else
    TCmean = trapz(tT(:,1), tempcorr(tT(:,2), T_ref, par_T)) / (tT(end,1) - tT(1,1));
end

% Mean functional response over the simulation period
if isStageFood
    fmean = NaN;  % not used; food is stage-specific
elseif size(tf,1) == 1
    fmean = tf(1,2);
else
    fmean = trapz(tf(:,1), tf(:,2)) / (tf(end,1) - tf(1,1));
end

% mean life span
switch model        
    case {'std', 'stf', 'sbp','abp'}
        tau_m = get_tm_mod(model, [g, k, v_Hb, v_Hp, h_a/k_M^2, s_G]);     
    case 'stx'
        tau_m = get_tm_mod(model, [g, k, v_Hb, v_Hx, v_Hp, h_a/k_M^2, s_G]);
    case 'abj'
        tau_m = get_tm_mod(model, [g, k,  v_Hb, v_Hj, v_Hp, h_a/k_M^2, s_G]);
    case 'asj'
        tau_m = get_tm_mod(model, [g, k, v_Hb, v_Hs, v_Hj, v_Hp, h_a/k_M^2, s_G]);   
end
  a_mc = tau_m/k_M/TCmean; % d, mean life span 
  a_m = NaN;               % life span from event calculation is not available

% Set simulation time when no time horizon is provided
if size(tT,1) == 1 || (size(tf,1) == 1 && ~isStageFood)
    tSim = 1.5 * a_mc;
end

% Expand constant temperature to simulation horizon
if size(tT,1) == 1
    tT = [0 tT(1,2); tSim tT(1,2)];
end

% Expand constant food to simulation horizon
% For stx stage-specific food, tf = [f_bx f_xi] is not a time series.
if size(tf,1) == 1 && ~isStageFood
    tf = [0 tf(1,2); tSim tf(1,2)];
end

tspan = tT(:,1); % set simulation time

tTC = [tT(:,1) ,tempcorr(tT(:,2), T_ref, par_T)]; % -, temperature correction vector

% Food value used for DEBtool constant-environment predictions.
% For stage-specific stx food, keep [f_bx f_xi].
if isStageFood
    f = tf;
else
    f = fmean;
end

% Check once whether temperature and food are constant.
isConstT = all(tTC(:,2) == tTC(1,2)); TC0 = tTC(1,2);
if isStageFood 
    isConstF = false; % For stx with stage food
    f0 = NaN;
else
    isConstF = all(tf(:,2) == tf(1,2));
    f0 = tf(1,2);
end

% scalar food value for initial reserve functions
if numel(f) == 2
    f_init = f(1);
else
    f_init = f;
end
%

% initial reserve and states at birth
pars_UE0 = [V_Hb; g; k_J; k_M; v];
switch model
   case {'stf','stx'}  
       f_foetus = 1;
       [U0, Lb, info] = initial_scaled_reserve_foetus(f_foetus, pars_UE0);
       E_0 = U0 * p_Am;    % J, energy in embryo reserve
   otherwise
       U_E0 = initial_scaled_reserve(f_init, pars_UE0);
       E_0  = U_E0 * p_Am; % J, energy in egg
end
ELHR0 = [E_0, 1e-20, 0, 0]; % initial conditions at fertilization

switch model
    case 'std'
        pars_tp = [g k l_T v_Hb v_Hp];
        [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled ages and lengths
        L_bc = L_m * l_b; L_pc = l_p * L_m; % cm, length at birth and puberty at constant f
        a_bc = tau_b/k_M/TCmean; a_pc = tau_p/k_M/TCmean; %d, age at birth and puberty
        Ww_bc = L_bc^3 * (1+f*ome); Ww_pc = L_pc^3 * (1+f*ome);
        L_ic = f * L_m; % cm, ultimate struct length at mean constant f
        Ww_ic = L_ic^3 * (1 + f * ome); % g, ultimate wet weight at mean constant f
        %
        pars_std = [p_Am, v, p_M, k_J, kap, kap_G, E_G, E_Hb, E_Hp];
        options = odeset('Events',@stage_events_std,'AbsTol',1e-9, 'RelTol',1e-9);
        [t, ELHR, te, ye, ie] = ode45(@dget_ELHR_std, tspan, ELHR0, options, pars_std, tTC, tf, isConstT, TC0, isConstF, f0);
        if isempty(te)
            te(1) = NaN; te(2) = NaN; ye = NaN * ones(2,4);
            warning('birth is not reached')
        elseif length(te) == 1
            te(2) = NaN; ye(2,:) = NaN * ones(1,4);
            warning('puberty is not reached')
        end
        a_b = te(1); a_p = te(2); % ages at events b, p
        L_b = ye(1,2); L_p = ye(2,2);
        Ww_b = ye(1,2)^3 + ye(1,1) * w_E/mu_E/d_E; 
        Ww_p = ye(2,2)^3 + ye(2,1) * w_E/mu_E/d_E; 
        L_i = NaN; Ww_i = NaN; % not applicaple in dynamic environment
        % calculate powers
        pars_pj = [p_Am, v, p_M, k_J, kap, kap_R, E_G, kap_G];
        if isConstF, f_s  = f0 * ones(size(t)); else, f_s  = spline1(t,tf);  end
        if isConstT, TC_s = TC0 * ones(size(t)); else, TC_s = spline1(t,tTC); end
        pAMGRD = powers(ELHR, f_s, pars_pj, L_b, L_p) .* TC_s;
        JM = - (n_M\n_O) * eta_O * pAMGRD(:, [1 4 3])';  % mol/d: J_C, J_H, J_O, J_N in rows
        %
        aLW = [a_b; a_p; a_m; L_b; L_p; L_i; Ww_b; Ww_p; Ww_i];
        % use the get_* functions of the DEBtool
        aLWc = [a_bc; a_pc; a_mc; L_bc; L_pc; L_ic; Ww_bc; Ww_pc; Ww_ic];
    case 'stx'
        % Analytical predictions using get_tx (foetal development + weaning)
        % p = [g, k, l_T, v_Hb, v_Hx, v_Hp]; f = post-weaning food (pre-weaning f=1)
        pars_tx = [g, k, l_T, v_Hb, v_Hx, v_Hp];
        [tau_p, tau_x, tau_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
        if numel(f) == 2
            f_bx = f(1);  % birth to weaning
            f_xi = f(2);  % weaning to end
        else
            f_bx = f;
            f_xi = f;
        end
        L_bc  = L_m * l_b;  L_xc  = L_m * l_x;  L_pc  = L_m * l_p; % cm, length at birth, weaning, and puberty at constant f
        a_bc  = tau_b/k_M/TCmean; a_xc  = tau_x/k_M/TCmean; a_pc  = tau_p/k_M/TCmean; % d, age at birth, weaning, and puberty
        Ww_bc = L_bc^3 * (1 + f_bx*ome);
        Ww_xc = L_xc^3 * (1 + f_bx*ome);
        Ww_pc = L_pc^3 * (1 + f_xi*ome);
        L_ic  = f_xi * L_m;
        Ww_ic = L_ic^3 * (1 + f_xi * ome);
        %
        pars_stx = [p_Am, v, p_M, k_J, kap, kap_G, E_G, E_Hb, E_Hx, E_Hp];
        options = odeset('Events', @stage_events_stx, 'AbsTol', 1e-9, 'RelTol', 1e-9);
        [t, ELHR, te, ye, ie] = ode45(@dget_ELHR_stx, tspan, ELHR0, options, pars_stx, tTC, tf, isConstT, TC0, isConstF, f0);
        % te order: birth (E_Hb), weaning (E_Hx), puberty (E_Hp)
        if isempty(te)
            te = NaN(3,1); ye = NaN * ones(3,4);
            warning('birth is not reached')
        elseif length(te) == 1
            te(2) = NaN; te(3) = NaN;
            ye(2,:) = NaN * ones(1,4); ye(3,:) = NaN * ones(1,4);
            warning('weaning is not reached')
        elseif length(te) == 2
            te(3) = NaN; ye(3,:) = NaN * ones(1,4);
            warning('puberty is not reached')
        elseif length(te)~=3
            warning('event detection was not successful \n')
        end
        a_b = te(1); a_x = te(2); a_p = te(3);
        L_b = ye(1,2); L_x = ye(2,2); L_p = ye(3,2);
        Ww_b = ye(1,2)^3 + ye(1,1) * w_E/mu_E/d_E;
        Ww_x = ye(2,2)^3 + ye(2,1) * w_E/mu_E/d_E;
        Ww_p = ye(3,2)^3 + ye(3,1) * w_E/mu_E/d_E;
        L_i = NaN; Ww_i = NaN; % not applicable in dynamic environment
        % calculate powers
        pars_pj = [p_Am, v, p_M, k_J, kap, kap_R, E_G, kap_G];
        if isStageFood
            f_s = tf(1) * (ELHR(:,3) < E_Hx) + tf(2) * (ELHR(:,3) >= E_Hx);
        else
            if isConstF, f_s  = f0 * ones(size(t)); else, f_s  = spline1(t,tf);  end
        end
        if isConstT, TC_s = TC0 * ones(size(t)); else, TC_s = spline1(t,tTC); end
        pAMGRD = powers(ELHR, f_s, pars_pj, L_b, L_p) .* TC_s;
        JM = - (n_M\n_O) * eta_O * pAMGRD(:, [1 4 3])';  % mol/d: J_C, J_H, J_O, J_N in rows
        %
        aLW  = [a_b; a_x; a_p; a_m; L_b; L_x; L_p; L_i; Ww_b; Ww_x; Ww_p; Ww_i];
        aLWc = [a_bc; a_xc; a_pc; a_mc; L_bc; L_xc; L_pc; L_ic; Ww_bc; Ww_xc; Ww_pc; Ww_ic];
    case 'sbp'
        pars_tp = [g k l_T v_Hb v_Hp];
        [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled ages and lengths
        L_bc = L_m * l_b; L_pc = l_p * L_m; % cm, length at birth and puberty at constant f
        a_bc = tau_b/k_M/TCmean; a_pc = tau_p/k_M/TCmean; % d, age at birth and puberty
        Ww_bc = L_bc^3 * (1+f*ome); Ww_pc = L_pc^3 * (1+f*ome);
        L_ic = NaN;  Ww_ic = NaN;  % growth stops at puberty
        %
        pars_sbp = [p_Am, v, p_M, k_J, kap, kap_G, E_G, E_Hb, E_Hp];
        options = odeset('Events',@stage_events_std,'AbsTol',1e-9, 'RelTol',1e-9);
        [t, ELHR, te, ye, ie] = ode45(@dget_ELHR_sbp, tspan, ELHR0, options, pars_sbp, tTC, tf, isConstT, TC0, isConstF, f0);
        if isempty(te)
            te(1) = NaN; te(2) = NaN; ye = NaN * ones(2,4);
            warning('birth is not reached')
        elseif length(te) == 1
            te(2) = NaN; ye(2,:) = NaN * ones(1,4);
            warning('puberty is not reached')
        end
        a_b = te(1); a_p = te(2); % ages at events b, p
        L_b = ye(1,2); L_p = ye(2,2);
        Ww_b = ye(1,2)^3 + ye(1,1) * w_E/mu_E/d_E; 
        Ww_p = ye(2,2)^3 + ye(2,1) * w_E/mu_E/d_E; 
        L_i = NaN; Ww_i = NaN; % not applicaple in dynamic environment
        % calculate powers
        pars_pj = [p_Am, v, p_M, k_J, kap, kap_R, E_G, kap_G];
        if isConstF, f_s  = f0 * ones(size(t)); else, f_s  = spline1(t,tf);  end
        if isConstT, TC_s = TC0 * ones(size(t)); else, TC_s = spline1(t,tTC); end
        pAMGRD = powers(ELHR, f_s, pars_pj, L_b, L_p) .* TC_s;
        JM = - (n_M\n_O) * eta_O * pAMGRD(:, [1 4 3])';  % mol/d: J_C, J_H, J_O, J_N in rows
        pAMGRD(:,3) = pAMGRD(:,3) .* (ELHR(:,2) < L_p); % adults do not grow
        %
        aLW = [a_b; a_p; a_m; L_b; L_p; L_i; Ww_b; Ww_p; Ww_i];
        % use the get_* functions of the DEBtool
        aLWc = [a_bc; a_pc; a_mc; L_bc; L_pc; L_ic; Ww_bc; Ww_pc; Ww_ic];
    case 'abj'
        pars_tj = [g k l_T v_Hb v_Hj v_Hp]; 
        [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); % -, scaled ages and lengths
        L_bc = L_m * l_b; L_jc = l_j * L_m; L_pc = l_p * L_m; % cm, length at birth, metamorphosis, and puberty at constant f
        a_bc = tau_b/k_M/TCmean; a_jc = tau_j/k_M/TCmean; a_pc = tau_p/k_M/TCmean; % d, age at birth, metamorphosis, and puberty
        Ww_bc = L_bc^3 * (1+f*ome); Ww_jc = L_jc^3 * (1+f*ome); Ww_pc = L_pc^3 * (1+f*ome);
        L_ic = f * L_m * (L_jc/L_bc);     % cm, ultimate struct length at mean constant f
        Ww_ic = L_ic^3 * (1 + f * ome);   % g, ultimate wet weight at mean constant f
        %
        pars_abj = [p_Am, v, p_M, k_J, kap, kap_G, E_G, E_Hb, E_Hj, E_Hp];
        options = odeset('Events',@stage_events_abj, 'AbsTol',1e-9, 'RelTol',1e-9);
        % 1st call from fertilization to birth
        s_M = 1; isterminal =[1,0,0];
        [t1, ELHR1, te, ye, ie] = ode45(@dget_ELHR_abj, tspan, ELHR0, options, pars_abj, tTC, tf, NaN, s_M, isConstT, TC0, isConstF, f0, isterminal);
        if isempty(te)
            te = NaN; ye = NaN * ones(1,4);
            warning('birth is not reached')
        end          
        a_b = te; L_b = ye(2); Ww_b = ye(2)^3 + ye(1) * w_E/mu_E/d_E; % age (d), struc length (cm), weight (g) at birth
        % 2nd call from birth to metamorphosis
        L_b = ye(2); isterminal =[0,1,0];
        [t2, ELHR2, te, ye, ie] = ode45(@dget_ELHR_abj, [te, tspan(end)], ye+1e-8, options, pars_abj, tTC, tf, L_b, NaN, isConstT, TC0, isConstF, f0, isterminal);        
        t2(1) = []; ELHR2(1,:) =[];
        if isempty(te)
            te = NaN; ye = NaN * ones(1,4);
            warning('metamorphosis is not reached')
        end
        a_j = te; L_j = ye(2); Ww_j = ye(2)^3 + ye(1) * w_E/mu_E/d_E; % age (d), struc length (cm), weight (g) at metamorphosis
        % 3nd call from metamorphosis to the end of simulation
        s_M = L_j/L_b;  isterminal =[0,0,0];
        [t3, ELHR3, te, ye, ie] = ode45(@dget_ELHR_abj, [te, tspan(end)], ye+1e-8, options, pars_abj, tTC, tf, NaN, s_M, isConstT, TC0, isConstF, f0, isterminal);        
        t3(1) = []; ELHR3(1,:) =[];
        if isempty(te)
            te = NaN; ye = NaN * ones(1,4);
            warning('puberty is not reached')
        end
        a_p = te; L_p = ye(2); Ww_p = ye(2)^3 + ye(1) * w_E/mu_E/d_E; % age (d), struc length (cm), weight (g) at puberty
        % catenate matrices
        t = [t1; t2; t3]; ELHR = [ELHR1; ELHR2; ELHR3];
        L_i = NaN; Ww_i = NaN; % not applicaple in dynamic environment
        % calculate powers
        pars_pj = [p_Am, v, p_M, k_J, kap, kap_R, E_G, kap_G];
        if isConstF, f_s  = f0 * ones(size(t)); else, f_s  = spline1(t,tf);  end
        if isConstT, TC_s = TC0 * ones(size(t)); else, TC_s = spline1(t,tTC); end
        pAMGRD = powers_j(ELHR, f_s, pars_pj, L_b, L_b, L_j, L_p) .* TC_s;
        JM = - (n_M\n_O) * eta_O * pAMGRD(:, [1 4 3])';  % mol/d: J_C, J_H, J_O, J_N in rows
        %
        aLW = [a_b; a_j; a_p; a_m; L_b; L_j; L_p; L_i; Ww_b; Ww_j; Ww_p; Ww_i];
        % use the get_* functions of the DEBtool
        aLWc = [a_bc; a_jc; a_pc; a_mc; L_bc; L_jc; L_pc; L_ic; Ww_bc; Ww_jc; Ww_pc; Ww_ic];
    case 'asj'
        pars_ts = [g, k, 0, v_Hb, v_Hs, v_Hj, v_Hp];
        [tau_s, tau_j, tau_p, tau_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_ts(pars_ts, f); % -, scaled ages and lengths
        L_bc = L_m * l_b; L_sc = l_s * L_m; L_jc = l_j * L_m; L_pc = l_p * L_m; 
        a_bc = tau_b/k_M/TCmean; a_sc = tau_s/k_M/TCmean; 
        a_jc = tau_j/k_M/TCmean; a_pc = tau_p/k_M/TCmean; 
        Ww_bc = L_bc^3 * (1+f*ome); Ww_sc = L_jc^3 * (1+f*ome); 
        Ww_jc = L_jc^3 * (1+f*ome); Ww_pc = L_pc^3 * (1+f*ome);
        L_ic = f * L_m * (L_jc/L_bc);     % cm, ultimate struct length at mean constant f
        Ww_ic = L_ic^3 * (1 + f * ome);   % g, ultimate wet weight at mean constant f
        %
        pars_asj = [p_Am, v, p_M, k_J, kap, kap_G, E_G, E_Hb, E_Hs, E_Hj, E_Hp];
        options = odeset('Events',@stage_events_asj, 'AbsTol',1e-9, 'RelTol',1e-9);
        % 1st call from fertilization to start of metabolic acceleration
        s_M = 1; isterminal =[0,1,0,0];
        [t1, ELHR1, te, ye, ie] = ode45(@dget_ELHR_asj, tspan, ELHR0, options, pars_asj, tTC, tf, NaN, s_M, isConstT, TC0, isConstF, f0, isterminal);
        if isempty(te)
            te(1) = NaN; te(2) = NaN; ye = NaN * ones(2,4);
            warning('birth is not reached')
        elseif length(te) == 1
            te(2) = NaN; ye(2,:) = NaN * ones(1,4);
            warning('start of accel is not reached')
        end
        a_b = te(1); L_b = ye(1,2); Ww_b = ye(1,2)^3 + ye(1,1) * w_E/mu_E/d_E; % age (d), struc length (cm), weight (g) at birth
        a_s = te(2); L_s = ye(2,2); Ww_s = ye(2,2)^3 + ye(2,1) * w_E/mu_E/d_E; % age (d), struc length (cm), weight (g) at start of accel
        % 2nd call from start of acceleration to metamorphosis (end of acceleration)
        isterminal =[0,0,1,0];
        [t2, ELHR2, te, ye, ie] = ode45(@dget_ELHR_asj, [te(2), tspan(end)], ye(2,:)+1e-8, options, pars_asj, tTC, tf, L_s, NaN, isConstT, TC0, isConstF, f0, isterminal);
        t2(1) = []; ELHR2(1,:) =[];
        if isempty(te)
            te = NaN; ye = NaN * ones(1,4);
            warning('metamorphosis is not reached')
        end
        a_j = te; L_j = ye(2); Ww_j = ye(2)^3 + ye(1) * w_E/mu_E/d_E; % age (d), struc length (cm), weight (g) at metamorphosis
        % 3nd call from metamorphosis to the end of simulation
        s_M = L_j/L_s;  isterminal =[0,0,0,0];
        [t3, ELHR3, te, ye, ie] = ode45(@dget_ELHR_asj, [te, tspan(end)], ye+1e-8, options, pars_asj, tTC, tf, NaN, s_M, isConstT, TC0, isConstF, f0, isterminal);        
        t3(1) = []; ELHR3(1,:) =[];
        if isempty(te)
            te = NaN; ye(:) = NaN * ones(1,4);
            warning('puberty is not reached')
        end
        a_p = te; L_p = ye(2); Ww_p = ye(2)^3 + ye(1) * w_E/mu_E/d_E; % age (d), struc length (cm), weight (g) at puberty
        % catenate matrices
        t = [t1; t2; t3]; ELHR = [ELHR1; ELHR2; ELHR3];
        L_i = NaN; Ww_i = NaN; % not applicaple in dynamic environment
        % calculate powers
        pars_pj = [p_Am, v, p_M, k_J, kap, kap_R, E_G, kap_G];
        if isConstF, f_s  = f0 * ones(size(t)); else, f_s  = spline1(t,tf);  end
        if isConstT, TC_s = TC0 * ones(size(t)); else, TC_s = spline1(t,tTC); end
        pAMGRD = powers_j(ELHR, f_s, pars_pj, L_b, L_s, L_j, L_p) .* TC_s;
        JM = - (n_M\n_O) * eta_O * pAMGRD(:, [1 4 3])';  % mol/d: J_C, J_H, J_O, J_N in rows
        %
        aLW = [a_b; a_s; a_j; a_p; a_m; L_b; L_s; L_j; L_p; L_i; Ww_b; Ww_s; Ww_j; Ww_p; Ww_i];
        % use the get_* functions of the DEBtool
        aLWc = [a_bc; a_sc; a_jc; a_pc; a_mc; L_bc; L_sc; L_jc; L_pc; L_ic; Ww_bc; Ww_sc; Ww_jc; Ww_pc; Ww_ic];
    case 'abp'
        pars_tj = [g k l_T v_Hb v_Hp v_Hp+1e-6];
        [tau_p, tau_pp, tau_b, l_p, l_pp, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f); % -, scaled ages and lengths
        L_bc = L_m * l_b; L_pc = l_p * L_m;
        a_bc = tau_b/k_M/TCmean; a_pc = tau_p/k_M/TCmean; 
        Ww_bc = L_bc^3 * (1+f*ome); Ww_pc = L_pc^3 * (1+f*ome);
        L_ic = NaN;  Ww_ic = NaN;  % growth stops at puberty
        %
        pars_abp = [p_Am, v, p_M, k_J, kap, kap_G, E_G, E_Hb, E_Hp];
        options = odeset('Events',@stage_events_abp, 'AbsTol',1e-9, 'RelTol',1e-9);
        % 1st call from fertilization to birth
        s_M = 1; isterminal =[1,0];
        [t1, ELHR1, te, ye, ie] = ode45(@dget_ELHR_abp, tspan, ELHR0, options, pars_abp, tTC, tf, NaN, s_M, isConstT, TC0, isConstF, f0, isterminal);
        if isempty(te)
            te = NaN; ye = NaN * ones(1,4);
            warning('birth is not reached')
        end          
        a_b = te; L_b = ye(2); Ww_b = ye(2)^3 + ye(1) * w_E/mu_E/d_E; % age (d), struc length (cm), weight (g) at birth
        % 2nd call from birth to the end of simulation
        isterminal =[0,0];
        [t2, ELHR2, te, ye, ie] = ode45(@dget_ELHR_abp, [te, tspan(end)], ye+1e-8, options, pars_abp, tTC, tf, L_b, NaN, isConstT, TC0, isConstF, f0, isterminal);
        t2(1) = []; ELHR2(1,:) =[];
        if isempty(te)
            te = NaN; ye = NaN * ones(1,4);
            warning('puberty is not reached')
        end
        a_p = te; L_p = ye(2); Ww_p = ye(2)^3 + ye(1) * w_E/mu_E/d_E; % age (d), struc length (cm), weight (g) at puberty
        % catenate matrices
        t = [t1; t2]; ELHR = [ELHR1; ELHR2];
        L_i = NaN; Ww_i = NaN; a_99 = NaN; % not applicaple in dynamic environment
        % calculate powers
        pars_pj = [p_Am, v, p_M, k_J, kap, kap_R, E_G, kap_G];
        if isConstF, f_s  = f0 * ones(size(t)); else, f_s  = spline1(t,tf);  end
        if isConstT, TC_s = TC0 * ones(size(t)); else, TC_s = spline1(t,tTC); end
        pAMGRD = powers_j(ELHR, f_s, pars_pj, L_b, L_b, L_p, L_p) .* TC_s;
        JM = - (n_M\n_O) * eta_O * pAMGRD(:, [1 4 3])';  % mol/d: J_C, J_H, J_O, J_N in rows
        pAMGRD(:,3) = pAMGRD(:,3) .* (ELHR(:,2) < L_p); % adults do not grow
        %
        aLW = [a_b; a_p; a_m; L_b; L_p; L_i; Ww_b; Ww_p; Ww_i];
        % use the get_* functions of the DEBtool
        aLWc = [a_bc; a_pc; a_mc; L_bc; L_pc; L_ic; Ww_bc; Ww_pc; Ww_ic];
end
  
% observable quantities
% Lw = ELHR(:,2)/del_M;               % cm, physical length del_M is not packed in par
Ww = ELHR(:,2).^3 + ELHR(:,1) * w_E/ mu_E/ d_E; % g, wet weight (reproduction buffer is not included)
if any(strcmp(model, {'stf','stx'}))
    N = repmat(NaN, size(Ww,1),1);   % for stf and stx models
else
    N = kap_R * ELHR(:,4)/E_0; % #, cumulated number of eggs
end
JX = (w_X/(kap_X*mu_X*d_X)) * pAMGRD(:,1); % g/d, food consumed
JO = - 32 * JM(3,:)';    % g O2/d,  O2 consumption 
% pack output
tELHR = [t, ELHR];
tWNXO = [t, Ww, N, JX, JO];
tpAMGRD =[t, pAMGRD];
% 
end

% subfunctions
function dELHR = dget_ELHR_std(t, ELHR, p, tTC, tf, isConstT, TC0, isConstF, f0)
  % Define changes in the state variables for std model
  % t: time
  % ELHR: 4-vector with state variables
  %         E , J, reserve energy
  %         L , cm, structural length
  %         E_H , J , cumulated energy inversted into maturity (E_H in Kooijman 2010)
  %         E_R , J, reproduction buffer (E_R in Kooijman 2010)
  %         
  % dELHR: 4-vector with change in E, L, H, R

  % unpack state variables

  E = ELHR(1); L = ELHR(2); E_H = ELHR(3);

  % unpack par
  p_Am = p(1); v = p(2); p_M = p(3); k_J = p(4); 
  kap = p(5); kap_G = p(6); 
  E_G = p(7); E_Hb = p(8); E_Hp = p(9);

  % Use constant values directly whenever possible.
  % Otherwise interpolate at the current integration time.
  if isConstT
      TC = TC0;
  else
      TC = spline1(t, tTC);
  end

  if isConstF
      f_t = f0;
  else
      f_t = spline1(t, tf);
  end

  % temp correction
  pT_Am = TC * p_Am ;
  vT = TC * v;  
  pT_M = TC * p_M;
  kT_J = TC * k_J; 

  pA = (pT_Am * f_t * L^2) * (E_H >= E_Hb);
  if  kap * E * vT >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
    r = (E * vT/ L - pT_M * L^3/ kap)/ (E + E_G * L^3/ kap); % d^-1, specific growth rate  
  else 
    r = (E * vT/ L - pT_M * L^3/ kap)/ (E + kap_G * E_G * L^3/ kap); % d^-1, specific growth rate                                      
  end
  pC  = E * (vT/ L - r); % J/d, mobilized energy flux
 
  % generate derivatives
  dE    = pA - pC;  % J/d, change in energy in reserve
  dL    = r * L / 3;    % cm^3/d, change in structural volume
  dE_H  = ((1 - kap) * pC - kT_J * E_H) * (E_H<E_Hp);     % J/d, change in cumulated energy invested in maturation
  dE_R  = ((1 - kap) * pC - kT_J * E_Hp) * (E_H >= E_Hp); % J/d, change in reproduction buffer

  % pack derivatives
  dELHR = [dE; dL; dE_H; dE_R]; 
end
%
function dELHR = dget_ELHR_stx(t, ELHR, p, tTC, tf, isConstT, TC0, isConstF, f0)
  % Define changes in the state variables for stx model
  % t: time
  % ELHR: 4-vector with state variables
  %         E , J, reserve energy
  %         L , cm, structural length
  %         E_H , J , cumulated energy inversted into maturity (E_H in Kooijman 2010)
  %         E_R , J, reproduction buffer (E_R in Kooijman 2010)
  %         
  % dELHR: 4-vector with change in E, L, H, R

  % unpack state variables

  E = ELHR(1); L = ELHR(2); E_H = ELHR(3);

  % unpack par
  p_Am = p(1); v = p(2); p_M = p(3); k_J = p(4); 
  kap = p(5); kap_G = p(6); 
  E_G = p(7); E_Hb = p(8); E_Hx=p(9); E_Hp = p(10);

if isConstT
    TC = TC0;
else
    TC = spline1(t, tTC);
end

if size(tf,1) == 1 && size(tf,2) == 2
    if E_H < E_Hx
        f_eff = tf(1);  % birth to weaning
    else
        f_eff = tf(2);  % weaning to end
    end
elseif isConstF
    f_eff = f0;
else
    f_eff = spline1(t, tf);
end

  % temp correction
  pT_Am = TC * p_Am ;
  vT = TC * v;  
  pT_M = TC * p_M;
  kT_J = TC * k_J; 

  pA = (pT_Am * f_eff * L^2) * (E_H >= E_Hb);
  if  kap * E * vT >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
    r = (E * vT/ L - pT_M * L^3/ kap)/ (E + E_G * L^3/ kap); % d^-1, specific growth rate  
  else 
    r = (E * vT/ L - pT_M * L^3/ kap)/ (E + kap_G * E_G * L^3/ kap); % d^-1, specific growth rate                                      
  end
  pC  = E * (vT/ L - r); % J/d, mobilized energy flux
 
  % generate derivatives
  dE    = pA - pC;  % J/d, change in energy in reserve
  dL    = r * L / 3;    % cm^3/d, change in structural volume
  dE_H  = ((1 - kap) * pC - kT_J * E_H) * (E_H<E_Hp);     % J/d, change in cumulated energy invested in maturation
  dE_R  = ((1 - kap) * pC - kT_J * E_Hp) * (E_H >= E_Hp); % J/d, change in reproduction buffer

  % pack derivatives
  dELHR = [dE; dL; dE_H; dE_R]; 
end
%
function dELHR = dget_ELHR_sbp(t, ELHR, p, tTC, tf, isConstT, TC0, isConstF, f0)
  % Define changes in the state variables for sbp model
  % t: time
  % ELHR: 4-vector with state variables
  %         E , J, reserve energy
  %         L , cm, structural length
  %         E_H , J , cumulated energy inversted into maturity (E_H in Kooijman 2010)
  %         E_R , J, reproduction buffer (E_R in Kooijman 2010)
  %         
  % dELHR: 4-vector with change in E, L, H, R

  % unpack state variables

  E = ELHR(1); L = ELHR(2); E_H = ELHR(3);

  % unpack par
  p_Am = p(1); v = p(2); p_M = p(3); k_J = p(4); 
  kap = p(5); kap_G = p(6); 
  E_G = p(7); E_Hb = p(8); E_Hp = p(9);

  % Use constant values directly whenever possible.
  % Otherwise interpolate at the current integration time.
  if isConstT
      TC = TC0;
  else
      TC = spline1(t, tTC);
  end

  if isConstF
      f_t = f0;
  else
      f_t = spline1(t, tf);
  end

  % temp correction
  pT_Am = TC * p_Am ;
  vT = TC * v;  
  pT_M = TC * p_M;
  kT_J = TC * k_J; 

  pA = (pT_Am * f_t * L^2) * (E_H >= E_Hb);
  if E_H < E_Hp
    if  kap * E * vT >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
        r = (E * vT/ L - pT_M * L^3/ kap)/ (E + E_G * L^3/ kap); % d^-1, specific growth rate  
    else 
        r = (E * vT/ L - pT_M * L^3/ kap)/ (E + kap_G * E_G * L^3/ kap); % d^-1, specific growth rate                                      
    end
    pC  = E * (vT/ L - r); % J/d, mobilized energy flux
    % generate derivatives
    dE_H  = ((1 - kap) * pC - kT_J * E_H);     % J/d, change in cumulated energy invested in maturation
    dE_R  = 0; % J/d, change in reproduction buffer
  else
    % adults do not grow, and do not shrink
    r = 0; % d^-1, specific growth rate                                      
    pC  = E * vT/ L; % J/d, mobilized energy flux
    dE_H  = 0;     % J/d, change in cumulated energy invested in maturation
    dE_R  = pC - pT_M * L^3 - kT_J * E_Hp; % J/d, change in reproduction buffer
  end
  % generate derivatives
  dE    = pA - pC;  % J/d, change in energy in reserve
  dL    = r * L / 3;    % cm^3/d, change in structural volume

  % pack derivatives
  dELHR = [dE; dL; dE_H; dE_R]; 
end
%
function dELHR = dget_ELHR_abj(t, ELHR, p, tTC, tf, Lb, s_M, isConstT, TC0, isConstF, f0, isterminal)
  % Define changes in the state variables for abj model
  % t: time
  % ELHR: 4-vector with state variables
  %         E , J, reserve energy
  %         L , cm, structural length
  %         E_H , J , cumulated energy inversted into maturity (E_H in Kooijman 2010)
  %         E_R , J, reproduction buffer (E_R in Kooijman 2010)
  %         
  % dELHR: 4-vector with change in E, L, H, R

  % unpack state variables

  E = ELHR(1); L = ELHR(2); E_H = ELHR(3);

  % unpack par
  p_Am = p(1); v = p(2); p_M = p(3); k_J = p(4); 
  kap = p(5); kap_G = p(6); 
  E_G = p(7); E_Hb = p(8); E_Hj = p(9); E_Hp = p(10); 

  % Use constant values directly whenever possible.
  % Otherwise interpolate at the current integration time.
  if isConstT
      TC = TC0;
  else
      TC = spline1(t, tTC);
  end

  if isConstF
      f_t = f0;
  else
      f_t = spline1(t, tf);
  end

  % temp correction
  pT_Am = TC * p_Am ;
  vT = TC * v;  
  pT_M = TC * p_M;
  kT_J = TC * k_J; 

  % Fluxes
  if isnan(s_M)
      s_M = L/Lb;  % -, multiplication factor for v and {p_Am} 
  end
  pA = (pT_Am * s_M * f_t * L^2) * (E_H >= E_Hb);

  if  kap * E * s_M * vT >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
    r = (E * s_M * vT/ L - pT_M * L^3/ kap)/ (E + E_G * L^3/ kap); % d^-1, specific growth rate  
  else 
    r = (E * s_M * vT/ L - pT_M * L^3/ kap)/ (E + kap_G * E_G * L^3/ kap); % d^-1, specific growth rate                                      
  end
  pC  = E * (s_M * vT/ L - r); % J/d, mobilized energy flux
  % generate derivatives
  dE    = pA - pC;  % J/d, change in energy in reserve
  dL    = r * L / 3;    % cm^3/d, change in structural volume
  dE_H  = ((1 - kap) * pC - kT_J * E_H) * (E_H<E_Hp);     % J/d, change in cumulated energy invested in maturation
  dE_R  = ((1 - kap) * pC - kT_J * E_Hp) * (E_H >= E_Hp); % J/d, change in reproduction buffer

  % pack derivatives
  dELHR = [dE; dL; dE_H; dE_R]; 
end
%
function dELHR = dget_ELHR_asj(t, ELHR, p, tTC, tf, Ls, s_M, isConstT, TC0, isConstF, f0, isterminal)
  % Define changes in the state variables for asj model
  % t: time
  % ELHR: 4-vector with state variables
  %         E , J, reserve energy
  %         L , cm, structural length
  %         E_H , J , cumulated energy inversted into maturity (E_H in Kooijman 2010)
  %         E_R , J, reproduction buffer (E_R in Kooijman 2010)
  %         
  % dELHR: 4-vector with change in E, L, H, R

  % unpack state variables

  E = ELHR(1); L = ELHR(2); E_H = ELHR(3);

  % unpack par
  p_Am = p(1); v = p(2); p_M = p(3); k_J = p(4); 
  kap = p(5); kap_G = p(6); 
  E_G = p(7); E_Hb = p(8); E_Hs = p(9); E_Hj = p(10); E_Hp = p(11); 
  
  % Use constant values directly whenever possible.
  % Otherwise interpolate at the current integration time.
  if isConstT
      TC = TC0;
  else
      TC = spline1(t, tTC);
  end

  if isConstF
      f_t = f0;
  else
      f_t = spline1(t, tf);
  end

  % temp correction
  pT_Am = TC * p_Am ;
  vT = TC * v;  
  pT_M = TC * p_M;
  kT_J = TC * k_J; 

  % Fluxes
  if isnan(s_M)
      s_M = L/Ls;  % -, multiplication factor for v and {p_Am} 
  end
  pA = (pT_Am * s_M * f_t * L^2) * (E_H >= E_Hb);

  if  kap * E * s_M * vT >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
    r = (E * s_M * vT/ L - pT_M * L^3/ kap)/ (E + E_G * L^3/ kap); % d^-1, specific growth rate  
  else 
    r = (E * s_M * vT/ L - pT_M * L^3/ kap)/ (E + kap_G * E_G * L^3/ kap); % d^-1, specific growth rate                                      
  end
  pC  = E * (s_M * vT/ L - r); % J/d, mobilized energy flux
  % generate derivatives
  dE    = pA - pC;  % J/d, change in energy in reserve
  dL    = r * L / 3;    % cm^3/d, change in structural volume
  dE_H  = ((1 - kap) * pC - kT_J * E_H) * (E_H<E_Hp);     % J/d, change in cumulated energy invested in maturation
  dE_R  = ((1 - kap) * pC - kT_J * E_Hp) * (E_H >= E_Hp); % J/d, change in reproduction buffer

  % pack derivatives
  dELHR = [dE; dL; dE_H; dE_R]; 
end
%
function dELHR = dget_ELHR_abp(t, ELHR, p, tTC, tf, Lb, s_M, isConstT, TC0, isConstF, f0, isterminal)
  % Define changes in the state variables for abp model
  % t: time
  % ELHR: 4-vector with state variables
  %         E , J, reserve energy
  %         L , cm, structural length
  %         E_H , J , cumulated energy inversted into maturity (E_H in Kooijman 2010)
  %         E_R , J, reproduction buffer (E_R in Kooijman 2010)
  %         
  % dELHR: 4-vector with change in E, L, H, R

  % unpack state variables

  E = ELHR(1); L = ELHR(2); E_H = ELHR(3);

  % unpack par
  p_Am = p(1); v = p(2); p_M = p(3); k_J = p(4); 
  kap = p(5); kap_G = p(6); 
  E_G = p(7); E_Hb = p(8);  E_Hp = p(9); 

  % Use constant values directly whenever possible.
  % Otherwise interpolate at the current integration time.
  if isConstT
      TC = TC0;
  else
      TC = spline1(t, tTC);
  end

  if isConstF
      f_t = f0;
  else
      f_t = spline1(t, tf);
  end
  
  % temp correction
  pT_Am = TC * p_Am ;
  vT = TC * v;  
  pT_M = TC * p_M;
  kT_J = TC * k_J; 

  % Fluxes
  if isnan(s_M)
      s_M = L/Lb;  % -, multiplication factor for v and {p_Am} 
  end
  pA = (pT_Am * s_M * f_t * L^2) * (E_H >= E_Hb);

  if E_H < E_Hp
      if  kap * E * s_M * vT >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
          r = (E * s_M * vT/ L - pT_M * L^3/ kap)/ (E + E_G * L^3/ kap); % d^-1, specific growth rate  
      else 
          r = (E * s_M * vT/ L - pT_M * L^3/ kap)/ (E + kap_G * E_G * L^3/ kap); % d^-1, specific growth rate                                      
      end
      pC  = E * (s_M * vT/ L - r); % J/d, mobilized energy flux
      % generate derivatives
      dE_H  = ((1 - kap) * pC - kT_J * E_H);     % J/d, change in cumulated energy invested in maturation
      dE_R  = 0; % J/d, change in reproduction buffer
  else
      % adults do not grow, and do not shrink
      r = 0; % d^-1, specific growth rate                                      
      pC  = E * s_M * vT/ L; % J/d, mobilized energy flux
      dE_H  = 0;     % J/d, change in cumulated energy invested in maturation
      dE_R  = pC - pT_M * L^3 - kT_J * E_Hp; % J/d, change in reproduction buffer
  end
  dE = pA - pC;  % J/d, change in energy in reserve
  dL = r * L / 3;    % cm^3/d, change in structural volume

  % pack derivatives
  dELHR = [dE; dL; dE_H; dE_R]; 
end
% 
% power functions
%
function pAMGRD = powers(ELHR, f_s, p, L_b, L_p)
  % Gets powers assimilation, mobilisation, somatic maintenance, maturity maintenance,
  % growth, reproduction  and dissipation
  % for the std model

  % unpack state variables
  E  = ELHR(:,1); L = ELHR(:,2); E_H = ELHR(:,3);

  % unpack parameters
  p_Am = p(1);  % J/d.cm^2, surface-area-specific maximum assimilation rate
  v    = p(2);  % cm/d, energy conductance
  p_M  = p(3);  % J/d.cm^3, somatic maint 
  k_J   = p(4); % 1/d, maturity maint rate coeff
  kap  = p(5);  % -, fraction allocated to growth + som maint
  kap_R = p(6); % -, fraction of reprod flux that is fixed in embryo reserve 
  E_G  = p(7);  % J/cm^3, volume-specific costs of structure
  kap_G  = p(8);% -, growth efficiency
        
  V = L.^3;
  assim = L>L_b;
  kappa_R = kap_R * ones(length(L),1);
  kappa_R = kappa_R.*(L>L_p);

  % powers
  pA = assim .* (p_Am * f_s .* L.^2);     % assim
  pS = p_M * V;                      % somatic  maint
  if  kap * E * v  >= p_M * L.^4 % section 4.1.5 comments to Kooy2010
    r = (v * E./L - pS/ kap)./ (E + E_G * V/ kap); % d^-1, specific growth rate  
  else 
    r = (v * E./L - pS/ kap)./ (E + kap_G * E_G * V/ kap); % d^-1, specific growth rate                                      
  end
  pC  = E .* (v./ L - r);    % J/d, mobilized energy flux
  pJ = k_J * E_H;            % maturity maint
  pG = r .* V * E_G;         % growth
  pR = (1 - kap) * pC - pJ;  % maturation/reproduction
  pD = pS + pJ + (1 - kappa_R) .* pR ;  % dissipation
  pmaint = pS+pJ;

  pAMGRD = [pA, pmaint, pG, pR, pD];
end
%
function pAMGRD = powers_j(ELHR, f_s, p, L_b, L_s, L_j, L_p)
  % Gets powers assimilation, mobilisation, somatic maintenance, maturity maintenance,
  % growth, reproduction  and dissipation
  % for the abj and asj models

  % unpack state variables
  E  = ELHR(:,1); L = ELHR(:,2); E_H = ELHR(:,3);

  % unpack parameters
  p_Am = p(1);  % J/d.cm^2, surface-area-specific maximum assimilation rate
  v    = p(2);  % cm/d, energy conductance
  p_M  = p(3);  % J/d.cm^3, somatic maint 
  k_J   = p(4); % 1/d, maturity maint rate coeff
  kap  = p(5);  % -, fraction allocated to growth + som maint
  kap_R = p(6); % -, fraction of reprod flux that is fixed in embryo reserve 
  E_G  = p(7);  % J/cm^3, volume-specific costs of structure
  kap_G  = p(8);% -, growth efficiency
      
  V = L.^3;
  assim = L>L_b;
  s_M = 1* (L<L_s) + L/L_s .*(L>=L_s & L<L_j) + L_j/L_s .*(L>=L_j);
  kappa_R = kap_R * ones(length(L),1);
  kappa_R = kappa_R.*(L>L_p);

  % powers
  pA = p_Am * assim .* f_s .* s_M .* L.^2;     % assim
  pS = p_M * V;                      % somatic  maint
  pJ = k_J * E_H;                    % maturity maint
  if  kap * E .* s_M * v >= p_M * L.^4 % section 4.1.5 comments to Kooy2010
    r = (v * s_M .* E./L - pS/ kap)./ (E + E_G * V/ kap); % d^-1, specific growth rate  
  else 
    r = (v * s_M .* E./L - pS/ kap)./ (E + kap_G * E_G * V/ kap); % d^-1, specific growth rate                                      
  end
  pC  = E .* (v* s_M./ L - r);  % J/d, mobilized energy flux
  pG = r .* V * E_G;            % growth
  pR = (1 - kap) * pC - pJ;     % maturation/reproduction
  pD = pS + pJ + (1 - kappa_R) .* pR ;  % dissipation
  pmaint = pS+pJ;

  pAMGRD = [pA, pmaint, pG, pR, pD];
end
%
% event functions
function [value,isterminal,direction] = stage_events_std(t, ELHR, p, tTC, tf, isConstT, TC0, isConstF, f0 )
 E_Hb = p(8); E_Hp = p(9); 
 value = [E_Hb, E_Hp] - [ELHR(3), ELHR(3)];
 isterminal = [0, 0];
 direction = 0;
end
%
function [value,isterminal,direction] = stage_events_stx(t, ELHR, p, tTC, tf, isConstT, TC0, isConstF, f0)
 E_Hb = p(8); E_Hx = p(9); E_Hp = p(10);
 value = [E_Hb, E_Hx, E_Hp] - [ELHR(3), ELHR(3), ELHR(3)];
 isterminal = [0, 0, 0];
 direction = 0;
end
%
function [value,isterminal,direction] = stage_events_abj(t, ELHR, p, tTC, tf, Lb, s_M, isConstT, TC0, isConstF, f0, isterminal)
 E_Hb = p(8); E_Hj = p(9); E_Hp = p(10);
 value = [E_Hb, E_Hj, E_Hp] - [ELHR(3), ELHR(3), ELHR(3)];
 direction = 0;
end
%
function [value,isterminal,direction] = stage_events_asj(t, ELHR, p, tTC, tf, Ls, s_M, isConstT, TC0, isConstF, f0, isterminal)
 E_Hb = p(8); E_Hs = p(9); E_Hj = p(10); E_Hp = p(11);
 value = [E_Hb, E_Hs, E_Hj, E_Hp] - [ELHR(3), ELHR(3), ELHR(3), ELHR(3)];
 direction = 0;
end
function [value,isterminal,direction] = stage_events_abp(t, ELHR, p, tTC, tf, Lb, s_M, isConstT, TC0, isConstF, f0, isterminal)
 E_Hb = p(8); E_Hp = p(9);
 value = [E_Hb, E_Hp] - [ELHR(3), ELHR(3)];
 direction = 0;
end