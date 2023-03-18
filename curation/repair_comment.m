%% repair_comment
% edit mydata_my_pet, write results_my_pet.mat, save zip, writes entries_web/my_pet/my_pet_res.html

%%
function [WD, nm] = repair_comment(entries)
% created 2023/03/16 by Bas Kooijman
%% Syntax
% [WD, nm] = <repair_comment *repair_comment*>(entries)

%% Description
% Checks if all field names of txtData.comment as a corresponding field name in data
% edit mydata_my_pet, write results_my_pet.mat, save zip, writes entries_web/my_pet/my_pet_res.html
%
% Input:
%
% * entries: character or cell string with one or more entries
%
% Ouput:
%
% * WD: current path
% * nm: cell string with modified field names

%% Remarks
% Requires syncing with servers when done

%% Example
% repair_comment

cur2ew = '../../deblab/add_my_pet/entries_web/'; % path from AmPtool/curation to entries_web

WD = pwd; nm = cell(0,1);
if ~exist('entries','var')
  entries = select;
elseif ~iscell(entries)
  entries = {entries};
end
n=length(entries); 

for i=1:n % scan entries
  my_pet = entries{i}; 
  fprintf('%g: %s\n', i, my_pet);
  cdEntr(my_pet); % store current work directory and cd to add_my_pet/entries/my_pet

  eval(['[data, auxData, metaData, txtData] = mydata_', my_pet, ';']); % run mydata_my_pet
  if isfield(txtData,'comment')
    fld_data = fields(data); fld_comm = fields(txtData.comment); 
    diff = fld_comm(~ismember(fld_comm,fld_data));
  else
    diff = '';
  end
  
  if ~isempty(diff)  
    nm = [nm; my_pet]; cur2ewmp = [cur2ew, my_pet,'/']; % path from AmPtool/curation to entries_web/my_pet

    fprintf('comment-fields that have no data-field: %s, \n', diff{:});
    edit(['mydata_', my_pet, '.m']); % edit mydata_my_pet.m file
    fprintf('type dbcont to proceed or dbquit \n'); keyboard
    run_collection(my_pet);
  end
end
cd(WD)
end

function run_repair(my_pet)
% use estim_pars for writing results_my_pet.mat file
global pets 

pets = {my_pet}; 

estim_options('default'); 
estim_options('pars_init_method', 2); 
estim_options('results_output', 0); 
estim_options('method', 'no'); 

estim_pars; 
end
