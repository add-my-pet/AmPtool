%% select_legend_eco
% graphical user interface for setting legend using eco-codes for a given taxon

%%
function legend = select_legend_eco(legend, taxon)
% created 2018/05/30 by Bas Kooijman

%% Syntax
% legend = <../select_legend_eco.m *select_legend_eco*> (legend, taxon)

%% Description
% Select or edit a legend using eco-codes for a given taxon, such as 'Animalia' or 'Aves'.
% The types of codes are coded as
%
%   C climate 
%   E ecozone
%   H habitat 
%   E embryo environment
%   M migration/torpor 
%   F food
%   G gender
%   R reproduction
%
% Selections of several codes from a type are possible using keys Ctrl or Shift, see <select_ecoCode.html *select_ecoCode*>.
% The active item is indicated and can be changed with button #. 
% Edit maker specs with button marker and taxon name with button taxon.
% Edit the sequence with buttons v and ^, insert with >, remove with x. 
%
% Input:
%
% * legend: optional (n,2)-matrix with markers (5-vector of cells) and eco-codes (cell string)
% * taxon: character string with name of taxon
%
% Output: 
% 
% * legend: (m,2)-matrix with markers (5-vector of cells) and eco-codes (string)

%% Remarks
% Press any key when done.
% Calls <../../lib/misc/html/select_marker.html *select_marker*> to edit markers.

%% Example of use
% legend = select_legend;

  global legend_local i_legend Hlegend
  
  if ~exist('taxon','var')
    taxon = 'Animalia';
  end
  
  if ~exist('legend', 'var') || isempty(legend)
    legend_local = { ...
        {'o', 10, 2, [1 0 0], [1 0 0]}, {'C.MA'}; ...
        {'o', 10, 2, [1 0 1], [1 0 1]}, {'C.MB'}; ...
        {'o', 10, 2, [0 0 1], [0 0 1]}, {'C.MC'}; ...
        {'o', 10, 2, [0 0 0], [0 0 0]}, {'C.ME'}; ...
        };
  else
    legend_local = legend;
  end

  i_legend = size(legend_local,1); % default index of active item
  x = 30; y = 10; % lower-left corner of button block
  dx = 60;        % width of button
  HFig_legend = figure('Position', [500, 400, 8*dx, dx]); % initiate fig with buttons
  
  % Component
  Hnr     = uicontrol('Style','pushbutton',...
           'String', '#',...
           'Position',[x,y,.9*dx,.5*dx], ...
           'Callback', @nr_Callback);
  Hmarker = uicontrol('Style','pushbutton',...
           'String', 'marker',...
           'Position',[x+dx,y,.9*dx,.5*dx], ...
           'Callback', @marker_Callback);
  HecoCode = uicontrol('Style','pushbutton',...
           'String', 'eco-code', ...
           'Position',[x+2*dx,y, .9*dx,.5*dx], ...
           'Callback', @ecoCode_Callback);
  Hup   = uicontrol('Style','pushbutton',...
           'String', '^', ...
           'Position',[x+3*dx,y,.9*dx,.5*dx], ...
           'Callback', @up_Callback);    
  Hdown  = uicontrol('Style','pushbutton', ...
           'String','v',...
           'Position',[x+4*dx,y,.9*dx,.5*dx], ...
           'Callback', @down_Callback);
  Hinsert  = uicontrol('Style','pushbutton', ...
           'String','<',...
           'Position',[x+5*dx,y,.9*dx,.5*dx], ...
           'Callback', @insert_Callback);
  Hremove  = uicontrol('Style','pushbutton', ...
           'String','x',...
           'Position',[x+6*dx,y,.9*dx,.5*dx], ...
           'Callback', @remove_Callback);
%   OK       = uicontrol('Style','pushbutton', ...
%            'String','OK',...
%            'Position',[x+7*dx,y,.9*dx,.5*dx], ...
%            'Callback', 'uiresume(gcbf)');

  Hlegend = shlegend(legend_local,[],[],'',i_legend);
  %uiwait(gcf)
  pause
 
  close (HFig_legend); close(Hlegend);
  legend = legend_local; % export to output
end

% %%% subfunctions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function C = nr_Callback(source, eventdata) 
      global legend_local i_legend Hlegend
      list = {num2str((1:size(legend_local,1))')};
      i_legend = listdlg('PromptString', 'Select #', 'ListString', list, 'Selectionmode', 'single', 'InitialValue', i_legend);
      close(Hlegend); Hlegend = shlegend(legend_local,[],[],'',i_legend);
    end
    function C = marker_Callback(source, eventdata) 
      global legend_local  i_legend Hlegend
      legend_local{i_legend,1} = select_marker(legend_local{i_legend,1}); 
      close(Hlegend); Hlegend = shlegend(legend_local,[],[],'',i_legend);
    end
    function C = ecoCode_Callback(source, eventdata) 
      global legend_local  i_legend Hlegend
      legend_local{i_legend,2} = select_ecoCode;
      close(Hlegend); Hlegend = shlegend(legend_local,[],[],'',i_legend);
    end
    function C = up_Callback(source, eventdata) 
      global legend_local  i_legend Hlegend
      if i_legend > 1
        legend_local([i_legend-1, i_legend],:) = legend_local([i_legend, i_legend-1],:);
        i_legend = i_legend - 1; 
     end
      close(Hlegend); Hlegend = shlegend(legend_local,[],[],'',i_legend);
    end
    function C = down_Callback(source, eventdata) 
      global legend_local i_legend Hlegend
      if i_legend < size(legend_local,1)
        legend_local([i_legend, i_legend+1],:) = legend_local([i_legend+1, i_legend],:);
        i_legend = i_legend + 1; 
      end
      close(Hlegend); Hlegend = shlegend(legend_local,[],[],'',i_legend);
    end
    function C = insert_Callback(source, eventdata) 
      global legend_local i_legend Hlegend
      N = (1:size(legend_local,1))'; % index-vector of legend items
      item = {{'.', 12, 4, [0 0 0], [0 0 0]}, 'Animalia'}; % default marker, taxon
      legend_local = [legend_local(N<i_legend,:); item; legend_local(N>=i_legend,:)];
      close(Hlegend); Hlegend = shlegend(legend_local,[],[],'',i_legend);
    end
    function C = remove_Callback(source, eventdata) 
      global legend_local i_legend Hlegend
      n = size(legend_local,1); N = (1:n)'; 
      legend_local = legend_local(~(N==i_legend),:);
      i_legend = max(1, i_legend - 1);
      close(Hlegend); Hlegend = shlegend(legend_local,[],[],'',i_legend);
    end