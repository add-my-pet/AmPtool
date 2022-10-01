%% get_id_AnAge
% gets id of AnAge

%%
function id = get_id_AnAge(my_pet, open)
% created 2021/08/03 by Bas Kooijman

%% Syntax
% id = <../get_id_AnAge.m *get_id_Ange*>(my_pet, open)

%% Description
% Gets identifier for Animal Ageing and Longevity Database
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id accepted name in AnAge

%% Remarks
% Outputs empty string if identification was not successful.

%% Example of use
% id = get_id_AnAge('Bufo_bufo',1)

address = 'https://genomics.senescence.info/species/entry.php?species=';
if ~exist('open','var')
  open = 0;
end

id = strrep(my_pet,' ','_');  

try
  check = urlread([address, id]);
  if ~isempty(strfind(check, 'not found'))
    id = ''; return
  end
catch
  fprintf('AnAge cannot be reached\n');
  id = ''; return
end

if open
  web([address, id],'-browser');
end

