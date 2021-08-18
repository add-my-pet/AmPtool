%% prt_id
% prints an html-page with all identifiers for specified AmP entries 

%%
function prt_id(pets, save)
% created 2021/08/14 by Bas Kooijman

%% Syntax
% <prt_id *prt_id*>(pets, save)

%% Description
% prints an html-page with all identifiers for specified AmP entries as present in results_my_pet.mat files
%
% Input:
%
% * pets: cell array with names of existing entries
% * save: optional boolean for saving the table in AmPTool/curation (default 0: do not save)

%% Remarks
% This function uses results_my_pet.mat files in local directories of add_my_pet/entries;
% AmP supports 23 websites: 7 general, 16 taxon-specific. 
% Repair id of an entry with <repair_id.html *repair_id*>, get existing id's with <get_links.html *get_links*> and new id's with <get_id.html *get_id*>.

%% Example
% prt_id(select('Crustacea'))

  WD = cdCur;
  
  if ~exist('save','var')
    save = false;
  end

  n = length(pets); 
     
   % initiate
   CoL = cell(n,1); 
   ITIS = cell(n,1); 
   EoL = cell(n,1); 
   Wiki = cell(n,1); 
   ADW = cell(n,1); 
   Taxo = cell(n,1); 
   WoRMS = cell(n,1); 
   molluscabase = cell(n,1); 
   scorpion = cell(n,1); 
   spider = cell(n,1); 
   collembola = cell(n,1); 
   orthoptera = cell(n,1); 
   phasmida = cell(n,1); 
   aphid = cell(n,1); 
   diptera = cell(n,1); 
   lepidoptera = cell(n,1); 
   fishbase = cell(n,1); 
   amphweb = cell(n,1);
   ReptileDB = cell(n,1); 
   avibase = cell(n,1); 
   birdlife = cell(n,1); 
   MSW3 = cell(n,1); 
   AnAge = cell(n,1); 

   for i = 1:n
     cdEntr(pets{i});
     load(['results_', pets{i},'.mat'], 'metaData');
     id = metaData.links; vars_pull(id);
     flds = fields(id); n_flds = length(flds);
     for j = 1:n_flds
        nm = strsplit(flds{j}, '_'); nm = nm{2};
        eval([nm,'{i} = id_', nm, ';']);
     end
   end
     
   cdCur;
   prt_tab({pets, CoL, ITIS, EoL, Wiki, ADW, Taxo, WoRMS, ...
       molluscabase, scorpion, spider, collembola, orthoptera, phasmida, aphid, diptera, lepidoptera, ...
       fishbase, amphweb, ReptileDB, avibase, birdlife, MSW3, AnAge}, ...
       {'entry', 'CoL', 'ITIS', 'EoL', 'Wiki', 'ADW', 'Taxo', 'WoRMS', ...
       'molluscabase', 'scorpion', 'spider', 'collembola', 'orthoptera', 'phasmida', 'aphid', 'diptera', 'lepidoptera', ...
       'fishbase' 'amphweb' 'ReptileDB', 'avibase', 'birdlife', 'MSW3', 'AnAge'}, ['id_', datestr(datenum(date),'yyyymmdd')], save);
   
   cd(WD);

end
