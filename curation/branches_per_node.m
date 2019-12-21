%% branches_per_node
% get branches per node of taxonomic tree in ../taxa/

%%
function [NB, n_nodes] = branches_per_node(info)
% created 2017/09/30 by Bas Kooijman

%% Syntax
% [NB, n_nodes] = <../branches_per_node.m *branches_per_node*>

%% Description
% counts the number of branches per node 
%
% Input
%
% Info: optional scalar with yes (info neq 0) or no (info = 0) survivor plot (default info = 1);  
%
% Output: 
% 
% * NB: (n,2)-array with histogram of the number of branches per node 
% * n_nodes: scalar with number of nodes

%% Remarks
% 
%% Example of use
% [NB, n_nodes] = branches_per_node

  WD = pwd;
  
  cd ../taxa
  nodes = ls('*.txt'); n_nodes = length(nodes); 
  branch = zeros(n_nodes,1); % initiate number of branches for each node
  for  i = 1:n_nodes
    branch(i) = length(textread(nodes(i,:), '%s'));
  end

  cd(WD)
    
  % compose histogram 
  max_branch = max(branch); NB = zeros(max_branch,2); NB(:,1) = 1:max_branch;
  for i = 1: max_branch
    NB(i,2) = sum(branch == i);
  end
  
  if ~exist('info', 'var') 
    info = 1;
  end
  
  if info == 0
    return
  end
  
  x_median = median(branch); x_min = min(branch);
  surv_x = surv(branch); 
  plot([x_min; x_median; x_median], [0.5;0.5;0], 'r', surv_x(:,1), surv_x(:,2), 'b', 'Linewidth', 2)
  set(gca, 'FontSize', 15, 'Box', 'on')
  xlabel('branches per node')  
  ylabel('survivor function')
  xlim([0 21])
  saveas(gca, '../../img/AmPtool/branches_per_node.png')

 
