%% check_tg
% checks tg in metaData of mammels

%%
function nm = check_tg
% created 2025/05/23 by Bas Kooijman

%% Syntax
% nm = <../check_tg.m *check_tg*>

%% Description
% selects mamal entries that do not have tg in data_0
%
% Output
%
% * nm: cell string of entries with no tg in data_0

%% remarks
% Proceed with cdEntr(nm,1) to load failing entries in the Matlab editor

%% Example of use
% nm = check_tg; cdEntr(nm,1)

WD = pwd;

nm = select('Mammalia'); n = length(nm); sel = zeros(n,1);  % initiate selection
for i = 1:n % scan taxa
  cdEntr(nm{i});
  load(['results_',nm{i}],'metaData'); 
  sel(i) = ~ismember('tg',metaData.data_0);
end
nm = nm(sel==1); 

cd(WD);
