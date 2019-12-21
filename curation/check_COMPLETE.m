%% check_COMPLETE
% checks actual complete score against expected score

%%
function [entries_NAN CC entries] = check_COMPLETE
% created 2018/01/17 by Bas Kooijman

%% Syntax
% [entries_NAN CC entries] = <../check_COMPLETE.m *check_COMPLETE*>

%% Description
% checks COMPLETE settings against expected ones
%
% Output: 
% 
% * entries_NAN: cell string of entry names for which COMPLETE could not be computed
% * CC: (n,2)-matrix with actual and expected COMPLETE settings 
% * entries: cell string with all entries

%% Remarks
% uses <get_COMPLETE.html *get_COMPLETE*> to compute COMPLETE setting; use <check_data.html *check_data*> to list data types

%% Example of use
% check_COMPLETE;

load allStat

entries = select('Animalia');   % n-string of latin names of species in the lists
n = length(entries); CC = zeros(n,2);

for i=1:n
  CC(i,:) = [allStat.(entries{i}).COMPLETE get_COMPLETE(allStat.(entries{i}).data)]; 
end

entries_NAN = entries(isnan(CC(:,2)));




