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
% id = get_id_birdlife('Passer_domesticus', 1)

address = 'http://datazone.birdlife.org/species/factsheet/';
if ~exist('open','var')
  open = 0;
end

url = urlread(['https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=', get_id_avibase(my_pet)]);
i_0 = strfind(url,'name="twitter:title" content="') + 30;
i_1 = strfind(url(i_0:end), '"') + i_0(1) - 2;
id = lower(url(i_0(1): i_1(1))); id = strrep(id, '- ', '-'); id = strrep(id, ' ', '-');

if open
  web([address, id],'-browser');
end

