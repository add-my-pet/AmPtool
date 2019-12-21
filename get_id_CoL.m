%% get_id_CoL
% gets id of species name in Catolog of Life

%%
function [id_CoL accepted_name] = get_id_CoL(my_pet)
% created 2018/01/05 by Bas Kooijman

%% Syntax
% [id_CoL accepted_name] = <../get_id_CoL.m *get_id_CoL*>(my_pet)

%% Description
% Gets identifier for an accepted species name in the Catalog of Life
%
% Input:
%
% * my_pet: character string with name of a taxon
%
% Output:
%
% * id_CoL: character string of id in CoL
% * accepted_name: character string with accepted name

%% Remarks
% Outputs empty string if identification was not successful.
% Used in lineage_CoL

%% Example of use
% id_CoL = get_id_CoL('Daphnia_magna')

my_pet_CoL = strrep(my_pet, '_', '+');
url = urlread(['http://webservice.catalogueoflife.org/col/webservice?name=', my_pet_CoL]);
i_0 = 10 + strfind(url,'<result>'); i_1 = strfind(url,'</result>') - 1; 
n_res = length(i_0); % number of returned results
id_CoL = [];         % initiate identifier
accepted_name = [];  % initiate accepted name

if n_res == 0
  fprintf(['Warning from get_id_CoL: ', my_pet, ' not found in CoL\n']);
  return
end

for i = 1:n_res % scan results
  res_i = url(i_0(i):i_1(i));
  j_0 = 13 + strfind(res_i, '<name_status>'); j_1 = strfind(res_i, '</name_status>') - 1;
  name_status = res_i(j_0:j_1); 
  if strcmp(name_status,'accepted name')
    j_0 = 4 + strfind(res_i, '<id>'); j_1 = strfind(res_i, '</id>') - 1;
    id_CoL = res_i(j_0:j_1);
    accepted_name = strrep(my_pet, '+', '_');
    break
  elseif strcmp(name_status,'synonym')
    fprintf('Warning from get_id_CoL: Species not accepted in CoL\n');
    j_0 = 15 + strfind(res_i, '<accepted_name>'); j_1 = strfind(res_i, '</accepted_name>') - 1;
    res_i = res_i(j_0:j_1);
    j_0 = 6 + strfind(res_i, '<name>'); j_1 = strfind(res_i, '</name>') - 1;
    accepted_name = strrep(res_i(j_0:j_1), ' ', '_');
    j_0 = 4 + strfind(res_i, '<id>'); j_1 = strfind(res_i, '</id>') - 1;
    id_CoL = res_i(j_0:j_1);
    break
  end
end

if isempty(id_CoL)
  fprintf('Warning from get_id_CoL: No accepted species found in CoL\n');
end
