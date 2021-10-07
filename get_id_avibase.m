%% get_id_avibase
% gets id of name in avibase

%%
function id = get_id_avibase(my_pet, open)
% created 2021/08/02 by Bas Kooijman

%% Syntax
% id = <../get_id_avibase.m *get_id_avibase*>(my_pet, open)

%% Description
% Gets identifier for avibase
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in avibase

%% Remarks
% Outputs empty string if identification was not successful.

%% Example of use
% id = get_id_avibase('Passer_domesticus', 1)

address = 'https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=';
if ~exist('open','var')
  open = 0;
end

my_pet = strrep(my_pet,'_','+'); 
my_pet = strrep(my_pet,' ','+'); 

url = urlread(['https://avibase.bsc-eoc.org/search.jsp?pg=search&qstr=', my_pet]);

if isempty(strfind(url,'Search results')) % single or no result
  i_0 = strfind(url,'avibaseid='); if isempty(i_0); id = ''; return; end
  i_0 = i_0 + 10; i_1 = strfind(url(i_0(1):end),'&') + i_0(1) - 2; id = url(i_0(1): i_1(1));
else % multiple results
  i_1 = strfind(url,[''')">', strrep(my_pet, '+', ' '), '</a>']);
  if isempty(i_1); id = ''; return; end
  i_1 = i_1 - 1; i_0 = strfind(url(1:i_1), '''') + 1;
  id = url(i_0(end): i_1(1));
end

if open
  web([address, id],'-browser');
end

