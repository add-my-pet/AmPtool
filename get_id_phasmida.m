%% get_id_phasmida
% gets id of species name in Phasmida Species File Online
%%
function id = get_id_phasmida(my_pet, open)
% created 2021/08/13 by Bas Kooijman

%% Syntax
% id = <../get_id_phasmida.m *get_id_phasmida*>(my_pet, open)

%% Description
% Gets identifier for Phasmida Species File Online
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in Phasmida Species File Online

%% Remarks
% Outputs empty strings if identification was not successful.

%% Example of use
% id = get_id_phasmida('Extatosoma_tiaratum',1)

address = 'http://lsid.speciesfile.org/urn:lsid:Phasmida.speciesfile.org:TaxonName:';
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
i_0 = strfind(url, 'Phasmida.speciesfile.org:TaxonName:');
if isempty(i_0)
  id = ''; return
end
i_0 = i_0(1) + 35; i_1 = strfind(url(i_0:end),'</online_resource>') - 2 + i_0(1);
id = url(i_0:i_1(1));

try
  urlread([address, id]);
catch
  id = ''; return
end

if open
  web([address, id],'-browser');
end

