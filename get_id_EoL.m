%% get_id_EoL
% gets id of species name in EoL
%%
function id_EoL = get_id_EoL(my_pet)
% created 2018/01/31 by Bas Kooijman

%% Syntax
% id_EoL = <../get_id_EoL.m *get_id_EoL*>(my_pet)

%% Description
% Gets identifier for a species name in EoL
%
% Input:
%
% * my_pet: character string with name of an entry
%
% Output:
%
% * id_EoL: character string of id in EoL

%% Remarks
% Outputs empty string if identification was not successful

%% Example of use
% id_EoL = get_id_EoL('Daphnia_magna')

url = urlread(['http://eol.org/pages/', my_pet]);
ind = strfind(url,'http://eol.org/pages/'); ind = ind(1) + 20; url(1:ind) = [];
id_EoL = url(1:(strfind(url,'/') - 1)); 

if isempty(id_EoL)
  fprintf(['Warning from get_id_EoL: ', my_pet, ' not found in EoL\n']);
end
