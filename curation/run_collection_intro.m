%% run_collection_intro
% runs functions for collection overhead

%%
function run_collection_intro(entries)
% created 2016/11/18 by Bas Kooijman, modified 2017/08/16, 2020/06/26, 2021/06/11

%% Syntax
% <run_collection_intro *run_collection_intro*> (entries)

%% Description
% runs functions for collection overhead, but before running this script
%
%  * update lists-of-lists in AmPtool/taxa
%  * update files in add_my_pet/entries/
%  * update ../../add_my_pet/img/tree/ by adding *.jpg and *.jpg.txt files
%  * run_collection(entries-names) to generate files in add_my_pet/entries_zip and entries_web
%  * export bibtex from Zotero to deb/DEB library.bib for the DEBlib picture on add_my_pet/about.html)
%
% Input:
%
% * entries: optional cell array with names of entries. Runs all entries if absent
%
% Ouput:
%
% * no explicit output, but many files are written

%% Remarks
% All variables will be cleared
% SyncBackPro is used to copy the following files to server 
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
%
% Repository AmPtool is synced with Github

WD = cdCur; % go to AmPtool/curation

% allStat and popStat are made persistent and must be overwritten
save('temporary.mat','WD','entries'); clear all; load('temporary.mat'); delete('temporary.mat');

% write add_my_pet/AmPdata/allStat.mat and popStat.mat
if exist('entries','var')
  [allStat, info] = write_addStat(entries); % this adds/modifies allStat for selected entries
  if ~info; return; end;
  write_popStat_loc(entries); % collects entries_web/my_pet_pop.mat files in structure popStat
else
  [allStat, info] = write_allStat; % this overwrites allStat
  if ~info; return; end;
  write_popStat_loc; % collects entries_web/my_pet_pop.mat files in structure popStat
end

% write add_my_pet/AmPdata/AmPdata.zip
cdAmPdata; zip('AmPdata', {'allStat.mat','popStat.mat','cdAmPdata.m'}); cdCur; 
% write toolbars in add_my_pet/sys/ to update dropdown collection/AmPdata
% toolbar_AmPtool.html is also written, but moved to AmPtool/docs for syncing with GitHub
prt_toolbar; % add_my_pet/sys/toolbar_amp.html, toolbar_app.html, toolbar_buget.html, toolbar_entry.html
% add_my_pet/sys/toolbar_deblab.html and toolbar_subdeblab.html are static

prt_species_names; % add_my_pet/species_names.html
prt_species_list; % add_my_pet/species_list.html
prt_species_tree_taxa_js; % add_my_pet/sys/species_tree_Animalia.js and species_tree_Animalia_search.html javascript for the tree; add_my_pet/species_tree.html itself is static
prt_authors; % add_my_pet/authors.html
prt_pars; % add_my_pet/pars.html
prt_patterns; % add_my_pet/patterns.html
prt_pie_SGGJR; % add_my_pet/pie_pSGJRb.html, pie_pSGJRi.html, pie_pSGJRp.html, pie_SGJRb.html
prt_about; % add_my_pet/about.html

% cleanup
delete('..\taxa\*.txt~','..\taxa\*.txt#') % delete emacs backup-files
delete('..\..\add_my_pet\img\tree\*.txt~','..\..\add_my_pet\img\tree\*.txt#') % delete emacs backup-files

% sync AmPtool with github to update AmPtool/taxa and AmPtool/docs/index.html 
if ismac || isunix
  % system('git status');
  system('git add ../taxa/* ../docs/*');
  system('git commit -am "extension"');
  system('git push origin master');
else
  % system('powershell git status');
  system('powershell git add ../taxa/* ../docs/*');
  system('powershell git commit -am "extension"');
  system('powershell git push origin master');
end

% mirror to VU and IUEM; this takes 10 min each, but runs in the background
if ismac || isunix
  system('SyncBackPro AmP2VU -i  AmP2IUEM -i'); 
else
  system('powershell SyncBackPro AmP2VU -i  AmP2IUEM -i'); 
  %system('powershell SyncBackPro AmP2VU -i'); 
end

cd(WD); % go to current directory (when this function was started)
