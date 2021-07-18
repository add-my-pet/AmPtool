%% legend_tetra
% specification of legend for tetrapods

%
function legend = legend_tetra
% created at 2017/05/14 by Bas Kooijman

  %% Syntax
  % legend = <legend_tetra.m *legend_tetra*>

  %% Description
  % Specifies a legend for tetrapods
  %
  % Output
  %
  % * legend: (11,2) cell matrix with (marker, taxon)-pairs

  % type, size, linewidth, edge color and face color of a marker, taxon
  legend = {...
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Amphibia'
    {'o', 8, 3, [1 0 1], [0 0 1]}, 'Lepidosauria'
    {'o', 8, 3, [1 0 1], [0 0 0]}, 'Testudines'
    {'o', 8, 3, [1 0 1], [0 0 1]}, 'Crocodilia'
    {'o', 8, 3, [1 0 1], [1 0 1]}, 'Pterosauria'
    {'o', 8, 3, [1 0 1], [1 0 0]}, 'Dinosauria'
    {'o', 8, 3, [1 0 0], [0 0 0]}, 'Prototheria'
    {'o', 8, 3, [1 0 0], [0 0 1]}, 'Marsupialia'
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Placentalia'
  };
end

