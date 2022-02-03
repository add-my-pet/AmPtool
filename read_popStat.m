%% read_popStat
% read statistics and/or parameters in popStat.mat

%%
function [var, entries] = read_popStat(varargin)
% created 2019/08/04 by Bas Kooijman, modified 2019/12/24

%% Syntax
% [var, entries] = <../read_popStat.m *read_popStat*>(varargin)

%% Description
% read statistics and/or parameters in popStat.mat, specifying scaled functional response (f0, ff or f1), thinning (thin0 or thin1), gender (f or m) and statistic.
% popStat is a structure with the entry-names as first-level fieldnames,
% while temperature (T), temperature correction factor (c_T) and scaled functional responses (f0, ff or f1) are second-level fieldnames.
%
% Input:
%
% * varargin: names of variables or cell-string with names of variables
%
% Output
%
% * var: (n,x)-matrix with values of variables or cell-array if some variable is not numerical 
% * entries: n-cell string with names of entries

%% Remarks
% If particular field don't exist, empty is outputted 

%% Example of use
% [r, nm] = read_popStat('f1.thin0.f.r','c_T'); 
  
  persistent popStat
  
  if ~exist('popStat','var') || isempty(popStat)
    load('popStat','popStat');  % get all parameters and statistics in structure popStat
  end
  
  entries = fieldnames(popStat); n_fields = length(entries); 
  if iscell(varargin{1})    
    varargin = varargin{:}; % unpack cell string
  end
  nargin = length(varargin);    
  var = cell(n_fields,nargin); 
  
  load('n_entries', 'n_entries');
  if ~(n_fields == n_entries)
    fprintf(['Warning from read_popStat: popStat has ', num2str(n_fields), ' fields, but the lists-of-lists have ', num2str(n_entries), ' entries\n'])
    date_check;
  end

  %entries = {'Terrapene_carolina'}; n=1; nargin=1; var=cell(1,1);
    
  for i = 1:n_fields
    for j = 1:nargin
      str = split(varargin{j},'.'); n_str = length(str);
      if n_str == 4 
        if isfield(popStat.(entries{i}),(str{1})) && ...
           isfield(popStat.(entries{i}).(str{1}),(str{2})) && ...
           isfield(popStat.(entries{i}).(str{1}).(str{2}),(str{3})) && ...
           isfield(popStat.(entries{i}).(str{1}).(str{2}).(str{3}),(str{4}))
          var{i,j} = popStat.(entries{i}).(str{1}).(str{2}).(str{3}).(str{4});
        else
          var{i,j} = []; 
        end
      else
        if isfield(popStat.(entries{i}),(varargin{j}))
          var{i,j} = popStat.(entries{i}).(varargin{j});
        else
          var{i,j} = []; 
        end
      end
    end
  end
  
  i = ~cellfun(@isempty,var); i = i(:,1); var = var(i); entries = entries(i); 
  var = cell2mat(var);
  
  % convert cell array to numerical array if possible
%   num = 0;
%   for j = 1:nargin
%     num = num +  isnumeric(var{1,j});
%   end
%   if num == nargin
%     var = cell2mat(var);
%   end
  
