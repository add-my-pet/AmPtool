%% get_id_CoL
% gets id and name of the corresponding accepted species-name in Catolog of Life

%%
function [id_CoL, name_status, accepted_name] = get_id_CoL(my_pet, open)
% created 2018/01/05 by Bas Kooijman

%% Syntax
% [id_CoL, name_status, accepted_name] = <../get_id_CoL.m *get_id_CoL*>(my_pet, open)

%% Description
% Gets identifier for an accepted species name in the Catalog of Life
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id_CoL: character string of id in CoL
% * name_status: character status of the name my_pet in CoL
% * accepted_name: character string with accepted name

%% Remarks
% Outputs empty string if identification was not successful.
% Used in lineage_CoL

%% Example of use
% id_CoL = get_id_CoL('Daphnia_magna',1)

address = 'https://www.catalogueoflife.org/data/taxon/';
if ~exist('open','var')
  open = 0;
end

if ~isempty(strfind(my_pet, ' '));
  my_pet = strrep(my_pet,' ','_');
end

my_pet_CoL = strrep(my_pet, '_', '+');
url = urlread(['http://webservice.catalogueoflife.org/col/webservice?name=', my_pet_CoL]);
i_0 = 10 + strfind(url,'<result>'); i_1 = strfind(url,'</result>') - 1; 
n_res = length(i_0); % number of returned results
id_CoL = '';         % initiate identifier
name_status = '';    % initiate name_status
accepted_name = '';  % initiate accepted name

if n_res == 0
  fprintf(['Warning from get_id_CoL: ', my_pet, ' not found in CoL\n']);
  if ~isempty(strfind(my_pet,'_'))
    genus = strsplit(my_pet,'_') ; genus = genus{1}; 
    [id_CoL, name_status, accepted_name] = get_id_CoL(genus);
    if open
      web([address, id_CoL],'-browser');
    end
  end
  return
end

for i = 1:n_res % scan results
  res_i = url(i_0(i):i_1(i));
  j_0 = 13 + strfind(res_i, '<name_status>'); j_1 = strfind(res_i, '</name_status>') - 1;
  name_status = res_i(j_0(end):j_1(end)); name_status = strsplit(name_status, ' '); name_status = name_status{1};
  if strcmp(name_status,'accepted')
    j_0 = 4 + strfind(res_i, '<id>'); j_1 = strfind(res_i, '</id>') - 1;
    id_CoL = res_i(j_0:j_1);
    accepted_name = strrep(my_pet, '+', '_');
    break
  elseif strcmp(name_status,'synonym')
    fprintf(['Warning from get_id_CoL: ', my_pet, ' not accepted in CoL\n']);
    j_0 = 15 + strfind(res_i, '<accepted_name>'); j_1 = strfind(res_i, '</accepted_name>') - 1;
    res_i = res_i(j_0:j_1);
    j_0 = 6 + strfind(res_i, '<name>'); j_1 = strfind(res_i, '</name>') - 1;
    accepted_name = strrep(res_i(j_0:j_1), ' ', '_');
    j_0 = 4 + strfind(res_i, '<id>'); j_1 = strfind(res_i, '</id>') - 1;
    id_CoL = res_i(j_0:j_1);
    break
  end
end

if isempty(id_CoL) && ~isempty(strfind(my_pet,'_'))
  genus = strsplit(my_pet,'_') ; genus = genus{1}; 
  [id_CoL, name_status, accepted_name] = get_id_CoL(genus);
elseif isempty(id_CoL)
  return
end

if open
  web([address, id_CoL],'-browser');
end
