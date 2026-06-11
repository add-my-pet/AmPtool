%% get_synonym
% gets a synonym of an accepted name (via the GBIF backbone)

%%
function nm = get_synonym(id_CoL)
% created 2021/08/5 by Bas Kooijman, modified 2026/06/11

%% Syntax
% nm = <../get_synonym.m *get_synonym*>(id_CoL)

%% Description
% Gets a synonym of an accepted name.
% The classic CoL web service was retired; synonyms are now read from the GBIF backbone, keyed by the
%   GBIF usageKey that <get_id_CoL.html *get_id_CoL*> returns.
%
% Input:
%
% * id_CoL: character string or number with the GBIF backbone usageKey
%
% Output:
%
% * nm: character string with a synonym as Genus_species, or '' if none

%% Example of use
% get_synonym(get_id_CoL('Vulpes_vulpes'))

nm = '';
if isempty(id_CoL)
  return
end

opts = weboptions('Timeout', 15, 'ContentType', 'json');
try
  r = webread(['https://api.gbif.org/v1/species/', num2str(id_CoL), '/synonyms'], opts);
catch
  return
end

if ~isfield(r, 'results') || isempty(r.results)
  return
end
res = r.results;
if iscell(res), item = res{1}; else, item = res(1); end

if isfield(item, 'canonicalName') && ~isempty(item.canonicalName)
  parts = strsplit(strtrim(item.canonicalName), ' ');
  if numel(parts) >= 2
    nm = [parts{1}, '_', parts{2}];
  end
end
