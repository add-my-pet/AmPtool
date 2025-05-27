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
  % The code does not include spawning events, weights do not include
  % reproduction buffer.
  % Starvation allows shrinking in structural mass. For other type of
  % starvation rules the code should be modified.
  %
  % Input
  %
  % * species: string (name of entry) or cell array {metaData, metaPar, par}
  % * tT: optional (nT,2) array of [time, temperature in Kelvin] (default: T=T_typical)
  %     If scalar, the temperature is assumed to be constant
  % * tf: optional (nX,2) array of [time, functional response]
  %     If scalar, the food density is assumed to be constant (default f=1) 
  %
%% Example of use
% * simu_my_pet('Torpedo_marmorata');
% * simu_my_pet('Torpedo_marmorata', C2K(18)); 
% * simu_my_pet('Oryzias_latipes', [0 C2K(21); 2*365 C2K(21)] ,0.8)
% * simu_my_pet('Megalobulimus_mogianensis', C2K(21),0.8)
% * simu_my_pet('Megalobulimus_mogianensis', [0 C2K(21); 10*365 C2K(21)] ,0.8)
% * If results_My_Pet.mat exists in current directory (where "My_Pet" is replaced by the name of some species):
%   for example if My_Pet is Torpedo_marmorata then
%   load('results_Torpedo_marmorata.mat'); simu_my_pet({metaData, metaPar, par}, tT, tf)

% Get core parameters (2 possible routes for getting pars), species and model
species
if iscell(species)
    metaData = species{1}; metaPar = species{2}; par = species{3}; 
    species = metaData.species;  
%     datePrintNm = ['date: ',datestr(date, 'yyyy/mm/dd')];
else  % use allStat.mat as parameter source 
    [par, metaPar, ~, metaData, info] = allStat2par(species); 
    if info == 0
        warning('Parameter extraction failed for species: %s', species);
        ELHR=[]; power=[]; 
        return
    end
%     datePrintNm = ['allStat version: ', datestr(date_allStat, 'yyyy/mm/dd')];
end

model = metaPar.model;
unsupportedModels = {'stf','stx', 'ssj', 'hep', 'hex', 'hax'};
if ismember(model, unsupportedModels)
    warning('Model "%s" not yet supported in get_indDyn_mod.', model);
    return
end

% --- Set temperature (tT) ---
if ~exist('tT','var') || isempty(tT) 
    tT = [0 metaData.T_typical];
elseif size(tT,2) == 1
    tT = [0 tT(1)];
end

% --- Set food availability (tf) ---
if ~exist('tf','var')  || isempty(tf)
    tf = [0 1];  
elseif size(tf,2) == 1
    tf = [0 tf(1)];
end

% --- Ensure tT and tf have compatible time frames ---
if size(tT,1) == 1 && size(tf,1) > 1 
    tT = [0 tT(1,2); tf(end,1) tT(1,2)];
elseif size(tT,1) > 1 && size(tf,1) == 1 
    tf = [0 tf(1,2); tT(end,1) tf(1,2)];
elseif size(tT,1) > 1 && size(tf,1) > 1  
    tSim = min(tT(end,1), tf(end,1));
    tT = tT(tT(:,1)<tSim,:); tT = [tT; tSim, tT(end,2)];
    tf = tf(tf(:,1)<tSim,:); tf = [tf; tSim, tf(end,2)];
end

% --- Run simulation ---
[tELHR, tWNXO, tpAMGRD, aLW, aLWc]  = get_indDyn_mod(model, par, tT, tf);
n_col = size(tpAMGRD,2);

%% plotting

close all
%
% --- Expand tT and tf for plotting ---
if size(tT,1) == 1, tT = [tELHR(:,1), repmat(tT(1,2), size(tELHR,1), 1)]; end
if size(tf,1) == 1, tf = [tELHR(:,1), repmat(tf(1,2), size(tELHR,1), 1)]; end

% --- Plot environment ---
figure(1) 
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

