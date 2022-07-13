%% get_id_Wiki
% gets id of Wiki

%%
function id = get_id_Wiki(my_pet, open)
% created 2021/08/03 by Bas Kooijman

%% Syntax
% id = <../get_id_Wiki.m *get_id_Ange*>(my_pet, open)

%% Description
% Gets identifier for Wikipedia
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id accepted name in Wiki

%% Remarks
% Outputs empty string if identification was not successful.

%% Example of use
% id = get_id_Wiki('Bufo_bufo',1)

address = 'https://en.wikipedia.org/wiki/';
if ~exist('open','var')
  open = 0;
end

my_pet = strrep(my_pet,' ','_'); 
id = my_pet;

try
  url = urlread([address, id]);
  if ~isempty(strfind(url, 'not have an article'))
    id = '';
  end
catch
  id = '';
end

if isempty(id)
  try
    id_syn = get_synonym(get_id_CoL(my_pet));
  catch
    id_syn = '';
  end
  if ~isempty(id_syn)
    try
      url = urlread([address, id_syn]);
      if ~isempty(strfind(url, 'not have an article'))
        id = '';
      else
        id = id_syn;
      end
    catch
      id = '';
    end
  end
end

if isempty(id)
  id = strsplit(my_pet,'_'); id = id{1};
  try
    urlread([address, id]);
  catch
    id = ''; return
  end
end
    
if open
  web([address, id],'-browser');
end

