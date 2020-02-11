%% date_popStat
% get date of popStat.mat file

%
function date = date_popStat
% created at 2020/02/11 by Bas Kooijman

  %% Syntax
  % date = <date_popStat.m *date_popStat*>

  %% Description
  % Get date of popStat.mat
  %
  % Output
  %
  % * date string

  %% Remark
  % convert to yyyy/mm/dd with datestr(date_popStat, 'yyyy/mm/dd')
  
  popStatInfo = dir(which('popStat.mat')); date = popStatInfo.date; 