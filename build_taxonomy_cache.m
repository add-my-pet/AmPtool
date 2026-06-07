%% build_taxonomy_cache
% Reads all .txt files in the taxa directory and writes taxonomy_cache.mat.
% Called automatically by get_taxonomy_cache when the cache is missing or stale.
% Can also be called manually after adding new entries to the taxa directory.

function build_taxonomy_cache(taxa_dir)
% created 2025/06/07

%% Syntax
% <../build_taxonomy_cache.m *build_taxonomy_cache*> (taxa_dir)

%% Description
% Reads all taxon .txt files and builds four lookup structures:
%   taxon_set    - set of all intermediate taxon names (those with a .txt file)
%   species_set  - set of all species names (leaf nodes, contain '_')
%   parent       - map from every node to its parent taxon name
%   children     - map from every taxon to its direct children (ordered as in .txt file)
%   species_list - map from every taxon to its full sorted list of descendant species
%
% Input:
% * taxa_dir: optional path to taxa directory (default: taxa/ inside AmPtool)
%
% Output:
% * writes taxonomy_cache.mat to taxa_dir

if nargin < 1
  taxa_dir = fullfile(fileparts(which('build_taxonomy_cache.m')), 'taxa');
end

files   = dir(fullfile(taxa_dir, '*.txt'));
n_txt   = numel(files);
taxon_names = cellfun(@(f) f(1:end-4), {files.name}, 'UniformOutput', false);

fprintf('Building taxonomy cache from %d taxa files in %s ...\n', n_txt, taxa_dir);

taxon_set = containers.Map(taxon_names, true(1, n_txt));
parent    = containers.Map('KeyType', 'char', 'ValueType', 'char');
children  = containers.Map('KeyType', 'char', 'ValueType', 'any');

for i = 1:n_txt
  t   = taxon_names{i};
  raw = fileread(fullfile(taxa_dir, [t, '.txt']));
  lines = strtrim(strsplit(raw, {char(10), char(13)}));
  lines = lines(~cellfun('isempty', lines));
  children(t) = lines;
  for j = 1:numel(lines)
    parent(lines{j}) = t;
  end
end

% Pre-compute species_list for every taxon via a single memoised DFS from root.
% containers.Map is a handle object so modifications inside the helper persist.
species_list = containers.Map('KeyType', 'char', 'ValueType', 'any');
memo_collect_leaves('Animalia', children, taxon_set, species_list);

% Build species_set from the complete species list under Animalia
all_species = species_list('Animalia');
species_set = containers.Map(all_species, true(numel(all_species), 1));

out_file = fullfile(taxa_dir, 'taxonomy_cache.mat');
save(out_file, 'n_txt', 'taxon_set', 'species_set', 'parent', 'children', 'species_list');
fprintf('Taxonomy cache saved: %d taxa, %d species -> %s\n', n_txt, numel(all_species), out_file);
end


%% memo_collect_leaves
% Memoised recursive helper — populates species_list for node and all descendants.
% Total work is O(n) because each node is visited exactly once.
function leaves = memo_collect_leaves(node, children, taxon_set, species_list)
if isKey(species_list, node)
  leaves = species_list(node);
  return
end
if ~isKey(taxon_set, node)
  % Leaf node (species): its own list is just itself
  leaves = {node};
  species_list(node) = leaves;
  return
end
kids = children(node);
sub  = cell(numel(kids), 1);
for i = 1:numel(kids)
  sub{i} = memo_collect_leaves(kids{i}, children, taxon_set, species_list);
end
leaves = vertcat(sub{:});
species_list(node) = leaves;
end
