%% check_links
% check links to web-pages from  results_my_pet.mat, as specified in metaData.links

%%
function [nm, nm_empty] = check_links(pets, repair)
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
%
% Output:
%
% * nm: cell array with names of entries that show differences
% * nm_empty: cell array with names for which get_id_CoL gives empty

%% Remarks
% This function uses results_my_pet.mat files in local directories of add_my_pet.entries;
% AmP supports 14 websites: 6 general, 8 taxon-specific. 
% New id's are collected by get_id, which returns the 6 general id's plus 0, 1 or 2 relevant taxon-specific ones, depending on the lineage as obtained from CoL.
% Some of these id's might be empty, but get_id gets more hits than the site-specific get_id's. 
% Existing AmP id's are checked against the ones from get_id.
% When repair is activated, the files mydata, results_my_pet, my_pet_toolbar, my_pet_data.zip and allStat.my_pet.id_CoL are updated.
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
  
  fid_CoL = fopen('empty_id_CoL.txt','a+');
   
  comment = {
     'id_CoL'          ' % Cat of Life';
     'id_EoL'          ' % Ency of Life';
     'id_Wiki'         ' % Wikipedia';
     'id_ADW'          ' % ADW';
     'id_Taxo'         ' % Taxonomicon';
     'id_WoRMS'        ' % WoRMS';
     'id_molluscabase' ' % molluscabase';
     'id_fishbase'     ' % fishbase';
     'id_amphweb'      ' % AmphibiaWeb';
     'id_ReptileDB'    ' % ReptileDB';
     'id_avibase'      ' % avibase';
     'id_birdlife'     ' % birdlife';
     'id_msw3'         ' % MSW3';
     'id_AnAge'        ' % AnAge'};
  
   % initiate
   nm_empty = cell(0,1);
   CoL_o = cell(n,1); CoL_n = cell(n,1);
   EoL_o = cell(n,1); EoL_n = cell(n,1);
   Wiki_o = cell(n,1); Wiki_n = cell(n,1);
   ADW_o = cell(n,1); ADW_n = cell(n,1);
   Taxo_o = cell(n,1); Taxo_n = cell(n,1);
   WoRMS_o = cell(n,1); WoRMS_n = cell(n,1);
   molluscabase_o = cell(n,1); molluscabase_n = cell(n,1);
   fishbase_o = cell(n,1); fishbase_n = cell(n,1);
   amphweb_o = cell(n,1); amphweb_n = cell(n,1);
   ReptileDB_o = cell(n,1); ReptileDB_n = cell(n,1);
   avibase_o = cell(n,1); avibase_n = cell(n,1);
   birdlife_o = cell(n,1); birdlife_n = cell(n,1);
   msw3_o = cell(n,1) ; msw3_n = cell(n,1);
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
         if ~isempty(id_amphweb_new) && ~strcmp(id_amphweb, id_mamphweb_new) 
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
     
       if ismember('id_msw3', id_txt)
         id_msw3_new = id_new{ismember(id_txt, 'id_msw3')}; 
         if ~exist('id_msw3','var'); id_msw3 = ''; end 
         if ~isempty(id_msw3_new) && ~strcmp(id_msw3, id_msw3_new) 
           sel = true; msw3_o{i} = id_msw3; msw3_n{i} = id_msw3_new;
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
       
       if repair % change id_CoL in allStat
         allStat.(pets{i}).id_CoL = id_new{1};
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
   EoL_o = EoL_o(sel_n); EoL_n = EoL_n(sel_n);
   Wiki_o = Wiki_o(sel_n); Wiki_n = Wiki_n(sel_n);
   ADW_o = ADW_o(sel_n); ADW_n = ADW_n(sel_n);
   Taxo_o = Taxo_o(sel_n); Taxo_n = Taxo_n(sel_n);
   WoRMS_o = WoRMS_o(sel_n); WoRMS_n = WoRMS_n(sel_n);
   molluscabase_o = molluscabase_o(sel_n); molluscabase_n = molluscabase_n(sel_n);
   fishbase_o = fishbase_o(sel_n); fishbase_n = fishbase_n(sel_n);
   amphweb_o = amphweb_o(sel_n); amphweb_n = amphweb_n(sel_n);
   ReptileDB_o = ReptileDB_o(sel_n); ReptileDB_n = ReptileDB_n(sel_n);
   avibase_o = avibase_o(sel_n); avibase_n = avibase_n(sel_n);
   birdlife_o = birdlife_o(sel_n); birdlife_n = birdlife_n(sel_n);
   msw3_o = msw3_o(sel_n); msw3_n = msw3_n(sel_n);
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
   
   fclose all; % close empty_id_CoL.txt
   cd(WD);

   prt_tab({nm, CoL_o, CoL_n, EoL_o, EoL_n, Wiki_o, Wiki_n, ADW_o, ADW_n, Taxo_o, Taxo_n, WoRMS_o, WoRMS_n, ...
       molluscabase_o, molluscabase_n, fishbase_o, fishbase_n, amphweb_o, amphweb_n, ReptileDB_o, ReptileDB_n, ...
       avibase_o, avibase_n, birdlife_o, birdlife_n, msw3_o, msw3_n, AnAge_o, AnAge_n}, ...
       {'entry', 'CoL','CoL', 'EoL','EoL', 'Wiki','Wiki', 'ADW','ADW', 'Taxo','Taxo', 'WoRMS','WoRMS', ...
       'molluscabase','molluscabase', 'fishbase','fishbase', 'amphweb','amphweb', 'ReptileDB','ReptileDB', ...
       'avibase','avibase', 'birdlife','birdlife', 'msw3','msw3', 'AnAge','AnAge'}, 'check links');
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
