%% get_id_WoRMS
% gets id of accepted species name in World Register of Marine Species

%%
function [id, name_status, accepted_name] = get_id_WoRMS(my_pet, open)
% created 2021/08/01 by Bas Kooijman, modified 2021/08/26

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
% * id: character string with id of accepted name in WoRMS
% * name_status: character status of the name my_pet in WoRMS
% * accepted_name: character string with accepted name

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% [id, stat, nm] = get_id_WoRMS('Squalus_acanthias')

if ~exist('open','var')
  open = 0;
end

try
  % AphiaID suggested by Bart Vanhoorne info@marinespecies.org
  url = webread(['https://www.marinespecies.org/rest/AphiaRecordsByName/', strrep(my_pet, '_', '%20'), '?marine_only=0&like=false']);
  id = num2str(url.valid_AphiaID);
  name_status = url.status;
  accepted_name = url.valid_name;
  
  if open
    address = 'https://marinespecies.org/aphia.php?p=taxdetails&id=';
    web([address, id],'-browser');
  end

catch
  id = '';
  name_status = '';
  accepted_name = '';
end

