%% list_taxa
% gets ordered list of all taxa and optionally count AmP members

%%
function [ol, n_c] = list_taxa(taxon, level, count)
% created 2016/02/25 by Bas Kooijman, modified 2018/06/14, 2024/09/11
% modified 2025/06/07 by mrke: replaced Perl backend with MATLAB taxonomy cache

%% Syntax
% [ol, n_c] = <../list_taxa.m *list_taxa*> (taxon, level, count)

%% Description
% gets an alphabetically ordered list of all taxa that belong to taxon in the add_my_pet collection.
% if count is specified, the order is by number of AmP members of the taxa
%
% Input:
%
% * taxon: optional characterstring with name of taxon (default 'Animalia')
% * level: optional integer for the level (default: 0)
%
%    0 all taxa, including leaves
%    1 all taxa, excluding leaves
%    2 leaves (names with "_")
%    3 genera only (names before first "_")
%    4 families only (names ending on "idae")
%    5 orders only (match with allStat.mat)
%    6 classes only (match with allStat.mat, but does not work for Reptilia)
%    7 phyla only (match with allStat.mat)
%
% * count: optional scalar with lower bound for counting members
%
% Output:
%
% * ol: cell string with alphabetically ordered list
% * n_c: vector with number of members; is empty if count is not specified

%% Remarks
% The classification follows that of Wikipedia

%% Example of use
% * ol = list_taxa
% * ol = list_taxa('Deuterostomata',4)
% * ol = list_taxa({},7)
% * ol = list_taxa('Arthropoda')
% * [ol, n] = list_taxa('Chondrichthyes',3,10); prt_tab({ol n},{'genus', 'n'},'genera',1)

  if ~exist('taxon', 'var') || isempty(taxon)
    taxon = 'Animalia';
  end

  if ~exist('level', 'var')
    level = 0;
  end

  TC = get_taxonomy_cache;

  if ~isKey(TC.taxon_set, taxon)
    disp('taxon not recognized')
    ol = {}; n_c = [];
    return
  end

  % Collect all descendants (both intermediate taxa and species) plus taxon itself
  all_nodes = [{taxon}; collect_all_nodes(taxon, TC)];
  ol = sort(all_nodes);

  switch level
    case 0
      % all nodes and leaves — already done

    case 1  % exclude leaves (species have '_')
      ol = ol(cellfun(@isempty, strfind(ol, '_')));

    case 2  % leaves only
      ol = ol(~cellfun(@isempty, strfind(ol, '_')));

    case 3  % genus only
      ol = ol(~cellfun(@isempty, strfind(ol, '_')));
      n  = length(ol);
      for i = 1:n
        parts = strsplit(ol{i}, '_');
        ol{i} = parts{1};
      end
      ol = unique(ol);

    case 4  % family only
      ol = ol(~cellfun(@isempty, strfind(ol, 'idae')));

    case 5  % order only
      ol = ol(ismember(ol, unique(read_allStat('order'))));

    case 6  % class only; does not work for Reptilia
      ol = ol(ismember(ol, unique(read_allStat('class'))));

    case 7  % phylum only
      ol = ol(ismember(ol, unique(read_allStat('phylum'))));
  end

  % Count members per taxon if requested
  n_c = [];
  if exist('count', 'var') && count >= 0
    n   = length(ol);
    n_c = zeros(n, 1);
    for i = 1:n
      n_c(i) = length(select(ol{i}));
    end
    sel  = n_c >= count;
    ol   = ol(sel);
    n_c  = n_c(sel);
    [n_c, ind] = sort(n_c, 'descend');
    ol   = ol(ind);
  end
end


%% collect_all_nodes
% Returns all descendants of node (both intermediate taxa and species leaves),
% excluding node itself. Uses the children map for an in-memory DFS.
function nodes = collect_all_nodes(node, TC)
  nodes = {};
  if ~isKey(TC.children, node)
    return  % leaf node: no children
  end
  kids = TC.children(node);
  for i = 1:numel(kids)
    nodes{end+1} = kids{i}; %#ok<AGROW>
    nodes = [nodes; collect_all_nodes(kids{i}, TC)]; %#ok<AGROW>
  end
end
