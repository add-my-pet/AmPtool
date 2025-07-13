%% legend_invert
% specification of legend for invertebrates

%
function legend = legend_invert
% created at 2025/07/08 by Bas Kooijman

  %% Syntax
  % legend = <legend_invert.m *legend_invert*>

  %% Description
  % Specifies a legend for invertebrates
  %
  % Output
  %
  % * legend: (11,2) cell matrix with (marker, taxon)-pairs

  % type, size, linewidth, edge color and face color of a marker, taxon
      legend = {...
        {'o', 8, 3, [0 0 0], [0 0 0]}, 'Cyclostomata'
        {'o', 8, 3, [0 0 1], [0 1 1]}, 'Chondrichthyes'
        {'o', 8, 3, [0 0 1], [0 0 0]}, 'Actinopterygii'
        {'o', 8, 3, [0 0 1], [1 0 1]}, 'Latimeria'
        {'o', 8, 3, [0 0 1], [1 0 0]}, 'Dipnoi'
        {'o', 8, 3, [1 0 1], [0 1 1]}, 'Amphibia'
        {'o', 8, 3, [1 0 1], [1 0 1]}, 'Lepidosauria'
        {'o', 8, 3, [1 0 0], [1 0 0]}, 'Aves'
        {'o', 8, 3, [1 0 0], [0 0 1]}, 'Archelosauria'
        {'o', 8, 3, [1 .5 .5], [1 .5 .5]}, 'Mammalia'
        %{'.', 8, 3, [0 0 0], [0 0 0]}, 'Animalia'
      };
end

