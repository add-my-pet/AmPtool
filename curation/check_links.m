%% check_links
% check links to web-pages from  results_my_pet.mat, as specified in metaData.links

%%
function check_links(pets, repair)
% created 2021/08/04 by Bas Kooijman

%% Syntax
% [nm, nm_empty] = <get_links *check_links*>(pets, repair)

%% Description
% check links as specified in results_my_pet.mat files against get_id and reports differences in table.
% The entry names with missing id_CoL are appended to local file empty_id_CoL.txt.
%
% Input:
%
% * pets: cell array with names of existing entries
% * repair: optional boolean for repair (default 0: do not repair)

%% Remarks
% This function uses results_my_pet.mat files in local directories of add_my_pet.entries;
% AmP supports 23 websites: 7 general, 16 taxon-specific. 
% New id's are collected by get_id, which returns the 7 general id's plus 0 till 3 relevant taxon-specific ones, depending on the lineage as obtained from CoL.
% Some of these id's might be empty, but get_id gets more hits than the site-specific get_id's. 
% Existing AmP id's are checked against the ones from get_id.
% When repair is activated, the files mydata, results_my_pet, my_pet_toolbar, my_pet_data.zip and allStat.my_pet.id_CoL are updated and synced.
% The names of the entries are not always accepted in CoL, but these are not changed.

