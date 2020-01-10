%% run_collection_intro
% runs functions for collection overhead

%% before running this script
% make sure that AmPtool/taxa/ is updated
% make sure that ../../add_my_pet/img/tree is updated
% run_collection(taxa-names) to generate files in entries_zip and entries_web
% make sure to export bibtex from Zotero to debtool/DEB library.bib

WD = cdCur;

% allStat and popStat are made persistent 
clear all
write_allStat;     % load ../../add_my_pet/AmPdata/allStat
write_popStat_loc; % load ../../add_my_pet/AmPdata/popStat
filenm = zip('AmPdata', '*.mat' , '../../add_my_pet/AmPdata/'); movefile AmPdata.zip '../../add_my_pet/AmPdata/'
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

%% cp files to server after running this script

% ../about.html
% ../authors.html
% ../pars.html
% ../pie_*.html
% ../species_list.html 
% ../species_names.html 

% ../sys/species_tree_Animalia.js
% ../sys/species_tree_Animalia_search.html
% ../sys/toolbar_*.html

% ../AmPdata/AmPdata.zip

% ../img/about/*.png 
% ../img/pars/*.png
% ../img/patterns/*.png
% ../img/tree/*.jpg and *.jpg.txt

% ../entries/*
% ../entries_web/*
% ../entries_zip/*
