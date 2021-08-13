%% get_id_WoRMS
% gets id of accepted species name in World Register of Marine Species

%%
function [id, name_status, accepted_name] = get_id_WoRMS(my_pet, open)
% created 2021/08/01 by Bas Kooijman

%% Syntax
% [id, name_status, accepted_name] = <../get_id_WoRMS.m *get_id_WoRMS*>(my_pet, open)

%% Description
% Gets identifier for the accepted species name in the World Register of Marine Species
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id accepted name in WoRMS
% * name_status: character status of the name my_pet in WoRMS
% * accepted_name: character string with accepted name

%% Remarks
% Outputs empty strings if identification was not successful.
% It uses webserver REST, which only works for marine species, and the webserver of CoL for non-marine ones.

%% Example of use
% [id, stat, nm] = get_id_WoRMS('Squalus_acanthias')

address = 'https://marinespecies.org/aphia.php?p=taxdetails&id=';
if ~exist('open','var')
  open = 0;
end

id = ''; name_status = ''; accepted_name = ''; % initiate

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
  nm = '';
  url = urlread(['http://webservice.catalogueoflife.org/col/webservice?name=', strrep(my_pet, '_', '+')]);
  if isempty(strfind(url,'www.marinespecies.org'))
    id = ''; nm = ''; return
  end
  i_0 = strfind(url,'aphia.php?p=taxdetails&amp;id=');
  if ~isempty(i_0)
    i_0 = i_0(1) + 30; i_1 = strfind(url(i_0:end),'</online') - 2 + i_0;
    id = url(i_0:i_1(1));
  else
    id = ''; nm = ''; return
  end
else
  i_1 = i_0(1)+strfind(url(i_0(1):end),','); 
  id = url(i_0(1):i_1(1)-2);
  
  % name status
  i_0 = 10 + strfind(url,'"status":"'); i_1 = i_0(1) + strfind(url(i_0(1):end),'"');
  name_status = url(i_0(1):i_1(1)-2); name_status = strsplit(name_status, ' '); name_status = name_status{1};
  if strcmp(name_status,'alternate'); name_status = 'synonym'; end

  % accepted name
  i_0 = 14+strfind(url,'"valid_name":"'); i_1 = i_0(1) + strfind(url(i_0(1):end),'"');
  accepted_name = strrep(url(i_0(1):i_1(1)-2), ' ', '_');
end


if open
  web([address, id],'-browser');
end

