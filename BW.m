%% BW
% converts legend with colours to that in black-and-white

%%
function legend = BW (legend)
%% created 2018/06/02 by Bas Kooijman

%% Syntax
% legend = <../BW.m *BW*> (legend)

%% Description
% converts legend with colours to that in black-and-white
%
% Input:
% 
% * legend: (n,2) cell-array as produced by <select_legend.html *select_legend*> or  <select_legend_eco.html *select_legend_eco*>
%
% Output: 
% 
% * legend: (n,2) cell-array as in input, but colors are removed

%% Remarks
% If legend is already in black and white, input equals output. 

%% Example of use
% legend = BW(select_legend)

n = size(legend,1);
for i = 1:n
  marker = legend{i,1};
  legend{i,1} = marker(1:3);
end