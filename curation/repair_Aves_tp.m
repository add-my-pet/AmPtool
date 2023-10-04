%% repair_Aves_tp
% edit source files
%%
function repair_Aves_tp(entries)
% created 2023/07/27 by Bas Kooijman

%% Syntax
% <repair_Aves_tp  *repair_Aves_tp*>(entries)

%% Description
% Edit mydata files
%
% Input:
%
% * entries: cell string with one or more entries


WD = cdCur; cd '../../deblab/add_my_pet/Aves_new/Struthio_camelus'; % first bird
 

n = length(entries);
for i=1:n % scan entries
  my_pet = entries{i}; 
  fprintf('%g: %s\n', i, my_pet);
  cd(['../',my_pet]);

  % load files in editor that are to be edited
  edit(['mydata_',my_pet,'.m'])
  edit(['pars_init_',my_pet,'.m'])
  edit(['predict_',my_pet,'.m'])

  % read source files
  flnm_mydata = ['mydata_', my_pet, '.m']; mydata = fileread(flnm_mydata);
  flnm_pars_init = ['pars_init_', my_pet, '.m']; pars_init = fileread(flnm_pars_init);
  flnm_predict = ['predict_', my_pet, '.m']; predict = fileread(flnm_predict);
  fullEdit = ~contains(mydata,'''ax'';');

  % get output of mydata_my_pet and pars_init
  eval(['[data, auxData, metaData] = mydata_', my_pet, ';'])
  eval(['par = pars_init_', my_pet, '(metaData);'])

  %% edit mydata
   
  % add tx to data_0 and add tx, modify tp
  if fullEdit
    % get tp
    tp = num2str(3 * data.tp); % txt string; madification from tp = tx

    % add tx to data_0
    mydata = strrep(mydata, '''ap'';', '''ax''; ''ap'';');
    % add tx, modify tp
    ind_0  = strfind(mydata, 'data.tp'); ind_1 = -1+strfind(mydata, 'data.tR'); txt = mydata(ind_0:ind_1);
    txt_tx = strrep(txt, 'tp', 'tx'); txt_tx = strrep(txt_tx, 'fledging/puberty', 'fledging');
    txt_tp = strrep(txt, 'fledging/puberty','puberty'); ind = strfind(txt_tp,';'); txt_tp = ['data.tp = ', tp, txt_tp(ind(1):end)];
    ind_2  = 11+strfind(txt_tp, 'bibkey.tp = '); ind_3 = ind_2 + strfind(txt_tp(ind_2:end),';'); 
    txt_tp = [txt_tp(1:ind_2), '''guess'';', txt_tp(ind_3:end)];
    txt_tp = [txt_tp, '  comment.tp = ''based on the stylized empirical relationship between tx and tp for species for which both data were available'';', char(13)];
    mydata = [mydata(1:ind_0-1), txt_tx, txt_tp, mydata(ind_1+1: end)];  
  end

  %% edit pars_init
    
  % modify E_Hp, add E_Hx
  pars_init = strrep(pars_init, 'fledging/puberty', 'puberty');
  ind_0 = strfind(pars_init, 'par.E_Hp'); ind_1 = strfind(pars_init, 'par.h_a');
  txt_EHx = pars_init(ind_0:ind_1-1); txt_EHx = strrep(txt_EHx, 'E_Hp', 'E_Hx');
  txt_EHx = strrep(txt_EHx, 'puberty', 'fledging');
  ind = ind_0 + 1 + strfind(pars_init(ind_0:end), ' = '); pars_init = [pars_init(1:ind), '2*', pars_init(ind+1:end)];
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
  
  if fullEdit
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
  
  % add prediction for tx to output list
  ind = -2 + strfind(predict, 'prdData.tp');
  predict = [predict(1:ind), ' prdData.tx = tT_x;', char(13), predict(ind:end)];
  end
  
  %% write/load
  
  % write edited files
  fid_mydata = fopen(flnm_mydata, 'w+'); fprintf(fid_mydata, '%s', mydata); fclose(fid_mydata);
  fid_pars_init = fopen(flnm_pars_init, 'w+'); fprintf(fid_pars_init, '%s', pars_init); fclose(fid_pars_init);
  fid_predict = fopen(flnm_predict, 'w+'); fprintf(fid_predict, '%s', predict); fclose(fid_predict);
  
  % load edited files in editor
  edit(['mydata_',my_pet,'.m'])
  edit(['pars_init_',my_pet,'.m'])
  edit(['predict_',my_pet,'.m'])
  
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
