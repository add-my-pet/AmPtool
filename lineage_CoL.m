%% lineage_CoL
% gets lineage of a species in Catalog of Life

%%
function [lineage, rank, id_CoL, name_status, accepted_name] = lineage_CoL(my_pet)
% created 2018/01/05 by Bas Kooijman, modified 2021/04/01, 2021/04/10, 2026/06/11

%% Syntax
% [lineage, rank, id_CoL, name_status, accepted_name] = <../lineage_CoL.m *lineage_CoL*>(my_pet)

%% Description
% Gets lineage of a species from the Catalog of Life, via the CoL-derived GBIF backbone.
% The native CoL release (ChecklistBank) uses a fine-grained rank system that omits clean Family/Genus ranks,
%   so the GBIF backbone is used here because it keeps the standard Linnaean ranks (Kingdom..Species).
% Note: ids, synonyms and vernacular names still come from native CoL (get_id_CoL, get_synonym, get_common_CoL).
%
% Input:
%
% * my_pet: character string with name of an entry
%
% Output:
%
% * lineage: (n,1) cell array with lineage, ordered root -> species
% * rank: (n,1) cell array with ranks (capitalized: Kingdom, Phylum, Class, Order, Family, Genus, Species)
% * id_CoL: GBIF backbone usageKey (character string); for the native CoL id use <get_id_CoL.html *get_id_CoL*>
% * name_status: string with the status of the name (e.g. accepted, synonym)
% * accepted_name: string with the accepted scientific name

%% Remarks
% You must be connected for using this function.
% Names of intermediate ranks (genus and up) are single words, as used in AmP; the species slot is underscored.

%% Example of use
% lineage_CoL('Daphnia_magna')

  lineage = {}; rank = {}; id_CoL = ''; name_status = ''; accepted_name = '';

  name = strrep(my_pet, '_', ' ');
  opts = weboptions('Timeout', 15, 'ContentType', 'json');
  try
    r = webread('https://api.gbif.org/v1/species/match', 'name', name, opts);
  catch
    return % not connected, or no response
  end

  if ~isfield(r, 'matchType') || strcmp(r.matchType, 'NONE')
    return % name not found in the backbone
  end

  ranks = {'kingdom','phylum','class','order','family','genus','species'};
  Ranks = {'Kingdom','Phylum','Class','Order','Family','Genus','Species'};
  for i = 1:numel(ranks)
    if isfield(r, ranks{i}) && ~isempty(r.(ranks{i}))
      val = r.(ranks{i});
      if strcmp(ranks{i}, 'species'); val = strrep(val, ' ', '_'); end
      lineage{end+1,1} = val;   %#ok<AGROW>
      rank{end+1,1}    = Ranks{i}; %#ok<AGROW>
    end
  end

  if isfield(r, 'usageKey');       id_CoL = num2str(r.usageKey);      end
  if isfield(r, 'status');         name_status = lower(r.status);     end
  if isfield(r, 'scientificName'); accepted_name = r.scientificName;  end

end
