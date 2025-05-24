%% check_MRE
% checks MRE in metaPar files to be smaller than a threshold

%%
function nm = check_MRE(pets,MRE0)
% created 2025/05/23 by Bas Kooijman

%% Syntax
% nm = <../check_MRE.m *check_MRE*> (pets,MRE0)

%% Description
% selects entries for pets that have an MRE in metaData larger than a threshold
%
% Input
%
% * pets: cell string with names of pets
% * MRE0: threshold for MRE's
%
% Output
%
% * nm: cell string of entries with MRE > MRE0

%% remarks
% Proceed with cdEntr(nm,1) to load failing entries in the Matlab editor

%% Example of use
% nm = check_MRE(nm_source,0.3); cdEntr(nm,0)

WD = pwd;

n = length(pets); MRE = zeros(n,1);  % initiate selection
for i = 1:n % scan taxa
  cdEntr(pets{i});
  load(['results_',pets{i}],'metaPar'); 
  MRE(i) = metaPar.MRE;
end
nm = pets(MRE > MRE0); 

cd(WD);
