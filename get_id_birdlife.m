%% get_id_birdlife
% gets id of name in birdlife

%%
function id = get_id_birdlife(my_pet, open)
% created 2021/08/02 by Bas Kooijman

%% Syntax
% id = <../get_id_birdlife.m *get_id_birdlife*>(my_pet, open)

%% Description
% Gets identifier for birdlife
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in birdlife

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% get_id_birdlife('Passer_domesticus', 1)

address = 'http://datazone.birdlife.org/species/factsheet/';

if ~exist('open','var')
  open = 0;
end

my_pet = strrep(my_pet,'_','+'); 
my_pet = strrep(my_pet,' ','+'); 

url = urlread(['http://datazone.birdlife.org/quicksearch?qs=', my_pet]);
i_0 = strfind(url,'factsheet/'); 
if isempty(i_0)
  id = ''; return
end
i_0 = i_0 + 10; i_1 = strfind(url(i_0(1):end),'"') + i_0(1) - 2;
id = url(i_0(1): i_1(1));

if open
  web([address, id],'-browser');
end

