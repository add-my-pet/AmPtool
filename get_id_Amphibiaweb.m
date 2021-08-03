%% get_id_Amphibiaweb
% gets id of accepted species name in Amphibiaweb

%%
function id = get_id_Amphibiaweb(my_pet, open)
% created 2021/08/02 by Bas Kooijman

%% Syntax
% id = <../get_id_Amphibiaweb.m *get_id_Amphibiaweb*>(my_pet, open)

%% Description
% Gets identifier for Amphibiaweb
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id accepted name in WoRMS

%% Remarks
% Outputs empty string if identification was not successful.

%% Example of use
% id = get_id_Amphibiaweb('Bufo_bufo',1)

address = 'https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=';
if ~exist('open','var')
  open = 0;
end

id = strrep(my_pet,'_','+'); 
id = strrep(id,' ','+'); 
check = urlread([address, id]);
if ~isempty(strfind(check,'Sorry'))
  id = []; return
end

if open
  web([address, id],'-browser');
end

