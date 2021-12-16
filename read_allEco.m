%% read_allEco
% read eco-codes in allEco.mat

%%
function [codes, entries] = read_allEco(varargin)
% created 2018/05/10 by Bas Kooijman

%% Syntax
% [codes, entries] = <../read_allEco.m *read_allEco*>(varargin)

%% Description
% read eco-codes in allStat. Possible arguments are: climate, ecozone, habitat, embryo, migrate, food, gender, reprod.
%
% Input:
%
% * varargin: names of variables or cell-string with names of variables
%
% Output
%
% * codes: (n,x)-cell-array with codes
% * entries: n-cell string with names of entries

%% Remarks
% Field migrate can be empty in case of no migration or torpor.

%% Example of use
% gender_embryo = read_allEco('gender', 'embryo'); 
% gender = read_allEco('gender'); [sel, nm] = select_01('Testudines'); prt_tab({nm(sel), gender(sel)});
  
  persistent allStat

  if ~exist('allStat','var') || length(allStat) == 0
    load('allStat','allStat') % get all parameters and statistics in structure allStat
  end

  entries = fieldnames(allStat); n = length(entries); 
  load('n_taxa', 'n_taxa');
  if ~(n==n_taxa)
    fprintf(['Warning from read_allEco: allStat has ', num2str(n), ' fields, but the lists-of-lists have ', num2str(n_taxa), ' names\n'])
  end

  if iscell(varargin{1})    
    varargin = varargin{:}; % unpack cell string
  end
  nargin = length(varargin);    
  
  for j = 1:nargin
    if ~ismember(varargin{j}, {'climate', 'ecozone', 'habitat', 'embryo', 'migrate', 'food', 'gender', 'reprod'})
      fprintf (['Error in read_allEco: variable "', varargin{j}, '" is not recognized\n']);
      codes = [];  entries = []; return
    end
  end

  codes = cell(n,nargin);
  
  for i = 1:n
    for j = 1:nargin
      codes{i,j} = allStat.(entries{i}).ecoCode.(varargin{j});
    end
  end
      
