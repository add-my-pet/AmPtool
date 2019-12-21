%% pie_model
% counts number of entries of the various model types

%%
function [n model index] = pie_model 
%% created 2016/02/21 by Bas Kooijman

%% Syntax
% [n model index] = <../pie_model.m *pie_model*> (taxon)

%% Description
% The frequency of the various models in the add_my_pet collection are counted and the result is presented in a pie
%
% Output (apart from figure):
% 
% * n: nm-vector containing model counts in taxa
% * model: nm-vector with names of models
% * index: (ne,nm) binary matrix with models of each of ne members of the taxon

%% Remarks
% sum(n) = total number of animal species in the add_my_pet collection
% about_add_my_pet make a plot of this

%% Example of use
% [n model index] = pie_model;

  model = {'std', 'stf', 'stx', 'ssj', 'sbp', 'abp', 'abj', 'asj', 'hep', 'hex'};
  [models entries] = read_allStat('model');
   
  ne = length(entries); nm = length(model); index = zeros(ne,nm);
  for i = 1:ne
    index(i,:) = strcmp(model,models{i}); 
  end
  n = sum(index,1);
  
  txt = model; y = n; 
  y(9) = y(9) + y(10); txt{9} = 'hep+hex'; y(10) = []; txt(10) = [];
  y(7) = y(7) + y(8);  txt{7} = 'abj+asj'; y(8)  = []; txt(8)  = [];
  y(5) = y(5) + y(6);  txt{5} = 'sbp+abp'; y(6)  = []; txt(6)  = [];
  %pie3s(y, 'Bevel', 'Elliptical', 'Labels', txt);
  pie(y, txt);

  if ~(sum(n) == ne)
    fprintf('Warning: model types need updating')
  end
end

