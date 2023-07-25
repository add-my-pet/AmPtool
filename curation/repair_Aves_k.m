%% repair_Aves_k
% edit mydata_my_pet, write results_my_pet.mat
%%
function repair_Aves_k(entries)
% created 2023/06/19 by Bas Kooijman

%% Syntax
% [WD, nm] = <repair_Aves  *repair_Aves*>(entries)

%% Description
%
% * k = 0.3 as speudo-data by releasing k_J in pars_init
% * puberty at tp = 3 * t_x if guessed 
% * check that the predict-file is using the pre-natal temp, and kT_M based on temp for am
% * add tx in data_0, in mydata and in predict
% * edit post-natal temperatures with get_T_Aves, pre-natal temp around 33 C
% * modify last discussion point on tp 
% * add discussion point for temp and bibitem PrinPres1991 to biblist
% * add Starrlight to modification authors
%
% Input:
%
% * entries: character or cell string with one or more entries

%% Remarks
% the Matlab editor should only contain this file, loading and removing source files is automatic
% Target entries are in add_my_pet/Aves_k which is a copy of Aves_new
% After editing all entries copy Aves_k over entries
% and run_collection('Aves'), then run_collection_intro('Aves')
% Requires syncing with servers when done
% This review does not create new modifications; the last modification was very recent
% Check MRE in the collection and compare it with current MRE; 
% re-estimate if the current MRE is larger

%% Example
% nm=select('Aves'); repair_Aves_k(nm); 
% After quitting at entry i, continue with nm(1:i-1)=[]; repair_Aves_k(nm)
% If i is lost. but entry nm_i is in the the Matlab editor, recover i by 
% nm=select('Aves'); ind=1:length(nm); i = ind(strcmp(nm_i,nm)); nm(1:i-1)=[]; 

WD = cdCur; cd '../../deblab/add_my_pet/Aves_k/Struthio_camelus'; % first bird
 
% set estim options
estim_options('default'); 
estim_options('max_step_number', 5e2); 
estim_options('max_fun_evals', 5e3); 

estim_options('pars_init_method', 2); 
estim_options('results_output', 3); 

n = length(entries);
for i=1:n % scan entries
  my_pet = entries{i}; 
  fprintf('%g: %s\n', i, my_pet);
  cd(['../',my_pet]);
  
  % read source files
  flnm_mydata = ['mydata_', my_pet]; mydata = fileread(flnm_mydata);
  flnm_pars_init = ['pars_init_', my_pet]; pars_init = fileread(flnm_pars_init);
  flnm_predict = ['predict_', my_pet]; predict = fileread(flnm_predict);
  
  % replace modification author
  ind = strfind('author_mod_',mydata); ind = ind(end);
  ind = ind +  strfind('}',mydata); mydata = [mydata(1:ind), ', Starrlight Augustine', mydata(ind+1:end)];
  
  % add tx to data_0
  if ~strcmp(
  flnm_mydata = strrep(mydata, '''ap;''', '''ax''; ''ap'';');
  
  % release k_J and add E_Hx
  
  % insert prediction for tx
  
  % write edited files
  fid_mydata = fopen(flnm_mydata, 'w+'); fprintf(fid_mydata, mydata); fclose(fid_mydata);
  fid_pars_init = fopen(flnm_pars_init, 'w+'); fprintf(fid_pars_init, pars_inti); fclose(flnm_pars_init);
  fid_predict = fopen(flnm_predict, 'w+'); fprintf(fid_predict, predict); fclose(fid_predict);
  
  % load edited files in editor
  edit(['mydata_',my_pet,'.m'])
  edit(['pars_init_',my_pet,'.m'])
  edit(['predict_',my_pet,'.m'])
  
  pets = {my_pet};
  check_my_pet(pets); 
  estim_options('method', 'nm'); 
  estim_pars; 
  
  fprintf('type dbcont to proceed or dbquit \n'); 
  keyboard
  
  mat2parsinit
  
  % close source files in editor
  editorTabs = matlab.desktop.editor.getAll;
  editorTabs(2:end).close;

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
