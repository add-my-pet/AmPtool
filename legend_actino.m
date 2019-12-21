%% legend_actino
% specification of a legend for Actinopterygii

%
function legend = legend_actino
% created at 2017/04/20 by Bas Kooijman, modified 2017/12/20

  %% Syntax
  % legend = <legend_actino.m *legend_actino*>

  %% Description
  % Specifies a legend for Actinopterygii
  %
  % Output
  %
  % * legend: (8,2) cell matrix with (marker, taxon)-pairs

  % type, size, linewidth, edge color and face color of a marker, taxon
  legend = {...
    {'o', 8, 3, [0 0 0], [0 0 0]}, 'Cladistii'; ...
    {'o', 8, 3, [0 0 0], [0 0 1]}, 'Chondrostei'; ...          
    {'o', 8, 3, [0 0 0], [1 0 0]}, 'Holostei'; ....             % Neopterygii
    {'o', 8, 3, [0 0 1], [0 0 0]}, 'Elopocephalai'; ....        % Teleostei
    {'o', 8, 3, [0 0 1], [0 0 1]}, 'Osteoglossocephala'; ....   % Osteoglossocephalai
    {'o', 8, 3, [0 0 1], [1 0 0]}, 'Otomorpha'; ....            % Clupeocephala
    {'o', 8, 3, [1 0 1], [0 0 0]}, 'Lepidogalaxii'; ....        % Euteleosteomorpha
    {'o', 8, 3, [1 0 1], [0 0 1]}, 'Protacanthopterygii'; ....
    {'o', 8, 3, [1 0 1], [1 0 1]}, 'Stomiati'; ....
    {'o', 8, 3, [1 0 1], [1 0 0]}, 'Aulopa'; ....               % Neoteleostei
    {'o', 8, 3, [1 0 1], [1 1 1]}, 'Myctophata'; ....           % Ctenosquamata
    {'o', 8, 3, [1 0 0], [0 0 0]}, 'Paracanthomorphacea'; ....  % Acanthomorphata
    {'o', 8, 3, [1 0 0], [0 0 1]}, 'Polymixiacea'; ....
    {'o', 8, 3, [1 0 0], [1 0 1]}, 'Berycimorphaceae'; ....     % Euacanthomorphacea
    {'o', 8, 3, [1 0 0], [1 0 0]}, 'Holocentrimorphaceae'; ....
    {'o', 8, 3, [1 0 0], [1 1 1]}, 'Percomorphaceae'; ....
  };
end
