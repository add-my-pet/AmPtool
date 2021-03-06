%% legend_austro
% specification of a legend for the Austrodyptornithes

%
function legend = legend_austro
% created at 2019/09/25 by Bas Kooijman

  %% Syntax
  % legend = <legend_austro.m *legend_austro*>

  %% Description
  % Specifies a legend for Austrodyptornithes
  %
  % Output
  %
  % * legend: (7,2) cell matrix with (marker, taxon)-pairs

  % type, size, linewidth, edge color and face color of a marker, taxon
  legend = {...
    {'o', 8, 3, [0 0 1], [0 0 0]}, 'Procellariidae'; ....
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Diomedeidae'; ....
    {'o', 8, 3, [0 0 1], [1 0 1]}, 'Oceanitidae'; ....
    {'o', 8, 3, [0 0 1], [1 0 0]}, 'Hydrobatidae'; ....
    {'o', 8, 3, [0 0 1], [1 1 1]}, 'Oceanitidae'; ....
    {'o', 8, 3, [1 0 0], [0 0 0]}, 'Aptenodytes'; ....
    {'o', 8, 3, [1 0 0], [0 0 1]}, 'Spheniscus'; ....
    {'o', 8, 3, [1 0 0], [1 0 1]}, 'Eudyptula'; ....
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Eudyptes'; ....
    {'o', 8, 3, [1 0 0], [1 1 1]}, 'Pygoscelis'; ....
    {'.',12, 3, [1 0 0], [0 0 0]}, 'Aequornithes'; ....
    {'.',12, 3, [1 0 1], [0 0 0]}, 'Aequorlitornithes'; ....
    {'.', 8, 3, [0 0 0], [0 0 0]}, 'Aves'; ....
  };
end
