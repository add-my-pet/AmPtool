%% llegend_ACP
% specification of reference line-legend for animals, chordates and  protostomata

%
function llegend = llegend_ACP
% created at 2017/04/20 by Bas Kooijman

  %% Syntax
  % llegend = <llegend_ACP.m *llegend_ACP*>

  %% Description
  % Specifies a reference legend for all animals, chordates and  protostomata
  %
  % Output
  %
  % * legend: (3,2) cell matrix with (line, taxon)-pairs

  % type, linewidth, color  of a line, taxon
  
  llegend = {...
    {'-', 2, [0 0 1]}, 'Protostomata'; ....
    {'-', 2, [1 0 0]}, 'Chordata'; ....
    {'-', 2, [0 0 0]}, 'Animalia'; ....
  };
end

