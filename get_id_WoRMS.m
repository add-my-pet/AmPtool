%% get_id_WoRMS
% gets id of accepted species name in World Register of Marine Species

%%
function [id, nm] = get_id_WoRMS(my_pet, open)
% created 2021/08/01 by Bas Kooijman

%% Syntax
% [id, nm] = <../get_id_WoRMS.m *get_id_WoRMS*>(my_pet, open)

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
% * nm: character string with accepted name in WoRMS, which might or might not be identical to my_pet (but space-separated)

%% Remarks
% Outputs empty strings if identification was not successful.
% It uses webserver REST, which only works for marine species.
% Use <get_id_molluscabase.html *get_id_molluscabase*> to find non-marine ones.

%% Example of use
% [id, nm] = get_id_WoRMS('Squalus_acanthias')

address = 'https://marinespecies.org/aphia.php?p=taxdetails&id=';
if ~exist('open','var')
  open = 0;
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
  nm = '';
  url = urlread(['http://webservice.catalogueoflife.org/col/webservice?name=', strrep(my_pet, '_', '+')]);
  i_0 = strfind(url,'marinespecies.org/hydrozoa/aphia.php?p=taxdetails&amp;id=');
  if ~isempty(i_0)
    i_0 = i_0 + 57; i_1 = strfind(url(i_0:end),'</online') - 2 + i_0;
    id = url(i_0:i_1(1));
  else
    id = ''; nm = ''; return
  end
else
  i_1 = i_0(1)+strfind(url(i_0(1):end),','); 
  id = url(i_0(1):i_1(1)-2);
  
  % accepted name
  i_0 = 14+strfind(url,'"valid_name":"'); i_1 = i_0(1) + strfind(url(i_0(1):end),'"');
  nm = url(i_0(1):i_1(1)-2);
end


if open
  web([address, id],'-browser');
end

