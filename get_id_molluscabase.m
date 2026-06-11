%% get_id_molluscabase
% gets id of species name in molluscabase

%%
function id = get_id_molluscabase(my_pet, open)
% created 2021/08/02 by Bas Kooijman, modified 2026/06/11

%% Syntax
% id = <../get_id_molluscabase.m *get_id_molluscabase*>(my_pet, open)

%% Description
% Gets identifier for the accepted species name in molluscabase
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id accepted name in molluscabase

%% Remarks
% Outputs empty string if identification was not successful.
% MolluscaBase uses WoRMS AphiaIDs; the id is obtained directly from the WoRMS REST service.
% This replaces the retired CoL web service and the former R/taxize fallback.

%% Example of use
% id = get_id_molluscabase('Stagnicola_palustris',1)

address = 'https://www.molluscabase.org/aphia.php?p=taxdetails&id=';
if ~exist('open','var') || isempty(open)
  open = 0;
end

id = '';
name = strrep(strrep(my_pet, '_', ' '), '+', ' ');
urlname = strrep(name, ' ', '%20');

opts = weboptions('Timeout', 15, 'ContentType', 'text');
try % WoRMS returns the bare AphiaID, 204 (no content) if not found, or -999 if ambiguous
  res = webread(['https://www.marinespecies.org/rest/AphiaIDByName/', urlname, '?marine_only=false'], opts);
catch
  return
end

res = strtrim(num2str(res)); % WoRMS body is a single integer (numeric or char)
if isempty(res) || any(strcmp(res, {'-999','-1','0'}))
  return
end
id = res;

if open
  web([address, id],'-browser');
end