%% Example
% check_links(select('Crustacea'))

  WD = cdCur;
  
  if ~exist('repair','var')
    repair = false;
  end

  if repair
    load allStat
  end
  n = length(pets); sel_n = true(n,1);
     
  comment = {
     'id_CoL'          ' % Cat of Life';
     'id_ITIS'         ' % ITIS';
     'id_EoL'          ' % Ency of Life';
     'id_Wiki'         ' % Wikipedia';
     'id_ADW'          ' % ADW';
     'id_Taxo'         ' % Taxonomicon';
     'id_WoRMS'        ' % WoRMS';
     'id_molluscabase' ' % molluscabase';
     'id_scorpion'     ' % scorpion';
     'id_spider'       ' % spider';
     'id_collembola'   ' % collembola';
     'id_orthoptera'   ' % orthoptera';
     'id_phasmida'     ' % phasmida';
     'id_aphid'        ' % aphid';
     'id_diptera'      ' % Diptera';
     'id_lepiptera'    ' % lepiptera';
     'id_fishbase'     ' % fishbase';
     'id_amphweb'      ' % AmphibiaWeb';
     'id_ReptileDB'    ' % ReptileDB';
     'id_avibase'      ' % avibase';
     'id_birdlife'     ' % birdlife';
     'id_MSW3'         ' % MSW3';
     'id_AnAge'        ' % AnAge'};
  
   % initiate
   CoL_o = cell(n,1); CoL_n = cell(n,1);
   ITIS_o = cell(n,1); ITIS_n = cell(n,1);
   EoL_o = cell(n,1); EoL_n = cell(n,1);
   Wiki_o = cell(n,1); Wiki_n = cell(n,1);
   ADW_o = cell(n,1); ADW_n = cell(n,1);
   Taxo_o = cell(n,1); Taxo_n = cell(n,1);
   WoRMS_o = cell(n,1); WoRMS_n = cell(n,1);
   molluscabase_o = cell(n,1); molluscabase_n = cell(n,1);
   scorpion_o = cell(n,1); scorpion_n = cell(n,1);
   spider_o = cell(n,1); spider_n = cell(n,1);
   collembola_o = cell(n,1); collembola_n = cell(n,1);
   orthoptera_o = cell(n,1); orthoptera_n = cell(n,1);
   phasmida_o = cell(n,1); phasmida_n = cell(n,1);
   aphid_o = cell(n,1); aphid_n = cell(n,1);
   diptera_o = cell(n,1); diptera_n = cell(n,1);
   lepidoptera_o = cell(n,1); lepidoptera_n = cell(n,1);
   fishbase_o = cell(n,1); fishbase_n = cell(n,1);
   amphweb_o = cell(n,1); amphweb_n = cell(n,1);
   ReptileDB_o = cell(n,1); ReptileDB_n = cell(n,1);
   avibase_o = cell(n,1); avibase_n = cell(n,1);
   birdlife_o = cell(n,1); birdlife_n = cell(n,1);
   MSW3_o = cell(n,1) ; MSW3_n = cell(n,1);
   AnAge_o = cell(n,1); AnAge_n = cell(n,1);

   for i = 1:n
     fprintf(' %g : %s \n', i, pets{i}); % report progress to screen 
     cdEntr(pets{i});
     load(['results_', pets{i},'.mat'], 'metaData');
     id_old = metaData.links; vars_pull(id_old);
     [id_new, id_txt] = get_id(pets{i}); sel = false; 
     
     if isempty(id_new) 
       nm_empty = [nm_empty, pets{i}]; 
       fprintf(fid_CoL, '%s\n', pets{i});
     else
       id_CoL_new = id_new{ismember(id_txt, 'id_CoL')}; if ~exist('id_CoL', 'var'); id_CoL = ''; end
       if ~strcmp(id_CoL, id_CoL_new)
         sel = true; CoL_o{i} = id_CoL; CoL_n{i} = id_CoL_new;
       end
     
       id_ITIS_new = id_new{ismember(id_txt, 'id_ITIS')}; if ~exist('id_ITIS', 'var'); id_ITIS = ''; end
       if ~strcmp(id_ITIS, id_ITIS_new)
         sel = true; ITIS_o{i} = id_ITIS; ITIS_n{i} = id_ITIS_new;
       end
     
       id_EoL_new = id_new{ismember(id_txt, 'id_EoL')}; if ~exist('id_EoL', 'var'); id_EoL = ''; end
       if ~strcmp(id_EoL, id_EoL_new)
         sel = true; EoL_o{i} = id_EoL; EoL_n{i} = id_EoL_new;
       end
     
       id_Wiki_new = id_new{ismember(id_txt, 'id_Wiki')}; if ~exist('id_Wiki', 'var'); id_Wiki = ''; end
       if ~strcmp(id_Wiki, id_Wiki_new)
         sel = true; Wiki_o{i} = id_Wiki; Wiki_n{i} = id_Wiki_new;
       end
     
       id_ADW_new = id_new{ismember(id_txt, 'id_ADW')}; if ~exist('id_ADW', 'var'); id_ADW = ''; end
       if ~strcmp(id_ADW, id_ADW_new)
         sel = true; ADW_o{i} = id_ADW; ADW_n{i} = id_ADW_new;
       end
     
       id_Taxo_new = id_new{ismember(id_txt, 'id_Taxo')}; if ~exist('id_Taxo', 'var'); id_Taxo = ''; end
       if ~strcmp(id_Taxo, id_Taxo_new)
         sel = true; Taxo_o{i} = id_Taxo; Taxo_n{i} = id_Taxo_new;
       end
     
       id_WoRMS_new = id_new{ismember(id_txt, 'id_WoRMS')}; if ~exist('id_WoRMS', 'var'); id_WoRMS = ''; end
       if ~strcmp(id_WoRMS, id_WoRMS_new)
         sel = true; WoRMS_o{i} = id_WoRMS; WoRMS_n{i} = id_WoRMS_new;
       end
      
       if ismember('id_molluscabase', id_txt)
         id_molluscabase_new = id_new{ismember(id_txt, 'id_molluscabase')}; 
         if ~exist('id_molluscabase','var'); id_molluscabase = ''; end
         if ~isempty(id_molluscabase_new) && ~strcmp(id_molluscabase, id_molluscabase_new) 
           sel = true; molluscabase_o{i} = id_molluscabase; molluscabase_n{i} = id_molluscabase_new;
         end
       end
       
       if ismember('id_diptera', id_txt)
         id_diptera_new = id_new{ismember(id_txt, 'id_diptera')}; 
         if ~exist('id_diptera','var'); id_diptera = ''; end
         if ~isempty(id_diptera_new) && ~strcmp(id_diptera, id_diptera_new) 
           sel = true; diptera_o{i} = id_diptera; diptera_n{i} = id_diptera_new;
         end
       end
     
      if ismember('id_fishbase', id_txt)
         id_fishbase_new = id_new{ismember(id_txt, 'id_fishbase')}; 
         if ~exist('id_fishbase','var'); id_fishbase = ''; end
         if ~isempty(id_fishbase_new) && ~strcmp(id_fishbase, id_fishbase_new) 
           sel = true; fishbase_o{i} = id_fishbase; fishbase_n{i} = id_fishbase_new;
         end
       end
     
       if ismember('id_amphweb', id_txt)
         id_amphweb_new = id_new{ismember(id_txt, 'id_amphweb')}; 
         if ~exist('id_amphweb','var'); id_amphweb = ''; end
         if ~isempty(id_amphweb_new) && ~strcmp(id_amphweb, id_amphweb_new) 
           sel = true; amphweb_o{i} = id_amphweb; amphweb_n{i} = id_amphweb_new;
         end
       end
         
       if ismember('id_ReptileDB', id_txt)
         id_ReptileDB_new = id_new{ismember(id_txt, 'id_ReptileDB')};
         if ~exist('id_ReptileDB','var'); id_ReptileDB = ''; end
         if ~isempty(id_ReptileDB_new) && ~strcmp(id_ReptileDB, id_ReptileDB_new) 
           sel = true; ReptileDB_o{i} = id_ReptileDB; ReptileDB_n{i} = id_ReptileDB_new;
         end
       end
     
       if ismember('id_avibase', id_txt)
         id_avibase_new = id_new{ismember(id_txt, 'id_avibase')}; 
         if ~exist('id_avibase','var'); id_avibase = ''; end
         if ~isempty(id_avibase_new) && ~strcmp(id_avibase, id_avibase_new) 
           sel = true; avibase_o{i} = id_avibase; avibase_n{i} = id_avibase_new;
         end
       end
     
       if ismember('id_birdlife', id_txt)
         id_birdlife_new = id_new{ismember(id_txt, 'id_birdlife')}; 
         if ~exist('id_birdlife','var'); id_birdlife = ''; end
         if ~isempty(id_birdlife_new) && ~strcmp(id_birdlife, id_birdlife_new) 
           sel = true; birdlife_o{i} = id_birdlife; birdlife_n{i} = id_birdlife_new;
         end
       end
     
       if ismember('id_MSW3', id_txt)
         id_MSW3_new = id_new{ismember(id_txt, 'id_MSW3')}; 
         if ~exist('id_MSW3','var'); id_MSW3 = ''; end 
         if ~isempty(id_MSW3_new) && ~strcmp(id_MSW3, id_MSW3_new) 
           sel = true; MSW3_o{i} = id_MSW3; MSW3_n{i} = id_MSW3_new;
         end
       end
     
       if ismember('id_AnAge', id_txt)
         id_AnAge_new = id_new{ismember(id_txt, 'id_AnAge')}; 
         if ~exist('id_AnAge','var');  id_AnAge = ''; end
         if ~isempty(id_AnAge_new) && ~strcmp(id_AnAge, id_AnAge_new) 
           sel = true; AnAge_o{i} = id_AnAge; AnAge_n{i} = id_AnAge_new;
         end
       end
     
       sel_n(i) = sel;
       
       if  repair && ~strcmp(CoL_o{i}, CoL_n{i})
         reply = input(['Warning from check_links for ', pets{i}, ': old id_CoL = ', id_CoL_o, ', new id_CoL = ', id_CoL_n, '. Replace in allStat? (y/n/else):'], 's');
         if strcmp(reply,'y')         
           allStat.(pets{i}).id_CoL = id_new{1};
         end
       end
       
       if repair && sel % repair entry
         
         % write mydata_my_pet.m file
         
         % compose new links-section
         n_links = length(id_new); links_txt = [];
         for j = 1:n_links
           links_txt = [links_txt, 'metaData.links.', id_txt{j}, ' = ''', id_new{j}, ''';', comment{ismember(comment(:,1),id_txt{j}),2}, char([13 10])];
         end        
         % paste new links section in existing mydata file
         mydata = fileread(['mydata_', pets{i},'.m']);
         i_0 = strfind(mydata, 'metaData.links')-1; i_1 = strfind(mydata, '%% References')-1;
         mydata = [mydata(1:i_0), links_txt, char([13 10]), mydata(i_1:end)];
         fid = fopen(['mydata_', pets{i},'.m'],'w+');
         fprintf(fid, '%s', mydata); fclose(fid);
         
         run_repair(pets{i}); % write results_my_pet.mat file
         
         % write zip file
         cd('../../entries_zip'); % goto add_my_pet/entries_zip from  add_my_pet/entries/my_pet
         zip_my_pet(pets{i}, '../entries'); % zip the entry and save
         
         % write toolbar
         cdCur; prt_my_pet_toolbar(pets{i}, ['../../deblab/add_my_pet/entries_web/', pets{i},'/']);                                  
 
       end
       
     end
   end
   nm = pets(sel_n);
   CoL_o = CoL_o(sel_n); CoL_n = CoL_n(sel_n);
   ITIS_o = ITIS_o(sel_n); ITIS_n = ITIS_n(sel_n);
   EoL_o = EoL_o(sel_n); EoL_n = EoL_n(sel_n);
   Wiki_o = Wiki_o(sel_n); Wiki_n = Wiki_n(sel_n);
   ADW_o = ADW_o(sel_n); ADW_n = ADW_n(sel_n);
   Taxo_o = Taxo_o(sel_n); Taxo_n = Taxo_n(sel_n);
   WoRMS_o = WoRMS_o(sel_n); WoRMS_n = WoRMS_n(sel_n);
   molluscabase_o = molluscabase_o(sel_n); molluscabase_n = molluscabase_n(sel_n);
   scorpion_o = scorpion_o(sel_n); scorpion_n = scorpion_n(sel_n);
   spider_o = spider_o(sel_n); spider_n = spider_n(sel_n);
   collembola_o = collembola_o(sel_n); collembola_n = collembola_n(sel_n);
   orthoptera_o = orthoptera_o(sel_n); orthoptera_n = orthoptera_n(sel_n);
   phasmida_o = phasmida_o(sel_n); phasmida_n = phasmida_n(sel_n);
   aphid_o = aphid_o(sel_n); aphid_n = aphid_n(sel_n);
   diptera_o = diptera_o(sel_n); diptera_n = diptera_n(sel_n);
   lepidoptera_o = lepidoptera_o(sel_n); lepidoptera_n = lepidoptera_n(sel_n);
   fishbase_o = fishbase_o(sel_n); fishbase_n = fishbase_n(sel_n);
   amphweb_o = amphweb_o(sel_n); amphweb_n = amphweb_n(sel_n);
   ReptileDB_o = ReptileDB_o(sel_n); ReptileDB_n = ReptileDB_n(sel_n);
   avibase_o = avibase_o(sel_n); avibase_n = avibase_n(sel_n);
   birdlife_o = birdlife_o(sel_n); birdlife_n = birdlife_n(sel_n);
   MSW3_o = MSW3_o(sel_n); MSW3_n = MSW3_n(sel_n);
   AnAge_o = AnAge_o(sel_n); AnAge_n = AnAge_n(sel_n);
   
   if repair
     cdAmPdata;   
     save('allStat.mat', 'allStat');
     zip('AmPdata', {'allStat.mat','popStat.mat','cdAmPdata.m'}); cdCur; 
     % mirror to VU and IUEM; this takes 10 min each, but runs in the background
     if ismac || isunix
       system('SyncBackPro AmP2VU -i  AmP2IUEM -i'); 
     else
       system('powershell SyncBackPro AmP2VU -i  AmP2IUEM -i'); 
     end
   end
   
   cd(WD);

   prt_tab({nm, CoL_o,CoL_n, ITIS_o,ITIS_n, EoL_o,EoL_n, Wiki_o,Wiki_n, ADW_o,ADW_n, Taxo_o,Taxo_n, WoRMS_o,WoRMS_n, ...
       molluscabase_o,molluscabase_n, scorpion_o, scorpion_n, spider_o,spider_n, collembola_o,collembola_n, orthoptera_o,orthoptera_n, ...
       phasmida_o,phasmida_n, aphid_o,aphid_n, diptera_o,diptera_n, lepidoptera_o,lepidoptera_n, ...
       fishbase_o,fishbase_n, amphweb_o,amphweb_n, ReptileDB_o,ReptileDB_n, ...
       avibase_o,avibase_n, birdlife_o,birdlife_n, MSW3_o,MSW3_n, AnAge_o,AnAge_n}, ...
       {'entry', 'CoL','CoL', 'ITIS','ITIS', 'EoL','EoL', 'Wiki','Wiki', 'ADW','ADW', 'Taxo','Taxo', 'WoRMS','WoRMS', ...
       'molluscabase','molluscabase', 'scorpion','scorpion', 'spider','spider', 'collembola','collembola', 'orthoptera','orthoptera', 'phasmida','phasmida', ...
       'aphid','aphid', 'diptera','diptera', 'lepidoptera','lepidoptera', 'fishbase','fishbase', 'amphweb','amphweb', 'ReptileDB','ReptileDB', ...
       'avibase','avibase', 'birdlife','birdlife', 'MSW3','MSW3', 'AnAge','AnAge'}, 'check links');
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
