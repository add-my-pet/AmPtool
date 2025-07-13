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
  % * legend: (7,2) cell matrix with (marker, taxon)-pairs

  % type, size, linewidth, edge color and face color of a marker, taxon
      legend = {...
        {'o', 8, 3, [0 0 0], [0 0 0]}, 'Radiata'
        {'o', 8, 3, [0 0 1], [0 0 1]}, 'Xenacoelomorpha'
        {'o', 8, 3, [0 0 1], [0 0 1]}, 'Spiralia'
        {'o', 8, 3, [1 0 1], [1 0 1]}, 'Ecdysozoa'
        {'o', 8, 3, [1 0 0], [1 0 0]}, 'Echinodermata'
        {'o', 8, 3, [1 0 0], [1 0 1]}, 'Cephalochordata'
        {'o', 8, 3, [1 0 0], [0 0 1]}, 'Tunicata'
      };
end

