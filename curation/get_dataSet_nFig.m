%% get_dataSet_nFig
% fills global dataSet_nFig

%%
function get_dataSet_nFig(data, auxData, metaData)
% created  2023/03/11 by Bas Kooijman

%% Syntax
% <../get_dataSet_nFig.m *get_dataSet_nFig*>(data, auxData, metaData) 

%% Description
% Fills global dataSet_nFig: 
%   (n,2)-cell array with name of data set to plot and fig-number or, cell with fig-number and fig-number_legend
%
% Input
% 
% * data: structure with data for species
% * auxData: structure with auxilliairy data that is required to compute predictions of data (e.g. temperature, food.). 
% * metaData: structure with information on the entry

  global dataSet_nFig
  
  dataSet_nFig = cell(0,2);     
  txt0 = '0'; % text to prepend to figure counter if counter < 10 (for intuitive listing sequence in the directory)
  counter_fig = 0; % initiate figure counter

  nm = fields(data); nm(end)=''; % remove psd
  n = length(nm); sel = zeros(n,1);
  for i = 1:n
    sel(i) = (size(data.(nm{i}),2) > 1);
  end
  nm = nm(sel>0); n = length(nm); % field names of uni-, bi- and tri-variate data sets

  if isfield(metaData, 'grp') % grouped plots
    grpSets = metaData.grp.sets; n_grpSets = length(grpSets);
    for ii = 1:n_grpSets % scan the group-sets
      counter_fig = counter_fig + 1; allSetsInGroup = {};
      nFig = [txt0(counter_fig < 10), num2str(counter_fig)]; 
      nms = metaData.grp.sets{ii}; n_nms = length(nms); % names of data sets in group set ii
      allSetsInGroup = [allSetsInGroup, nms];  
      for jj = 1:n_nms % scan names of data sets in group set ii 
        dataSet_nFig = [dataSet_nFig; {nms{jj}, {nFig, [nFig,'_legend']}}];
      end
    end % end of all grp plots   
    nm = setdiff(nm, allSetsInGroup); n = length(nm); % remove all nms that were already in grp plot
  end

  for i = 1:n % non-grouped plots
    counter_fig = counter_fig + 1; 
    nFig = [txt0(counter_fig < 10), num2str(counter_fig)]; 
    if isfield(auxData,'treat') && isfield(auxData.treat,(nm{i})) && auxData.treat.(nm{i}){1} < 2
      dataSet_nFig = [dataSet_nFig; {nm{i}, {nFig, [nFig,'_legend']}}]; 
    else
      dataSet_nFig = [dataSet_nFig; {nm{i}, nFig}];
    end
  end       
  
 
