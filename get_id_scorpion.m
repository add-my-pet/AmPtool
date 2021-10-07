%% get_id_scorpion
% gets id of accepted species name in scorpion-files

%%
function id = get_id_scorpion(my_pet, open)
% created 2021/08/13 by Bas Kooijman

%% Syntax
% id = <../get_id_scorpion.m *get_id_scorpion*>(my_pet, open)

%% Description
% Gets identifier for scorpion-files
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in scorpion-files

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_scorpion('Smeringurus_mesaensis',1)

address = 'https://www.ntnu.no/ub/scorpion-files/';
if ~exist('open','var')
  open = 0;
end

if ~isempty(strfind(my_pet, '_'));
  nm = strsplit(my_pet,'_'); % genus, species
elseif ~isempty(strfind(my_pet, ' '));
  nm = strsplit(my_pet,' '); % genus, species
end
[lineage, rank]= lineage_CoL(my_pet);
if isempty(lineage)
  id = ''; return
end
family = lineage{ismember(rank,'Family')};
id = lower([family, '.php']);

try
  urlread([address, id]);
catch
  id = ''; return
end

if open
  web([address, id],'-browser');
end

