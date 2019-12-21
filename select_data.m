%% select_data
% selects taxa with a particular combination of data and models

%%
function [taxa, model, exact, sel] = select_data (data, model)
% created 2018/01/12 by Bas Kooijman, modified 2018/05/10

%% Syntax
% [taxa, models, exact, sel] = <../select_data.m *select_data*> (data, model)

%% Description
% selects taxa with a particular combination of data and models
%
% Input:
% 
% * data: cell string with combination of data
% * model: optional cell string with models (default: all)
%
% Output: 
% 
% * taxa: cell string with names of taxon
% * model: cell string with names of corresponding models
% * exact: vector of booleans if the match is exact, meaning that that entry has no more data
% * sel: vector of booleans that indicate selection in the whole collection of entries

%% Remarks
% Sequence of data is ignored; zero- and uni-variate data can be mixed.
% All data elements must be typified names, as mentioned in DEBwiki; if data is an empty cell string, entries are only selected on the basis of model.
% All model names must be typified model.

%% Example of use
% select_data({'ab'; 'am'; 'Ww-N'})

if ~exist('model','var')
  [n_model model] = check_model('std'); n_model = length(model);
else
  if ~iscell(model)
    model = {model};
  end
  n_model = length(model); sel_model = ones(n_model,1);
  for i = 1:n_model
    if ~check_model(model{i})
      printf(['warning from select_data: ', model{i}, ' is not a typified model\n'])
      sel_model(i) = 0;
    end
  end
  model = model(sel_model); n_model = length(model);
end
   
[allData entries] = read_allStat('data', 'model'); n_entries = length(entries); sel = false(n_entries,1); exact = false(n_entries,1);
for i = 1:n_entries
   seli = setdiff(data, allData{i,1});
   if isempty(seli) && ismember(allData(i,2), model)
     sel(i) = true;
     if isempty(setdiff(allData{i,1}, data))
       exact(i) = true;
     end
   end
end

taxa = entries(sel); model = allData(sel, 2); exact = exact(sel);
