%% check_links
% check links to web-pages from  results_my_pet.mat, as specified in metaData.links

%%
function check_links(pets, site)
% created 2021/08/14 by Bas Kooijman

%% Syntax
% <get_links *check_links*>(pets, site)

%% Description
% check links as specified in results_my_pet.mat files against get_id.
% The site can be: CoL, ITIS, EoL, Wiki, ADW, Taxo, WoRMS, 
%   molluscabase, scorpion, spider, collembola, orthoptera, phasmida, aphid, diptera, lepidoptera, 
%   fishbase, amphweb, ReptileDB, avibase, birdlife, MSW3, AnAge
% If the value in results_my_pet.mat does not match the value on the site, the mydata file is loaded for editing.
%
% Input:
%
% * pets: cell array with names of existing entries
% * site: optional string for a site, default all sites

%% Remarks
% * This function uses results_my_pet.mat files in local directories of add_my_pet.entries;
% * AmP supports 23 websites: 7 general, 16 taxon-specific. 
% * New id's are collected by get_id_site.
% * After runing, syncing still has to occur.
% * The names of the entries are not always accepted in CoL, but these are not changed.

%% Example
% check_links(select('Crustacea'))

  if exist('site','var')
    if ~ismember(site, {'CoL', 'ITIS', 'EoL', 'Wiki', 'ADW', 'Taxo', 'WoRMS', ...
          'molluscabase', 'scorpion', 'spider', 'collembola', 'orthoptera', 'phasmida', 'aphid', 'diptera', 'lepidoptera', ...
          'fishbase', 'amphweb', 'ReptileDB', 'avibase', 'birdlife', 'MSW3', 'AnAge'})
      fprintf('Warning from check_links: site is not recognized\n'); return
    end
    id_txt = {['id_', site]}; % cell with txt
    n_id = 1;
  end

  WD = cdCur;
  n=length(pets);
     

  for i = 1:n
    fprintf(' %g : %s \n', i, pets{i}); % report progress to screen 
   
    if exist('site','var')
      eval(['id_site = {get_', id_txt{1}, '(pets{i})};']); % get the id for the pet from the site of the detabase
    else
      [id_site, id_txt] = get_id(pets{i});
      n_id = length(id_site);
    end
     
    repair = false(n_id,1);
    cdEntr(pets{i});
    load(['results_', pets{i}], 'metaData') % get the id for the pet from the AmP collection 
     
    for j = 1:n_id % compare id's in mydata with those from the sites 
      if isfield(metaData.links, id_txt{j})
        id = metaData.links.(id_txt{j});
      else
        id = '';
      end
      if ~strcmp(id, id_site{ismember(id_txt, id_txt{j})})
        repair(j) = true;
      end
    end
     
    if any(repair) % take action if differences occur
      for j = 1:n_id % report where differences are
        if repair(j)
          fprintf([pets{i}, ': ', id_txt{j}, ' = ', id_site{j}, '\n']);
        end
      end
      repair_id(pets{i}); % actually repair mydata
    end
   end
       
   cd(WD);

end
