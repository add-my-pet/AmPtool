%% lineage_CoL
% gets lineage of a species in Catalog of Life (via the GBIF backbone)

%%
function [lineage, rank, id_CoL, name_status, accepted_name] = lineage_CoL(my_pet)
% created 2018/01/05 by Bas Kooijman, modified 2021/04/01, 2021/04/10, 2026/06/11

%% Syntax
% [lineage, rank, id_CoL, name_status, accepted_name] = <../lineage_CoL.m *lineage_CoL*>(my_pet)

%% Description
% Gets lineage of species from the Catalog of Life: kingdom, phylum, class, order, family, genus, species.
% The classic CoL web service was retired when CoL moved onto the ChecklistBank platform; this function
%   now queries the GBIF backbone taxonomy (which is largely CoL-derived) through its name-match service,
%   which returns the full classification in a single call.
%
% Input:
%
% * my_pet: character string with name of an entry
%
% Output:
%
% * lineage: (n,1) cell array with lineage, ordered root -> species
% * rank: (n,1) cell array with ranks
% * id_CoL: GBIF backbone usageKey (character string) for the matched taxon
% * name_status: string that describes the status of the name (e.g. accepted, synonym)
% * accepted_name: string with accepted scientific name

%% Remarks
% You must be connected for using this function.
% <lineage.html *lineage*> gives a similar result for AmP entries, but here only a limited set.
% Names of intermediate ranks (genus and up) are single words, as used in AmP; the species slot keeps the
%   binomial returned by GBIF (with a space), so it will not match AmP species names (which use underscores).

%% Example of use
% lineage_CoL('Passer_domesticus')

  lineage = {}; rank = {}; id_CoL = ''; name_status = ''; accepted_name = '';

  name = strrep(my_pet, '_', ' ');
  opts = weboptions('Timeout', 15, 'ContentType', 'json');
  try
    r = webread('https://api.gbif.org/v1/species/match', 'name', name, opts);
  catch
    return % not connected, or no response from GBIF
  end

  if ~isfield(r, 'matchType') || strcmp(r.matchType, 'NONE')
    return % name not found in the backbone
  end

  ranks = {'kingdom','phylum','class','order','family','genus','species'};
  Ranks = {'Kingdom','Phylum','Class','Order','Family','Genus','Species'};
  for i = 1:numel(ranks)
    if isfield(r, ranks{i}) && ~isempty(r.(ranks{i}))
      lineage{end+1,1} = r.(ranks{i}); %#ok<AGROW>
      rank{end+1,1}    = Ranks{i};     %#ok<AGROW>
    end
  end

  if isfield(r, 'usageKey');       id_CoL = num2str(r.usageKey);      end
  if isfield(r, 'status');         name_status = lower(r.status);     end
  if isfield(r, 'scientificName'); accepted_name = r.scientificName;  end

end
