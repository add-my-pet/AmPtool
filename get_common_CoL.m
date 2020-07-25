%% get_common_CoL
% gets the common name of a species of given id from Catolog of Life

%%
function species_en = get_common_CoL(id_CoL)
% created 2020/06/05 by Bas Kooijman

%% Syntax
% species_en = <../get_common_CoL.m *get_common_CoL*>(id_CoL)

%% Description
% Gets the common name of a species of given id from Catolog of Life
%
% Input:
%
% * id_CoL: character string with name id of species in CoL
%
% Output:
%
% * species_en: character string with common name

%% Remarks
% Get id_CoL with get_id_CoL.
% Output can be empty if CoL does not have the common name.

%% Example of use
% nm = get_common_CoL(get_id_CoL('Passer_domesticus'))

url = urlread(['http://www.catalogueoflife.org/col/details/species/id/', id_CoL]);
i = strfind(url, 'id="common-names"'); url(1:i) = [];
i = strfind(url, 'id="taxonomic-classification"'); url(i:end) = [];

i = strfind(url,'<td>English</td>'); 
if isempty(i)
  species_en = []; return
end
url(i:end) = [];
i = strfind(url, '<td>'); i = i(end); url(1:i+3) = [];
i = strfind(url, '</td>'); 
species_en = url(1:i-1);


