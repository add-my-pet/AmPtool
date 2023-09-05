%% repair_Aves_k
% edit source files, runs estimation
%%
function estim_Aves_k(j)
% created 2023/07/26 by Bas Kooijman

%% Syntax
% <repair_Aves_k  *repair_Aves_k*>(entries)

%% Description
% Edit 3 source files, load them in Matlab editor and run estim_pars; leave run_my_pet unused
%
% Input:
%
% * entries: cell string with one or more entries

%% Remarks
% the Matlab editor should only contain this file, loading and removing source files is automatic
% Target entries are in add_my_pet/Aves_k which is a copy of Aves_new
% Most predict files have filter t_0 < 0, but not all
% If possible, replace tp prediction for time at first moult for Paleognathae and Galloanserae
% It might be necessary to release v, if fixed
% Compare the resulting MRE with the existing one to see if you need more continuations
% mat2pars_init is called after each estim_pars, in compibation with fixed estim_options('pars_init_method', 2);
% the run-file is not used and not edited
% copy Aves_k to VU server with Filezilla
%
% Tasks for Bas after updating Aves_k
% Copy Aves_k from VU server over local dir with Filezilla
% Copy Aves_k over entries locally
% and run_collection('Aves'), then run_collection_intro('Aves')
% Requires syncing with servers when done
% This review does not create new modifications; the last modification was very recent

%% Example
% nm=select('Aves'); repair_Aves_k(nm); 
% continue estimation with "estim_pars; mat2pars_init" move to the next species with "dbcont" 
% After quitting at entry i, continue with nm=select('Aves');nm(1:i-1)=[]; repair_Aves_k(nm)
% If i is lost. but entry nm_i is in the the Matlab editor, recover i by 
% nm=select('Aves'); ind=1:length(nm); i = ind(strcmp(nm_i,nm)); nm(1:i-1)=[]; repair_Aves_k(nm); 


WD = cdCur; cd '../../deblab/add_my_pet/Aves_k/Struthio_camelus'; % first bird
 
close all; 
global pets
entries = select('Aves');
n = length(entries);

for i= j:n % scan entries
  my_pet = entries{i}; 
  fprintf('%g: %s\n', i, my_pet);
  cd(['../',my_pet]);

  % load files in editor that are to be edited
  edit(['mydata_',my_pet,'.m'])
  edit(['pars_init_',my_pet,'.m'])
  edit(['predict_',my_pet,'.m'])

pets = {my_pet};
% setweights_clr('Dryocopus_martius');
setweights_tW(my_pet,  0.1); % set weights of tW to 0.1

estim_options('default'); 
estim_options('max_fun_evals', 5e3); 
estim_options('pars_init_method', 2); 
estim_options('results_output', 0); 

estim_options('method', 'no');  estim_pars; mat2pars_init; % prepares pars_init for protocols

estim_options('method', 'nm');   estim_options('report', 1); 
estim_options('max_step_number', 5e2); 

estim_options('pars_init_method', 1); 

fprintf('A) intesive params kap, v, and k_J, aux params, fixed \n'); 
set_free(my_pet, 0, {'z','z_m','p_M', 'E_G','E_Hb','E_Hx','E_Hp','h_a'});
estim_pars; estim_pars; estim_pars; %estim_pars; estim_pars; 
mat2pars_init;

fprintf('B) all free settings are 0, except pars_core \n'); 
set_free(my_pet, 2); % 2 all free settings are 0, except pars_core
estim_pars; mat2pars_init;

fprintf('C) all free settings are 0, except f_* \n'); 
estim_options('max_step_number', 300); 
set_free(my_pet, 1); % 1 all free settings are 0, except f_*
estim_pars; mat2pars_init;

fprintf('D) all free settings are 0, except pars_core \n'); estim_options('max_step_number', 500); 
set_free(my_pet, 2); % 2 all free settings are 0, except pars_core
estim_pars; mat2pars_init;

fprintf('E) all free settings are 0, except f_* \n'); estim_options('max_step_number', 300); 
set_free(my_pet, 1); % 1 all free settings are 0, except f_*
estim_pars; mat2pars_init;

fprintf('F) all free settings are 0, except pars_core \n'); estim_options('max_step_number', 500); 
set_free(my_pet, 2); % 2 all free settings are 0, except pars_core
estim_pars; mat2pars_init;

fprintf('G) all free settings are 0, except f_* \n'); estim_options('max_step_number', 300); 
set_free(my_pet, 1); % 1 all free settings are 0, except f_*
estim_pars; mat2pars_init;

%   fprintf('type dbcont to proceed to the next species or dbquit \n'); 
% %   fprintf('type estim_pars; mat2pars_init to estimate \n'); 
%   keyboard
     
  % close source files in editor
  editorTabs = matlab.desktop.editor.getAll;
  editorTabs(2:end).close;

   fprintf('%g: %s\n', i, my_pet);

end
cd(WD)
end

% err=read_stat(nm_m,{'MRE','SMSE'});
% val = [err_old(:,1), err(:,1)];
% Hfig = figure;
% plot([0;.4],[0;.4],'k', val(:,1),val(:,2),'.b','linewidth',3,'markersize',8)
% xlabel('MRE for female and male state vars different')
% ylabel('MRE for female and male state vars equal')
% h = datacursormode(Hfig); entries_txt = nm_m; n=length(nm_m);
% for i=1:n; entries_txt{i} = strrep(entries_txt{i}, '_' , ' '); end
% h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries_txt, val);
% datacursormode on % mouse click on plot
