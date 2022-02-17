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
  
  persistent allStat allUnits allLabel
  
  if isempty(allStat) % ~exist('allStat','var') || isempty(allStat) 
    WD = cdAmPdata; load allStat; cd(WD); % get all parameters and statistics in structure allStat
  end
  if isempty(allUnits) %~exist('allUnits','var') || isempty(allUnits)
    WD = cdAmPdata; load allUnits; cd(WD); % get all units in structure allUnits
  end
  if isempty(allLabel) %~exist('allLabel','var') || isempty(allLabel)
    WD = cdAmPdata; load allLabel; cd(WD); % get all labels in structure allLabel
  end
  
  entries = fieldnames(allStat); n_fields = length(entries);
  load('n_entries', 'n_entries');
  if ~(n_fields == n_entries)
    fprintf(['Warning from read_allStat: allStat has ', num2str(n_fields), ' fields, but the lists-of-lists have ', num2str(n_entries), ' entries\n'])
    date_check;
  end

  if iscell(varargin{1})    
    varargin = varargin{:}; % unpack cell string
  end
  nargin = length(varargin);    
  var = cell(n_fields,nargin);
  units = cell(nargin,1); label = cell(nargin,1);
  
  for i = 1:n_fields
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
      

