%% select_taxon
% selects a taxon from list

%%
function [taxon, s, v] = select_taxon (list, level)
%% created 2016/02/25 by Bas Kooijman, modified 2018/06/14

%% Syntax
% [taxon, s, v] = <../select_taxon.m *select_taxon*> (list, level)

%% Description
% select a taxon from a list of all possibilities
%
% Input:
% 
% * list: optional input with cell-vector of possible taxa (default: 'Animalia')
% * level: optional integer for level selection (default: 0)
%
%    0 all taxa, including leaves
%    1 all taxa, excluding leaves
%    2 leaves (names with "_")
%    3 genera only (names before first "_")
%    4 families only (names ending on "idae")
%    5 orders only (match with allStat.mat)
%    6 classes only (match with allStat.mat, but does not work for Reptilia)
%    7 phyla only (match with allStat.mat)
%
% Output: 
% 
% * taxon: string with name of taxon
% * s: index of taxon in the list
% * v: 0 when no selection is made, or 1 when a selection is made

%% Remarks
% taxon and s are empty, and v = 0, if cancel has been selected.
% taxon is 'Animalia', and v = 1, if no selection has been made and OK is selected

%% Example of use
%  select_taxon                         % for all taxa, including leaves
%  select_taxon('',4)                   % for family names only
%  select_taxon(list_taxa('Insecta',3)) % for insect genera

if ~exist('list', 'var')
  list = list_taxa; 
elseif exist('level', 'var')
  list = list_taxa(list, level);
end

n = length(list); i = 1:n;
i = i(strcmp(list, 'Animalia'));
[s, v] = listdlg('PromptString', 'Select a taxon', 'ListString', list, 'Selectionmode', 'single', 'InitialValue', i);
taxon = list{s};
