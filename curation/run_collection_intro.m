%% run_collection_intro
% runs functions for collection overhead

%%
function allStat = run_collection_intro(taxa)
% created 2016/11/18 by Bas Kooijman, modified 2017/08/16, 2020/06/26

%% Syntax
% allStat = <run_collection_intro *run_collection_intro*> (taxa)

%% Description
% runs functions for collection overhead, but before running this script
%
%  * make sure that AmPtool/taxa/ is updated
%  * make sure that ../../add_my_pet/img/tree is updated
%  * run_collection(taxa-names) to generate files in entries_zip and entries_web
%  * make sure to export bibtex from Zotero to debtool/DEB library.bib
%
% Input:
%
% * taxa: optional cell array with names of entries. Runs all entries if absent
%
% Ouput:
%
% * no explicit output, bt many files are written

%% Remaks
% After running this function copy files to server 
%
% ../about.html
% ../authors.html
% ../pars.html
% ../pie_*.html
% ../species_list.html 
% ../species_names.html 
%
% ../sys/species_tree_Animalia.js
% ../sys/species_tree_Animalia_search.html
% ../sys/toolbar_*.html
%
% ../AmPdata/AmPdata.zip
%
% ../img/about/*.png 
% ../img/pars/*.png
% ../img/patterns/*.png
% ../img/tree/*.jpg and *.jpg.txt
%
% ../entries/*
% ../entries_web/*
% ../entries_zip/*

WD = cdCur;

clear allStat popStat

% allStat and popStat are made persistent 
if exist('taxa','var')
  [allStat, info] = write_addStat(taxa); % this adds/modifies allStat for selected entries
else
  [allStat, info] = write_allStat; % this overwrites allStat
end
if ~info
  return
end

write_popStat_loc; % collects entries_web/my_pet_pop.mat files in structure popStat

cdAmPdata; zip('AmPdata', '*.mat'); cdCur; % creates AmPdata/AmPdata.zip
prt_toolbar

prt_species_names;
prt_species_list;
prt_species_tree_taxa_js;
prt_authors;
prt_pars;
prt_patterns;
prt_pie_SGGJR;
prt_about;

cd(WD);
