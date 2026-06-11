%% get_id_CoL
% gets id and name of the corresponding accepted species-name in Catalog of Life (via the GBIF backbone)

%%
function [id_CoL, name_status, accepted_name] = get_id_CoL(my_pet, open)
% created 2018/01/05 by Bas Kooijman, modified 2026/06/11

%% Syntax
% [id_CoL, name_status, accepted_name] = <../get_id_CoL.m *get_id_CoL*>(my_pet, open)

%% Description
% Gets an identifier for an accepted species name.
% The classic CoL web service was retired when CoL moved onto ChecklistBank; this function now queries the
%   GBIF backbone taxonomy (largely CoL-derived) through its name-match service.
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening the matched taxon in a browser (default: 0)
%
% Output:
%
% * id_CoL: character string with the GBIF backbone usageKey of the matched taxon
% * name_status: character string with the status of the name (e.g. accepted, synonym)
% * accepted_name: character string with the accepted name (underscores for spaces)

%% Remarks
% Outputs empty strings if identification was not successful.
% If the species is not matched, the genus is tried.

%% Example of use
% id_CoL = get_id_CoL('Daphnia_magna', 1)

  if ~exist('open', 'var') || isempty(open)
    open = 0;
  end

  id_CoL = ''; name_status = ''; accepted_name = '';

  my_pet = strrep(my_pet, ' ', '_'); % normalise to AmP style
  name   = strrep(my_pet, '_', ' '); % GBIF expects spaces

  opts = weboptions('Timeout', 15, 'ContentType', 'json');
  try
    r = webread('https://api.gbif.org/v1/species/match', 'name', name, opts);
  catch
    fprintf('Warning from get_id_CoL: could not reach GBIF\n');
    return
  end

  if ~isfield(r, 'matchType') || strcmp(r.matchType, 'NONE')
    fprintf(['Warning from get_id_CoL: ', my_pet, ' not found\n']);
    if contains(my_pet, '_') % retry with the genus
      genus = strsplit(my_pet, '_');
      [id_CoL, name_status, accepted_name] = get_id_CoL(genus{1}, open);
    end
    return
  end

  if isfield(r, 'usageKey'); id_CoL = num2str(r.usageKey); end
  if isfield(r, 'status');   name_status = lower(r.status); end
  if isfield(r, 'canonicalName') && ~isempty(r.canonicalName)
    accepted_name = strrep(r.canonicalName, ' ', '_');
  elseif isfield(r, 'scientificName')
    accepted_name = strrep(r.scientificName, ' ', '_');
  end

  if isfield(r, 'synonym') && r.synonym
    fprintf(['Warning from get_id_CoL: ', my_pet, ' not accepted (synonym); accepted name returned\n']);
  end

  if open && ~isempty(id_CoL)
    web(['https://www.gbif.org/species/', id_CoL], '-browser');
  end

end
