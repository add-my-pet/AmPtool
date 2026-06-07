%% read_allStat
% read statistics and/or parameters in allStat.mat

%%
function [var, entries, units, label] = read_allStat(varargin)
% created 2016/04/24 by Bas Kooijman

%% Syntax
% [var entries units label] = <../read_allStat.m *read_allStat*>(varargin)

%% Description
% read statistics and/or parameters in allStat.mat. 
%
% Input:
%
% * varargin: names of variables or cell-string with names of variables
%
% Output
%
% * var: (n,x)-matrix with values of variables or cell-array if some variable is not numerical 
% * entries: n-cell string with names of entries
% * units: cell string with units of variables
% * label: cell string with description of variables

%% Remarks
% Make sure that allStat has been generated at the correct temperature; 
% All parameters are at T_ref, the statistics at T or T_typical, see <write_allStat.html *write_allStat*>.
% Print all to screen: printpar(select, read_allStat('Ww_i'))
% Print selection to screen: tax = select; tax(read_allStat('N_i')<10)
% Put core parameters in a structure with <read_pars.html *read_pars*>

%% Example of use
% complete_mre = read_allStat('COMPLETE', 'MRE'); 
  
  persistent allStat allUnits allLabel entries_cache field_cache

  if isempty(allStat)
    WD = pwd; cd(amp_data_dir()); load allStat; cd(WD);
    entries_cache = fieldnames(allStat);
    field_cache   = containers.Map('KeyType', 'char', 'ValueType', 'any');
    n_entries = numel(get_taxonomy_cache().species_list('Animalia'));
    if length(entries_cache) ~= n_entries
      fprintf('Warning from read_allStat: allStat has %d fields, but the taxa list has %d entries\n', length(entries_cache), n_entries)
      date_check;
    end
  end
  if isempty(allUnits)
    WD = pwd; cd(amp_data_dir()); load allUnits; cd(WD);
  end
  if isempty(allLabel)
    WD = pwd; cd(amp_data_dir()); load allLabel; cd(WD);
  end

  entries = entries_cache; n_fields = length(entries);

  if iscell(varargin{1})
    varargin = varargin{:};
  end
  nargin = length(varargin);
  var = cell(n_fields, nargin);
  units = cell(nargin,1); label = cell(nargin,1);

  for j = 1:nargin
    fld = varargin{j};
    if isKey(field_cache, fld)
      var(:,j) = field_cache(fld);
    else
      col = cell(n_fields, 1);
      for i = 1:n_fields
        entry_i = allStat.(entries{i});
        if isfield(entry_i, fld)
          col{i} = entry_i.(fld);
        else
          col{i} = NaN;
        end
      end
      field_cache(fld) = col;
      var(:,j) = col;
    end
    if isfield(allUnits, fld)
      units{j} = allUnits.(fld);
      label{j} = allLabel.(fld);
    end
  end

  % convert cell array to numerical array if possible
  num = 0;
  for j = 1:nargin
    num = num + isnumeric(var{1,j});
  end
  if num == nargin
    var = cell2mat(var);
  end

end

