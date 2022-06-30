%% check_dates
% checks that dates of submission, modification and acceptance are in the correct sequence

%%
function entries = check_dates
% created 2018/01/18 by Bas Kooijman

%% Syntax
% entries = <../check_dates.m *check_dates*>

%% Description
% checks that dates of submission, modification and acceptance are in the correct sequence
%
%
% Output: 
% 
% * entries: cell string with entries, where dates are not in the correct sequence

%% Remarks
% date of acceptance might equal date of last modification

%% Example of use
% check_dates

load allStat

nm = fieldnames(allStat); n = length(nm); % all entries
entries = cell(0); % initiate output

for i = 1:n % scan all entries
  
  % collect dates and check for existence
  if isempty(allStat.(nm{i}).date_subm) % date_sub must exist
    entries = [entries; nm(i)];
  else
    date_subm = datenum(allStat.(nm{i}).date_subm);
  end
  
  if isfield(allStat.(nm{i}), 'date_mod') && ~isempty(allStat.(nm{i}).date_mod)
    if iscell(allStat.(nm{i}).date_mod)
      mod = allStat.(nm{i}).date_mod{:}; n_mod = length(mod); date_mod = zeros(n_mod,1);
      for j = 1:n_mod
        date_mod(j) = datenum(mod{j});
      end
    else
      date_mod = datenum(allStat.(nm{i}).date_mod);
      n_mod = 1;
    end
  else
    date_mod = [];
    n_mod = 0;
  end
  
  if isempty(allStat.(nm{i}).date_acc) % date_acc must exist
    entries = [entries; nm(i)];
  else
    date_acc = datenum(allStat.(nm{i}).date_acc);
  end
    
  % check sequences
  if n_mod == 0 
    if date_acc < date_subm
      entries = [entries; nm(i)];
    end
  elseif n_mod == 1
    if date_acc < date_mod | date_mod <= date_subm
      entries = [entries; nm(i)];
    end
  else % n_mod > 1
    if date_acc < date_mod(end) | date_mod(1) <= date_subm
      entries = [entries; nm(i)];
      [date_sub; date_mod; date_acc]
    end   
    for j = 2:n_mod
      if date_mod(j) <= date_mod(j-1)
        entries = [entries; nm(i)];
      end
    end
  end
end

entries = unique(entries);

