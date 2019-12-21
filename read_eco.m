%% read_eco
% read eco codes in allEco.mat for specified entries

%%
function codes = read_eco(entries, varargin)
% created 2018/05/10 by Bas Kooijman

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
% Use <read_allEco.html *read_allEco*> to include all entries.

%% Example of use
% embryo = read_eco(select('Aves'), 'embryo'); 
  
  persistent allEco
  
  if ~exist('allEco','var') || length(allEco) == 0
    load('allEco')        % get all parameters and statistics in structure allStat
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
      codes{i,j} = allEco.(entries{i}).(varargin{j});
    end
  end
  
