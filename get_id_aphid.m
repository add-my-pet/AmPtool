%% get_id_aphid
% gets id of species name in Aphid Species File
%%
function id = get_id_aphid(my_pet, open)
% created 2021/08/13 by Bas Kooijman

%% Syntax
% id = <../get_id_aphid.m *get_id_aphid*>(my_pet, open)

%% Description
% Gets identifier for Aphid Species File
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in Aphid Species File

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_aphid('Acyrthosiphon_pisum',1)

address = 'http://lsid.speciesfile.org/urn:lsid:Aphid.speciesfile.org:TaxonName:';
if ~exist('open','var')
  open = 0;
end

my_pet = strrep(my_pet,' ','+');
my_pet = strrep(my_pet,'_','+');

try
  url = urlread(['http://webservice.catalogueoflife.org/col/webservice?name=', my_pet]);
catch
  id = ''; return
end
i_0 = strfind(url, 'Aphid.speciesfile.org:TaxonName:');
if isempty(i_0)
  id = ''; return
end
i_0 = i_0(1) + 32; i_1 = strfind(url(i_0:end),'</online_resource>') - 2 + i_0(1);
id = url(i_0:i_1(1));

try
  urlread([address, id]);
catch
  id = ''; return
end

if open
  web([address, id],'-browser');
end

