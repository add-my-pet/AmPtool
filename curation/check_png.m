%% check_png
% checks if all *.png in entries/my_pet are mentioned in entries_web/my_pet_res.html 

%%
function nms = check_png(my_pets)
% created 2024/01/08 by Bas Kooijman

%% Syntax
% nms = <../check_png.m *check_png*> (my_pets)

%% Description
% checks if all *.png in entries/my_pet are mentioned in entries_web/my_pet_res.html; 
% At 2024/01/08 global dataSet_nFig was not set well by results_pets: 
%   plots with double y-axes were not included by prt_results_my_pet
%
% Input:
%
% * my_pets: optional cell string with entry names, or character string with entry or node names (default 'Animalia')
%
% Output:
%
% * nms: cells string of entries that did not matct fully

%% Remarks
% if an entry is not in allStat, the check is skipped without notice

%% Example of use
% * nms = check_png('Mola_mola') or
% * nms = check_results('Branchiopoda') 

if ~exist('my_pets','var')
  my_pets = select('Animalia');
elseif isempty(my_pets)
  my_pets = select;
elseif ~iscell(my_pets)
  my_pets = select(my_pets);
end

n = length(my_pets); % number of entries to scan    
WD = pwd; % path setting for curators 
nms = cell(0,1); % initiate output

for i = 1:n
  cdEntr(my_pets{i}); 
  
  fprintf([num2str(i), ': ', my_pets{i},'\n']) % print progress

  % list of all files in entries/my_pets{i}
  if ismac || isunix
    list = strsplit(ls); list(end) = [];
  else
    list = cellstr(ls);
  end
  % select names with .png 
  list_png = list(contains(list,'.png')); 
  n_png = length(list_png); sel = zeros(n_png,1);

  cd(['../../entries_web/',my_pets{i}])
  txt = fileread([my_pets{i}, '_res.html']);
  for j=1:n_png
    sel(j) = ~contains(txt,list_png{j});
  end

  if any(sel)
    nms = [nms; my_pets{i}];
  end

end

cd(WD);
