%% get_links
% gets links to web-pages from  results_my_pet.mat, as specified in metaData.links

%%
function [links, id] = get_links(my_pet, open)
% created 2019/12/25 by Bas Kooijman, modified 2020/05/15

%% Syntax
% [links, id] = <get_links *get_links*>(taxon, open)

%% Description
% Gets cell strings with links and descriptions for an entry and open the webpages.
% Without inputs, the function will open all websites that are supported by AmP.
%
% Input:
%
% * my_pet: optional character string with name of entry
% * open: optional boolean for opening the web pages (default 0: not open)
%
% Output:
%
% * links: (n,2)-cell array with links and names for links
% * id: (n,2)-cell array with id's and values, as in metaData.links of mydata

%% Remarks
% * This function first tries to find results_my_pet.mat or mydata_my_pet in local directories;
% * in failure, it downloads it from the web via powershell function wget,
% but this file is not deleted after downloading, because of use of the function in curator_report

%% Example
% get_links('Daphnia_magna',1)

  if ~exist('my_pet','var') || isempty(my_pet)
   id = [];
   links = { ...
   % general links
     'https://www.catalogueoflife.org/col/'; ...
     'https://www.itis.gov/'; ...
     'https://eol.org/'; ...
     'https://en.wikipedia.org/wiki/'; ...
     'https://animaldiversity.org/'; ...
     'http://taxonomicon.taxonomy.nl/'; ...
     'https://marinespecies.org/'; ...
   % taxon-specific links
     'https://www.molluscabase.org/'; ...
     'https://www.ntnu.no/ub/scorpion-files/'; ...
     'https://wsc.nmbe.ch/'; ...
     'https://www.collembola.org/'; ...
     'http://Orthoptera.SpeciesFile.org'; ...
     'http://phasmida.speciesfile.org/'; ...
     'http://aphid.speciesfile.org/'; ...
     'https://diptera.info/'; ...
     'http://www.nhm.ac.uk/our-science/data/lepindex/'; ...
     'https://www.fishbase.se/summary/'; ...
     'https://amphibiaweb.org/search/'; ...
     'https://reptile-database.reptarium.cz/'; ...
     'https://avibase.bsc-eoc.org/'; ...
     'http://datazone.birdlife.org/'; ...
     'https://www.departments.bucknell.edu/biology/resources/msw3/'; ...
     'https://genomics.senescence.info/'};
   n_links = length(links);
   for i= 1:n_links 
     web(links{i},'-browser');
   end
   return
  end

  % set all id's on empty
  id_CoL=''; id_ITIS=''; id_EoL=''; id_Wiki=''; id_ADW=''; id_Taxo=''; id_WoRMS='';  
  id_molluscabase=''; id_scorpion=''; id_spider=''; id_collembola=''; id_orthoptera=''; id_phasmida=''; id_aphid=''; id_diptera=''; id_lepidoptera='';
  id_fishbase=''; id_amphweb=''; id_ReptileDB=''; id_avibase=''; id_birdlife=''; id_MSW3=''; id_AnAge='';
  
  % overwrite id's with those in mydata_my_pet
  fnmmat = ['results_', my_pet,'.mat'];  
  try % locally present in dir entries (mostly for curators)
    WD = cdCur; load(['../../deblab/add_my_pet/entries/', my_pet, '/results_', my_pet,'.mat']); cd(WD);
    if ~isfield(metaData,'links')
      fprintf(['Warning from get_links: no links specified in ', fnnmat, '\n']);
      links = [];  id = []; return
    end
    id = metaData.links; vars_pull(id);
  catch % get results_my_pet.mat from web
    cd(WD);
    path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries/';
    if ismac || isunix
      system(['wget -O ', fnmmat, path, my_pet, '/', fnmmat]);
    else
      system(['!powershell wget -O ', fnmmat, path, my_pet, '/', fnmmat])
    end
    load(fnmmat)
    id = metaData.links; vars_pull(id);
    % delete(fnmmat) 
  end
       
  % compose (n,2) cell-array with links and descriptions
  links = { ...
  % general links
  ['https://www.catalogueoflife.org/data/taxon/', id_CoL], 'Cat of Life';  
  ['https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=', id_ITIS], 'ITIS';  
  ['https://eol.org/pages/', id_EoL], 'Ency of Life';
  ['https://en.wikipedia.org/wiki/', id_Wiki], 'Wikipedia';
  ['https://animaldiversity.org/accounts/', id_ADW], 'ADW';
  ['http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id=', id_Taxo], 'Taxonomicon';
  ['https://marinespecies.org/aphia.php?p=taxdetails&id=', id_WoRMS], 'WoRMS';
  % taxon-specific links
  ['https://www.molluscabase.org/aphia.php?p=taxdetails&id=', id_molluscabase], 'MolluscaBase';
  ['https://www.ntnu.no/ub/scorpion-files/', id_scorpion], 'Scorpiones'; 
  ['https://wsc.nmbe.ch/species/', id_spider], 'Araneae';
  ['https://www.collembola.org/taxa/', id_collembola], 'Entognatha';
  ['http://lsid.speciesfile.org/urn:lsid:Orthoptera.speciesfile.org:TaxonName:', id_orthoptera], 'Orthoptera';
  ['http://lsid.speciesfile.org/urn:lsid:Phasmida.speciesfile.org:TaxonName:', id_phasmida], 'Phasmatodea';
  ['http://lsid.speciesfile.org/urn:lsid:Aphid.speciesfile.org:TaxonName:', id_aphid], 'Aphididae';
  ['https://diptera.info/search.php?stext=', id_diptera, '&search=Search&method=OR&forum_id=0&stype=photos'], 'Diptera';
  ['http://www.nhm.ac.uk/our-science/data/lepindex/detail/?taxonno=', id_lepidoptera], 'Lepidoptera';
  ['https://www.fishbase.se/summary/', id_fishbase], 'fishbase';
  ['https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=', id_amphweb], 'Amphibiaweb';
  ['https://reptile-database.reptarium.cz/species?', id_ReptileDB], 'ReptileDB';
  ['https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=', id_avibase], 'Avibase';
  ['http://datazone.birdlife.org/species/factsheet/', id_birdlife], 'Birdlife';
  ['https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id=', id_MSW3], 'Mammal Spec World';
  ['https://genomics.senescence.info/species/entry.php?species=', id_AnAge], 'AnAge'};
  % remove empty links
  links = links(~cellfun(@isempty, { ...
    id_CoL, id_ITIS, id_EoL, id_Wiki, id_ADW, id_Taxo, id_WoRMS, ...                                                     % general/animal web sites
    id_molluscabase, id_scorpion, id_spider, id_collembola, id_orthoptera, id_phasmida, id_aphid, id_diptera, id_lepidoptera, ... 
    id_fishbase, id_amphweb, id_ReptileDB, id_avibase, id_birdlife, id_MSW3, id_AnAge}),:);                              % taxon web sites
  n_links = size(links,1); 
    
  if n_links == 0
    fprintf(['warning from get_links for ', taxon, ': no links specified\n']);
  elseif exist('open', 'var') && open == true % open web sites
    for i= 1:n_links 
      web(links{i,1},'-browser');
    end
  end
    
