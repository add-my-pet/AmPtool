%% COMPLETE_data
% fills a table with COMPLETE values and data combinations

%%
function CD = COMPLETE_data
% created 2018/01/19 by Bas Kooijman

%% Syntax
% CD = <../COMPLETE_data.m *COMPLETE_data*>

%% Description
% Sets a (n,2) cell array with COMPLETE values and data; COMPLETE criteria:
%
% * 0 maximum length and body weight; length as function of weight
% * 1 age, length and weight at birth and puberty for one food level
% * 2 growth (curve) at one food level: length and weight as function of age at constant (or abundant) food level
% * 3 reproduction and feeding as function of age, length and/or weight at one food level
% * 4 growth (curve) at several (> 1) food levels; age, length and weight at birth and puberty at several food levels
% * 5 reproduction and feeding as function of age, length and/or weight at several (> 1) food levels
% * 6 respiration as function of length or weight and life span at several (> 1) food levels
% * 7 elemental composition at one food level, survival due to ageing as function of age
% * 8 elemental composition at several (> 1) food levels, including composition of food
% * 9 elemental balances for C, H, O and N at several body sizes and several food levels
% * 10 energy balance at several body sizes and several food levels (including heat)
%
%
% Output:
% 
% * CD: (n,2)-cell array with complet values and data combinations

%% Remarks
% * Before adding a data-combination, make sure that it not already exists, by running this function with NaN as result.
% * Before changing either a combination or a COMPLETE setting, first find out which entries are affected, 
%   by running <../../html/select_data.html *select_data*>, with a copy-paste of the combination to be changed.
% * All changes should be carried through systematically. Activate test for uniqueness at the end of this function after edits.
% * This function is called by get_COMPLETE.

%% Example of use
% cd = COMPLETE_data

