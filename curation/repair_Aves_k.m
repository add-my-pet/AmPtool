%% repair_Aves_k
% edit source files, runs estimation
%%
function repair_Aves_k(entries)
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
 
% set estim options
global pets
estim_options('default'); 
estim_options('max_step_number', 5e2); 
estim_options('max_fun_evals', 5e3); 

estim_options('pars_init_method', 2); 
estim_options('results_output', 3); 
estim_options('method', 'nm'); 

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
  
  % get output of mydata_my_pet and pars_init
  eval(['[data, auxData, metaData] = mydata_', my_pet, ';'])
  eval(['par = pars_init_', my_pet, '(metaData);'])
  fullEdit = ~contains(mydata,'''ax'';');

  %% edit mydata
  
  % replace modification author
  ind = strfind(mydata,'author_mod_'); ind = ind(end);
  ind = ind-2+strfind(mydata(ind:end),'}'); ind = ind(1); mydata = [mydata(1:ind), ', ''Starrlight Augustine''', mydata(ind+1:end)];

  % get tp
  tp = num2str(3 * data.tp); % txt string; modification from tp = tx
   
  % add tx to data_0 and add tx, modify tp
  if fullEdit
    % add tx to data_0
    mydata = strrep(mydata, '''ap'';', '''ax''; ''ap'';');
    % add tx, modify tp
    ind_0  = strfind(mydata, 'data.tp'); ind_1 = -1+strfind(mydata, 'data.tR'); txt = mydata(ind_0:ind_1);
    txt_tx = strrep(txt, 'tp', 'tx'); txt_tx = strrep(txt_tx, 'fledging/puberty', 'fledging');
    txt_tp = strrep(txt, 'fledging','puberty'); ind = strfind(txt_tp,';'); txt_tp = ['data.tp = ', tp, txt_tp(ind(1):end)];
    ind_2  = 11+strfind(txt_tp, 'bibkey.tp = '); ind_3 = ind_2 + strfind(txt_tp(ind_2:end),';'); 
    txt_tp = [txt_tp(1:ind_2), '''guess'';', txt_tp(ind_3:end)];
%     txt_tp = [txt_tp, '  comment.tp = '''';', char(13)];
    mydata = [mydata(1:ind_0-1), txt_tx, txt_tp, mydata(ind_1+1: end)];  
  end
    
  % replace discussion point
  if fullEdit
    txt = ['Pseudo-data point k is used, rather than k_J; ' ...
      'Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. '...
      'Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. ' ...
      'See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>'];
  else
    txt = ['Pseudo-data point k is used, rather than k_J; ' ...
      'Parameter t_R is added, replacing clutch interval t_N. '...
      'Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. ' ...
      'See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>'];
  end
  mydata = strrep(mydata, 'Puberty is assumed to coincide with fledging with a waiting time to first brood', txt);
  
  % add bibitem
  PrinPres1991 = fileread('../PrinPres1991.txt');
  ind = -1+strfind(mydata, '];'); ind = ind(end); mydata = [mydata(1:ind), '];', char(13), PrinPres1991];

  % add comment to txtData, if not already done
  if ~contains(mydata, 'txtData.comment = comment;') && contains(mydata, 'comment.')
    ind = 24+strfind(mydata,'txtData.bibkey = bibkey;');
    mydata = [mydata(1:ind), 'txtData.comment = comment;', char(13), mydata(ind+1:end)];
  end
  
% set weights for guessed tp
  ind = 20+strfind(mydata, 'setweights(data, []);');
  mydata = [mydata(1:ind), 'weights.tp = 0.1;', mydata(ind+1:end)];

  % set weights for k_J ad k
  ind = 16+strfind(mydata, 'label, weights);');
  mydata = [mydata(1:ind), 'weights.psd.k_J = 0; weights.psd.k = 2;', mydata(ind+1:end)];
    
  T_typical = num2str(get_T_Aves(metaData.order));
  % change temperatures if wanted
   fprintf('The typical body temperature for this order is %s C\n', T_typical) 
%   tempChange = input(['T for this order is ', T_typical, '; Change body temparatures? (y/n) '],'s');
%   if strcmp(tempChange,'y') 
    % get T_typical
%     if ~contains(mydata, 'embryo')  

      n = length(strfind(mydata, 'C2K('));
      for j=1:n 
        ind_0 = 3 + strfind(mydata, 'C2K(');
        ind_1 = ind_0(j) - 1 + strfind(mydata(ind_0(j):end),')'); 
        mydata = [mydata(1:ind_0(j)), T_typical, mydata(ind_1(1):end)]; 
      end
      ind_0 = 13 + strfind(mydata, 'temp.ab = C2K('); 
      ind_1 = ind_0(1) - 1 + strfind(mydata(ind_0(1):end),')'); 
      mydata = [mydata(1:ind_0(1)), '36', mydata(ind_1(1):end)]; 
%       if contains(mydata, 'comment.ab')
%         ind = strfind(mydata, 'comment.ab'); ind_0 = strfind(mydata(ind:end),''''); ind = ind + ind_0(1);
%         mydata = [mydata(1:ind), 'Temperature is guessed based on being the optimal temperature for artificial incubation for several species; ' , ...
%          'It depends on environmental conditions and parental care. ', mydata(ind+1:end)];   
%       else
%         ind = -1+strfind(mydata, 'data.tx');
%         mydata = [mydata(1:ind), '  comment.ab = ''temperature is guessed based on being the optimal temperature for artificial incubation for several species; ' , ...
%          'It depends on environmental conditions and parental care'';', char(13), mydata(ind+1:end)];
%       end
%     else
%       fprintf('Warning from repair_Aves_k: mydata contains the word embryo, please edit temperatures by hand\n') 
%       fprintf('The typical body temperature for this order is %s C\n', T_typical) 
%     end
        if contains(mydata, 'embryo') 
            fprintf('Warning from repair_Aves_k: mydata contains the word embryo, please double check the temperatures \n') 
        end
%   end

  %% edit pars_init
    
%   % free v
  ind_0 = 8 + strfind(pars_init, 'free.v'); ind_1 =  strfind(pars_init(ind_0:end), ';'); ind_1 = ind_0 + ind_1(1) - 2;
  pars_init = [pars_init(1:ind_0), ' = 1;' , pars_init(ind_1:end)];

  % set initial estimate for k_J
%   k_J = num2str(0.3 * par.p_M/ par.E_G); % 1/d, based on k = 0.3
  k_J = num2str(0.02); % 1/d, based on experience
  ind_0 = 9 + strfind(pars_init, 'par.k_J = '); ind_1 =  strfind(pars_init(ind_0:end), ';'); ind_1 = ind_0 + ind_1(1) - 2;
  pars_init = [pars_init(1:ind_0), k_J, ';', pars_init(ind_1:end)];

  % release k_J
  % fix f_J
  ind_0 = 8 + strfind(pars_init, 'free.k_J'); ind_1 =  strfind(pars_init(ind_0:end), ';'); ind_1 = ind_0 + ind_1(1) - 2;
  pars_init = [pars_init(1:ind_0), ' = 0;' , pars_init(ind_1:end)];
  
  % reduce initial estimate for kap
% %   pars_init = strrep(pars_init, 'par.kap = ', 'par.kap = 0.9*');
%   pars_init = strrep(pars_init, 'par.kap = ', 'par.kap = 0.7;');
  
%   % fix kap
%   ind_0 = 8 + strfind(pars_init, 'free.kap'); ind_1 =  strfind(pars_init(ind_0:end), ';'); ind_1 = ind_0 + ind_1(1) - 2;
%   pars_init = [pars_init(1:ind_0), ' = 0;' , pars_init(ind_1:end)];


  % fix t_R at data.tR
  t_R = num2str(data.tR);
  ind_0 = 9 + strfind(pars_init, 'par.t_R = '); ind_1 = strfind(pars_init(ind_0:end), ';'); ind_1 = ind_0 + ind_1(2);
  pars_init = [pars_init(1:ind_0), t_R, '; free.t_R = 0;' , pars_init(ind_1:end)];
     
  % modify E_Hp, add E_Hx
  pars_init = strrep(pars_init, 'fledging/puberty', 'puberty');
  ind_0 = strfind(pars_init, 'par.E_Hp'); ind_1 = strfind(pars_init, 'par.h_a');
  txt_EHx = pars_init(ind_0:ind_1-1); txt_EHx = strrep(txt_EHx, 'E_Hp', 'E_Hx');
  txt_EHx = strrep(txt_EHx, 'puberty', 'fledging');
%   ind = ind_0 + 1 + strfind(pars_init(ind_0:end), ' = '); pars_init = [pars_init(1:ind), '2*', pars_init(ind+1:end)];

  % other parameters 
  ind = 21+ strfind(pars_init, '%% other parameters');
  pars_init  = [pars_init(1:ind), txt_EHx, pars_init(ind+1:end)];
  pars_init = strrep(pars_init, 'par.t_0', '% par.t_0');  

  % starting values for birds
  pars_init = strrep(pars_init, 'par.v = ', 'par.v = 0.02;');
  pars_init = strrep(pars_init, 'par.kap = ', 'par.kap = 0.7;');
  pars_init = strrep(pars_init, 'par.p_M = ', 'par.p_M = 500;');
  pars_init = strrep(pars_init, 'par.E_Hb = ', 'par.E_Hb = 9.057e+02;');
  pars_init = strrep(pars_init, 'par.E_Hx = ', 'par.E_Hx = 9.057e+02*2;');
  pars_init = strrep(pars_init, 'par.E_Hp = ', 'par.E_Hp =   1.689e+03;');
  pars_init = strrep(pars_init, 'par.h_a = ', 'par.h_a = 5.236e-12;');
  pars_init = strrep(pars_init, 'par.z = ', 'par.z = 1.65;');
  
  % free or fix parameter values
  % set initial estimate for v
%   pars_init = strrep(pars_init, 'free.v     = 0;', 'free.v     = 1;');
  pars_init = strrep(pars_init, 'free.kap   = 1;', 'free.kap   = 0;');
  pars_init = strrep(pars_init, 'free.p_M   = 0;', 'free.p_M   = 1;');
  pars_init = strrep(pars_init, 'free.E_Hp  = 0;', 'free.E_Hp  = 1;');
pars_init = strrep(pars_init, 'free.v     = 1', 'free.v     = 0');
pars_init = strrep(pars_init, 'free.v    = 1', 'free.v     = 0');

% fix some errors from previous edits:
 pars_init = strrep(pars_init, 'ppar.E_Hx =', 'par.E_Hx =');
  pars_init = strrep(pars_init, 'ar.f =', 'par.f =');
    pars_init = strrep(pars_init, 'ppar.f =', 'par.f =');
  
  %% edit predict
  
  % TC (some entries do not use TC_ab)
  ind_0 = -1 + strfind(predict, 'TC'); ind_1 = -2 + strfind(predict, '% zero');
  txt = ['TC_ab = tempcorr(temp.ab, T_ref, T_A);', char(13), ...
         '  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;', char(13), char(13)];
  predict = [predict(1:ind_0), txt, predict(ind_1:end)];
  
  %  t_0:
%   ind_0 = -1 + strfind(predict, 'aT_b'); ind_1 = strfind(predict, '% d,'); 
%   predict = [predict(1:ind_0), 'aT_b = t_0 + t_b/ k_M/ TC_ab;      ', predict(ind_1(1):end)];
predict = strrep(predict, 'aT_b = t_0 + t_b/ k_M/ TC_ab;', 'aT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'aT_b = t_0 + t_b/ k_M/ TC;', 'aT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'aT_b = t_0 + t_b/ kT_M;', 'aT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'aT_b = t_0 + t_b/ TC_ab/ k_M;', 'aT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'aT_b = t_0 + tT_b;', 'aT_b = tT_b;');
predict = strrep(predict, 'tT_b = t_b/ k_M/ TC_ab;', 'tT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'tT_b = t_b/ k_M/ TC;', 'tT_b = tau_b/ k_M/ TC_ab;');
predict = strrep(predict, 'if t_0 < 0', 'if E_Hx < 0');

  if fullEdit
  % insert prediction for tx
  ind_0 = -2 + strfind(predict, 'pars_tp')'; ind_1 = -1+strfind(predict, '[t_p')'; txt_pars_tx = predict(ind_0(1):ind_1(1));
  txt_pars_tx = strrep(txt_pars_tx, 'tp', 'tx'); txt_pars_tx = strrep(txt_pars_tx, 'v_Hp', 'v_Hx');
%   txt = ['t_x = get_tp(pars_tx, f); % -, scaled time', char(13)];
  txt = ['[tau_x, ~,~,~,info] = get_tp(pars_tx, f); if info == 0; prdData = []; return; end', char(13)];
  predict = [predict(1:ind_0(1)-1), txt_pars_tx, txt, predict(ind_0(1):end)];
  predict = strrep(predict, '[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);', '[tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); if info == 0; prdData = []; return; end');

  %
  ind_0 = strfind(predict, '% fledging/puberty'); ind_1 = -2 + strfind(predict, '% ultimate');
  txt = ['% fledging', char(13), '  tT_x = (tau_x - tau_b)/ kT_M;         % d, time since birth at fledging', char(13), char(13)];
  txt = [txt, '  % puberty', char(13), '  tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at puberty', char(13), char(13)];
  predict = [predict(1:ind_0), txt, predict(ind_1:end)];
  
  predict = strrep(predict, 't_m =', 'tau_m =');
  predict = strrep(predict, 'aT_m = t_m/ kT_M', 'aT_m = tau_m/ kT_M');
  predict = strrep(predict, 'aT_m = t_m/ k_M/ TC;', 'aT_m = tau_m/ kT_M');
  predict = strrep(predict, '1 + f * w', '1 + f * ome');
  predict = strrep(predict, 'w_m =', 'ome_m =');
  predict = strrep(predict, '1 + f * w_m', '1 + f * ome_m');
  predict = strrep(predict, 'EWome_m =', 'EWw_m =');

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
  
  pets = {my_pet};

  fprintf('type dbcont to proceed to the next species or dbquit \n'); 
  fprintf('type estim_pars; mat2pars_init to estimate \n'); 
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
