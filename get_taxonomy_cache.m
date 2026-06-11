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

persistent cache cache_mat_mtime

taxa_dir   = fullfile(fileparts(which('get_taxonomy_cache.m')), 'taxa');
n_txt_now  = numel(dir(fullfile(taxa_dir, '*.txt')));
cache_file = fullfile(taxa_dir, 'taxonomy_cache.mat');

% Get current .mat modification time (0 if file absent)
mat_mtime_now = 0;
if exist(cache_file, 'file') == 2
  d = dir(cache_file);
  mat_mtime_now = d.datenum;
end

% Return in-memory cache if file count and .mat timestamp are unchanged
if ~isempty(cache) && cache.n_txt == n_txt_now && ...
    ~isempty(cache_mat_mtime) && cache_mat_mtime == mat_mtime_now
  TC = cache;
  return
end

% Rebuild .mat if file count changed
needs_build = (mat_mtime_now == 0) || (exist(cache_file, 'file') ~= 2);
if ~needs_build
  tmp = load(cache_file, 'n_txt');
  needs_build = (tmp.n_txt ~= n_txt_now);
end

if needs_build
  build_taxonomy_cache(taxa_dir);
end

cache = load(cache_file);
d = dir(cache_file);
cache_mat_mtime = d.datenum;
TC = cache;
end
