%% select_llegend
% graphical user interface for setting legend for line plots

%%
function legend = select_llegend(legend)
% created 2017/04/20 by Bas Kooijman

%% Syntax
% legend = <../select_llegend.m *select_llegend*> (legend)

%% Description
% Select or edit a legend for line plots; the active item is indicated and can be changed with button #. 
% Edit line specs with button line and taxon name with button taxon.
% Edit the sequence with buttons v and ^, insert with >, remove with x. 
% The sequence matters if lines will be plotted on top of each other.
%
% Input:
%
% * legend: optional (n,2)-matrix with lines (3-vector of cells) and taxa (string)
%
% Output: 
% 
% * legend: (m,2)-matrix with lines (3-vector of cells) and taxa (string)

%% Remarks
% Press any key when done.
% Calls <../../lib/misc/html/select_line.html *select_line*> to edit lines.

%% Example of use
% legend = select_llegend;

  global legend_local i_legend Hlegend
  
  if ~exist('legend', 'var')
    legend_local = { ...
        {'-'; 2; [0 0 1]}, 'Protostomata'; ...
        {'-'; 2; [1 0 0]}, 'Chordata'; ...
        {'-'; 2; [0 0 0]}, 'Animalia'; ...
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
  Hline  = uicontrol('Style','pushbutton',...
           'String', 'line',...
           'Position',[x+dx,y,.9*dx,.5*dx], ...
           'Callback', @line_Callback);
  Htaxon   = uicontrol('Style','pushbutton',...
           'String', 'taxon', ...
           'Position',[x+2*dx,y, .9*dx,.5*dx], ...
           'Callback', @taxon_Callback);
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

  Hlegend = shllegend(legend_local,[],[],'',i_legend);
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
      close(Hlegend); Hlegend = shllegend(legend_local,[],[],'',i_legend);
    end
    function C = line_Callback(source, eventdata) 
      global legend_local  i_legend Hlegend
      legend_local(i_legend,1) = {select_line(legend_local{i_legend,1})}; 
      close(Hlegend); Hlegend = shllegend(legend_local,[],[],'',i_legend);
    end
    function C = taxon_Callback(source, eventdata) 
      global legend_local  i_legend Hlegend
      legend_local(i_legend,2) = {select_taxon};
      close(Hlegend); Hlegend = shllegend(legend_local,[],[],'',i_legend);
    end
    function C = up_Callback(source, eventdata) 
      global legend_local  i_legend Hlegend
      if i_legend > 1
        legend_local([i_legend-1, i_legend],:) = legend_local([i_legend, i_legend-1],:);
        i_legend = i_legend - 1; 
     end
      close(Hlegend); Hlegend = shllegend(legend_local,[],[],'',i_legend);
    end
    function C = down_Callback(source, eventdata) 
      global legend_local i_legend Hlegend
      if i_legend < size(legend_local,1)
        legend_local([i_legend, i_legend+1],:) = legend_local([i_legend+1, i_legend],:);
        i_legend = i_legend + 1; 
      end
      close(Hlegend); Hlegend = shllegend(legend_local,[],[],'',i_legend);
    end
    function C = insert_Callback(source, eventdata) 
      global legend_local i_legend Hlegend
      N = (1:size(legend_local,1))'; % index-vector of legend items
      item = {{'-', 2, [0 0 0]}, 'Animalia'}; % default marker, taxon
      legend_local = [legend_local(N<i_legend,:); item; legend_local(N>=i_legend,:)];
      close(Hlegend); Hlegend = shllegend(legend_local,[],[],'',i_legend);
    end
    function C = remove_Callback(source, eventdata) 
      global legend_local i_legend Hlegend
      n = size(legend_local,1); N = (1:n)'; 
      legend_local = legend_local(~(N==i_legend),:);
      i_legend = max(1, i_legend - 1);
      close(Hlegend); Hlegend = shllegend(legend_local,[],[],'',i_legend);
    end