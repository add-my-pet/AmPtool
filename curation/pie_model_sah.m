%% pie_model_sah
% counts number of entries of the various model types

%%
function [n model index] = pie_model_sah 
%% created 2016/02/21 by Bas Kooijman

%% Syntax
% [n model index] = <../pie_model_sah.m *pie_model_sah*> (taxon)

%% Description
% The frequency of the various models in the add_my_pet collection are counted and the result is presented in a pie
%
% Output (apart from figure):
% 
% * n: nm-vector containing model counts in taxa
% * model: nm-vector with names of models
% * index: (ne,nm) binary matrix with models of each of ne members of the taxon

%% Remarks
% * sum(n) = total number of animal species in the add_my_pet collection
% * about_add_my_pet make a plot of this

%% Example of use
% [n model index] = pie_model;

  model = {'std', 'stf', 'stx', 'ssj', 'sbp', 'abp', 'abj', 'asj', 'hep', 'hex'};
  [models entries] = read_allStat('model');
   
  ne = length(entries); nm = length(model); index = zeros(ne,nm);
  for i = 1:ne
    index(i,:) = strcmp(model,models{i}); 
  end
  n = sum(index,1);
  
  txt = {'s-models'; 'a-models'; 'h-models'}; y = zeros(3,1);
  y(1) = sum(n(1:5)); y(2) = sum(n([6,7,8])); y(3) = sum(n([9,10]));
  % pie3s(y, 'Bevel', 'Elliptical', 'Labels', txt);
  pie(y, txt);

  if ~(sum(n) == ne)
    fprintf('Warning: model types need updating')
  end
end

