%% get_n
% get number of entries in taxa

%%
function [n_taxa, taxa] = get_n(taxa)
% created 2021/08/13 by Bas Kooijman

%% Syntax
% [n_taxa, taxa] = <../get_n.m *get_#*>(taxa)

%% Description
% Writes html table with number of AmP entries
%
% Input:
%
% * taxa: cell string of names of entries
%
% Output:
%
% * n_taxa: vector with number of entries
% * taxa: cell string of names of entries

%% Example of use
% get_n(list_taxa('Carnivora',4));

 n = length(taxa); n_taxa = zeros(n,1);
 
 for i = 1:n
   n_taxa(i) = length(select(taxa{i}));
 end
     
 prt_tab({taxa, n_taxa});