%% legend_rept
% specification of legend for squamata

%
function legend = legend_rept
% created at 2026/01/08 by Bas Kooijman

  %% Syntax
  % legend = <legend_rept.m *legend_rept*>

  %% Description
  % Specifies a legend for reptilia
  %
  % Output
  %
  % * legend: (5,2) cell matrix with (marker, taxon)-pairs

  % type, size, linewidth, edge color and face color of a marker, taxon
  legend = {...
    {'o', 8, 3, [0 0 0], [0 0 0]}, 'Rhynchocephalia'
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Gekkota' % Squamata
    {'o', 8, 3, [0 0 1], [1 1 1]}, 'Unidentata' % Squamata
    {'o', 8, 3, [1 0 0], [1 1 1]}, 'Testudines'
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Crocodilia'
  };
end

