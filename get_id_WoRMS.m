%% get_id_WoRMS
% gets id of accepted species name in World Register of Marine Species

%%
function [id, nm] = get_id_WoRMS(my_pet)
% created 2021/08/01 by Bas Kooijman

%% Syntax
% [id, nm] = <../get_id_WoRMS.m *get_id_WoRMS*>(my_pet)

%% Description
% Gets identifier for the accepted species name in the World Register of Marine Species
%
% Input:
%
% * my_pet: character string with name of a taxon
%
% Output:
%
% * id: character string with id accepted name in WoRMS
% * nm: character string with accepted name in WoRMS, which might or might not be identical to my_pet (but space-separated)

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% [id, nm] = get_id_WoRMS('Squalus_acanthias')

% AphiaID
url = urlread(['http://www.marinespecies.org/rest/AphiaRecordsByName/', my_pet]);
i_0 = 16+strfind(url,'"valid_AphiaID":'); 
if isempty(i_0)
  id = ''; nm = ''; return
end
i_1 = i_0(1)+strfind(url(i_0(1):end),','); 
id = url(i_0(1):i_1(1)-2);

% accepted name
i_0 = 14+strfind(url,'"valid_name":"'); i_1 = i_0(1) + strfind(url(i_0(1):end),'"');
nm = url(i_0(1):i_1(1)-2);
