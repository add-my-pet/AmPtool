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
% * Field migrate can be empty in case of no migration or torpor.
% * See also <prt_ecoCodes.html *prt_ecoCodes*> to print a table with ecoCodes.

%% Example of use
% gender_embryo = read_allEco('gender', 'embryo'); 
% gender = read_allEco('gender'); [sel, nm] = select_01('Testudines'); prt_tab({nm(sel), gender(sel)});
  
  persistent allStat entries_cache

  if isempty(allStat)
    WD = pwd; cd(amp_data_dir()); load('allStat', 'allStat'); cd(WD);
    entries_cache = fieldnames(allStat);
    n_entries = numel(get_taxonomy_cache().species_list('Animalia'));
    if length(entries_cache) ~= n_entries
      fprintf('Warning from read_allEco: allStat has %d fields, but the taxa list has %d entries\n', length(entries_cache), n_entries)
      date_check;
    end
  end

  entries = entries_cache; n_fields = length(entries);

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

  codes = cell(n_fields,nargin);
  
  for i = 1:n_fields
    for j = 1:nargin
      codes{i,j} = allStat.(entries{i}).ecoCode.(varargin{j});
    end
  end
      
