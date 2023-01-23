%% run_collection_intro
% runs functions for collection overhead

%%
function run_collection_intro(entries)
% created 2016/11/18 by Bas Kooijman, modified 2017/08/16, 2020/06/26, 2021/06/11, 2021/10/06, 2022/06/06

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
% * All variables will be cleared
% * SyncBackPro is used to copy the following files to server 
%
% * ../about.html
% * ../authors.html
% * ../pars.html
% * ../pie_*.html
% * ../species_list.html 
% * ../species_names.html 
% * ../links.html
%
% * ../sys/specJump.js
% * ../sys/species_tree_Animalia.js
% * ../sys/species_tree_Animalia_search.html
% & ../sys/toolbar_*.html
%
% * ../AmPdata/AmPdata.zip
%
% * ../img/about/*.png 
% * ../img/pars/*.png
% * ../img/patterns/*.png
% * ../img/tree/*.jpg and *.jpg.txt
%
% * ../entries/*
% * ../entries_web/*
% * ../entries_zip/*
%
% * Repository AmPtool is synced with Github

WD = cdCur; % go to AmPtool/curation

if ~exist('entries','var')
  entries = select;
end

% allStat and popStat are made persistent and must be overwritten
save('temporary.mat','WD','entries'); clear all; load('temporary.mat'); delete('temporary.mat');

% write add_my_pet/AmPdata/allStat.mat and popStat.mat
[allStat, info] = write_addStat(entries); % this adds/modifies allStat for selected entries
if ~info; return; end
write_popStat_loc(entries); % collects entries_web/my_pet_pop.mat files in structure popStat

% write add_my_pet/AmPdata/AmPdata.zip
cdAmPdata; load allUnits; load allLabel
  zip('AmPdata', {'allStat.mat','popStat.mat','allUnits.mat', 'allLabel.mat', 'cdAmPdata.m'}); 
  n_entries = length(fields(allStat)); save('n_entries', 'n_entries')
cdCur; 
% write toolbars in add_my_pet/sys/ to update dropdown collection/AmPdata
% toolbar_AmPtool.html is also written, but moved to AmPtool/docs for syncing with GitHub
prt_toolbar; % 20 toolbars
prt_specJump; % write sys/specJump.js for navigation

prt_species_names; % add_my_pet/species_names.html
prt_species_list; % add_my_pet/species_list.html
prt_species_tree_taxa_js; % add_my_pet/sys/species_tree_Animalia.js and species_tree_Animalia_search.html javascript for the tree; add_my_pet/species_tree.html itself is static
prt_authors; % add_my_pet/authors.html
prt_pars; % add_my_pet/pars.html
prt_patterns; % add_my_pet/patterns.html
prt_pie_SGGJR; % add_my_pet/pie_pSGJRb.html, pie_pSGJRi.html, pie_pSGJRp.html, pie_SGJRb.html
prt_about; % add_my_pet/about.html
prt_ecoCodes(select,1); % ecoCodes of all entries
prt_id(select,1); % id of all links to html pages
prt_taxa; % all thumbnails plus sys/taxaSel.js for selection

% cleanup
delete('..\taxa\*.txt~','..\taxa\*.txt#') % delete emacs backup-files
delete('..\..\add_my_pet\img\tree\*.txt~','..\..\add_my_pet\img\tree\*.txt#') % delete emacs backup-files

% sync AmPtool with github to update AmPtool/taxa and AmPtool/docs/index.html 
% and DEBtool_M/docs/sys/, AmPtox/docs/sys
cdCur;
if ismac || isunix
  % system('git status');
  cd ../; system('git add taxa/* docs/* docs/sys/*');
  system('git commit -am "extension"');
  system('git push origin master');
  cd ../DEBtool_M; system('git add docs/sys/*'); % toolbars
  system('git commit -am "toolbars"');
  system('git push origin master');
  cd ../AmPtox; system('git add docs/sys/*');
  system('git commit -am "toolbars"');
  system('git push origin master');
else
  % system('powershell git status');
  cd ../; system('powershell git add taxa/* docs/* docs/sys/*'); % toolbars + taxa
  system('powershell git commit -am "extension"');
  system('powershell git push origin master');
  cd ../DEBtool_M; system('powershell git add docs/sys/*'); % toolbars
  system('powershell git commit -am "toolbars"');
  system('powershell git push origin master');
  cd ../AmPtox; system('powershell git add docs/sys/*'); % toolbars
  system('powershell git commit -am "toolbars"');
  system('powershell git push origin master');
end
cdCur;

% mirror to VU and IUEM; this takes 10 min each, but runs in the background
if ismac || isunix
  system('SyncBackPro AmP2VU -i  AmP2IUEM -i'); 
else
  system('powershell SyncBackPro AmP2VU -i'); 
  system('powershell SyncBackPro AmP2IUEM -i'); 
  %system('powershell SyncBackPro AmP2VU -i'); 
end

cd(WD); % go to current directory (when this function was started)
