%% open_link
% open links to web-pages for AmP entries

%%
function open_link(taxon)
% created 2018/01/30
%% Syntax
% <open_link *open_link*>(taxon)

%% Description
% Opens web links for an entry in the system brouwser, as provded by <get_link.html *get_link*>
%
% Input:
%
% * taxon: character string with name of an entry

%% Remark
% Uses curation function <curation/get_link.html *get_link*> in display mode

%% Example
% open_link('Daphnia_magna')

get_link(taxon, 1);