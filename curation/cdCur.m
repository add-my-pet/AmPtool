%% cdCur
% cd to the AmPtool/curation directory

function WD = cdCur
% created 2020/01/12 by Bas Kooijman

%% Syntax
% <../cdCur.m *cdCur*>

%% Description
% cd to the AmPdata directory
%
% Output
%
% * WD: current path 

%% Remarks
% Intended use: WD = cdCur; ..code.. cd(WD)

WD = pwd; path = which('cdCur'); 
if ismac
 ind = strfind(path,'/'); 
else
 ind = strfind(path,'\');
end
cd(path(1:ind(end)));
