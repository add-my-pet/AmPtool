%% lineage_CoL
% gets lineage of a species in Catalog of Life

%%
function [lineage, rank, id_CoL, name_status, accepted_name] = lineage_CoL(my_pet)
% created 2018/01/05 by Bas Kooijman, modified 2021/04/01, 2021/04/10, 2026/06/11

%% Syntax
% [lineage, rank, id_CoL, name_status, accepted_name] = <../lineage_CoL.m *lineage_CoL*>(my_pet)

%% Description
% Gets lineage of a species from the Catalog of Life.
% The classic CoL web service was retired when CoL moved onto ChecklistBank; this function now queries the
%   latest CoL release (ChecklistBank dataset 3LR) through its name-match service and reads the classification.
%
% Input:
%
% * my_pet: character string with name of an entry
%
% Output:
%
% * lineage: (n,1) cell array with lineage, ordered root -> species
% * rank: (n,1) cell array with ranks
% * id_CoL: CoL id (character string) of the matched taxon
% * name_status: string that describes the status of the name (e.g. accepted, synonym)
% * accepted_name: string with the accepted name (underscores for spaces)

%% Remarks
% You must be connected for using this function.
% <lineage.html *lineage*> gives a similar result for AmP entries.
% Names of intermediate ranks are single words, as used in AmP; the species slot is the underscored binomial.

%% Example of use
% lineage_CoL('Daphnia_magna')

  lineage = {}; rank = {}; id_CoL = ''; name_status = ''; accepted_name = '';

  name = strrep(my_pet, '_', ' ');
  opts = weboptions('Timeout', 15, 'ContentType', 'json');
  try
    r = webread('https://api.checklistbank.org/dataset/3LR/match/nameusage', 'q', name, opts);
  catch
    return % not connected, or no response
  end

  if ~(isfield(r, 'match') && ~isempty(r.match) && r.match && isfield(r, 'usage'))
    return % name not found
  end
  u = r.usage;

  if isfield(r, 'id'); id_CoL = r.id; elseif isfield(u, 'id'); id_CoL = u.id; end
  if isfield(u, 'status'); name_status = u.status; end

  % classification is ordered low -> high and excludes the species; reverse to high -> low (root first)
  cl = [];
  if isfield(u, 'classification'); cl = u.classification; end
  M = numel(cl);
  for k = M:-1:1
    if iscell(cl), item = cl{k}; else, item = cl(k); end
    if isfield(item, 'name') && ~isempty(item.name)
      lineage{end+1,1} = item.name; %#ok<AGROW>
      if isfield(item, 'rank'), rank{end+1,1} = item.rank; else, rank{end+1,1} = ''; end %#ok<AGROW>
    end
  end

  % append the species itself (drop any subgenus in parentheses, e.g. Daphnia (Ctenodaphnia) magna)
  sp = '';
  if isfield(u, 'name'); sp = u.name; end
  sp = strtrim(regexprep(regexprep(sp, '\s*\([^)]*\)\s*', ' '), '\s+', ' '));
  if ~isempty(sp)
    accepted_name = strrep(sp, ' ', '_');
    lineage{end+1,1} = accepted_name;
    rank{end+1,1} = 'species';
  end
