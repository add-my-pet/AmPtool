%% legend_fish
% specification of a legend for fish

%
function legend = legend_fish
% created at 2016/04/23 by Bas Kooijman

  %% Syntax
  % legend = <legend_fish.m *legend_fish*>

  %% Description
  % Specifies a legend for fish
  %
  % Output
  %
  % * legend: (7,2) cell matrix with (marker, taxon)-pairs

  % type, size, linewidth, edge color and face color of a marker, taxon
  legend = {...
    {'o', 8, 3, [0 0 0], [0 0 1]}, 'Cyclostomata'; ...
    {'o', 8, 3, [0 0 1], [1 0 1]}, 'Chondrichthyes'; ....
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Actinopterygii'; ....
    {'o', 8, 3, [1 0 0], [1 0 1]}, 'Latimeria'; ....
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Dipnoi'; ....
    {'.', 8, 3, [1 0 0], [0 0 0]}, 'Vertebrata'; ....
    {'.', 8, 3, [0 0 0], [0 0 0]}, 'Animalia'; ....
  };
end
