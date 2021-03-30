%% check_collection
% checks entries in tree vs in dir entries

%%
function [missingFromCollection, missingFromList] = check_collection
% created 2016/02/21 by Bas Kooijman

%% Syntax
% [info, missingSpecies] = <../check_collection.m *check_collection*>

%% Description
% checks that all members of the list returned by select('Animalia') are in dir ../../entries and vice-versa
%
%
% Output: 
% 
% * missingFromCollection: n-string of names of entries which are in the lists but are not in the collection 
% * missingFromList: n-string of names of entries which are in the lists but are not in the collection 

%% Remarks
% use this to e.g. make sure that the list in AmPtool/taxa are up to date
% and/or that all of the entries have been put on the web.

%% Example of use
% [missingFromCollection, missingFromList] = check_collection

entries = select('Animalia');   % n-string of latin names of species in the lists
WD = cdCur;  % store current path
cd('../../deblab/add_my_pet/') % goto add_my_pet
        
allFiles = dir('entries'); 
allNames = {allFiles.name}; % n-string of names of directories
% removes names which are not entries
allNames(strncmp(allNames, '.', 2)) = []; 
allNames(strncmp(allNames, '..', 2)) = [];
allNames(strncmp(allNames, 'index.cache', 2)) = [];
allNames(strncmp(allNames, 'index.wn', 2)) = [];

% compare lists :
missingFromCollection = setdiff(entries,allNames)'; % returns entries which are in the lists but are not in the collection 
missingFromList = setdiff(allNames,entries)'; % returns entries whcih are included in the collection but have not been put in the lists

cd(WD)  % goto original path


end



