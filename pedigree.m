%% pedigree
% gets classification tree of a taxon

%%
function [tree, nm, val, units, label] = pedigree(taxon, var)
% created 2015/09/18 by Bernd Brandt; modified 2017/12/14 by Bas Kooijman
% modified 2025/06/07 by mrke: replaced Perl backend with MATLAB taxonomy cache

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
% * units: character string with units (non-empty if var is specified)
% * label: character string with label (non-empty if var is specified)

%% Remarks
% The default root is Animalia.
% If chosen as taxon, a tree of all species in the collection results.
% New lines are written with char(10), tabs with char(9).
% The classification follows that of Wikipedia.
% See <prtStat.html *prtStat*> for lists without tree.
% See <treeview_taxa.html *treeview_taxa*> for an interactive tree in html.

%% Example of use
% tree  = pedigree or tree = pedigree('Mollusca') or pedigree('Alcidae', 'p_M')

  if ~exist('taxon', 'var')
    taxon = 'Animalia';
  end

  TC = get_taxonomy_cache;

  if ~isKey(TC.taxon_set, taxon)
    fprintf('Warning from pedigree: Name %s is not recognized as taxon\n', taxon);
    tree = ''; nm = []; val = []; units = ''; label = '';
    return
  end

  % Build indented tree string (taxon at level 0, children indented with tabs)
  tree = [taxon, char(10), build_pedigree_string(taxon, TC, 1)];

  if ~exist('var', 'var')
    nm = []; val = []; label = []; units = [];
  else
    [nm, val, units, label] = prtStat(taxon, var, 0);
    n = length(nm);
    for i = 1:n
      tree = strrep(tree, nm{i}, [nm{i}, ' ', num2str(val(i)), ' ', units]);
    end
    tree = [label, ': ', tree];
  end
end


%% build_pedigree_string
% Recursively builds the indented tree string for all descendants of node.
% Each child is prefixed with `level` tab characters; grandchildren with level+1, etc.
function s = build_pedigree_string(node, TC, level)
  s = '';
  if ~isKey(TC.children, node)
    return  % leaf node: no children to print
  end
  kids = TC.children(node);
  tab  = repmat(char(9), 1, level);
  for i = 1:numel(kids)
    s = [s, tab, kids{i}, char(10), build_pedigree_string(kids{i}, TC, level + 1)]; %#ok<AGROW>
  end
end
