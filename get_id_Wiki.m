%% get_id_Wiki
% gets id of Wiki

%%
function id = get_id_Wiki(my_pet, open)
% created 2021/08/03 by Bas Kooijman

%% Syntax
% id = <../get_id_Wiki.m *get_id_Ange*>(my_pet, open)

%% Description
% Gets identifier for Wikipedia
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id accepted name in Wiki

%% Remarks
% Outputs empty string if identification was not successful.

%% Example of use
% id = get_id_Wiki('Bufo_bufo',1)

address = 'https://en.wikipedia.org/wiki/';
if ~exist('open','var')
  open = 0;
end

id = strrep(my_pet,' ','_'); 

try
  check = urlread([address, id]);
catch
  id = []; return
end

if open
  web([address, id],'-browser');
end

