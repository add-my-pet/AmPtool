%% get_synonym
% gets synonyms of an accepted name in CoL

%%
function nm = get_synonym(id_CoL)
% created 2021/08/5 by Bas Kooijman

%% Syntax
% nm = <../get_id.m *get_synonym*>(id_CoL)

%% Description
% Get synonyms from CoL, via id_CoL, see <get_id_CoL.html *get_id_CoL*>.
%
% Input:
%
% * id_CoL: character strin with id of CoL
%
% Output:
%
% * nm: cell string with synonyms


%% Example of use
% get_synonym(get_id_CoL('Vulpes_vulpes'))

try
 url = urlread(['https://www.catalogueoflife.org/data/taxon/', id_CoL]);
 i_0 = strfind(url,'"alternateName"');
catch
 i_0 = [];
end
 if isempty(i_0)
   nm = cell(0,1); return
 end
 i_0 = i_0(1) + 19; i_1 = strfind(url(i_0:end),'"');
 nm = url(i_0 + i_1(1): i_0 + i_1(2));
 if ~isempty(strfind(nm,' '))
   nm = strsplit(nm, ' '); nm = [nm{1}, '_', nm{2}];
 else
   nm = '';
 end
 

