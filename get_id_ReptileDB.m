%% get_id_ReptileDB
% gets id of accepted species name in ReptileDB

%%
function id = get_id_ReptileDB(my_pet, open)
% created 2021/08/02 by Bas Kooijman

%% Syntax
% id = <../get_id_ReptileDB.m *get_id_ReptileDB*>(my_pet, open)

%% Description
% Gets identifier for ReptileDB
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in ReptileDB

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_ReptileDB('Lacerta_schreiberi',1)

address = 'https://reptile-database.reptarium.cz/species?';
if ~exist('open','var')
  open = 0;
end

if ~isempty(strfind(my_pet, '_'));
  nm = strsplit(my_pet,'_'); % genus, species
elseif ~isempty(strfind(my_pet, ' '));
  nm = strsplit(my_pet,' '); % genus, species
end
genus = nm{1}; species = nm{2};
id = ['genus=', genus, '&species=', species];

check = urlread([address, id]);
if ~isempty(strfind(check,'was not found'))
  id = ''; return
end

if open
  web([address, id],'-browser');
end

