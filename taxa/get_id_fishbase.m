%% get_id_fishbase
% gets id of accepted species name in fishbase

%%
function id = get_id_fishbase(my_pet, open)
% created 2021/08/02 by Bas Kooijman

%% Syntax
% id = <../get_id_fishbase.m *get_id_fishbase*>(my_pet, open)

%% Description
% Gets identifier for fishbase
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in fishbase

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_fishbase('Squalus_acanthias',1)

address = 'https://www.fishbase.se/summary/';
if ~exist('open','var')
  open = 0;
end

id = strrep(my_pet,'_','-'); 
id = strrep(id,' ','-'); 
check = urlread([address, id]);
if ~isempty(strfind(check,'Species name is not in the public version of FishBase'))
  id = []; return
end

if open
  web([address, id],'-browser');
end

