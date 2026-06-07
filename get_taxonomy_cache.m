%% get_taxonomy_cache
% Returns the in-memory taxonomy cache, rebuilding it automatically when stale.

function TC = get_taxonomy_cache()
% created 2025/06/07

%% Syntax
% TC = <../get_taxonomy_cache.m *get_taxonomy_cache*> ()

%% Description
% Returns a struct with five fields built from the taxa .txt files:
%   TC.n_txt        - number of .txt files when cache was last built
%   TC.taxon_set    - containers.Map: taxon name -> true  (intermediate nodes)
%   TC.species_set  - containers.Map: species name -> true  (leaf nodes)
%   TC.parent       - containers.Map: node -> parent taxon name
%   TC.children     - containers.Map: taxon -> cell array of direct children
%   TC.species_list - containers.Map: taxon -> cell array of all descendant species
%
% Stale detection: counts the number of .txt files in the taxa directory.
% If the count has changed since the cache was built, the cache is rebuilt.
% The in-memory copy (persistent variable) is reused within a MATLAB session
% as long as the count matches, so repeated calls are essentially free.

persistent cache

taxa_dir  = fullfile(fileparts(which('get_taxonomy_cache.m')), 'taxa');
n_txt_now = numel(dir(fullfile(taxa_dir, '*.txt')));

% Return in-memory cache if it is current
if ~isempty(cache) && cache.n_txt == n_txt_now
  TC = cache;
  return
end

% Check whether the file on disk is also current
cache_file = fullfile(taxa_dir, 'taxonomy_cache.mat');
needs_build = true;
if exist(cache_file, 'file') == 2
  tmp = load(cache_file, 'n_txt');
  needs_build = (tmp.n_txt ~= n_txt_now);
end

if needs_build
  build_taxonomy_cache(taxa_dir);
end

cache = load(cache_file);
TC    = cache;
end
