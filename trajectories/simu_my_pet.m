%% simu_my_pet
% Simulates individual dynamics using species parameters and environmental data
%%
function simu_my_pet(species, tT, tf)
 % created 2023/06/01 by Dina Lika
  %% Syntax
  % tELHR = <../simu_my_pet.m *simu_my_pet*>(species, tT, tX)
    
  %% Description
  % Obtains predictions for state trajectories and some traits for start of development till death by aging, 
  % in a possibly dynamic environment, using parameters from the AmP collection.
  % These parameter can be overwritten.
  % It is a shell around get_indDyn_mod to plot the trajectories.
  %
  % Input
  %
  % * species: character-string with name of entry or cell-string with structures: {metaData, metaPar, par}
  % * tT: optional (nT,2)-array with time and temperature in Kelvin (default: T=T_typical)
  %     If scalar, the temperature is assumed to be constant
  % * tf: optional (nX,2)-array with time and functional response
  %     If scalar, the food density is assumed to be constant (default f=1) 
  %
%% Example of use
% * If results_My_Pet.mat exists in current directory (where "My_Pet" is replaced by the name of some species, but don't replace "my_pet"):
%   for example if My_Pet is Torpedo_marmorata then
%   load('results_My_Pet.mat'); simu_my_pet({metaData, metaPar, par}, tT, tf)
% * simu_my_pet('Torpedo_marmorata');
% * simu_my_pet('Torpedo_marmorata', C2K(18)); 
% * simu_my_pet('Oryzias_latipes', [0 C2K(21); 2*365 C2K(21)] ,0.8)
% * simu_my_pet('Megalobulimus_mogianensis', C2K(21),0.8)
% * simu_my_pet('Megalobulimus_mogianensis', [0 C2K(21); 10*365 C2K(21)] ,0.8)

% get core parameters (2 possible routes for getting pars), species and model
if iscell(species) 
  metaData = species{1}; metaPar = species{2}; par = species{3}; %txtPar = species{4}; 
  species = metaData.species;
  datePrintNm = ['date: ',datestr(date, 'yyyy/mm/dd')];
else  % use allStat.mat as parameter source 
  [par, metaPar, txtPar, metaData, info] = allStat2par(species); 
  if info == 0
    ELHR=[]; power=[]; return
  end
  datePrintNm = ['allStat version: ', datestr(date_allStat, 'yyyy/mm/dd')];
end

model = metaPar.model;
switch model
    case {'stf', 'stx', 'hep', 'hex', 'hax'}
    fprintf('Warning from get_inDyn_mod: %s model is not coded yet; work in progress\n', model);
    return
end

% temperature
if ~exist('tT','var') || isempty(tT) 
  tT = [0 metaData.T_typical];
elseif size(tT,2) == 1
  tT = [0 tT(1)];
end

% supply food 
if ~exist('tf','var') || isempty(tf)
  tf = [0 1];  
elseif size(tf,2) == 1
  tf = [0 tf(1)];
end

if size(tT,1) == 1 && size(tf,1) > 1 
    tT = [0 tT(1,2); tf(end,1) tT(1,2)];
elseif size(tT,1) > 1 && size(tf,1) == 1 
    tf = [0 tf(1,2); tT(end,1) tf(1,2)];
elseif size(tT,1) > 1 && size(tf,1) > 1  
    tSim = min(tT(end,1), tf(end,1));
    tT = tT(tT(:,1)<tSim,:); tT = [tT; tSim, tT(end,2)];
    tf = tf(tf(:,1)<tSim,:); tf = [tf; tSim, tf(end,2)];
end

[tELHR, tWNXO, tpAMGRD, aLW, aLWc]  = get_indDyn_mod(model, par, tT, tf);
n_col = size(tpAMGRD,2);

%% plotting

close all
%
if size(tT,1) == 1 
    tT =[tELHR(:,1), ones(length(tELHR(:,1)),1)*tT(:,2)];
end
if size(tf,1) == 1 
    tf =[tELHR(:,1), ones(length(tELHR(:,1)),1)*tf(:,2)];
end

figure(1) % environment
subplot(2,1,1), hold on
plot(tT(:,1), K2C(tT(:,2)), 'k', 'Linewidth', 2)
plot([tT(1,1), tT(end,1)], [K2C(mean(tT(:,2))), K2C(mean(tT(:,2)))], 'r:', 'Linewidth', 2)
xlabel('time, d'), ylabel('temperature, C')
set(gca, 'FontSize', 15, 'Box', 'on')
subplot(2,1,2), hold on
plot(tf(:,1), tf(:,2), 'k', 'Linewidth', 2)
plot([tf(1,1), tf(end,1)], [mean(tf(:,2)), mean(tf(:,2))], 'r:', 'Linewidth', 2)
xlabel('time, d'), ylabel('functional response, -')
set(gca, 'FontSize', 15, 'Box', 'on')

figure(2) % t-ELHR
subplot(2,2,1), hold on
plot(tELHR(:,1), tELHR(:,2), 'k', 'Linewidth', 2)
xlabel('age, d'), ylabel('reserve energy, J')
set(gca, 'FontSize', 15, 'Box', 'on')
subplot(2,2,2), hold on
plot(tELHR(:,1), tELHR(:,3), 'k', 'Linewidth', 2)
xlabel('age, d'), ylabel('structural length, cm')
set(gca, 'FontSize', 15, 'Box', 'on')
subplot(2,2,3), hold on
plot(tELHR(:,1), tELHR(:,4), 'k', 'Linewidth', 2)
xlabel('age, d'), ylabel('cum. energy to maturation, J')
set(gca, 'FontSize', 15, 'Box', 'on')
subplot(2,2,4), hold on
plot(tELHR(:,1), tELHR(:,5), 'k', 'Linewidth', 2)
xlabel('age, d'), ylabel('cum. energy to reprod, J')
set(gca, 'FontSize', 15, 'Box', 'on')
%
figure(3) % t-LWNJX
subplot(2,2,1), hold on
plot(tWNXO(:,1), tWNXO(:,2), 'k', 'Linewidth', 2)
xlabel('age, d'), ylabel('wet weight, g')
set(gca, 'FontSize', 15, 'Box', 'on')
subplot(2,2,2), hold on
plot(tWNXO(:,1), tWNXO(:,3), 'k', 'Linewidth', 2)
xlabel('age, d'), ylabel('cum. number of eggs, #')
set(gca, 'FontSize', 15, 'Box', 'on')
subplot(2,2,3), hold on
plot(tWNXO(:,1), tWNXO(:,4), 'k', 'Linewidth', 2)
xlabel('age, d'), ylabel('feeding rate, g/d')
set(gca, 'FontSize', 15, 'Box', 'on')
subplot(2,2,4), hold on
plot(tWNXO(:,1), tWNXO(:,5), 'k', 'Linewidth', 2)
xlabel('age, d'), ylabel('O_2 consumption, g/d')
set(gca, 'FontSize', 15, 'Box', 'on')

figure(4) % t-powers
clr = {'b-', 'k-', 'r-', 'r:', 'k:'};
hold on
for i = 2:n_col
    plot(tpAMGRD(:,1), tpAMGRD(:,i), clr{i-1}, 'Linewidth', 2)
end
legend('assim', 'maint', 'growth', 'matur/reprod', 'dissip', 'Location', 'best')
xlabel('age, d'), ylabel('powers, J/d')
set(gca, 'FontSize', 15, 'Box', 'on')
%
switch model
    case {'std', 'sbp'}
        prt_tab({{'age at birth; a_b (d)'; 'age at puberty; a_p (d)'; 'life span; a_m (d)'; ...
        'struc length at birth; L_b (cm)'; 'struc length at puberty; L_p (cm)'; 'ultimate length; L_i (cm)';  ...
        'wet weight at birth; Ww_b (g)'; 'wet weight at puberty; Ww_p (g)'; 'ultimate wet weigh; Ww_i (g)'}, aLW, aLWc}, ...
        {'description; symbol (units)', 'values at T&f (event function)', 'values at mean T&f (DEBtool functions)'});
    case 'abj'
        prt_tab({{'age at birth; a_b (d)'; 'age at metamorphosis; a_j (d)'; 'age at puberty; a_p (d)'; 'life span; a_m (d)'; ...
        'struc length at birth; L_b (cm)'; 'struc length at metamorphosis; L_j (cm)';  ...
        'struc length at puberty; L_p (cm)'; 'ultimate length; L_i (cm)';  ...
        'wet weight at birth; Ww_b (g)'; ...
        'wet weight at metamorphosis; Ww_j (g)'; 'wet weight at puberty; Ww_p (g)'; 'ultimate wet weigh; Ww_i (g)'}, aLW, aLWc}, ...
        {'description; symbol (units)', 'values at T&f (event function)', 'values at mean T&f (DEBtool functions)'});
    case 'asj'
        prt_tab({{'age at birth; a_b (d)'; 'age at start of acceleration; a_s (d)'; 'age at metamorphosis; a_j (d)'; 'age at puberty; a_p (d)'; 'life span; a_m (d)'; ...
        'struc length at birth; L_b (cm)'; 'struc length at start of acceleration; L_s (cm)'; 'struc length at metamorphosis; L_j (cm)';  ...
        'struc length at puberty; L_p (cm)'; 'ultimate length; L_i (cm)';  ...
        'wet weight at birth; Ww_b (g)'; 'wet weight at start of acceleration; Ww_s (g)';...
        'wet weight at metamorphosis; Ww_j (g)'; 'wet weight at puberty; Ww_p (g)'; 'ultimate wet weigh; Ww_i (g)'}, aLW, aLWc}, ...
        {'description; symbol (units)', 'values at T&f (event function)', 'values at mean T&f (DEBtool functions)'});
    case 'abp'
        prt_tab({{'age at birth; a_b (d)'; 'age at puberty; a_p (d)'; 'life span; a_m (d)'; ...
        'struc length at birth; L_b (cm)'; 'struc length at puberty; L_p (cm)'; 'ultimate length; L_i (cm)';  ...
        'wet weight at birth; Ww_b (g)'; 'wet weight at puberty; Ww_p (g)'; 'ultimate wet weigh; Ww_i (g)'}, aLW, aLWc}, ...
        {'description; symbol (units)', 'values at T&f (event function)', 'values at mean T&f (DEBtool functions)'});
end