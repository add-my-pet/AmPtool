%% get_id_phasmida
% gets id of species name in Phasmida Species File Online
%%
function id = get_id_phasmida(my_pet, open)
% created 2021/08/13 by Bas Kooijman, modified 2026/06/11

%% Syntax
% id = <../get_id_phasmida.m *get_id_phasmida*>(my_pet, open)

%% Description
% Gets identifier for Phasmida Species File Online
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in Phasmida Species File Online

%% Remarks
% Outputs empty string if identification was not successful.
% The CoL web service was retired; the id is now read from the Phasmida Species File checklist on GBIF.

%% Example of use
% id = get_id_phasmida('Extatosoma_tiaratum',1)

address = 'http://lsid.speciesfile.org/urn:lsid:Phasmida.speciesfile.org:TaxonName:';
if ~exist('open','var') || isempty(open)
  open = 0;
end

id = get_id_GBIFdataset(my_pet, '598678e4-323c-49dc-8eb7-3a96ac72d472');
if isempty(id)
  return
end

if open
  web([address, id],'-browser');
end
