%% check_results
% checks parameters in results_my_pet.mat versus pars_init_my_pet.m and allStat.mat

%%
function [diff_0, diff_1] = check_results(varargin)
% created 2021/05/10 by Bas Kooijman

%% Syntax
% [diff_0, diff_1] = <../check_results.m *check_results*> (varargin)

%% Description
% checks parameters in results_my_pet.mat against pars_init_my_pet.m and allStat.mat
%
% Input:
%
% * varargin: optional cell array with entry names, or character string with entry or node names (default 'Animalia')
%
% Output:
%
% * diff_0: cell-string with names of entries for which results_my_pet.mat differs from pars_init_my_pet.m 
% * diff_1: cell-string with names of entries for which results_my_pet.mat differs from allStat.mat

%% Remarks
% if an entry is not in allStat, the check is skipped without notice

%% Example of use
% * [d0, d1] = check_results('Mola_mola') or
% * [d0, d1] = check_results('Mola_mola', 'Molva_molva') or
% * [d0, d1] = check_results({'Mola_mola', 'Molva_molva'}) or 
% * [d0, d1] = check_results('Clitellata');

  persistent allStat
  
if ~exist('allStat','var') || length(allStat) == 0
  WD = cdAmPdata; load('allStat'); cd(WD); % get all parameters and statistics in structure allStat
end

if isempty(varargin)
  varargin = select('Animalia');
elseif ~iscell(varargin{1}) && isempty(strfind(varargin{1},'_'))
  varargin = select(varargin{1});
elseif iscell(varargin{1})    
  varargin = varargin{:}; % unpack cell string  
end

nargin = length(varargin); % number of entries to scan    
WD = cdEntr(varargin{1}); % path setting for curators 
diff_0 = cell(0,1); diff_1 = cell(0,1); % prepare output

for i = 1:nargin 
  cd(['../',varargin{i}])
  
  fprintf([num2str(i), ': ', varargin{i},'\n'])

  load(['results_', varargin{i}], 'par','metaData');
  [par_pi, ~, ~] = feval(['pars_init_',varargin{i}],metaData); 
  par_pi = rmfield(par_pi,'free'); flds = fields(par_pi); 
  n_flds = length(flds);
  
  sum_0 = 0; sum_1 = 0;
  for j = 1:n_flds
    sum_0 = sum_0 + abs(par_pi.(flds{j}) - par.(flds{j})); 
    if isfield(allStat,varargin{i})
      sum_1 = sum_1 + abs(par_pi.(flds{j}) - allStat.(varargin{i}).(flds{j}));  
    end
  end
  
  if sum_0 > 1e-4
    diff_0 = [diff_0; varargin{i}];
    fprintf(['Warning from check_results: parameters in results and pars_init differ for ', varargin{i}, '\n']);
  end
  
  if sum_1 > 1e-8
    diff_1 = [diff_1; varargin{i}];
    fprintf(['Warning from check_results: parameters in results and allStat differ for ', varargin{i}, '\n']);
  end
end

cd(WD);
