%% date_taxa
% get date of last modification of AmPtool/taxa 

%
function Date = date_taxa
% created at 2021/12/16 by Bas Kooijman

  %% Syntax
  % Date = <date_taxa.m *date_taxa*>

  %% Description
  % Get date of last modification of AmPtool/taxa
  %
  % Output
  %
  % * date string

  %% Remark
  % convert to yyyy/mm/dd with datestr(date_allStat, 'yyyy/mm/dd')
    
  WD = cdCur; cd ../taxa; % goto AmPtool/taxa
  txt = dir;
  Date = txt.date;
  
  cd(WD);