%% get_id_diptera
% gets id of accepted species name in diptera

%%
function id = get_id_diptera(my_pet, open)
% created 2021/08/09 by Bas Kooijman

%% Syntax
% id = <../get_id_diptera.m *get_id_diptera*>(my_pet, open)

%% Description
% Gets identifier for diptera
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in diptera

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_diptera('Chironomus_riparius',1)

address = 'https://diptera.info/search.php?stext=id_diptera&search=Search&method=OR&forum_id=0&stype=photos';
if ~exist('open','var')
  open = 0;
end

id = strrep(my_pet,'_','+'); 
id = strrep(id,' ','+'); 
check = urlread(strrep(address, 'id_diptera', id));
if ~isempty(strfind(check,'0 Photos found'))
  id = ''; return
end

if open
  web(strrep(address, 'id_diptera', id),'-browser');
end

