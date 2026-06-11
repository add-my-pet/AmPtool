%% get_id_aphid
% gets id of species name in Aphid Species File
%%
function id = get_id_aphid(my_pet, open)
% created 2021/08/13 by Bas Kooijman, modified 2026/06/11

%% Syntax
% id = <../get_id_aphid.m *get_id_aphid*>(my_pet, open)

%% Description
% Gets identifier for Aphid Species File
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in Aphid Species File

%% Remarks
% Outputs empty string if identification was not successful.
% The CoL web service was retired; the id is now read from the Aphid Species File checklist on GBIF.

%% Example of use
% id = get_id_aphid('Acyrthosiphon_pisum',1)

address = 'http://lsid.speciesfile.org/urn:lsid:Aphid.speciesfile.org:TaxonName:';
if ~exist('open','var') || isempty(open)
  open = 0;
end

id = get_id_GBIFdataset(my_pet, '214c3109-d37a-40f8-9c24-5b6e59915394');
if isempty(id)
  return
end

if open
  web([address, id],'-browser');
end
