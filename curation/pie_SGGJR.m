%% pie_SGGJR
% presents pies for allocation at birth, puberty, ultimate & cumulative investment at birth

%%
function  pSGGJR = pie_SGGJR (species, model, par, stat, destinationFolder)
% created 2016/05/02 by Bas Kooijman, modified 2017/01/04; 2017/10/14; 2018/08/23

%% Syntax
% pSGGJR = <../pie_SGGJR.m *pie_SGGJR*> (species, model, par, stat, destinationFolder)

%% Description
% Allocation to somatic maintenance, growth, maturity maintenance and maturation/reproduction 
%   for birth, puberty and ultimate and cumulative investment at birth are presented in 4 pies.
% Dissipating fluxes explode in the pies; growth is partitioned into growth excluding overheads and growth overheads.
% Color coding: som maint: red, mat maint: magenta, growth: green, maturation/reproduction: blue.
% Writes 4 png-files to destinationFolder if it is not empty
%
% Input
%
% * species: string with name of entry
% * model: string with name of typified model
% * par: structure with parameters
% * stat: structure with result of statistics_st
% * destinationFolder: optional string with destination folder the files are printed to (default: no writing)
%
% Output (apart from figure):
% 
% * pSGGRJ: (5,3)-matrix with powers in J/d
%
%     - S: p_M + p_T: somatic maintenance
%     - G: p_G: growth, excluding overhead
%     - G: p_G: growth overhead
%     - J: p_J: maturity maintenance
%     - R: p_R: maturation or reproduction

%% Remarks
% Function is called by entries_admin/prt_my_pet

