%% get_links
% gets links to web-pages from  results_my_pet.mat, as specified in metaData.links

%%
function [links, id] = get_links(my_pet, open)
% created 2019/12/25 by Bas Kooijman

%% Syntax
% [links, id] = <get_link *get_link*>(taxon, open)

%% Description
% Gets cell strings with links and descriptions for an entry and open the webpages.
%
% Input:
%
% * my_pet: character string with name of entry
% * open: optional boolean for opening the web pages (default 0: not open)
%
% Output:
%
% * links: (n,2)-cell array with links and names for links
% * id: (n,2)-cell array with id's and values, as in metaData.links of mydata

%% Remarks
% This function first tries to find results_my_pet.mat in local directory entries (typically only for curators); 
% in failure, it downloads it from the web via powershell function wget

%% Example
% edit_links('Daphnia_magna',{'id_EoL', '46498265'})

  % set all id's on empty
  id_CoL=[]; id_EoL=[]; id_Wiki=[]; id_ADW=[]; id_Taxo=[]; id_WoRMS=[];                                                 
  id_molluscabase=[]; id_fishbase=[]; id_amphweb=[]; id_ReptileDB=[]; id_avibase=[]; id_birdlife=[]; id_MSW3=[]; id_AnAge=[];
  
  
  % overwrite id's with those in mydata_my_pet
  fnmmat = ['results_', my_pet,'.mat'];  
  try % locally present in dir entries (mostly for curators)
    load(which(fnmmat))
    id = metaData.links; vars_pull(id);
  catch % get results_my_pet.mat from web
    path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries/';
    eval(['!powershell wget ', path, my_pet, '/', fnmmat, ' -O ', fnmmat])
    load(fnmmat)
    id = metaData.links; vars_pull(id);
    delete(fnmmat) 
  end
       
  % compose (n,2) cell-array with links and descriptions
  links = { ...
  % general links
  ['http://www.catalogueoflife.org/col/details/species/id/', id_CoL], 'Cat of Life';  
  ['http://eol.org/pages/', id_EoL], 'Ency of Life';
  ['http://en.wikipedia.org/wiki/', id_Wiki], 'Wikipedia';
  ['http://animaldiversity.org/accounts/', id_ADW], 'ADW';
  ['http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id=', id_Taxo], 'Taxonomicon';
  ['http://marinespecies.org/aphia.php?p=taxdetails&id=', id_WoRMS], 'WoRMS';
  % taxon-specific links
  ['http://www.molluscabase.org/aphia.php?p=taxdetails&id=', id_molluscabase], 'MolluscaBase';
  ['http://www.fishbase.org/summary/', id_fishbase], 'fishbase';
  ['http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=', id_amphweb], 'Amphibiaweb';
  ['http://reptile-database.reptarium.cz/species?', id_ReptileDB], 'ReptileDB';
  ['https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=', id_avibase], 'Avibase';
  ['http://datazone.birdlife.org/species/factsheet/', id_birdlife], 'Birdlife';
  ['https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id=', id_MSW3], 'Mammal Spec World';
  ['http://genomics.senescence.info/species/entry.php?species=', id_AnAge], 'AnAge'};
  % remove empty links
  links = links(~cellfun(@isempty, { ...
    id_CoL, id_EoL, id_Wiki, id_ADW, id_Taxo, id_WoRMS, ...                                                  % general/animal web sites
    id_molluscabase, id_fishbase, id_amphweb, id_ReptileDB, id_avibase, id_birdlife, id_MSW3, id_AnAge}),:); % taxon web sites
  n_links = size(links,1); 
    
  if n_links == 0
    fprintf(['warning from get_links for ', taxon, ': no links specified\n']);
  elseif exist('open', 'var') && open == true % open web sites
    for i= 1:n_links 
      web(links{i,1},'-browser');
    end
  end
    
