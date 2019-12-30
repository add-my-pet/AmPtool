%% cdCur
% cd to the AmPtool/curation directory

function cdCur
% created 2019/12/30 by Bas Kooijman

%% Syntax
% <../cdCur.m *cdCur*>

%% Description
% cd to the AmPtool/curation directory

path = which('cdCur'); ind = strfind(path,'\');
cd(path(1:ind(end)));
