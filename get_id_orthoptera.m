%% get_id_orthoptera
% gets id of species name in Orthoptera Species File Online

%%
function id = get_id_orthoptera(my_pet, open)
% created 2021/08/13 by Bas Kooijman, modified 2026/06/11

%% Syntax
% id = <../get_id_orthoptera.m *get_id_orthoptera*>(my_pet, open)

%% Description
% Gets identifier for Orthoptera Species File Online
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in Orthoptera Species File Online

%% Remarks
% Outputs empty string if identification was not successful.
% The CoL web service was retired; the id is now read from the Orthoptera Species File checklist on GBIF.

%% Example of use
% id = get_id_orthoptera('Locusta_migratoria',1)

address = 'http://orthoptera.speciesfile.org/Common/basic/Taxa.aspx?TaxonNameID=';
if ~exist('open','var') || isempty(open)
  open = 0;
end

id = get_id_GBIFdataset(my_pet, 'af66d4cf-0fd2-434b-9334-9806a5efa6f7');
if isempty(id)
  return
end

if open
  web([address, id],'-browser');
end
