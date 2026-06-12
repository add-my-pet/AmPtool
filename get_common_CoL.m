%% get_common_CoL
% gets the common name of a species of given id from Catalog of Life

%%
function common = get_common_CoL(id_CoL, language)
% created 2020/06/05 by Bas Kooijman, modified 2026/06/11

%% Syntax
% common = <../get_common_CoL.m *get_common_CoL*>(id_CoL, language)

%% Description
% Gets the common (vernacular) names of a species of given id from the Catalog of Life.
% The classic CoL web service was retired; vernacular names are now read from the latest CoL release
%   (ChecklistBank dataset 3LR), keyed by the CoL id that <get_id_CoL.html *get_id_CoL*> returns.
%
% Input:
%
% * id_CoL: character string with the CoL id of the species
% * language: optional string with language name (e.g. 'English') or ISO 639-3 code (e.g. 'eng'); default 'English'
%
% Output:
%
% * common: cell string with common names
%
%% Remarks
% Get id_CoL with get_id_CoL.
% Output can be empty if CoL does not have the common name in the requested language.

%% Example of use
% nm = get_common_CoL(get_id_CoL('Passer_domesticus'),'French')

if ~exist('language', 'var') || isempty(language)
  language = 'English';
end

common = {};
if isempty(id_CoL)
  return
end
if ~ischar(id_CoL)
  id_CoL = num2str(id_CoL);
end

% map language name to the ISO 639-3 code CoL uses; accept a 3-letter code as-is
codes = struct('English','eng', 'French','fra', 'German','deu', 'Spanish','spa', ...
               'Dutch','nld', 'Italian','ita', 'Portuguese','por', 'Russian','rus', ...
               'Chinese','zho', 'Japanese','jpn');
if isfield(codes, language)
  lang = codes.(language);
else
  lang = lower(language); % assume an ISO 639 code was passed
end

opts = weboptions('Timeout', 15, 'ContentType', 'json');
try
  r = webread(['https://api.checklistbank.org/dataset/3LR/taxon/', id_CoL, '/vernacular'], opts);
catch
  return
end

% r is an array of vernacular-name objects
N = numel(r); names = {};
for i = 1:N
  if iscell(r), item = r{i}; else, item = r(i); end
  if isfield(item, 'name') && isfield(item, 'language') && strcmpi(item.language, lang)
    names{end+1,1} = item.name; %#ok<AGROW>
  end
end
common = unique(names);
