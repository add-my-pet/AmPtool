%% get_id_WoRMS
% gets id of accepted species name in World Register of Marine Species

%%
function [id, nm] = get_id_WoRMS(my_pet, show_in_browser)
% created 2021/08/01 by Bas Kooijman

%% Syntax
% [id, nm] = <../get_id_WoRMS.m *get_id_WoRMS*>(my_pet, show_in_browser)

%% Description
% Gets identifier for the accepted species name in the World Register of Marine Species
%
% Input:
%
% * my_pet: character string with name of a taxon
% * show_in_browser: optional boolean for opening in browser (defaul: 0)
%
% Output:
%
% * id: character string with id accepted name in WoRMS
% * nm: character string with accepted name in WoRMS, which might or might not be identical to my_pet (but space-separated)

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% [id, nm] = get_id_WoRMS('Squalus_acanthias')

address = 'http://marinespecies.org/aphia.php?p=taxdetails&id=';
if ~exist('show_in_browser','var')
  show_in_browser = 0;
end

if ~isempty(strfind(my_pet, '_'));
  nm = strsplit(my_pet,'_'); % genus, species
elseif ~isempty(strfind(my_pet, ' '));
  nm = strsplit(my_pet,' '); % genus, species
  my_pet = strrep(my_pet,' ','_');
end

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

if show_in_browser
  web([address, id],'-browser');
end

