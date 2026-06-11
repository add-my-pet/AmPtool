%% get_id_lepidoptera
% gets id of species name in Global Lepidoptera Names Index

%%
function id = get_id_lepidoptera(my_pet, open)
% created 2021/08/13 by Bas Kooijman, modified 2026/06/11

%% Syntax
% id = <../get_id_lepidoptera.m *get_id_lepidoptera*>(my_pet, open)

%% Description
% Gets identifier for Global Lepidoptera Names Index (LepIndex)
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in Global Lepidoptera Names Index

%% Remarks
% Currently returns '' (no identification).
% The id used to be harvested from the CoL web service, which was retired; LepIndex is not available as a
%   GBIF checklist dataset, so no replacement source is wired up yet.
% TODO: obtain the LepIndex taxonno from the NHM Data Portal (data.nhm.ac.uk CKAN datastore API).

%% Example of use
% id = get_id_lepidoptera('Manduca_sexta',1)

if ~exist('open','var') || isempty(open)
  open = 0;
end

id = '';
fprintf('Warning from get_id_lepidoptera: no data source available (LepIndex lookup disabled)\n');
