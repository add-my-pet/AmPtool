%% date_check
% compares date of last modification of AmPtool/taxa with that of allStat

%
function d = date_check
% created at 2021/12/16 by Bas Kooijman

  %% Syntax
  % d = <date_check.m *date_check*>

  %% Description
  % Compares date of last modification of AmPtool/taxa with that of allStat
  %
  % Output
  %
  % * d: number of days between last modification dates in d
    
  d = datenum(date_allStat) - datenum(date_taxa);
  
  if abs(d)>1
    fprintf(['Warning from date_check: modification dates of AmPtool and AmPdata differ by ', abs(num2str(d)), ' d\n']);
  end
