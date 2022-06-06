%% get_COMPLETE
% gets value for COMPLETE, given data types

%%
function COMPLETE = get_COMPLETE(data, n)
% created 2018/01/05 by Bas Kooijman

%% Syntax
% COMPLETE = <../get_COMPLETE.m *get_COMPLETE*>(data, n)

%% Description
% Sets value for COMPLETE. The general criteria for the std model are
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
% Other models have more demands on data, so lower completeness levels, and guesses for data might reduce the level also.
%
% Input:
%
% * data: cell string with names of zero- and uni-variate data labels
% * n: optional value to correct for guesses of model type (default 0)
%
% Output:
% 
% * COMPLETE: scalar for COMPLETE

%% Remarks
% * Calls function COMPLETE_data to set COMPLETE-data combinations
% * Before adding a data-combination, make sure that it not already exists, by running this function with NaN as result.
% * Before changing either a combination of a COMPLETE setting, first find out which entries are affected, 
%   by running <../../html/select_data.html *select_data*>, with a copy-paste of the combination to be changed.
% * All changes should be carried through systematically.

%% Example of use
% get_COMPLETE('std', sort({'ab', 'am', 'Wwi'}))

if ~exist('n','var')
  n = 0;
end

Cd = COMPLETE_data; n_Cd = size(Cd,1); COMPLETE = NaN;

for i = 1:n_Cd
  if STRCMP(Cd{i,2},data)
    COMPLETE = Cd{i,1};
    break
  end
end

COMPLETE = COMPLETE - n; % reduce for punish points 
