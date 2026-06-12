%% get_synonym
% gets a synonym of an accepted name in CoL

%%
function nm = get_synonym(id_CoL)
% created 2021/08/5 by Bas Kooijman, modified 2026/06/11

%% Syntax
% nm = <../get_synonym.m *get_synonym*>(id_CoL)

%% Description
% Gets a synonym of an accepted name from the Catalog of Life.
% The classic CoL web service was retired; synonyms are now read from the latest CoL release
%   (ChecklistBank dataset 3LR), keyed by the CoL id that <get_id_CoL.html *get_id_CoL*> returns.
%
% Input:
%
% * id_CoL: character string with a CoL id
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
if ~ischar(id_CoL)
  id_CoL = num2str(id_CoL);
end

opts = weboptions('Timeout', 15, 'ContentType', 'json');
try
  r = webread(['https://api.checklistbank.org/dataset/3LR/taxon/', id_CoL, '/synonyms'], opts);
catch
  return
end

% prefer homotypic synonyms, else heterotypic
syn = [];
if isfield(r, 'homotypic') && ~isempty(r.homotypic)
  syn = r.homotypic;
elseif isfield(r, 'heterotypic') && ~isempty(r.heterotypic)
  syn = r.heterotypic;
end
if isempty(syn)
  return
end
if iscell(syn), item = syn{1}; else, item = syn(1); end

sciname = '';
if isfield(item, 'name')
  nmobj = item.name;
  if isstruct(nmobj) && isfield(nmobj, 'scientificName')
    sciname = nmobj.scientificName;
  elseif ischar(nmobj)
    sciname = nmobj;
  end
end

if ~isempty(sciname)
  parts = strsplit(strtrim(sciname), ' ');
  if numel(parts) >= 2
    nm = [parts{1}, '_', parts{2}];
  end
end
