%% get_id_ITIS
% gets id of accepted species name in ITIS

%%
function id = get_id_ITIS(my_pet, open)
% created 2021/08/13 by Bas Kooijman

%% Syntax
% id = <../get_id_ITIS.m *get_id_ITIS*>(my_pet, open)

%% Description
% Gets identifier for ITIS
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in ITIS

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_ITIS('Lacerta_schreiberi',1)

address = 'https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=';
if ~exist('open','var')
  open = 0;
end


my_pet = strrep(my_pet, ' ', '_');
my_pet_ITIS = strrep(my_pet, '_', '%20');

try
  url = urlread(['https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=Scientific_Name&search_value=', my_pet_ITIS, '&search_kingdom=Animal&search_span=containing&categories=All&source=html&search_credRating=All']);
catch
  id = ''; return
end
i_0 = strfind(url, 'search_value=');
if isempty(i_0)
  my_pet = get_synonym(my_pet); my_pet_ITIS = strrep(my_pet, '_', '%20');
  try
    url = urlread(['https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=Scientific_Name&search_value=', my_pet_ITIS, '&search_kingdom=Animal&search_span=containing&categories=All&source=html&search_credRating=All']);
  catch
    id = ''; return
  end
  i_0 = strfind(url, 'search_value=');
  if isempty(i_0)
    id = ''; return
  end
end
i_0 = i_0(1) + 13; i_1 = strfind(url(i_0(1):end), '"') - 2 + i_0(1);
id = url(i_0(1):i_1(1)); i_1 = strfind(id,'&');
if ~isempty(i_1)
   id = id(1:i_1-1);
end

try
  url = urlread([address, id]);
catch
  id = ''; return
end

if open
  web([address, id],'-browser');
end

