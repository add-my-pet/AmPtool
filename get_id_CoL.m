%% get_id_CoL
% gets id and name of the corresponding accepted species-name in Catalog of Life

%%
function [id_CoL, name_status, accepted_name] = get_id_CoL(my_pet, open)
% created 2018/01/05 by Bas Kooijman, modified 2026/06/12

%% Syntax
% [id_CoL, name_status, accepted_name] = <../get_id_CoL.m *get_id_CoL*>(my_pet, open)

%% Description
% Gets an identifier for an accepted species name in the Catalog of Life.
% The classic CoL web service was retired when CoL moved onto ChecklistBank; this function now queries the
%   latest CoL release (ChecklistBank dataset 3LR) through its name-match service. The returned id is a genuine
%   CoL id (e.g. '59LYB'), as used by https://www.catalogueoflife.org/data/taxon/<id>.
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening the matched taxon in a browser (default: 0)
%
% Output:
%
% * id_CoL: character string with the CoL id of the matched (accepted) taxon
% * name_status: character string with the status of the name (e.g. accepted, synonym)
% * accepted_name: character string with the accepted name (underscores for spaces)

%% Remarks
% Outputs empty strings if identification was not successful.
% If the species is not matched, the genus is tried.

%% Example of use
% id_CoL = get_id_CoL('Tupaia_belangeri', 1)

  address = 'https://www.catalogueoflife.org/data/taxon/';
  if ~exist('open', 'var') || isempty(open)
    open = 0;
  end

  id_CoL = ''; name_status = ''; accepted_name = '';

  my_pet = strrep(my_pet, ' ', '_'); % normalise to AmP style
  name   = strrep(my_pet, '_', ' '); % ChecklistBank expects spaces

  opts = weboptions('Timeout', 15, 'ContentType', 'json');
  try
    r = webread('https://api.checklistbank.org/dataset/3LR/match/nameusage', 'q', name, opts);
  catch
    fprintf('Warning from get_id_CoL: could not reach ChecklistBank\n');
    return
  end

  matched = isfield(r, 'match') && ~isempty(r.match) && r.match && isfield(r, 'usage');
  if ~matched
    % fallback: search endpoint (match endpoint is too strict for some species)
    try
      r2 = webread('https://api.checklistbank.org/dataset/3LR/nameusage/search', ...
                   'q', name, opts);
      if isfield(r2, 'result') && ~isempty(r2.result)
        hit = r2.result{1};
        if isfield(hit, 'id');    id_CoL = hit.id; end
        if isfield(hit, 'usage')
          u = hit.usage;
          if isfield(u, 'status'); name_status = u.status; end
          if isfield(u, 'label');  accepted_name = strrep(u.label, ' ', '_'); end
        end
        if ~isempty(id_CoL)
          if open; web([address, id_CoL], '-browser'); end
          return
        end
      end
    catch
    end
    fprintf(['Warning from get_id_CoL: ', my_pet, ' not found in CoL\n']);
    if contains(my_pet, '_') % retry with the genus
      genus = strsplit(my_pet, '_');
      [id_CoL, name_status, accepted_name] = get_id_CoL(genus{1}, open);
    end
    return
  end

  u = r.usage;
  if isfield(r, 'id'); id_CoL = r.id; elseif isfield(u, 'id'); id_CoL = u.id; end
  if isfield(u, 'status'); name_status = u.status; end
  if isfield(u, 'label'); accepted_name = strrep(u.label, ' ', '_'); end

  % if a synonym was matched, follow to the accepted taxon when available
  if strcmpi(name_status, 'synonym') && isfield(u, 'accepted')
    a = u.accepted;
    if isfield(a, 'id'); id_CoL = a.id; end
    if isfield(a, 'label'); accepted_name = strrep(a.label, ' ', '_'); end
  end

  if open && ~isempty(id_CoL)
    web([address, id_CoL], '-browser');
  end

end
