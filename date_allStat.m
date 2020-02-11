%% date_allStat
% get date of allStat.mat file

%
function date = date_allStat
% created at 2020/02/11 by Bas Kooijman

  %% Syntax
  % date = <date_allStat.m *date_allStat*>

  %% Description
  % Get date of allStat.mat
  %
  % Output
  %
  % * date string

  %% Remark
  % convert to yyyy/mm/dd with datestr(date_allStat, 'yyyy/mm/dd')
  
  allStatInfo = dir(which('allStat.mat')); date = allStatInfo.date; 