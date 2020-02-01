%% cdAmPdata
% cd to the AmPdata directory

function WD = cdAmPdata
% created 2020/01/12 by Bas Kooijman

%% Syntax
% <../cdAmPdata.m *cdData*>

%% Description
% cd to the AmPdata directory
%
% Output
%
% * WD: current path 

%% Remarks
% Intended use: WD = cdAmPdata; ..code.. cd(WD)

WD = pwd; path = which('cdAmPdata'); ind = strfind(path,'\'); cd(path(1:ind(end)));
