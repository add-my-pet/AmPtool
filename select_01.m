%% select_01
% finds booleans for occurences of members of taxon among members of taxon_src

%
function [sel, taxa_src] = select_01(taxon_src, taxon_sel)
% created 2016/04/12 by Bas Kooijman, modified 2017/06/14

%% Syntax
% [sel, taxa_src] = <select_01.m *select_01*>(taxon_src, taxon_sel)

%% Description
% Finds booleans for occurences of members of taxon among members of taxon_src
%
% Input
%
% * taxon_src: optional character or cell string with name(s) of source taxon/taxa (default 'Animalia')
% * taxon_sel: character or cell string with names of taxa that belong to source taxon
%
% Output
%
% * sel: n-vector with booleans
% * taxa_scr: n-vector with names of members of taxon_src

%% Remarks
% The names of members of taxon can be found by
% [sel nm] = select_01(taxon_src, taxon); nm(sel)

%% Example of use
% sel = select_01('Aves'); or sel = select_01({'Aves','Mammalia'); or 
% sel = select_01('Animalia',{'Aves','Mammalia'});
%
% sel_fish = select_01('Vertebrata') & ~select_01('Tetrapoda'); 
% or 
% sel_fish = select_01({'Myxini','Cephalaspidomorphi','Chondrichthyes','Actinopterygii','Sarcopterygii'}) 

if ~exist('taxon_src', 'var') && ~exist('taxon_sel', 'var')
  taxon_sel = 'Animalia'; taxon_src = 'Animalia';
elseif ~exist('taxon_sel', 'var')
  taxon_sel = taxon_src; taxon_src = 'Animalia';
end

taxa_src = select(taxon_src); n_taxa_src = size(taxa_src,1);
sel = false(n_taxa_src,1);

if ~iscell(taxon_sel)
  taxa = select(taxon_sel); n_taxa = size(taxa,1);
  for i = 1:n_taxa
    sel(strcmp(taxa_src, taxa{i})) = true;
  end
  
else
  for j = 1:length(taxon_sel)
    taxa = select(taxon_sel{j}); n_taxa = size(taxa,1); 
    for i = 1:n_taxa
      sel(strcmp(taxa_src, taxa{i})) = true;
    end
  end
end

