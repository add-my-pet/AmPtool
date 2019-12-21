%% pedigree
% gets classification tree of a taxon

%%
function [tree, nm, val, units, label] = pedigree(taxon, var)
% created 2015/09/18 by Bernd Brandt; modified 2017/12/14 by Bas Kooijman

%% Syntax
% tree = <../pedigree.m *pedigree*> (taxon) 

%% Description
% gets a tree of all species in the add_my_pet collection that belong to a
% particular taxon and writes the value of a parameter or statistic behind
% entry names.
%
% Input:
%
% * taxon: optional character string with name of taxon (default 'Animalia')
% * var: character string with parameter or statistic
%
% Output:
% 
% * character string with a tree of all species in the add_my_pet collection that belong to that taxon
% * nm: n-cellstring with names of entries (non-empty if var is specified)
% * val: n-vector with values for parameter or statistic (non-empty if var is specified)
% * units: charactore string with units (non-empty if var is specified)
% * label: charactore string with label (non-empty if var is specified)

%% Remarks
% The default root is Animalia. 
% If chosen as taxon, a tree of all species in the collection results.
% New lines are written with char(10), tabs with char(9).
% The classification follows that of Wikipedia.
% See <prtStat.html *prtStat*> for lists without tree.
% See <treeview_taxa.html *treeview_taxa*> for an interactive tree in html.

%% Example of use
% tree  = pedigree or tree = pedigree('Mollusca') or pedigree('Alcidae', 'p_M')

  WD = pwd;                 % store current path
  taxa = which('pedigree.pl'); % 
  taxa = taxa(1:end - 11);  % 
  cd(taxa)                  % goto taxa

  if ~exist('taxon', 'var')
    taxon = 'Animalia';
  end
  
  try
    tree = perl('pedigree.pl', taxon); 
  catch
    disp(['Warning from pedigree: Name ', taxon, ' is not recognized as taxon'])
  end
  
  cd(WD)                    % goto original path
  
  if ~exist('var', 'var')
     nm = []; val = []; label = []; units = [];
  else
    [nm, val, units, label] = prtStat(taxon, var, 0);
    n = length(nm);
    for i = 1:n
      tree = strrep(tree,nm{i},[nm{i}, ' ', num2str(val(i)), ' ', units]);
    end
    tree = [label, ': ', tree];
  end

end

