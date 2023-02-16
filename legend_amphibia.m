%% legend_amphibia
% specification of legend for amphibia

%
function legend = legend_amphibia
% created at 2023/01/21 by Bas Kooijman

  %% Syntax
  % legend = <legend_amphibia.m *legend_amphibia*>

  %% Description
  % Specifies a legend for amphibia
  %
  % Output
  %
  % * legend: (7,2) cell matrix with (marker, taxon)-pairs

  % type, size, linewidth, edge color and face color of a marker, taxon
  legend = {...
    {'o', 8, 3, [0 0 0], [0 0 0]}, 'Gymnophiona'
    {'o', 8, 3, [0 0 1], [0 0 0]}, 'Cryptobranchoidea' % Caudata
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Salamandroidea'
    {'o', 8, 3, [0 0 1], [1 0 0]}, 'Sirenoidea'
    {'o', 8, 3, [1 0 0], [0 0 0]}, 'Archaeobatrachia' % Anura
    {'o', 8, 3, [1 0 0], [0 0 1]}, 'Mesobatrachia'
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Neobatrachia'
  };
end

