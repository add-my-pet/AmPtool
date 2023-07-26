%% repair_Aves_k
% edit source files, runs estimation
%%
function repair_Aves_k(entries)
% created 2023/07/26 by Bas Kooijman

%% Syntax
% [WD, nm] = <repair_Aves_k  *repair_Aves_k*>(entries)

%% Description
% Edit 3 source files, load them in Matlab editor and run estim_pars; leave run_my_pet unused
%
% Input:
%
% * entries: cell string with one or more entries

%% Remarks
% the Matlab editor should only contain this file, loading and removing source files is automatic
% Target entries are in add_my_pet/Aves_k which is a copy of Aves_new
% Most predit files have filter t_0 < 0, but not all
% If possible replace tp prediction for time at first moult for Paleognathae and Galloanserae
% Compare the resulting MRE with the existing one to see if you need more continuations
%
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
  flnm_mydata = ['mydata_', my_pet, '.m']; mydata = fileread(flnm_mydata);
  flnm_pars_init = ['pars_init_', my_pet, '.m']; pars_init = fileread(flnm_pars_init);
  flnm_predict = ['predict_', my_pet, '.m']; predict = fileread(flnm_predict);
  
  fullEdit = ~contains(mydata,'''ax'';');

  %% edit mydata
  
  % get T_typical
  eval(['[data, auxData, metaData, txtData, weights] = mydata_', my_pet, ';'])
  T_typical = num2str(get_T_Aves(metaData.order));
  
  % get tp
  tp = num2str(3 * data.tp);
   
  % add tx to data_0
  if fullEdit
    mydata = strrep(mydata, '''ap'';', '''ax''; ''ap'';');
  end
  
  % replace modification author
  ind = strfind(mydata,'author_mod_'); ind = ind(end);
  ind = ind-2+strfind(mydata(ind:end),'}'); ind = ind(1); mydata = [mydata(1:ind), ', ''Starrlight Augustine''', mydata(ind+1:end)];
  
  % replace discussion point
  txt = 'Pseudo-data point k is used, rather than k_J; prenatal T is guessed, postnatal T is based on PrinPres1991';
  mydata = strrep(mydata, 'Puberty is assumed to coincide with fledging with a waiting time to first brood', txt);
  
  % add bibitem
  PrinPres1991 = fileread('../PrinPres1991.txt');
  ind = -1+strfind(mydata, '];'); ind = ind(end); mydata = [mydata(1:ind), '];', char(13), PrinPres1991];
 
  % add tx, modify tp
  ind_0 = strfind(mydata, 'data.tp'); ind_1 = -1+strfind(mydata, 'data.tR'); txt = mydata(ind_0:ind_1);
  txt_tx = strrep(txt, 'tp', 'tx'); txt_tx = strrep(txt_tx, 'fledging/puberty', 'fledging');
  txt_tp = strrep(txt, 'fledging/puberty','puberty'); ind = strfind(txt_tp,';'); txt_tp = ['data.tp = ', tp, txt_tp(ind(1):end)];
  ind_2 = 11+strfind(txt_tp, 'bibkey.tp = '); ind_3 = ind_2 + strfind(txt_tp(ind_2:end),';'); 
  txt_tp = [txt_tp(1:ind_2), '''guess'';', txt_tp(ind_3:end)];
  mydata = [mydata(1:ind_0-1), txt_tx, txt_tp, mydata(ind_1+1: end)];  

  % set weights for k_J ad k
  ind = 16+strfind(mydata, 'label, weights);');
  mydata = [mydata(1:ind), 'weights.psd.k_J = 0; weights.psd.k = 0.1;', mydata(ind+1:end)];
  
  % change temperatures
  n = length(strfind(mydata, 'C2K('));
  for j=1:n 
    ind_0 = 3 + strfind(mydata, 'C2K(');
    ind_1 = ind_0(j) - 1 + strfind(mydata(ind_0(j):end),')'); 
    mydata = [mydata(1:ind_0(j)), T_typical, mydata(ind_1(1):end)]; 
  end
  ind_0 = 13 + strfind(mydata, 'temp.ab = C2K('); 
  ind_1 = ind_0(1) - 1 + strfind(mydata(ind_0(1):end),')'); 
  mydata = [mydata(1:ind_0(1)), '33', mydata(ind_1(1):end)]; 
  
  %% edit pars_init
  
  % release k_J
  pars_init = strrep(pars_init, 'free.k_J   = 0', 'free.k_J   = 1');
  
  % modify E_Hp, add E_Hx
  pars_init = strrep(pars_init, 'fledging/puberty', 'puberty');
  ind_0 = strfind(pars_init, 'par.E_Hp'); ind_1 = strfind(pars_init, 'par.h_a');
  txt_EHx = pars_init(ind_0:ind_1-1); txt_EHx = strrep(txt_EHx, 'E_Hp', 'E_Hx');
  txt_EHx = strrep(txt_EHx, 'puberty', 'fledging');
  ind = ind_0 + 1 + strfind(pars_init(ind_0:end), ' = '); pars_init = [pars_init(1:ind), '3*', pars_init(ind+1:end)];
  %
  ind = 20 + strfind(pars_init, '%% other parameters');
  pars_init  = [pars_init(1:ind), txt_EHx, pars_init(ind+1:end)];
    
  %% edit predict
  
  % TC (some entries do not use TC_ab)
  ind_0 = -1 + strfind(predict, 'TC'); ind_1 = -2 + strfind(predict, '% zero');
  txt = ['TC_ab = tempcorr(temp.ab, T_ref, T_A);', char(13), ...
         '  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;', char(13), char(13)];
  predict = [predict(1:ind_0), txt, predict(ind_1:end)];
  
  % aT_b
  ind_0 = -1 + strfind(predict, 'aT_b'); ind_1 = strfind(predict, '% d,'); 
  predict = [predict(1:ind_0), 'aT_b = t_0 + t_b/ k_M/ TC_ab;      ', predict(ind_1(1):end)];
  
  % insert prediction for tx
  ind_0 = -2 + strfind(predict, 'pars_tp')'; ind_1 = -1+strfind(predict, '[t_p')'; txt_pars_tx = predict(ind_0(1):ind_1(1));
  txt_pars_tx = strrep(txt_pars_tx, 'tp', 'tx'); txt_pars_tx = strrep(txt_pars_tx, 'v_Hp', 'v_Hx');
  txt = ['t_x = get_tp(pars_tx, f); % -, scaled time', char(13)];
  predict = [predict(1:ind_0(1)-1), txt_pars_tx, txt, predict(ind_0(1):end)];
  %
  ind_0 = strfind(predict, '% fledging/puberty'); ind_1 = -2 + strfind(predict, '% ultimate');
  txt = ['% fledging', char(13), '  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at fledging', char(13), char(13)];
  txt = [txt, '  % puberty', char(13), '  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty', char(13), char(13)];
  predict = [predict(1:ind_0), txt, predict(ind_1:end)];
  
  % add prediction fro tx to output list
  ind = -2 + strfind(predict, 'prdData.tp');
  predict = [predict(1:ind), ' prdData.tx = tT_x;', char(13), predict(ind:end)];
   
  %% write/load
  
  % write edited files
  fid_mydata = fopen(flnm_mydata, 'w+'); fprintf(fid_mydata, '%s', mydata); fclose(fid_mydata);
  fid_pars_init = fopen(flnm_pars_init, 'w+'); fprintf(fid_pars_init, '%s', pars_init); fclose(fid_pars_init);
  fid_predict = fopen(flnm_predict, 'w+'); fprintf(fid_predict, '%s', predict); fclose(fid_predict);
  
  % load edited files in editor
  edit(['mydata_',my_pet,'.m'])
  edit(['pars_init_',my_pet,'.m'])
  edit(['predict_',my_pet,'.m'])
  
  %% estimate
  
  pets = {my_pet};
  check_my_pet(pets); 
  estim_options('method', 'nm'); 
  estim_pars; 
  mat2parsinit

  %% finalize
  
  fprintf('type dbcont to proceed or dbquit \n'); 
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
