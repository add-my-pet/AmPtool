%% get_id_collembola
% gets id of species name in collembola

%%
function id = get_id_collembola(my_pet, open)
% created 2021/08/12 by Bas Kooijman, modified 2026/06/11

%% Syntax
% id = <../get_id_collembola.m *get_id_collembola*>(my_pet, open)

%% Description
% Gets identifier for collembola
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in collembola

%% Remarks
% Currently returns '' (no identification).
% The id used to be harvested from the CoL web service, which was retired; the collembola.org world checklist
%   is not available as a GBIF checklist dataset, so no replacement source is wired up yet.
% TODO: obtain the id by querying collembola.org directly (no API; would require scraping its search pages).

%% Example of use
% id = get_id_collembola('Isotoma_viridis',1)

if ~exist('open','var') || isempty(open)
  open = 0;
end

id = '';
fprintf('Warning from get_id_collembola: no data source available (collembola.org lookup disabled)\n');
