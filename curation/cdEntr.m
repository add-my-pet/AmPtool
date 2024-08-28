%% cdEntr
% cd to the add_my_pet/entries/my_pet directory

function WD = cdEntr(my_pet, ed)
% created 2021/02/22 by Bas Kooijman, modified 2024/01/06

%% Syntax
% WD = <../cdEntr.m *cdEntr*> (my_pet, ed)

%% Description
% cd to the add_my_pet/entries/my_pet directory and open source files in Matlab editor
% if nm exists, birdsoftheworld will be opened
%
% * my_pet: string or cellstring with name(s) of entry
% * ed: optional identifyer for editing in Matlab: 1 for mydata-file only, else all 4 source files
%
% Output
%
% * WD: current path 

%% Remarks
% Intended use: 
% * cdEntr('Daphnia_magna',0) or cdEntr('Daphnia',1) or cdEntr(select('Daphnia'),1)

if iscell(my_pet)
  nms = my_pet; n = length(nms);  
elseif contains(my_pet,'_')
  nms = {my_pet}; n = 1; 
else
  if contains(my_pet,' ')
    my_pet = strrep(my_pet,' ','_'); n = 1; nms = {my_pet};
  else
    nms = select(my_pet); n = length(nms);
  end
end

WD = pwd;

for i=1:n
  my_pet = nms{i};
  cdCur; cd(['../../deblab/add_my_pet/entries/', my_pet])

  if exist('ed', 'var')
    if ed==1
      edit(['mydata_', my_pet, '.m'])
    elseif ed==3
      edit(['predict_', my_pet, '.m'])
    else
      edit(['mydata_', my_pet, '.m'])
      edit(['pars_init_', my_pet, '.m'])
      edit(['predict_', my_pet, '.m'])
      edit(['run_', my_pet, '.m'])
    end
  end
end
