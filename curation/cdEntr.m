%% cdEntr
% cd to the add_my_pet/entries/my_pet directory

function WD = cdEntr(my_pet, ed, nm)
% created 2021/02/22 by Bas Kooijman

%% Syntax
% WD = <../cdEntr.m *cdEntr*> (my_pet, ed)

%% Description
% cd to the add_my_pet/entries/my_pet directory and open source files in Matlab editor
% if nm exists, birdsoftheworld will be opened
%
% * my_pet: string with name of entry
% * ed: optional identifyer for editing in Matlab: 1 for mydata-file only, else all 4 source files
% * nm: optional cell-string of names to which my_pet is appended.
%
% Output
%
% * WD: current path 

%% Remarks
% Intended use: 
% * WD = cdEntr('Daphnia_magna',0); ..code.. cd(WD)
% * nm={}; nm = cdEntr('my_pet1',1,nm); edit mydata_mypet1; nm = cdEntr('my_pet2',1,nm); edit mydata_mypet2; ...
% * run_collection(nm); run_collection_intro(nm);

if ~contains(my_pet,'_')
  my_pet = strrep(my_pet,' ','_');
end
if exist('nm','var')
  WD = [nm; my_pet];
%   try 
%     get_id_bow(my_pet,1);
%   catch
%     fprintf('warning from cdEntr: not found in bow\n');
%   end
else
  WD = pwd; 
end
cdCur; cd(['../../deblab/add_my_pet/entries/', my_pet])

if exist('ed', 'var')
  if ed==1
    edit(['mydata_', my_pet, '.m'])
  else
    edit(['mydata_', my_pet, '.m'])
    edit(['pars_init_', my_pet, '.m'])
    edit(['predict_', my_pet, '.m'])
    edit(['run_', my_pet, '.m'])
  end
end
