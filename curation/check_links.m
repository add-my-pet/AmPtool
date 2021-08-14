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
% * site: string for a site

%% Remarks
% This function uses results_my_pet.mat files in local directories of add_my_pet.entries;
% AmP supports 23 websites: 7 general, 16 taxon-specific. 
% New id's are collected by get_id_site.
% After runing, syncing still has to occur.
% The names of the entries are not always accepted in CoL, but these are not changed.

%% Example
% check_links(select('Crustacea'))

  if ~ismember(site, {'CoL', 'ITIS', 'EoL', 'Wiki', 'ADW', 'Taxo', 'WoRMS', ...
          'molluscabase', 'scorpion', 'spider', 'collembola', 'orthoptera', 'phasmida', 'aphid', 'diptera', 'lepidoptera', ...
          'fishbase', 'amphweb', 'ReptileDB', 'avibase', 'birdlife', 'MSW3', 'AnAge'})
    fprintf('Warning from check_links: site is not recognized\n'); return
  end
  idsite = ['id_', site]; % txt, while id_site is the value

  WD = cdCur;
  n=length(pets);
     

   for i = 1:n
     fprintf(' %g : %s \n', i, pets{i}); % report progress to screen 
   
     eval(['id_site = get_', idsite, '(pets{i});']); % get the id for the pet from the site of the detabase

     cdEntr(pets{i});
     load(['results_', pets{i}], 'metaData') % get the id for the pet from the AmP collection 
     if isfield(metaData.links, idsite)
       id = metaData.links.(idsite);
     else
       id = '';
     end
     
     % compare the results and take action if differences occur
     if ~strcmp(id, id_site)
       fprintf([pets{i}, ': ', idsite, ' = ', id_site, '\n']);
       repair_id(pets{i});
     end
   end
       
   cd(WD);

end
