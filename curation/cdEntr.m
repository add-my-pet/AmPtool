%% cdEntr
% cd to the add_my_pet/entries/my_pet directory abd optional load files in editor

function WD = cdEntr(my_pet, ed)
% created 2021/02/22 by Bas Kooijman, modified 2024/01/06, 2024/12/17

%% Syntax
% WD = <../cdEntr.m *cdEntr*> (my_pet, ed)

%% Description
% cd to the add_my_pet/entries/my_pet directory and open source files in Matlab editor
%
% Input
% 
% * my_pet: string or cellstring with name(s) of entry
% * ed: optional identifyer for editing in Matlab: 
%
%    1 mydata-file
%    2 pars_init-file
%    3 predict-file
%    4 run-file
%    else all 4 source files
%
% Output
%
% * WD: current path 

%% Remarks
% Intended use: 
%
% * cdEntr('Daphnia_magna');
% * cdEntr('Daphnia',1) 
% * cdEntr(select('Daphnia'),1)
%
% Use <../editor2pets.m *editor2pets*> to convert files in Matlab editor to a list of entries

if iscell(my_pet)
  nms = my_pet; n = length(nms);  
elseif contains(my_pet,'_')
  nms = {my_pet}; n = 1; 
elseif contains(my_pet,' ')
  my_pet = strrep(my_pet,' ','_'); nms = {my_pet}; n = 1;
else
  nms = select(my_pet); n = length(nms);
end

WD = pwd; % copy to output

if ~exist('ed', 'var')
  cdCur; cd(['../../deblab/add_my_pet/entries/', nms{1}])
  return
end

for i=1:n
  my_pet = nms{i};
  cdCur; cd(['../../deblab/add_my_pet/entries/', my_pet])
  switch ed
    case 1
      edit(['mydata_', my_pet, '.m'])
    case 2
      edit(['pars_init_', my_pet, '.m'])
    case 3
      edit(['predict_', my_pet, '.m'])
    case 4
      edit(['run_', my_pet, '.m'])
    otherwise
      edit(['mydata_', my_pet, '.m'])
      edit(['pars_init_', my_pet, '.m'])
      edit(['predict_', my_pet, '.m'])
      edit(['run_', my_pet, '.m'])
  end
end
end
