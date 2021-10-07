%% legend_aves
% specification of legend for birds

%
function legend = legend_aves
% created at 2016/04/24 by Bas Kooijman, modified 2021/07/18

  %% Syntax
  % legend = <legend_aves.m *legend_aves*>

  %% Description
  % Specifies a legend for birds
  %
  % Output
  %
  % * legend: (10,2) cell matrix with (marker, taxon)-pairs

  % type, size, linewidth, edge color and face color of a marker, taxon
  legend = {...
    {'o', 8, 3, [0 0 0], [0 0 0]}, 'Crocodilia'
    {'o', 8, 3, [0 0 1], [0 0 0]}, 'Paleognathae'
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Galloanserae'
    % Neoaves: edge magenta and red
    {'o', 8, 3, [1 0 1], [0 0 0]}, 'Mirandornithes'
    {'o', 8, 3, [1 0 1], [0 0 1]}, 'Gruimorphae'
    {'o', 8, 3, [1 0 1], [1 0 1]}, 'Opisthocomiformes'
    {'o', 8, 3, [1 0 1], [1 0 0]}, 'Strisores'
    {'o', 8, 3, [1 0 1], [1 1 1]}, 'Columbea'
    % Passerea: edge red
    {'o', 8, 3, [1 0 0], [0 0 0]}, 'Ardeae'
    {'o', 8, 3, [1 0 0], [0 0 1]}, 'Afroaves'
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Australaves'
    %
    {'.', 8, 3, [0 0 0], [0 0 0]}, 'Animalia'
  };
end

