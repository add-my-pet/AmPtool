%% repair_Aves_k
% edit source files, runs estimation
%%
function repair_Aves_k_customized_filters(j)
% created 2023/08/31 by Starrlight

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
 entries = select('Aves');
n = length(entries);

n = length(entries);
for i=j:n % scan entries
  my_pet = entries{i}; 
  fprintf('%g: %s\n', i, my_pet);
  cd(['../',my_pet]);

  % load files in editor that are to be edited
  edit(['predict_',my_pet,'.m'])

  % read source file
  flnm_predict = ['predict_', my_pet, '.m']; predict = fileread(flnm_predict);
  
 



  %% edit predict
  
  % TC (some entries do not use TC_ab)
predict = strrep(predict, '%% fledging', '% fledging');
predict = strrep(predict, 'aT_b = t_0 + t_b/ k_M/ TC_ab;', 'aT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'aT_b = t_0 + t_b/ k_M/ TC;', 'aT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'aT_b = t_0 + t_b/ kT_M;', 'aT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'aT_b = t_0 + t_b/ TC_ab/ k_M;', 'aT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'aT_b = t_0 + tT_b;', 'aT_b = tT_b;');
predict = strrep(predict, 'tT_b = t_b/ k_M/ TC_ab;', 'tT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'tT_b = t_b/ k_M/ TC;', 'tT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'if t_0 < 0', 'if E_Hx < 0');
predict = strrep(predict, 'if t_0 <0', 'if E_Hx < 0');
predict = strrep(predict, 'if t_0< 0', 'if E_Hx < 0');
predict = strrep(predict, '* w_m)', '* ome_m)');
predict = strrep(predict, '* w)', '* ome)');
predict = strrep(predict, '1 + w_m * e)', '1 + ome_m * e)');
predict = strrep(predict, 'L.^3 * w_m .* de)', 'L.^3 * ome_m .* de)');


  
  %% write/load
  
  % write edited files
  fid_predict = fopen(flnm_predict, 'w+'); fprintf(fid_predict, '%s', predict); fclose(fid_predict);
  
  % load edited files in editor
  
  edit(['predict_',my_pet,'.m'])
  
 
  fprintf('type dbcont to proceed to the next species or dbquit \n'); 
 keyboard

     
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
