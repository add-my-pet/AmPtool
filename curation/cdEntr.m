%% cdEntr
% cd to the add_my_pet/entries/my_pet directory

function WD = cdEntr(my_pet)
% created 2021/02/22 by Bas Kooijman

%% Syntax
% WD = <../cdEntr.m *cdEntr*> (my_pet)

%% Description
% cd to the add_my_pet/entries/my_pet directory
%
% Output
%
% * WD: current path 

%% Remarks
% Intended use: WD = cdEntr('Daphnia_magna'); ..code.. cd(WD)

WD = pwd; cdCur; cd(['../../deblab/add_my_pet/entries/', my_pet])