CD = { ...
 0.9 {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}  
 1.0 {'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'} 
 1.5  {'ab'; 'ax'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'} 
 1.5  {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'rB'}  
 1.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}  
 1.5 {'Li'; 'Wdi'; 'L-Wd'; 'L-WC'; 'L-WN'; 'Wd-JO'; 'Wd-JN'} 
 1.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Wwb'; 'Wwi'; 'Ri'} 
 1.5 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'} 
 1.5 {'ab'; 'as'; 'aj'; 'ap'; 'am'; 'Lb'; 'Ls'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'L-Ww'} 
 1.5 {'am'; 'Li'; 't-L'; 't-N'} 
 1.5 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'} 
 1.5 {'ap'; 'am'; 'Li'; 't-L'; 't-Wd'} 
 1.7 {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ww_t'; 'Wwi'; 'R_L'}  
 1.7 {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-Ww'; 'L-N'; 'Ww-JO'} 
 1.7 {'tg'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 1.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 1.8 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'rB'; 'Ri'} 
 1.8 {'ab'; 'am'; 'Lb'; 'L_t'; 'Wdb'; 'Wd_t'; 'Ni'; 't-L'} 
 1.8 {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwp'; 'Wwi'; 'Ri'}  
 1.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}  
 1.9 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'L_t'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}  
 2.0 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ww_L'; 'Ri'}  
 2.0 {'ab'; 'ap'; 'am'; 'Lb'; 'Ls'; 'Lj'; 'L_t'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'} 
 2.0 {'ab'; 'am'; 'Lb'; 'L_t'; 'Lp'; 'Li'; 'Wwi'; 'Ri'} 
 2.0 {'ap'; 'am'; 'Li'; 'Wwi'; 'Ri'; 't-L'} 
 2.0 {'ap'; 'am'; 'Lb'; 'L_t'; 'Li'; 'Wwi'; 'Ri'} 
 2.0 {'ab'; 'ap'; 'am'; 'Lb'; 'L_t'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.0 {'ab'; 'ap_T'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; 't-L'} 
 2.0 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'} 
 2.0 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'L_t'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.0 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}  
 2.1 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'} 
 2.1 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'} 
 2.1 {'ap';'am';'Lb';'Lp';'Li';'Ri'; 'L-Ww'; 't-L'}  
 2.1 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ni'; 'L-Ww'}  
 2.1 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}  
 2.2 {'aR'; 'am'; 'Lb'; 'LR'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 'JO_W'; 'T-ab'}  
 2.2 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}  
 2.2 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}  
 2.2 {'ab'; 'am'; 'Ni'; 't-L'; 't-LR'; 't-Wd'}  
 2.2 {'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'GSI'; 'L-Ww'; 'Ww-JO_T'}  
 2.2 {'ab'; 'aj_T'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.2 {'tg'; 'ax'; 'ap'; 'am'; 'Lx'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'} 
 2.2 {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'} 
 2.2 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwi'; 'Ri'} 
 2.2 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'} 
 2.2 {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_T'; 't-Ww_T' } 
 2.3 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.3 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.3 {'tg'; 'ax'; 'ap'; 'am'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'JLi'} 
 2.3 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'} 
 2.3 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Ww0'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'} 
 2.3 {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'} 
 2.3 {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'; 't-L';'L-Ww'} 
 2.3 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Ww_L'; 'Ri'} 
 2.3 {'ab'; 'ap_T'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'} 
 2.3 {'ap'; 'am'; 'Li'; 'Wwi'; 'GSI'; 't-M_N'; 't-M_DNA'; 't-M_RNA'} 
 2.3 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwi'; 'Ww_t'; 'Ri'} 
 2.3 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 't-L_T'; 'L-Ww'; 'L-JO'} 
 2.3 {'ab'; 'ap'; 'am'; 'Lb'; 'L_t'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'} 
 2.3 {'ab'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Ni'; 't-L'; 'L-Wd'}
 2.3 {'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.3 {'ap'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.3 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'; 'GSI'} 
 2.3 {'ap'; 'am'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'; 't-L'} 
 2.3 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-Ww'} 
 2.3 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'dLp'; 'Wwb'; 'Wwi'; 'Ri'} 
 2.3 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'} 
 2.3 {'ab'; 'ax';'aR'; 'am'; 'Li'; 'Ww0'; 'Wwb'; 'Wwx'; 'WwR'; 'Wwi'; 'Ri'} 
 2.3 {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'; 'L-Ww'} 
 2.3 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L-Ww'; 'L-N'; 'Ww-N'} 
 2.4 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.4 {'ab'; 'am'; 'Li'; 'Wd0'; 'Wdb'; 'Wdi'; 'Ni'; 't-L_T'} 
 2.4 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 'L-Ww'} 
 2.4 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 'L-Ww'} 
 2.4 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 'L-Ww'; 'L-N'} 
 2.4 {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.4 {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.4 {'ab'; 'ax'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'} 
 2.4 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'} 
 2.4 {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'dLb'; 'Ww_L'; 't-L'} 
 2.4 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdp'; 'Wdi'; 'R_L'; 't-L'} 
 2.4 {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 't-L'; 'L-Wd'} 
 2.4 {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.4 {'ab'; 'aj_T'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'L_t'; 'Wdb'; 'Wwp'; 'Wwi'; 'Ww_t'; 'Ri'; 'E0'} 
 2.4 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_W'; 't-L'} 
 2.4 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'L-dL'} 
 2.4 {'ab'; 'aj_T'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'L_t'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ww_t'; 'R_L'; 'E0'} 
 2.4 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.4 {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_L'; 't-L'; 'L-Ww'} 
 2.4 {'ah'; 'ab'; 'am'; 'Lh'; 'Lp'; 'Li'; 'L-N'; 'L-Ww'} 
 2.4 {'ab'; 'ap'; 'am_T'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ww_L'; 'rB_T'; 'R_L'} 
 2.4 {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'; 't-L'} 
 2.4 {'ab'; 'aj';'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.4 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'} 
 2.4 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwh'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-dL'; 'L-dWw'; 'L-Ww'} 
 2.5 {'ah'; 'ab'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'Ww-dWw_T'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'R_L'; 't-L'; 'T-ab'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'; 'T-ab'} 
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'L-dL'} 
 2.5 {'ab'; 'am'; 'Li'; 'Wd0'; 'Wdj'; 'Ni'; 't-L_T'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; 't-Wd'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'; 'L-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'JXi'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'JXi'; 't-L'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp';  'Wwi'; 'Ri'; 't-Ww'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'JLi'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Wwe'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JXi'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JXi'; 't-L'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'; 't-Ww'} 
 2.5 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'Lb'; 'Li' ; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'LR'; 'Li'; 'Wwb'; 'WwR'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'LR'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 't-L'; 'L-N'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wd0'; 'Wwb'; 'Wwp'; 't-L'; 'L-Ww'; 'L-N'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwp'; 't-L'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L'; 'Ww-N'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'L-dL'; 't-L'; 'L-N'} 
 2.5 {'ab'; 'aj'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L_T'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'L-dL'; 'L-N'; 'T-aj'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'L-dL'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'; 'L-N'} 
 2.5 {'ah_T'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_L'; 't-L_f'; 'L-Ww'} 
 2.5 {'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.5 {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 't-Ww'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'L_t'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'; 't-L'; 'L-N'; 'T-ab'; 'T-aj'} 
 2.5 {'ab'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'R_L'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'; 'L-Ww'} 
 2.5 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'; 'L-Ww'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'; 'T-ah'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'} 
 2.5 {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L'; 't-Ww'; 'L-N'; 'Ww-N'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L'; 'L-N'} 
 2.5 {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'; 'L-Ww'} 
 2.5 {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'; 't-Ww'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'GSI'; 't-L'; 'Ww-JO'} 
 2.5 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Li'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'; 'L-Ww'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'GSI'; 't-WL'; 'Ww-JO'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'; 't-Le'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww_L'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'ab'; 'aj_T'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-Le_T'; 't-L'; 'T-JO'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L'; 't-Ww'; 'L-R'} 
 2.5 {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'aj'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Ri'; 'dWw_W'; 'JX_W'; 't-L'; 't-Ww'; 'L-Ww'} 
 2.5 {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'am'; 'L_t'; 'Wwe'; 'Ww_t'; 'Ni'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ae'; 'am'; 'Wd0'; 'Wdb'; 'Wdj'; 'Wde'; 't-Wd'; 't-N'} 
 2.5 {'ab'; 'aj'; 'am'; 'Wwb'; 'Wwj'; 'Wwe'; 'Ni'; 't-Ww'} 
 2.5 {'ab'; 'aj'; 'am'; 'L0'; 'Lb'; 'Lj'; 'Li'; 'Wdj'; 'Ni'; 't-L'; 'L-Wd'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lp'; 'Wdb'; 'Wdp'; 'Ri'; 't-Wd_T'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Wdb'; 'Wdp'; 'Ri'; 't-Wd'} 
 2.5 {'ab'; 'aj'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Wwj'; 'Ni'; 'T-ab'; 't-L'; 'L-Wd'; 'L-N'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wwp'; 'Wwi'; 'Ri'; 'Eb'; 'Ej'; 't-L'; 'T-aj'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri';'t-L';'t-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L'; 't-Ww'; 'L-N'} 
 2.5 {'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'GSI'; 't-L'; 't-Ww'} 
 2.5 {'am'; 'Lb'; 'Lp'; 'Wwb'; 't-L'; 'L-Ww'; 'L-N'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'L_t'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-dL'} 
 2.5 {'aj_T'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'; 't-WC_T'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 't-L_T'; 'L-N'} 
 2.5 {'ab_T'; 'ap_T'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 't-L_T'; 'L-N_T'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ni'; 't-L'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; 't-L'; 't-Wd'; 'L-Wd'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'; 'T-ab'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; 'L-N_T'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'; 'T-ap'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 't-L'; 'L-Wd'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'; 'L-Ww'} 
 2.5 {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 't-L'; 'T-ab'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab_f'; 'ap_f'; 'am_f'; 'Lb_f'; 'Lp_f'; 'Li_f'; 'Vb_f'; 'Vp_f'; 'Vi_f'; 'Ri_f'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 'JX_L'; 't-L'; 't-Wd'} 
 2.5 {'am'; 'Wdb'; 'Wwp'; 'Wwi'; 'Ni'; 't-Ww'; 'T-t'} 
 2.5 {'ab_T'; 'as'; 'ap'; 'am'; 'Lb'; 'Wdb'; 'Wds'; 'Wwp'; 'Wwi'; 'Ni'; 't-L'; 't-Ww'; 't-Wd'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Wwb'; 'Wwi'; 'Ni'; 't-Ww'} 
 2.5 {'ab_T'; 'as'; 'ap'; 'am'; 'Wwb'; 'Wws'; 'Wwp'; 'Wwi'; 'Ni'; 't-Ww'} 
 2.5 {'ab_T'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'; 't-L'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li';'Wwb'; 'Wwp'; 'Wwi'; 'Ni'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Wwb'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wdi'; 'Ri'; 't-L'; 't-Ww'; 'L-Ww'} 
 2.5 {'ab_T'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp';  'Li'; 'Wwb'; 'GSI'; 'pAi'; 't-L'; 'L-Wd'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp';  'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp';  'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp';  'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'; 't-L'; 'L-Wd'; 't-Wd'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'; 't-L'} 
 2.5 {'ap'; 'am'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 'L-Ww'; 'L-Wd'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wd_L'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 'L-Wd'; 't-L'} 
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ap'; 'am'; 'Lp'; 'Li';  'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Vb'; 'Vp'; 'Vi'; 'Ri'; 't-A'; 't-V'; 't-N'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'; 't-L'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 't-L'; 'L-Ww'; 'T-JO'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Wd'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wd_L'; 'Ri'; 't-L'} 
 2.5 {'ax'; 'ap'; 'am'; 'L0'; 'Lx'; 'Lp'; 'Li'; 'Ri'; 't-L'; 'L-Wd'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdp'; 'Wdi'; 'rB'; 'Ri'} 
 2.5 {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wdp'; 'WdR_Wd'; 't-L'; 't-Wd'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Wd'; 'L-Ww'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'; 't-L'; 'L-Wd'} 
 2.5 {'ab'; 'as'; 'ap'; 'am'; 'Lb'; 'Ls'; 'Lp'; 'Li'; 'Wwb'; 'Wws'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; 'L-Wd'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L';'t-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Ww_L'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Ni'; 't-Ww'} 
 2.5 {'ab';'aj';'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ww_L'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ww_t'; 'Ri'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 'L-dL'} 
 2.5 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 't-L'; 'T-ab'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 't-L'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L';'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwp'; 'Wwi'; 'L-N'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'L-N'; 'L-Ww'} 
 2.5 {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 't-L'; 'T-ab'; 'L-Wd'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 't-L'; 'L-L'; 'L-Ww'; 'L-N'} 
 2.5 {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Wdi'; 'Ri'; 't-Ww'; 'L-N'} 
 2.5 {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSi'; 't-L'} 
 2.5 {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'GSI'; 'JX_W'; 't-L'; 'L-Ww'} 
 2.5 {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'; 'Ww-JO'; 'T-JO'} 
 2.5 {'ab'; 'aj'; 'am'; 'Lj'; 'Li'; 'Wd0'; 'Wdj'; 'Ni'; 't-L_T'; 't-Wd_T'; 'T-ab'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwp'; 'Ri'; 't-L'; 'L-Ww'; 'Ww-N'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ax'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Ri'; 't-L'; 't-Ww'; 'L-N'}
 2.5 {'ab'; 'aj'; 'am'; 'Lb'; 'Lj'; 'Wd0'; 'Wdb'; 'Wdj'; 'Ri'; 't-Wd'} 
 2.5 {'ap'; 'am'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'GSI'; 'L-dL'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 'L-Ww'; 'L-N'; 'Ww-N'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L';'t-Ww';'Ww-N'} 
 2.5 {'ah'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwi'; 'GSI'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 't-L'; 'L-Ww'; 'T-ab'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'; 't-L';'L-Ww'} 
 2.5 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L';'L-Ww'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwh'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab_T'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 'L-Ww'; 'T-ah'} 
 2.5 {'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'L-dL'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'; 'E0'; 't-Ww'} 
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ah'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'L_t'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab';'ap';'am';'Li'; 'Wwb'; 'Wwi';'Ww_L'; 'Ri'; 't-L'} 
 2.5 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'L_t'; 'Lp'; 'Li'; 'Wwi'; 'Ri'} 
 2.5 {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'ah_T'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L'; 'L-N'; 'Ww-N'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 't-Ww'; 'L-Ww'} 
 2.5 {'am'; 'Lb'; 'Lp'; 'Li'; 'Ww_L'; 'Wwi'; 't-L'; 'L-GSI'; 'L-N'; 'Ww-N'} 
 2.5 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'R_L'; 't-L'; 't-Ww'} 
 2.5 {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'; 't-L'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'; 't-L'; 'L-N'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ww_t'; 'Ri'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'; 'L-Ww'} 
 2.5 {'ah'; 'ab'; 'am'; 'Lh'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'ss'; 'L-N'; 'Ww-N'} 
 2.5 {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-Ww'; 't-L'; 't-Ww'; 'T-JO'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-Ww'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 't-L'; 'L-Ww'; 'L-N'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'L-Ww'; 'L-N'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'L-dL'} 
 2.5 {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ww_t'; 'Ri'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'L-dL'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-dL'; 't-L'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 'L-dL'; 't-L'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'L-N'} 
 2.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 'L-JX'; 'T-ab'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab_T'; 'ap'; 'am'; 'Wwb'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'; 'L-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'JCi'; 'JXi'; 'K'} 
 2.5 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'}
 2.5 {'ab'; 'ax'; 'aR'; 'ap'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.5 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'; 'L-Ww'; 't-N'; 't-dC'; 't-WwR'}
 2.5 {'ab'; 'ax'; 'aR'; 'am'; 'Lb'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri';'t-Ww'; 't-N'; 't-Le'; 't-Wwe'}; 
 2.5 {'ab'; 'ap'; 'am'; 'L0'; 'Lb'; 'Lp'; 'Li'; 'V0'; 'Wd0'; 'Wwi'; 'Ni'; 'Ri'; 't-Wd'; 'L-Wd'; 'L-Ww'; 'Wd-N'; 't-N'}; 
 2.6 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'ax-Wwx_f'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 't-Ww'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'JXi'; 'pAi'; 't-L_f'; 't-Ww'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 'L-N'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'T-ab'; 'L-Ww'; 't-Ww_T'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-Ww'; 'L-N'} 
 2.6 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.6 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.6 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Wwe'} 
 2.6 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.6 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'pXi'; 'pAi'; 'pL'; 't-L'; 'Ww-JO'} 
 2.6 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww_f'; 't-T'} 
 2.6 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'pX-pG'} 
 2.6 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww_f'; 't-R_f'} 
 2.6 {'ap'; 'am'; 'Lb'; 'Li'; 'Ww_t';'Wwp'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'; 'L-R'} 
 2.6 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.6 {'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.6 {'ah'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwi'; 't-L'; 'L-Ww'; 'Ww-N'} 
 2.6 {'ah'; 'ab'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 't-L'; 'L-Ww'; 'L-N'} 
 2.6 {'ah'; 'ab'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 't-L'; 'L-Ww'; 'L-N'; 't-Ww_f'; 't-R_f'} 
 2.6 {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L'; 'L-Ww'; 'L-N'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'; 'L-Ww'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 't-L_f'; 't-N_f'} 
 2.6 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'; 'Ww-JO'} 
 2.6 {'ab_T'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.6 {'ah_T'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'R_L'; 'GSI'; 't-L_f'; 't-Ww'; 'L-Ww'; 'T-ah'} 
 2.6 {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L_f'; 'L-Ww'} 
 2.6 {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 't-L'; 'L-Ww'; 'L-N'} 
 2.6 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'pXi'; 't-L'; 't-Ww'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L_f'; 'L-Ww'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'; 't-L_f'} 
 2.6 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L_f'; 'L-Ww'; 'T-ab'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wdb'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'Ni'; 't-L'; 't-Ww'; 'L-Ww'; 't-N'} 
 2.6 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'T-ah'} 
 2.6 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'; 't-Ww_f'; 'L-Ww'} 
 2.6 {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 't-L'; 'L-Ww'; 'L-N'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'; 'Ww-N'} 
 2.6 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'} 
 2.6 {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'; 't-L'; 'L-Ww'; 'L-N'} 
 2.6 {'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 't-L'; 'L-Ww'; 'L-N'; 'T-ab'} 
 2.6 {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 'Ww-JX'; 'Ww-dWw'; 't-Ww'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'; 't-Ww'; 'T-aj'} 
 2.6 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 't-L_T'; 'T-ab'; 'L-Wd'} 
 2.6 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'; 't-L_f'} 
 2.6 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_fT'; 'L-Ww'} 
 2.6 {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_T'} 
 2.6 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L'; 'L-N'} 
 2.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdp'; 'Wdi'; 'Ri'; 't-L'; 'L-Ww'; 't-Wd'; 't-WdR'} 
 2.6 {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 't-L'; 'T-ab'; 'X-Lp'} 
 2.6 {'aj'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'; 't-L'; 'T-ab'; 'T-aj'; 'T-ap'; 'T-am'} 
 2.6 {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'; 't-L'; 'T-ab'; 'T-aj'; 'T-ap'; 'T-am'} 
 2.6 {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ri'; 't-L'; 'L-Wd'; 'T-ab'; 'T-aj'; 'T-ap'; 'T-am'} 
 2.6 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'L_W'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'; 't-L_f'} 
 2.6 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 't-L'; 'L-Ww'; 'L-N'; 'T-ab'} 
 2.6 {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.6 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.6 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'; 'pXi'; 't-Ww'} 
 2.6 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'pXi'; 't-Ww_f'} 
 2.6 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'; 't-Ww_f'} 
 2.6 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.6 {'ab'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.6 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L_f'; 't-Ww_f'} 
 2.6 {'ab'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.6 {'ab'; 'aj'; 'ap'; 'am'; 'Wwb'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'GSI'; 't-L'; 'L-Ww'; 'T-JO'} 
 2.6 {'ab'; 'ax'; 'aR'; 'am'; 'V0'; 'Ww0'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww'} 
 2.7 {'ab'; 'ax'; 'aR'; 'am'; 'V0'; 'Ww0'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.7 {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'; 't-L_f'; 't-Ww_f'} 
 2.7 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.7 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pXi'; 't-L'} 
 2.7 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.7 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'; 't-Wwe'; 't-Le'} 
 2.7 {'ab'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'; 't-Wd'; 't-E'; 't-JO'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww_f'; 'L-N'; 'T-JO_f'; 'T-ab'} 
 2.7 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 't-Le'; 't-L'; 'L-N'} 
 2.7 {'ah'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'R_L'; 't-L_T'; 't-Ww_T'; 'L-Ww'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Le'} 
 2.7 {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L'; 't-Le'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'; 't-Le'; 't-VYe'; 'L-N'; 'L-Ww'; 'L-Wwe'} 
 2.7 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'; 'Ww-JO'; 'L-Ww'} 
 2.7 {'ab'; 'aj'; 'ae'; 'am'; 'Wd0'; 'Wwj'; 'Wwe'; 'Wde'; 'Ni'; 't-L_f'; 't-Ww'; 'Ww-N'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wdb'; 'Wdi'; 'Ri'; 'T-ab'; 'T-ap'; 't-L'; 't-Wd'; 'L-Wd'; 't-S'}
 2.7 {'ab'; 'aj'; 'ap'; 'am'; 'L0'; 'Lj'; 'Li'; 'Wdj'; 'Ni'; 'T-ab'; 't-Wd_f'; 't-Ww'; 'L-Wd'} 
 2.7 {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; 't-L_T'} 
 2.7 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'E0';'Ww0'; 'Wwb'; 'Wwi'; 'Ri'; 't-JOe'; 't-Ww'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-WwYe'; 't-WwVe'; 't-JOe'} 
 2.7 {'ah'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lj'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 'JOi'; 't-L'; 'X-aj'; 'X-ap'; 'X-Ri'; 'T-ah'; 'T-aj'; 'T-ap'} 
 2.7 {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 't-L'; 'L-Wd'; 'L-JO_T'; 'T-JO'} 
 2.7 {'Wdi'; 't-L_T'; 't-N_T'; 't-S_T'; 'T-ap'} 
 2.7 {'ab_f'; 'ap_f'; 'am_f'; 'Lb'; 'Lp_f'; 'Li_f'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ni_f'; 't-L_f'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdi'; 'Ni'; 'T-ab'; 'T-ap'; 't-N_T'; 't-L_T'} 
 2.7 {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wd0'; 'pXi_Wd'; 't-L_f'; 't-Wd'; 'L-Wd'; 'L-N'} 
 2.7 {'ab_T'; 'ap'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Ri'; 't-L_T'; 't-N_T'; 't-S_T'; 'T-ab'; 'T-ap'} 
 2.7 {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wd0'; 'pXm_Wd'; 't-L_f'; 't-Wd'; 'L-Wd'; 'L-N'} 
 2.7 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-JX'; 'T-ab'} 
 2.7 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_T'; 't-Ww'; 'Ww-N'; 'L-Ww'; 'L-Wd'; 'T-ah'} 
 2.7 {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Ww0'; 'Wdp'; 'Ri'; 't-L_f'; 'L-Wd'} 
 2.7 {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'WdR_L'; 't-L_f'; 'L-Wd_f'} 
 2.7 {'ab'; 'aj'; 'am'; 'Li'; 'Wd0'; 'Wwi'; 'Ni'; 't-L'; 't-Ww'; 'Ww-JO'}
 2.7 {'ab'; 'aj'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wd0'; 'Wwp'; 'Wwi'; 'GSI'; 't-L'; 't-Ww'; 't-Wde'; 'T-JO'; 'Ww-dWw'; 'L-Ww_f'; 'L-WwR'} 
 2.7 {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.7 {'am'; 'Lp'; 'Li'; 'Wwb'; 't-L'; 'L-Ww'; 'L-N'} 
 2.7 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Wwe'; 't-Ww'} 
 2.7 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'; 't-Wwe'} 
 2.7 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'; 'L-Ww'; 'X-JX'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L_f'; 't-S_f'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww_L'; 'GSI'; 't-L_f'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; 'L-Ww'; 't-Ww'; 't-L'; 'T-JO'} 
 2.7 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'; 't-Ww_f'} 
 2.8 {'ab'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'; 't-Ww'; 'Ww-JO'} 
 2.8 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-L'; 't-Le'; 't-Ww'; 't-Wwe'} 
 2.8 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww'; 't-Wwe'} 
 2.8 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'; 'Ww-JO'} 
 2.8 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 't-Le'; 't-Wwe'; 't-L'; 't-Ww_f'; 'Ww-JO'} 
 2.8 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Wwe'; 't-Ww'} 
 2.8 {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww'; 't-Le'; 't-Wwe'; 'L-Ww'} 
 2.8 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'; 't-pX'} 
 2.8 {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww'; 't-pX'} 
 2.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-Ww'; 't-L_f';'t-Ww_f'; 'T-JO'} 
 2.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'Ww-X'; 'L-Ww'} 
 2.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-Ww'; 'Ww-JO'; 't-Ww'; 'T-ab'} 
 2.8 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wdb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'; 't-Ww_f'; 'L-Ww'} 
 2.8 {'ah'; 'am'; 'Lh'; 'L_t'; 'Lp'; 'Li'; 'Wwi'; 't-L'; 'L-Ww'; 'L-N'; 'Ww-N'} 
 2.8 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-WwVe'; 't-JOe'; 't-WwYe'}
 2.8 {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 2.8 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_f'; 'L-Ww'; 'Ww-N'} 
 2.8 {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 't-Le'; 't-L_f'; 't-Ww'; 'L-Ww'; 't-N'; 'T-ab'} 
 2.8 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L',; 'L-N'; 'L-Ww'} 
 2.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 'L-Ww'; 'Wd-Ww'; 'Wd-Wa'; 'L-dL'; 'L-N'; 'T-JO_W'} 
 2.8 {'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 't-L_f'; 'L-N_f'; 'L-Ww'; 'L-Wd'; 'L-E'; 'T-ap'; 'Wd-JO'} 
 2.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wdb'; 'Wdp'; 'Wdi'; 't-L_fT'; 'L-JX'; 'L-JO'; 'L-N'} 
 2.8 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 't-L'; 'L-JX'; 'L-JC'; 'L-N'} 
 2.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 't-Wd'; 't-L_f'; 'T-ab'; 'Ww-N'; 'L-Ww'} 
 2.8 {'am'; 'WC0'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww_T'; 'T-ab'; 'T-ap'; 'T-JX'; 'T-JC'; 'T-R'} 
 2.8 {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 'L-Ww'; 'Wd-JO_T'} 
 2.8 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'; 't-L'; 't-Ww'; 'Ww-JO'} 
 2.8 {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'; 'JO_W'; 't-L'; 't-Ww'} 
 2.8 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww'; 't-JX'} 
 2.8 {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-L'; 't-Ww_T'; 'L-Ww'; 'Ww-p+_T'} 
 2.8 {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.8 {'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wdi'; 'GSI'; 'E_L'; 't-L_f'} 
 2.8 {'ab_T'; 'ap'; 'am'; 'Li'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'; 't-Ww'; 't-N'} 
 2.8 {'ab_T'; 'ap'; 'am'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'; 't-Ww'; 't-N'} 
 2.8 {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'; 'T-ah'; 't-L_T'; 't-Ww_T'; 'L-Ww'; 'L-F'}
 2.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'; 't-L_f'} 
 2.8 {'ab'; 'ap'; 'am'; 'Wwp'; 'Wwi'; 'Ni_f'; 't-Ww_f'} 
 2.8 {'am'; 'L0'; 'Lj'; 'Lp'; 'Li'; 'WC0'; 'WN0'; 'Wwp'; 'Wdi'; 'R_L'; 'L-Wd'; 'L-Ww'; 'Wd-JO'; 'Wd-JN'; 'T-N'} 
 2.8 {'ab'; 'aj'; 'ap'; 'am'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'; 'V-V'} 
 2.8 {'ab'; 'aj_T'; 'ae'; 'am'; 'Lb'; 'Lj'; 'Wd0'; 'Wwj'; 'Wwe'; 'Wde'; 'Ni_f'; 't-L_fT'; 'L-Wd'} 
 2.8 {'ah'; 'ab'; 'ap'; 'am'; 'Ab'; 'Ap'; 'Ai'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ae'; 't-A'} 
 2.8 {'ah';'ab'; 'ap';'am';'Lh'; 'Lb';'Lj';'Lp';'Li'; 'Ww0'; 'Ww_t'; 'Wwp'; 'Wwi'; 't-L_T'; 't-Ww_T';'t-JX_T'; 'L-JO_T'; 'L-Ww'; 'L-N'} 
 2.8 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'L-Ww'; 'L-JX'} 
 2.8 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'; 'T-ah'; 't-L_fT'; 't-Ww_T';'L-Ww'; 'L-F'} 
 2.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 'L-Wd_f'; 'X-dL_L'; 'X-dWd_W'; 't-L_f'; 'Wd-JO_f'; 'X-JC_W'; 'X-JX_W'} 
 2.9 {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 't-Ww_f'; 't-L_f'; 't-Wwe'} 
 2.9 {'ab'; 'ax'; 'aR'; 'am'; 'Wwi'; 'Ri'; 't-Ww'; 't-Wwe'; 't-JCe'} 
 2.9 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L_fT'; 't-R_T'; 't-S'} 
 2.9 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'dLj'; 'Ri'; 'JXi'; 't-L'; 'L-Wd'; 'Wd-JC_T'; 'Wd-JO_T'; 'Wd-JN_T'} 
 2.9 {'ab'; 'aj'; 'ae'; 'am'; 'Ww0'; 'Wwb'; 'Wwj'; 'Wwe'; 'Wwi'; 'Ww_t'; 'Ni'; 't-Wwe'; 't-Ww'; 't-JO'; 't-JOe'} 
 2.9 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li';'Wwh'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'; 'T-ah'; 't-WwYe_T'; 't-WwVe_T'; 't-JOe_T'; 't-JCe_T'; 'L_0-L_t'; 'L-Ww'} 
 2.9 {'ab'; 'ap'; 'am'; 'Li'; 'Ww0'; 'Wwb'; 'Wwx'; 'WwR'; 'Wwi'; 'Ri'; 't-Ww'; 't-Le'; 't-N'} 
 2.9 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 't-Ww'; 't-Wwe'} 
 2.9 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wd0'; 'Wwb'; 'Wdb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww_f'; 't-N_f'; 't-S'} 
 3.0 {'tg'; 'ax'; 'ap'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww_f'; 't-L_f'; 't-S'; 't-JO'; 't-JX'} 
 3.0 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwh'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'; 'T-ab'; 't-L_T'; 't-Ww_T'; 'L-Ww'; 'L-F'} 
 3.0 {'ab_T'; 'ap'; 'am'; 'L_t'; 'Lp'; 'Li'; 'Wdb'; 'Wwb'; 'Wwi'; 'Ri'; 't-JOe_T'} 
 3.0 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 'T-JO'; 'T-dWw_f'; 'Ww-JO'; 'Ww-JO'; 't-N'; 'L-Ww'} 
 3.0 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'; 't-L'; 't-Ww'; 'L-N'; 'Ww-N'} 
 3.0 {'ah'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Ww0'; 'Wwh'; 'Wwi'; 'Ri'; 'GSI'; 't-L'; 'L-Ww'; 't-WwYe'; 't-WwVe'; 't-JOe'} 
 3.0 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'L-dL'; 'L-N'; 'L-F'; 'WC-JX'} 
 3.0 {'ab_T'; 'aj'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Wd0'; 'Ww0'; 'Wdb'; 'Wwi'; 'GSI'; 't-Le_T'; 't-L_f'; 't-Wd_f'; 't-JOe'; 'L-Ww'; 'T-JO'} 
 3.0 {'aj'; 'ap'; 'am'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'GSI'; 't-L_fT'} 
 3.0 {'ab'; 'aj'; 'ae'; 'am'; 'Ww0'; 'Wwb'; 'Wwj'; 'Wwe'; 'Ni'; 't-Ww'; 't-JO'; 't-N'} 
 3.0 {'ab'; 'aj'; 'ae'; 'am'; 'E0'; 'L_t'; 'Ww0'; 'Wwj'; 'Wwe'; 'Ri'; 't-Ww'; 'Ww-JO'} 
 3.0 {'ab'; 'ap'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; 't-L_fT'; 't-S_T'; 'X-Li'} 
 3.0 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'Ni_f'; 't-L_f'} 
 3.0 {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww_f'} 
 3.0 {'ap'; 'am'; 'L0'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'RQ'; 'L-Ww'; 'L-Wd'; 'L-WN'; 'L-WC'; 't-Ww'; 'L-R'; 'T-ab'; 'T-JO'; 'T-JN'} 
 3.0 {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'WC0'; 'Wwi'; 'R_L'; 't-L'; 't-N'; 'L-Ww'; 'L-WC'; 'L-V'; 'L-R'; 'Ww-R'} 
 3.0 {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 'RQ'; 't-L_T'; 'L-F'; 'Ww-JO_T'} 
 3.0 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ri'; 'L-dL'; 'L-Wd'; 'Ww-dWw'; 'Wd-JO'; 'Ww-JX'} 
 3.0 {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 'EXx'; 'pX_t'; 't-Ww'; 'Ww-pX'}
 3.0 {'tg'; 'tx'; 'tp'; 'am'; 'Lb'; 'Lx'; 'Li'; 'Wwb'; 'Wdb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 't-Wwe'; 't-Wde'; 't-Le'; 't-L'; 't-Ww'; 'L-Ww'} 
 3.2 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'L0'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 't-L_fT'; 't-Le'; 't-Ww_fT'; 'L-Ww'; 'Ww-R'; 'Ww-JO_T'} 
 3.2 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'; 't-L'; 't-N'; 'L-Ww'; 'L-N'; 'Ww-N';  'Ww-pX_T'; 'Ww-JO_T'; 'T-ah'; 'T-dL'} 
 3.2 {'ab'; 'am'; 'L0'; 'Lp'; 'Li'; 'WC0'; 'Wwi'; 'R_L'; 't-Ww'; 't-WC'; 'Ww-R_f'; 'Ww-JO_T'} 
 3.2 {'ab'; 'am'; 'L0'; 'Lp'; 'Li'; 'WC0'; 'Wwi'; 'R_L'; 'Wd-JO'; 'Ww-R_f'; 't-Ww'; 't-WC'; 'L-Ww'; 'Ww-JO_T'} 
 3.3 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Wdb'; 'Wdj'; 'Wdi'; 'Ri'; 'GSI'; 'K'; 't-L_fT'; 't-Ww_f'; 't-Wd_f'; 't-F_f'; 't-JX'; 't-WwR'; 'L-JO'; 'L-Wd'} 
 3.3 {'ab'; 'aj'; 'ap'; 'am'; 'Lb';  'Lp'; 'Li'; 'Wd0'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'E0'; 'Eb'; 'Ej'; 'Ri'; 't-Le'; 't-WdVe'; 't-WdYe'; 't-Wde'; 't-JOe'; 'T-ab'} 
 3.3 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wdh'; 'Wwh'; 'Wdb'; 'Wwb'; 'E0'; 'Eh'; 'Eb'; 'Ri'; 't-WdYe'; 't-WdVe'; 't-JOe'} 
 3.3 {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj';  'Lp'; 'Li'; 'Wd0'; 'Wdh'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'E0'; 'Eh'; 'Ej'; 'Ri'; 't-L'; 't-WdVe'; 't-WdYe'; 't-Wde'; 't-JO'} 
 3.4 {'ah_T'; 'ab_T'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wwh'; 'Wdh'; 'Wdb'; 'Wwb'; 'Wwi'; 'E0'; 'Eh'; 'Eb'; 'Ri'; 't-WdYe'; 't-WdVe'; 't-JOe_T'} 
 3.4 {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwh'; 'Wwj'; 'Wwi'; 'Ri'; 'GSI'; 'E0'; 't-L_T'; 't-Wd_T'; 't-Ww_f'; 'L-Ww'; 't-p+'; 't-JOe'; 't-JNe'; 't-VY'; 't-E'; 't-Wwe'; 't-Wde'; 'T-ab'; 'L-N'} 
 3.5 {'ab'; 'am'; 'Lb'; 'Lp'; 'Wd0'; 'Wdb'; 'Wd_L'; 't-L_f'; 't-Wd_f'; 't-M_PLC'; 't-N'; 'L-JX'; 'L-JO'; 't-S'} 
 3.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'L_t'; 'Wdp'; 'Wdi'; 'GSI'; 'Fm'; 't-L'; 'L-Ww'; 'L-F'; 'L-JO'} 
 3.5 {'Vb'; 't-V_f'; 'JX-ap'; 'JX-am'; 'JX-Vp'; 'JX-Vi'; 'JX-Ri'} 
 3.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdp'; 'Wdi'; 'GSI'; 'Fm'; 't-L'; 'L-Ww'; 'L-F'; 'L-JO'} 
 3.5 {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Ri'; 't-L'; 't-Ww_f'; 'Ww-JX_f'; 'Ww-JO_f'} 
 3.5 {'ah_T'; 'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wd0'; 'Wdh'; 'Wdb'; 'Wwi'; 'Ri'; 't-Ww_f'; 't-L_f'; 't-Wde'; 't-WdYe'; 'T-ah'; 'Ww-JO'} 
 3.5 {'ah_T'; 'ab_T'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L_fT'; 't-Ww_fT'; 't-VY_T'; 'Ww-R'; 'Ww-N_T'; 'T-ah'; 'T-JO'; 'T-JN'} 
 3.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri';'t-L_f'; 'L-Ww'; 'L-Wd'; 'Wd-JO'}
 3.5 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'; 't-L_f'; 'L-Ww'; 'Wd-JO_T'}
 3.5 {'ah_T'; 'ab_T'; 'aj'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 't-L'; 't-Ww_T'; 'Ww-R'; 'Ww-JX_T'; 'T-JN_W'}; 
 3.6 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wd0'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'; 'E0'; 't-Le_T'; 'L-Wde_T'; 'T-ab'; 't-L_fT'; 't-Ww_fT'; 'L-Ww'; 'L-N'} 
 3.6 {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'; 't-L_f'; 'L-Wd'; 'L-N'; 'Wd-JO_f'; 'T-JO'}
 3.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 'Ri'; 't-L'; 't-dL'; 'L-Ww'; 'X-JX_L'; 'X-JP_L'; 'JX-JO_L'; 'L-JO'} 
 3.8 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 't-Ww_f'; 't-R_f'} 
 4.0 {'tg'; 'ax'; 'ap'; 'Li'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'; 't-Wwe'; 't-Ww_f'; 't-S_f'} 
 4.0 {'ab_T'; 'ap'; 'am'; 'L0'; 'Lb'; 'Li'; 'Ni_f';'t-L_f'; 't-Wd'; 't-N'} 
 4.2 {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'L0'; 'Lh'; 'Lj'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 't-L_fT'; 't-Ww_f'; 'L-Ww'; 'L-R'; 'Ww-JO_T'};
 4.5 {'ab'; 'aj'; 'ap'; 'am'; 'L0'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wd0'; 'Wwi'; 'Ri'; 'GSI'; 't-Le'; 't-L_fT'; 't-Ww_f'; 't-Wd_f'; 't-N'; 't-JO'; 't-S'} 
 4.5 {'ab'; 'ax'; 'ap'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'xi_WE'; 't-Wwe'; 't-Ww_f'; 't-S_f'; 'Ww-JO'}; 
 5.0 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 't-L_f'; 't-JX_f'; 't-N_f'; 'L-Wd_f'; 'L-JO_T'; 'L-Wd'} 
 5.0 {'ab_T'; 'ap'; 'Lj'; 'Lp'; 'Li'; 'Wd0'; 'Wdb'; 'Wdi'; 'Ri'; 'JOb'; 'JOi'; 't-L_f'; 't-Ww_f'; 't-Wwe'; 't-Wd_f'; 't-N_f'; 't-JOe'; 't-S'} 
 5.0 {'am'; 'Lb'; 'Li'; 'Wwb_f'; 'Wdb_f'; 'Wwp'; 'Wdi'; 'Ri'; 'T-ab'; 't-L_fT'; 't-N_fT'; 'Ww-JO'} 
 5.0 {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'WC0'; 'Wdi'; 'Ri'; 't-L_f'; 't-JX_f'; 't-N_f'; 'L-Wd_f'; 'L-JO_T'; 'L-Wd'} 
};

if 0 % test for uniqueness; activate after edits
  n = size(CD,1); x = 41; % line number of text "CD = { ..." in this function
  for i = 1:n-1
    for j = i+1:n
      if STRCMP(CD{i,2},CD{j,2})
        fprintf(['data at lines ', num2str(x + i), ' and ', num2str(x + j), ' are the same\n'])  
      end
    end
  end
end