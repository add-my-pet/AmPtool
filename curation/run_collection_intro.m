%% run_collection_intro
% runs functions for collection overhead

%%
function run_collection_intro(entries)
% created 2016/11/18 by Bas Kooijman, modified 2017/08/16, 2020/06/26

%% Syntax
% <run_collection_intro *run_collection_intro*> (entries)

%% Description
% runs functions for collection overhead, but before running this script
%
%  * update lists-of-lists in AmPtool/taxa
%  * upade AmPtool/entries/ 
%  * pudate ../../add_my_pet/img/tree 
%  * run_collection(entries-names) to generate files in entries_zip and entries_web
%  * export bibtex from Zotero to debtool/DEB library.bib
%
% Input:
%
% * entries: optional cell array with names of entries. Runs all entries if absent
%
% Ouput:
%
% * no explicit output, but many files are written

%% Remarks
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

clear global % allStat and popStat are made persistent 

if exist('entries','var')
  [allStat, info] = write_addStat(entries); % this adds/modifies allStat for selected entries
   write_popStat_loc(entries); % collects entries_web/my_pet_pop.mat files in structure popStat
else
  [allStat, info] = write_allStat; % this overwrites allStat
  write_popStat_loc; % collects entries_web/my_pet_pop.mat files in structure popStat
end
if ~info
  return
end


cdAmPdata; zip('AmPdata', {'allStat.mat','popStat.mat','cdAmPdata.m'}); cdCur; % creates AmPdata/AmPdata.zip
prt_toolbar

prt_species_names;
prt_species_list;
prt_species_tree_taxa_js;
prt_authors;
prt_pars;
prt_patterns;
prt_pie_SGGJR;
prt_about;

cd('C:\Program Files\2BrightSparks\SyncBackPro')
system('powershell SyncBackPro AmP2VU -i  AmP2IUEM -i');

cd(WD);
