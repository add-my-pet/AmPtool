%% cdCur
% cd to the AmPtool/curation directory

function WD = cdCur
% created 2019/12/30 by Bas Kooijman

%% Syntax
% <../cdCur.m *cdCur*>

%% Description
% cd to the AmPtool/curation directory
%
% Output
%
% * WD: current path 

%% Remarks
% Intended use: WD = cdCur; ..code.. cd(WD)

WD = pwd; path = which('cdCur'); ind = strfind(path,'\'); cd(path(1:ind(end)));
