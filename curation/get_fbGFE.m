%% get_fbGFE
% gets names in fisbase with data

%%
function GFE = get_fbGFE
% created 2024/03/18 by Bas Kooijman

%% Syntax
% GFE =  <../get_fbGFE.m *get_fbGFE*>

%% Description
% Gets names in fishbase with data on growth, fecundity and egg_development.
%
%
% Output:
%
% * GFE: cell array with species names that have data 
%
%% Example of use
% GFE = get_fbGFE; get_id_fishbase(GFE{1}{1},1)

WD=cdCur; cd ../../data
fbGrowth = fileread('fishbase_growth.txt');
fbFecund = fileread('fishbase_fecundity.txt');
fbEggDev = fileread('fishbase_egg_dev.txt');

ind = strfind(fbGrowth,'PopGrowthList.php?ID='); n=length(ind); growth = cell(n,1);
for i=1:n
  i0 = strfind(fbGrowth(ind(i):end),'">'); i0 = ind(i)+1+i0(1); 
  i1 = strfind(fbGrowth(i0:end),'</a>'); i1=i0+i1(1)-2;
  growth{i}=fbGrowth(i0:i1);
end

ind = strfind(fbFecund,'FecundityList.php?ID='); n=length(ind); fecund = cell(n,1);
for i=1:n
  i0 = strfind(fbFecund(ind(i):end),'">'); i0 = ind(i)+1+i0(1); 
  i1 = strfind(fbFecund(i0:end),'</a>'); i1=i0+i1(1)-2;
  fecund{i}=fbFecund(i0:i1);
end

ind = strfind(fbEggDev,'FishEggDevList.php?ID='); n=length(ind); eggdev = cell(n,1);
for i=1:n
  i0 = strfind(fbEggDev(ind(i):end),'">'); i0 = ind(i)+1+i0(1); 
  i1 = strfind(fbEggDev(i0:end),'</a>'); i1=i0+i1(1)-2;
  eggdev{i}=fbEggDev(i0:i1);
end
GFE = {growth, fecund, eggdev};

cd(WD);
