%% prt_pars
% generates survivor plots for primary parameters for display on pars.html

%%
function prt_pars
% created 2016/04/25 by Bas Kooijman; modified 2016/12/24, 2017/10/31

%% Syntax
% <../prt_pars *prt_pars*>

%% Description
% generates survivor plots for primary parameters for display on pars.html

%
% Output: 
%
% * 15 png-files written in ../img/pars: 
%
%    - Fm.png kapX.png pAm.png, v.png, kap.png, pM.png, EG.png, kJ.png, kapR.png, EHb.png, EHp.png, ha.png, sG.png, TA.png, z.png

%% Remarks
% For presentation on the web, copy png files to 
% /home/websites/www.bio.vu.nl/webroot/thb/deb/deblab/add_my_pet/img/pars

path = '../../deblab/add_my_pet/img/pars/';

close all
shstat_options('y_label', 'on');

figure(1) % {F_m}, max spec searching rate
shstat_options('x_transform', 'log10');
shstat({'F_m'}, [], '\{F_m\} at T_{ref}', 1);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('_{10}log \{F_m\}, dm^3/d.cm^2') % overwrite for better DEB notation
saveas(gca, [path, 'Fm.png'])

figure(2) % kappa_X, digestion efficiency
shstat_options('x_transform', 'none');
shstat({'kap_X'}, [], [], 2);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('\kappa_X, -') % overwrite for better DEB notation
saveas(gca, [path, 'kapX.png'])

figure(3) % {p_Am}, scaled specific assimilation
shstat_options('x_transform', 'log10');
pAmsM = read_allStat('p_Am', 's_M'); pAm = pAmsM(:,1); pAmj = prod(pAmsM, 2);
Hfig = shstat(pAmj, {'r', 'r'}, '\{p_{Am}\} at T_{ref}, before and after acceleration', 3);
shstat(pAm,  {'b', 'b'}, [], Hfig);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('_{10}log \{p_{Am}\}, J/d.cm^2') 
saveas(gca, [path, 'pAm.png'])

figure(4) % v, energy conductance
shstat_options('x_transform', 'log10');
vsM = read_allStat('v', 's_M'); v = vsM(:,1); vj = prod(vsM,2);
Hfig = shstat(vj, {'r', 'r'}, 'v at T_{ref}, before and after acceleration', 4);
shstat(v,  {'b', 'b'}, [], Hfig);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('_{10} log v, cm/d') % overwrite for better DEB notation
saveas(gca, [path, 'v.png'])

figure(5) % kappa, allocation fraction to soma
shstat_options('x_transform', 'none');
shstat({'kap'}, [], [], 5);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('\kappa, -') % overwrite for better DEB notation
saveas(gca, [path, 'kap.png'])

figure(6) % [p_M], specific somatic maintenance
shstat_options('x_transform', 'log10');
shstat({'p_M'}, [], '[p_M] at T_{ref}', 6);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('_{10}log [p_M], J/d') % overwrite for better DEB notation
saveas(gca, [path, 'pM.png'])

figure(7) % [E_G] d_V, cost for structure
%shstat_options('x_transform', 'none');
shstat_options('x_transform', 'log10');
EGdV = read_allStat('E_G','d_V'); 
shstat(EGdV(:,1) ./ EGdV(:,2), [], [], 7);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('_{10}log [E_G]/ d_V, J/g') 
saveas(gca, [path, 'EG.png'])

figure(8) % k_J, maturity maintenance rate coefficient
shstat_options('x_transform', 'none');
shstat({'k_J'}, [], 'k_J at T_{ref}', 8);
set(gca, 'FontSize', 15, 'Box', 'on')
saveas(gca, [path, 'kJ.png'])

figure(9) % kappa_R, reproduction efficiency
shstat_options('x_transform', 'none');
shstat({'kap_R'}, [], [], 9);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('\kappa_R, -') % overwrite for better DEB notation
saveas(gca, [path, 'kapR.png'])

figure(10) % E_Hb, maturity at birth
shstat_options('x_transform', 'log10');
shstat({'E_Hb'}, [], [], 10);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('_{10}log E_H^b, J')
saveas(gca, [path, 'EHb.png'])

figure(11) % E_Hp, maturity at puberty
shstat_options('x_transform', 'log10');
EHpz = read_allStat('E_Hp','z'); 
shstat({'E_Hp'}, [], [], 11);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('_{10}log E_H^p, J')
saveas(gca, [path, 'EHp.png'])

figure(12) % h_a, ageing acceleration
shstat_options('x_transform', 'log10');
shstat({'h_a'}, [], 'h_a at T_{ref}', 12);
set(gca, 'FontSize', 15, 'Box', 'on')
saveas(gca, [path, 'ha.png'])

figure(13) % s_G, Gompertz stress coefficient
shstat_options('x_transform', 'none');
shstat({'s_G'}, [], [], 13);
set(gca, 'FontSize', 15, 'Box', 'on')
saveas(gca, [path, 'sG.png'])

figure(14) % T_A, Arrhenius temperature
shstat_options('x_transform', 'log10');
shstat({'T_A'}, [], [], 14);
set(gca, 'FontSize', 15, 'Box', 'on')
saveas(gca, [path, 'TA.png'])

figure(15) % z, zoom factor
shstat_options('x_transform', 'log10');
zsM = read_allStat('z', 's_M'); z = zsM(:,1); zj = prod(zsM,2);
Hfig = shstat(zj, {'r', 'r'}, 'z before and after acceleration', 15);
shstat(z,  {'b', 'b'}, [], Hfig);
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('_{10}log z, -')
saveas(gca, [path, 'z.png'])

close all