% --- Plot  trajectories ---
plotSubplots(tELHR, {'reserve energy, J', 'structural length, cm', 'cum. maturation energy, J', 'cum. reproduction energy, J'}, 2);
plotSubplots(tWNXO, {'wet weight, g', 'cum. # eggs', 'feeding rate, g/d', 'O_2 consumption, g/d'}, 3);

% --- Plot powers ---
figure(4); clf; hold on;
colors = {'b-', 'k-', 'r-', 'r:', 'k:'};
for i = 2:n_col
    plot(tpAMGRD(:,1), tpAMGRD(:,i), colors{i-1}, 'LineWidth', 2);
end
legend({'assim', 'maint', 'growth', 'matur/reprod', 'dissip'}, 'Location', 'best');
xlabel('age, d'); ylabel('powers, J/d');
set(gca, 'FontSize', 15, 'Box', 'on');

% --- Print summary table ---
printSummaryTable(model, aLW, aLWc);

end

%% Plot 2x2 subplot
function plotSubplots(data, labels, figNum)
figure(figNum); clf;
for i = 1:4
    subplot(2,2,i); hold on;
    plot(data(:,1), data(:,i+1), 'k', 'LineWidth', 2);
    xlabel('age, d'); ylabel(labels{i});
    set(gca, 'FontSize', 15, 'Box', 'on');
end
end

%% Print trait summary
function printSummaryTable(model, aLW, aLWc)
switch model
    case {'std', 'stf','sbp'}
        desc = {'age at birth; a_b (d)', 'age at puberty; a_p (d)', 'life span; a_m (d)', ...
                'struc length at birth; L_b (cm)', 'struc length at puberty; L_p (cm)', 'ultimate length; L_i (cm)', ...
                'wet weight at birth; Ww_b (g)', 'wet weight at puberty; Ww_p (g)', 'ultimate wet weight; Ww_i (g)'};        
    case 'abj'
        desc = {'age at birth; a_b (d)', 'age at metamorphosis; a_j (d)', ...
                'age at puberty; a_p (d)', 'life span; a_m (d)', ...
                'struc length at birth; L_b (cm)',  'struc length at metamorphosis; L_j (cm)', ...
                'struc length at puberty; L_p (cm)',  'ultimate length; L_i (cm)', ...
                'wet weight at birth; Ww_b (g)', 'wet weight at metamorphosis; Ww_j (g)', ...
                'wet weight at puberty; Ww_p (g)',  'ultimate wet weight; Ww_i (g)'};
    case 'asj'
        desc = {'age at birth; a_b (d)', 'age at start of acceleration; a_s (d)', 'age at metamorphosis; a_j (d)', ...
                'age at puberty; a_p (d)', 'life span; a_m (d)', ...
                'struc length at birth; L_b (cm)', 'struc length at start of acceleration; L_s (cm)', ...
                'struc length at metamorphosis; L_j (cm)', 'struc length at puberty; L_p (cm)', ...
                'ultimate length; L_i (cm)', ...
                'wet weight at birth; Ww_b (g)', 'wet weight at start of acceleration; Ww_s (g)', ...
                'wet weight at metamorphosis; Ww_j (g)', 'wet weight at puberty; Ww_p (g)', ...
                'ultimate wet weight; Ww_i (g)'};
    case 'abp'
        desc = {'age at birth; a_b (d)', 'age at puberty; a_p (d)', 'life span; a_m (d)', ...
                'struc length at birth; L_b (cm)', 'struc length at puberty; L_p (cm)', 'ultimate length; L_i (cm)', ...
                'wet weight at birth; Ww_b (g)', 'wet weight at puberty; Ww_p (g)', 'ultimate wet weight; Ww_i (g)'};
    otherwise
        warning('No summary table defined for model: %s', model);
        return;
end

prt_tab({desc', aLW, aLWc}, {'description; symbol (units)', ...
         'values at T&f (event function)', 'values at mean T&f (DEBtool functions)'});
end