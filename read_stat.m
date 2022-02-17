%% read_stat
% read statistics and/or parameters in allStat.mat for specified entries

%%
function [var, units, label] = read_stat(entries, varargin)
% created 2018/01/17 by Bas Kooijman

%% Syntax
% [var units label] = <../read_stat.m *read_stat*>(entries, varargin)

%% Description
% read statistics and/or parameters in allStat.mat for specified entries. 
%
% Input:
%
% * entries: string with name of taxon or n-cell string with names of entries
% * varargin: names of variables or cell-string with names of variables
%
% Output
%
% * var: (n,x)-matrix with values of variables or cell-array if some variable is not numerical 
% * units: cell string with units of variables
% * label: cell string with description of variables

%% Remarks
% Make sure that allStat has been generated at the correct temperature; 
% All parameters are at T_ref, the statistics at T or T_typical, see <write_allStat.html *write_allStat*>.
% Print all to html: prt_tab({'Testudines', read_stat('Testudines', 'Ww_i')},{'Testudines', 'Ww_i'})
% Put core parameters in a structure with <read_pars.html *read_pars*>
% Use <read_allStat.html *read_allStat*> to include all entries.

%% Example of use
% complete_mre = read_stat(select('Aves'), 'COMPLETE', 'MRE'); 
  
  persistent allStat allUnits allLabel
  
  if ~exist('allStat','var') || isempty(allStat)
    load 'allStat'         % get all parameters and statistics in structure allStat
  end
  if ~exist('allUnits','var') || isempty(allUnits)
    load 'allUnits'        % get all units in structure allUnits
  end
  if ~exist('allLabel','var') || isempty(allLabel)
    load 'allLabel'        % get label in structure allLabels
  end
  
  if ~iscell(entries) % entries is name of taxon rather than a cell string
    entries = select(entries);
  end
  
  n = length(entries); 
  load('n_entries', 'n_entries'); n_fields = length(fields(allStat));
  if ~(n_fields == n_entries)
    fprintf(['Warning from read_stat: allStat has ', num2str(n_fields), ' fields, but the lists-of-lists have ', num2str(n_entries), ' entries\n'])
    date_check;
  end

  if iscell(varargin{1})    
    varargin = varargin{:}; % unpack cell string
  end
  nargin = length(varargin);    
  var = cell(n,nargin);
  units = cell(nargin,1); label = cell(nargin,1);
  
  for i = 1:n
    for j = 1:nargin
      if isfield(allStat.(entries{i}), varargin{j})
        var{i,j} = allStat.(entries{i}).(varargin{j});
        units{j} = allUnits.(varargin{j});
        label{j} = allLabel.(varargin{j});
      else
        var{i,j} = NaN; 
      end
    end
  end
  
  % convert cell array to numerical array if possible
  num = 0;
  for j = 1:nargin
    num = num +  isnumeric(var{1,j});
  end
  if num == nargin
    var = cell2mat(var);
  end
  