%% Example of use
% load results_my_pet.mat; 
% stat = statistics_st(metaPar.model, par, metaData.T_typical, par.f);
% pie_SGGJR(metaData.species, metaPar.model, par, stat, 0); 

  
  kap_G = stat.kap_G; E_0 = stat.E_0; T_txt = [num2str(stat.T, '% 3.1f'), ' ^oC']; 
  pSGGJR = [stat.p_Sb stat.p_Sp stat.p_Si;
           kap_G * [stat.p_Gb stat.p_Gp stat.p_Gi]; 
           (1 - kap_G) * [stat.p_Gb stat.p_Gp stat.p_Gi]; 
           stat.p_Jb stat.p_Jp stat.p_Ji; 
           stat.p_Rb stat.p_Rp stat.p_Ri];
  pSGGJR = max(1e-16, pSGGJR); % sometimes growth is negative (but very small)
  pC = sum(pSGGJR,1); % mobilisation flux
  pA = [stat.p_Ab; stat.p_Ap; stat.p_Ai]; % assimilation flux
  
  pie_color = [1 0 0; 0 1 0; 0 1 0; 1 0 1; 0 0 1]; % colors for S, G, J. R
  
  Hfig1 = figure(1); % allocation at birth
  p = pSGGJR(:,1)/pC(1); % divide p_* by sum, else errors occur (probably due to small numbers)
  txt = {...
    ['p_S ', num2str(p(1), '% 3.2f')], ['p_G ', num2str(p(2), '% 3.2f')], ['p_G ', num2str(p(3), '% 3.2f')], ...
    ['p_J ', num2str(p(4), '% 3.2f')], ['p_R ', num2str(p(5), '% 3.2f')]};
  set(gca, 'FontSize', 15, 'Box', 'on')
  %pie3s(p(:,1), 'Bevel', 'Elliptical', 'Labels', txt, 'Explode', [1 0 1 1 1]);
  pie(p(:,1), [1 0 1 1 1], txt);
  colormap(pie_color);
  title({['Birth at ', T_txt, ', f = 1'], ...
      ['p_A = ', num2str(pA(1), '% 1.3e'), ' J/d, p_C = ', num2str(pC(1), '% 1.3e'), ' J/d'], ...
      ['E_W = ', num2str(stat.E_Wb, '% 1.2e'), ' J, W_w = ', num2str(stat.Ww_b, '% 1.2e'), ' g'], ' ', ' '});
  
  if exist('destinationFolder','var')
    Hfig1 = tightfig(Hfig1);
    saveas(Hfig1, [destinationFolder, species, '_pie_pSGJRb.png']);
  end
  set(Hfig1, 'Outerposition', [50 500 600 600]);

  Hfig2 = figure(2); % allocation at puberty
  p= pSGGJR(:,2)/pC(2); % divide p_* by sum, else errors occur (probably due to small numbers)
  txt = {...
    ['p_S ', num2str(p(1), '% 3.2f')], ['p_G ', num2str(p(2), '% 3.2f')], ['p_G ', num2str(p(3), '% 3.2f')], ...
    ['p_J ', num2str(p(4), '% 3.2f')], ['p_R ', num2str(p(5), '% 3.2f')]};
  set(gca, 'FontSize', 15, 'Box', 'on')
  %pie3s(p(:,1), 'Bevel', 'Elliptical', 'Labels', txt, 'Explode', [1 0 1 1 1]);
  pie(p(:,1), [1 0 1 1 1], txt);
  colormap(pie_color);
  title({['Puberty at ', T_txt, ', f = 1'], ...
      ['p_A = ', num2str(pA(2), '% 1.3e'), ' J/d,  p_C = ', num2str(pC(2), '% 1.3e'), ' J/d'], ...
      ['E_W = ', num2str(stat.E_Wp, '% 1.2e'), ' J, W_w = ', num2str(stat.Ww_p, '% 1.2e'), ' g'], ' ', ' '});
  
  if exist('destinationFolder','var')
    Hfig2 = tightfig(Hfig2);
    saveas(Hfig2, [destinationFolder, species, '_pie_pSGJRp.png']);
  end
  set(Hfig2, 'Outerposition', [650 500 600 600]);
 
  Hfig3 = figure(3); % allocation at ultimate
  p=pSGGJR(:,3)/pC(3);
  txt = {...
    ['p_S ', num2str(p(1), '% 3.2f')], ['p_G ', num2str(p(2), '% 3.2f')], ['p_G ', num2str(p(3), '% 3.2f')], ...
    ['p_J ', num2str(p(4), '% 3.2f')], ['p_R ', num2str(p(5), '% 3.2f')]};
  txt{2} = '';
  set(gca, 'FontSize', 15, 'Box', 'on')
  %pie3s(p, 'Bevel', 'Elliptical', 'Labels', txt, 'Explode', [1 0 1 1 0]);
  pie(p, [1 0 1 1 0], txt);
  colormap(pie_color);
  if strcmp(model,'hex')
    title({['Pupation at ', T_txt], ...
        ['p_A = ', num2str(pA(3), '% 1.3e'), ' J/d, p_C = ', num2str(pC(3), '% 1.3e'), ' J/d'], ...
        ['E_W = ', num2str(stat.E_Wj, '% 1.2e'), ' J, W_w = ', num2str(stat.Ww_j, '% 1.2e'), ' g'],  ' ', ' '});
  elseif strcmp(model,'hep')
    title({['Metam at ', T_txt], ...
        ['p_A = ', num2str(pA(3), '% 1.3e'), ' J/d, p_C = ', num2str(pC(3), '% 1.3e'), ' J/d'], ...
        ['E_W = ', num2str(stat.E_Wj, '% 1.2e'), ' J, W_w = ', num2str(stat.Ww_j, '% 1.2e'), ' g'], ' ', ' '});
  else
    title({['Ultimate at ', T_txt, ', f = 1'], ...
        ['p_A = ', num2str(pA(3), '% 1.3e'), ' J/d, p_C = ', num2str(pC(3), '% 1.3e'), ' J/d'], ...
        ['E_W = ', num2str(stat.E_Wi, '% 1.2e'), ' J, W_w = ', num2str(stat.Ww_i, '% 1.2e'), ' g'], ' ', ' '});
  end
  
  if exist('destinationFolder','var')
    Hfig3 = tightfig(Hfig3);
    saveas(Hfig3, [destinationFolder, species, '_pie_pSGJRi.png'])
  end
  set(Hfig3, 'Outerposition', [650 20 600 600]);
    
  Hfig4 = figure(4); % cumulative investment at birth
  par_pie = [stat.g, stat.k, stat.v_Hb, par.kap, stat.kap_G];
  if strcmp(model, 'stf') || strcmp(model, 'stx')
    EMJHG = get_EMJHG_foetus(par_pie, 1);
    pie_txt = { ...
      ['reserve ', num2str(EMJHG(1), '% 3.2f')], ['som maint ', num2str(EMJHG(2), '% 3.2f')], ['mat maint ', num2str(EMJHG(3), '% 3.2f')], ...
      ['maturity ',  num2str(EMJHG(4), '% 3.2f')], ['growth overhead ', num2str(EMJHG(5), '% 3.2f')], ['structure ', num2str(EMJHG(6), '% 3.2f')]};
    pie_color = [1 1 .8; 1 0 0; 1 0 1; 0 0 1; 0 1 0; .8 1 .8];
    colormap(pie_color);
    set(gca, 'FontSize', 15, 'Box', 'on')
    %pie3s(EMJHG, 'Explode', [0 1 1 1 1 0], 'Labels', pie_txt, 'Bevel', 'Elliptical');
    pie(EMJHG, [0 1 1 1 1 0], pie_txt);
    title({'cum. investment in foetus, e_b = 1', ...
        ['E_0 = ', num2str(E_0,'% 1.2e'), ' J'], ' ', ' '})
  else
    EMJHG = get_EMJHG(par_pie, 1);
    pie_txt = { ...
        ['reserve ', num2str(EMJHG(1), '% 3.2f')], ['som maint ', num2str(EMJHG(2), '% 3.2f')], ['mat maint ', num2str(EMJHG(3), '% 3.2f')], ...
        ['maturity ', num2str(EMJHG(4), '% 3.2f')],['growth overhead ', num2str(EMJHG(5), '% 3.2f')], ['structure ', num2str(EMJHG(6), '% 3.2f')]};
    pie_color = [1 1 .8; 1 0 0; 1 0 1; 0 0 1; 0 1 0; .8 1 .8];
    colormap(pie_color);
    set(gca, 'FontSize', 15, 'Box', 'on')
    %pie3s(EMJHG, 'Explode', [0 1 1 1 1 0], 'Labels', pie_txt, 'Bevel', 'Elliptical');
    pie(EMJHG, [0 1 1 1 1 0],  pie_txt);
    title({'Cum. investment at birth, e_b = 1', ...
        ['E_0 = ', num2str(E_0,'% 1.2e'), ' J'], ' ', ' '})      
  end
  
  if exist('destinationFolder','var')
    Hfig4 = tightfig(Hfig4);
    saveas(Hfig4, [destinationFolder, species, '_pie_SGJRb.png'])
  end
  set(Hfig4, 'Outerposition', [50 20 600 600]);

end
