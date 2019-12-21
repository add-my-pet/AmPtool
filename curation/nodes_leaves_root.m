%% nodes_leaves_root
% get number of nodes between leaves and root in taxonomic tree in ../taxa/

%%
function [NN, n_taxa] = nodes_leaves_root(info)
% created 2017/09/30 by Bas Kooijman

%% Syntax
% [NB, n_taxa] = <../nodes_leaves_root.m *nodes_leaves_root*>

%% Description
% counts the number of nodes between leaves and root
%
% Input
%
% Info: optional scalar with yes (info neq 0) or no (info = 0) survivor plot (default info = 1);  
%
% Output: 
% 
% * NN: (m,2)-array with histogram of the number of nodes from leaves to root
% * n_taxa: scalar with number of leaves

%% Remarks
% 
%% Example of use
% [NN, n_taxa] = nodes_leaves_root

  
  taxa = select('Animalia'); n_taxa = length(taxa); nodes = zeros(n_taxa,1);
  for i = 1:n_taxa
    nodes(i) = length(lineage(taxa{i}));
  end
  
  % compose histogram
  max_nodes = max(nodes); NN = zeros(max_nodes,2); NN(:,1) = 1:max_nodes;
  for i = 1: max_nodes
    NN(i,2) = sum(nodes == i);
  end
    
  if ~exist('info', 'var') 
    info = 1;
  end
  
  if info == 0
    return
  end
  
  x_median = median(nodes); x_min = min(nodes);
  surv_x = surv(nodes); 
  plot([x_min; x_median; x_median], [0.5;0.5;0], 'r', surv_x(:,1), surv_x(:,2), 'b', 'Linewidth', 2)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('nodes between leaves and root')  
  ylabel('survivor function')
  saveas(gca, '../../img/AmPtool/nodes_leaves_root.png')

