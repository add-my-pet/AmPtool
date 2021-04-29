%% get_common_CoL
% gets the common name of a species of given id from Catolog of Life

%%
function common = get_common_CoL(id_CoL, language)
% created 2020/06/05 by Bas Kooijman

%% Syntax
% common = <../get_common_CoL.m *get_common_CoL*>(id_CoL)

%% Description
% Gets the common name of a species of given id from Catolog of Life
%
% Input:
%
% * id_CoL: character string with name id of species in CoL
% * language: optional string with language (default: 'English')
%
% Output:
%
% * common: cell string with common names

%% Remarks
% Get id_CoL with get_id_CoL.
% Output can be empty if CoL does not have the common name.

%% Example of use
% nm = get_common_CoL(get_id_CoL('Passer_domesticus'),'French')

if ~exist('language', 'var') || isempty(language)
  language = 'English';
end

url = urlread(['http://webservice.catalogueoflife.org/col/webservice?id=', id_CoL, '&response=full']);
i_0 = 13 + strfind(url, '<commonNames>'); i_1 = strfind(url, '</commonNames>') - 1;
if isempty(i_0)
  common = {}; return
end
url = url(i_0:i_1(end)); % substring between <commonNames>...</commonNames>

j_0 = 6 + strfind(url, '<name>'); j_1 = strfind(url, '</name>') - 1; 
k_0 = 10 + strfind(url, '<language>'); k_1 = strfind(url, '</language>') - 1; 
l_0 = 11 + strfind(url, '<language/>'); l_1 = l_0; % no language specified
k_0 = sort([k_0,l_0]); k_1 = sort([k_1,l_1]);

n = length(j_0); 
if n == 0
  common = {}; return
end   
common = cell(n,1); lan = cell(n,1);
for i=1:n
  common{i} = url(j_0(i):j_1(i));
  lan{i} = url(k_0(i):k_1(i));
end
common = unique(common(strcmp(language,lan)));


