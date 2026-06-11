%% get_id_spider
% gets id of accepted species name in World Spider Catalog
%%
function id = get_id_spider(my_pet, open)
% created 2021/08/13 by Bas Kooijman, modified 2026/06/11

%% Syntax
% id = <../get_id_spider.m *get_id_spider*>(my_pet, open)

%% Description
% Gets identifier for World Spider Catalog
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in World Spider Catalog

%% Remarks
% Outputs empty string if identification was not successful.
% The CoL web service was retired; the id is now read from the World Spider Catalog checklist on GBIF.
% GBIF stores the id as an LSID (urn:lsid:nmbe.ch:spidersp:NNNNNN); the trailing number is the WSC species id.

%% Example of use
% id = get_id_spider('Aglaoctenus_lagotis',1)

address = 'https://wsc.nmbe.ch/species/';
if ~exist('open','var') || isempty(open)
  open = 0;
end

taxonID = get_id_GBIFdataset(my_pet, '80dd9c94-241b-4d49-999f-c89de7648525');
if isempty(taxonID)
  id = ''; return
end

num = regexp(taxonID, '\d+$', 'match', 'once'); % trailing digits of the LSID
if isempty(num)
  id = ''; return
end
id = num2str(str2double(num)); % drop leading zeros, e.g. 017224 -> 17224

if open
  web([address, id],'-browser');
end
