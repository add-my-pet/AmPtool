%% get_common_Taxo
% gets the common name of a species of given id from Taxonomicon

%%
function [common, species] = get_common_Taxo(id_Taxo)
% created 2020/06/05 by Bas Kooijman

%% Syntax
% [common, species] = <../get_common_Taxo.m *get_common_Taxo*>(id_Taxo)

%% Description
% Gets the common name of a species of given id from Taxonomicon
%
% Input:
%
% * id_Taxo: character string with name id of species in Taxo
%
% Output:
%
% * common: cell string with common name
% * species: cell string with scientific name

%% Remarks
% Get id_Taxo with get_id_Taxo.
% Output can be empty if Taxo does not have the common name.

%% Example of use
% nm = get_common_Taxo(get_id_Taxo('Passer_domesticus'))

url = webread(['http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id=', id_Taxo]);
try
  i_0 = 8+strfind(url,'Species '); i_1 = i_0(1) + strfind(url(i_0(1):end), ' - '); species = url(i_0(1):i_1(1)-2); 
catch
  species = ''; common = ''; return
end
try
  i_0 = 2+strfind(url,['<b>',species,'</b>']); i_0 = 2 + i_0(end) + strfind(url(i_0(end):end), ' - '); i_1 = i_0(1) + strfind(url(i_0(1):end),'</span>');
  common = url(i_0:i_1(1)-2);
catch
  common = '';
end
