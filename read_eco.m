%% read_eco
% read eco codes in allEco.mat for specified entries

%%
function codes = read_eco(entries, varargin)
% created 2018/05/10 by Bas Kooijman, modified 2019/12/29

%% Syntax
% codes = <../read_eco.m *read_eco*>(entries, varargin)

%% Description
% Reads eco-codes in allEco.mat for specified entries. 
%
% Input:
%
% * entries: n-cell string with names of entries
% * varargin: names of variables or cell-string with names of variables
%
% Output
%
% * codes: (n,x)-cell-array with codes

%% Remarks
% * Use <read_allEco.html *read_allEco*> to include all entries.
% * See also <prt_ecoCodes.html *prt_ecoCodes*> to print a table with ecoCodes.

%% Example of use
% embryo = read_eco(select('Aves'), 'embryo'); 
  
  persistent allStat
  
  if ~exist('allStat','var') || length(allStat) == 0
    load('allstat')        % get all parameters and statistics in structure allStat
  end
  
  n_fields = length(fields(allStat)); load('n_entries', 'n_entries');
  if ~(n_fields == n_entries)
    fprintf(['Warning from read_eco: allStat has ', num2str(n_fields), ' fields, but the lists-of-lists have ', num2str(n_entries), ' entries\n'])
    date_check;
  end
  
  n = length(entries); 
  if iscell(varargin{1})    
    varargin = varargin{:}; % unpack cell string
  end
  nargin = length(varargin);
  
  for j = 1:nargin
    if ~ismember(varargin{j}, {'climate', 'ecozone', 'habitat', 'embryo', 'migrate', 'food', 'gender', 'reprod'})
      fprintf (['Error in read_eco: variable "', varargin{j}, '" is not recognized\n']);
      codes = [];  return
    end
  end

  codes = cell(n,nargin);
  
  for i = 1:n
    for j = 1:nargin
      try
        codes{i,j} = allStat.(entries{i}).ecoCode.(varargin{j});
      catch
        feval(['[~, ~, metaData, ~, ~] = mydata_', entries{i}])
        codes{i,j} = metaData.ecoCode.(varargin{j});
      end
    end
  end
  
