%% get_id
% gets id's of all AmP-supported websites

%%
function [id, id_txt, my_pet_acc] = get_id(my_pet, open, tab)
% created 2021/08/3 by Bas Kooijman

%% Syntax
% [id, id_txt, my_pet_acc] = <../get_id.m *get_id*>(my_pet, open, tab)

%% Description
% Gets identifiers for all websites that AmP uses for this taxon. 
% Some websites apply to all animals, others only for particular taxa.
% The lineage is taken from CoL.
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening sites in browser (default: 0)
% * tab: optional boolean for opening table in browser (default: 0)
%
% Output:
%
% * id: vector of cells with id's
% * id_txt: vector of cells with labels for id's
% * my_pet_acc: name of accepted species (_ separated)

%% Remarks
% Outputs empty id strings if identification was not successful.

%% Example of use
% get_id('Passer_domesticus', 1, 1)

  if ~exist('open','var')
    open = 0;
  end 
  if ~exist('tab','var')
    tab = 0;
  end

  links = {...
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
     
  address = { ...
  % general addresses
    'https://www.catalogueoflife.org/data/taxon/'  
    'https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value='
    'https://eol.org/pages/'
    'https://en.wikipedia.org/wiki/'
    'https://animaldiversity.org/accounts/'
    'http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id='
    'https://marinespecies.org/aphia.php?p=taxdetails&id='
  % taxon-specific addresses
    'https://www.molluscabase.org/aphia.php?p=taxdetails&id='
    'https://www.ntnu.no/ub/scorpion-files/'
    'https://wsc.nmbe.ch/species/'
    'https://www.collembola.org/taxa/'
    'http://orthoptera.speciesfile.org/HomePage/Orthoptera/HomePage.aspx'
    'http://phasmida.speciesfile.org/HomePage/Phasmida/HomePage.aspx'
    'http://lsid.speciesfile.org/urn:lsid:Aphid.speciesfile.org:TaxonName:'
    'https://diptera.info/search.php?stext=id_diptera&search=Search&method=OR&forum_id=0&stype=photos'
    'http://www.nhm.ac.uk/our-science/data/lepindex/detail/?taxonno='
    'https://www.fishbase.se/summary/'
    'https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name='
    'https://reptile-database.reptarium.cz/species?'
    'https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid='
    'http://datazone.birdlife.org/species/factsheet/'
    'https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id='
    'https://genomics.senescence.info/species/entry.php?species='};
    
  my_pet = strrep(my_pet, ' ', '_'); 
  [lin, rank, id_CoL, name_status, my_pet_acc] = lineage_CoL(my_pet); 
  if isempty(id_CoL)
    id = ''; id_txt = ''; return
  else
    if ~strcmp(name_status,'accepted name')
      if contains(my_pet_acc,'(')
        my_pet_acc = my_pet; % don't replace name if subgenus is part of the accepted name
      elseif ~strcmp(my_pet, my_pet_acc)
        fprintf(['Warning from get_id: status of ', my_pet, ' is ', name_status, '; continue with accepted name ', my_pet_acc, '\n'])
      end
    end
  end
     
  select_id(1:7) = true; id = cell(23,1); id_txt = cell(23,1);
  id{1} = id_CoL; id_txt{1} = 'id_CoL';
  id{2} = get_id_ITIS(my_pet_acc); id_txt{2} = 'id_ITIS';
  if isempty(id{2}) && ~strcmp(my_pet,my_pet_acc); id{2} = get_id_ITIS(my_pet); end
  id{3} = get_id_EoL(my_pet_acc); id_txt{3} = 'id_EoL';
  if isempty(id{3}) && ~strcmp(my_pet,my_pet_acc); id{3} = get_id_EoL(my_pet); end
  id{4} = get_id_Wiki(my_pet_acc); id_txt{4} = 'id_Wiki';
  if isempty(id{4}) && ~strcmp(my_pet,my_pet_acc); id{4} = get_id_Wiki(my_pet); end
  id{5} = get_id_ADW(my_pet_acc); id_txt{5} = 'id_ADW';
  if isempty(id{5}) && ~strcmp(my_pet,my_pet_acc); id{5} = get_id_ADW(my_pet); end
  id{6} = get_id_Taxo(my_pet_acc); id_txt{6} = 'id_Taxo';
  if isempty(id{6}) && ~strcmp(my_pet,my_pet_acc); id{6} = get_id_Taxo(my_pet); end
  id{7} = get_id_WoRMS(my_pet_acc); id_txt{7} = 'id_WoRMS';
  if isempty(id{7}) && ~strcmp(my_pet,my_pet_acc); id{7} = get_id_WoRMS(my_pet); end
 
  select_id(8:23) = false;
  if ismember(lin(ismember(rank,'Phylum')), 'Mollusca')
    select_id(8) = true;
    id{7} = get_id_molluscabase(my_pet_acc); id_txt{8} = 'id_molluscabase';
    if isempty(id{8}) && ~strcmp(my_pet,my_pet_acc); id{8} = get_id_molluscabase(my_pet); end
  end
  if ismember(lin(ismember(rank,'Order')), 'Scorpiones')
    select_id(9) = true;
    id{9} = get_id_scorpion(my_pet_acc); id_txt{9} = 'id_scorpion';
    if isempty(id{9}) && ~strcmp(my_pet,my_pet_acc); id{9} = get_id_scorpion(my_pet); end
  end
  if ismember(lin(ismember(rank,'Order')), 'Araneae')
    select_id(10) = true;
    id{10} = get_id_spider(my_pet_acc); id_txt{10} = 'id_spider';
    if isempty(id{10}) && ~strcmp(my_pet,my_pet_acc); id{10} = get_id_spider(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), 'Entognatha')
    select_id(11) = true;
    id{11} = get_id_collembola(my_pet_acc); id_txt{11} = 'id_collembola';
    if isempty(id{11}) && ~strcmp(my_pet,my_pet_acc); id{11} = get_id_collembola(my_pet); end
  end
  if ismember(lin(ismember(rank,'Order')), 'Orthoptera')
    select_id(12) = true;
    id{12} = get_id_orthoptera(my_pet_acc); id_txt{12} = 'id_orthoptera';
    if isempty(id{12}) && ~strcmp(my_pet,my_pet_acc); id{12} = get_id_orthoptera(my_pet); end
  end
  if ismember(lin(ismember(rank,'Order')), 'Phasmatodea')
    select_id(13) = true;
    id{13} = get_id_phasmida(my_pet_acc); id_txt{13} = 'id_phasmida';
    if isempty(id{13}) && ~strcmp(my_pet,my_pet_acc); id{13} = get_id_phasmida(my_pet); end
  end
  if ismember(lin(ismember(rank,'Family')), 'Aphididae')
    select_id(14) = true;
    id{14} = get_id_aphid(my_pet_acc); id_txt{14} = 'id_aphid';
    if isempty(id{14}) && ~strcmp(my_pet,my_pet_acc); id{14} = get_id_aphid(my_pet); end
  end
  if ismember(lin(ismember(rank,'Order')), 'Diptera')
    select_id(15) = true;
    id{15} = get_id_diptera(my_pet_acc); id_txt{15} = 'id_diptera';
    if isempty(id{15}) && ~strcmp(my_pet,my_pet_acc); id{15} = get_id_diptera(my_pet); end
    address{15} = strrep(address{15}, 'id_diptera', id{15});
  end
  if ismember(lin(ismember(rank,'Order')), 'Lepidoptera')
    select_id(16) = true;
    id{8} = get_id_diptera(my_pet_acc); id_txt{16} = 'id_lepidoptera';
    if isempty(id{16}) && ~strcmp(my_pet,my_pet_acc); id{16} = get_id_lepidoptera(my_pet); end
    address{16} = strrep(address{16}, 'id_diptera', id{16});
  end
  if ismember(lin(ismember(rank,{'Class','Gigaclass'})), {'Cephalaspidomorphi', 'Myxini', 'Cyclostomata', 'Chondrichthyes', 'Actinopterygii', 'Actinistia', 'Dipnoi'})
    select_id(17) = true;
    id{17} = get_id_fishbase(my_pet_acc); id_txt{17} = 'id_fishbase';
    if isempty(id{17}) && ~strcmp(my_pet,my_pet_acc); id{17} = get_id_fishbase(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), 'Amphibia') 
    select_id(18) = true;
    id{18} = get_id_amphweb(my_pet_acc); id_txt{18} = 'id_amphweb';
    if isempty(id{18}) && ~strcmp(my_pet,my_pet_acc); id{18} = get_id_amphweb(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), {'Reptilia','Squamata','Testudines','Crocodilia'}) 
    select_id(19) = true;
    id{19} = get_id_ReptileDB(my_pet_acc); id_txt{19} = 'id_ReptileDB';
    if isempty(id{19}) && ~strcmp(my_pet,my_pet_acc); id{19} = get_id_ReptileDB(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), 'Aves') 
    select_id(20:21) = true;
    id{20} = get_id_avibase(my_pet_acc); id_txt{20} = 'id_avibase';
    id{21} = get_id_birdlife(my_pet_acc); id_txt{21} = 'id_birdlife';
    if isempty(id{20}) && ~strcmp(my_pet,my_pet_acc); id{20} = get_id_avibase(my_pet); end
    if isempty(id{21}) && ~strcmp(my_pet,my_pet_acc); id{21} = get_id_birdlife(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), 'Mammalia') 
    select_id(22) = true;
    id{22} = get_id_MSW3(my_pet_acc); id_txt{22} = 'id_msw3';
    if isempty(id{22}) && ~strcmp(my_pet,my_pet_acc); id{22} = get_id_MSW3(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), {'Amphibia','Reptilia','Squamata','Testudines','Crocodilia','Aves','Mammalia'}) 
    select_id(23) = true;
    id{23} = get_id_AnAge(my_pet_acc); id_txt{23} = 'id_AnAge';
    if isempty(id{23})  && ~strcmp(my_pet,my_pet_acc); id{23} = get_id_AnAge(my_pet); end
  end
  id = id(select_id); id_txt = id_txt(select_id); 
  ind = 1:23; ind = ind(select_id); n = length(id);
        
  if open
    for i = 1:n
      if isempty(id{i})
        web(links{ind(i)},'-browser');
      else
        if strfind(address{ind(i)}, 'diptera')
          web(strrep(address{15}, 'id_diptera', id{i}),'-browser');
        else
          web([address{ind(i)}, id{i}],'-browser');
        end
      end
    end
  end
  if tab
    prt_tab({id_txt, id}, {'id','code'},'id')
  end

