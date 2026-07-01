%% get_id
% gets id's of all AmP-supported websites

%%
function [id, id_txt, my_pet_acc, lin, rank] = get_id(my_pet, open, tab)
% created 2021/08/3 by Bas Kooijman, modified 2024/09/14, 2026/07/01

%% Syntax
% [id, id_txt, my_pet_acc, lin, rank] = <../get_id.m *get_id*>(my_pet, open, tab)

%% Description
% Gets identifiers for all websites that AmP uses for this taxon.
% Some websites apply to all animals, others only for particular taxa.
% The lineage is taken from Taxonomicon.
% The CoL id is obtained automatically via get_id_CoL (ChecklistBank, latest CoL release).
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
% * lin: short lineage
% * rank: short rank (phylum, class, order, family, genus)

%% Remarks
% Outputs empty id strings if identification was not successful.
% Taxonomicon is used for lineage;
% CoL does not always give standard linnean ranks (e.g. Family is sometimes missing)

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
    'https://www.fishbase.de/summary/'
    'https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name='
    'https://reptile-database.reptarium.cz/species?'
    'https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid='
    'http://datazone.birdlife.org/species/factsheet/'
    'https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id='
    'https://genomics.senescence.info/species/entry.php?species='};

  my_pet = strrep(my_pet, ' ', '_');
  [~, ~, lin, rank] = lineage_Taxo(my_pet); rank = lower(rank);
  
  select_id = false(1, 23);
  id = cell(23, 1); id_txt = cell(23, 1);
  my_pet_acc = my_pet;

  % general ids (always fetched)
  select_id(1:7) = true;
  id{1}  = fetch(my_pet_acc, my_pet, @get_id_CoL);    id_txt{1}  = 'id_CoL';
  id{2}  = fetch(my_pet_acc, my_pet, @get_id_ITIS);   id_txt{2}  = 'id_ITIS';
  id{3}  = fetch(my_pet_acc, my_pet, @get_id_EoL);    id_txt{3}  = 'id_EoL';
  id{4}  = fetch(my_pet_acc, my_pet, @get_id_Wiki);   id_txt{4}  = 'id_Wiki';
  id{5}  = fetch(my_pet_acc, my_pet, @get_id_ADW);    id_txt{5}  = 'id_ADW';
  id{6}  = fetch(my_pet_acc, my_pet, @get_id_Taxo);   id_txt{6}  = 'id_Taxo';
  id{7}  = fetch(my_pet_acc, my_pet, @get_id_WoRMS);  id_txt{7}  = 'id_WoRMS';

  % phylum-level taxon-specific ids
  switch lin{1}
    case 'Mollusca'
      select_id(8) = true;
      id{8} = fetch(my_pet_acc, my_pet, @get_id_molluscabase); id_txt{8} = 'id_molluscabase';
  end

  % class-level taxon-specific ids
  switch lin{2}
    case 'Entognatha'
      select_id(11) = true;
      id{11} = fetch(my_pet_acc, my_pet, @get_id_collembola); id_txt{11} = 'id_collembola';
    case {'Cephalaspidomorphi', 'Myxini', 'Chondrichthyes', 'Actinopterygii', 'Actinistia', 'Dipnoi'}
      select_id(17) = true;
      id{17} = fetch(my_pet_acc, my_pet, @get_id_fishbase); id_txt{17} = 'id_fishbase';
    case 'Amphibia'
      select_id(18) = true;
      id{18} = fetch(my_pet_acc, my_pet, @get_id_amphweb); id_txt{18} = 'id_amphweb';
    case {'Reptilia','Squamata','Testudines','Crocodilia'}
      select_id(19) = true;
      id{19} = fetch(my_pet_acc, my_pet, @get_id_ReptileDB); id_txt{19} = 'id_ReptileDB';
    case 'Aves'
      select_id(20:21) = true;
      id{20} = fetch(my_pet_acc, my_pet, @get_id_avibase);  id_txt{20} = 'id_avibase';
      id{21} = fetch(my_pet_acc, my_pet, @get_id_birdlife); id_txt{21} = 'id_birdlife';
    case 'Mammalia'
      select_id(22) = true;
      id{22} = fetch(my_pet_acc, my_pet, @get_id_MSW3); id_txt{22} = 'id_msw3';
  end

  % order-level taxon-specific ids
  switch lin{3}
    case 'Scorpiones'
      select_id(9) = true;
      id{9} = fetch(my_pet_acc, my_pet, @get_id_scorpion); id_txt{9} = 'id_scorpion';
    case 'Araneae'
      select_id(10) = true;
      id{10} = fetch(my_pet_acc, my_pet, @get_id_spider); id_txt{10} = 'id_spider';
    case 'Orthoptera'
      select_id(12) = true;
      id{12} = fetch(my_pet_acc, my_pet, @get_id_orthoptera); id_txt{12} = 'id_orthoptera';
    case 'Phasmatodea'
      select_id(13) = true;
      id{13} = fetch(my_pet_acc, my_pet, @get_id_phasmida); id_txt{13} = 'id_phasmida';
    case 'Diptera'
      select_id(15) = true;
      id{15} = fetch(my_pet_acc, my_pet, @get_id_diptera); id_txt{15} = 'id_diptera';
    case 'Lepidoptera'
      select_id(16) = true;
      id{16} = fetch(my_pet_acc, my_pet, @get_id_lepidoptera); id_txt{16} = 'id_lepidoptera';
  end

  % family-level taxon-specific ids
  switch lin{4}
    case 'Aphididae'
      select_id(14) = true;
      id{14} = fetch(my_pet_acc, my_pet, @get_id_aphid); id_txt{14} = 'id_aphid';
  end

  % tetrapod AnAge ids (second class-level switch, kept separate to avoid case conflicts)
  switch lin{2}
    case {'Amphibia','Reptilia','Squamata','Testudines','Crocodilia','Aves','Mammalia'}
      select_id(23) = true;
      id{23} = fetch(my_pet_acc, my_pet, @get_id_AnAge); id_txt{23} = 'id_AnAge';
  end

  id = id(select_id); id_txt = id_txt(select_id);
  ind = find(select_id); n = length(id);

  if open
    for i = 1:n
      k = ind(i);
      if isempty(id{i})
        web(links{k}, '-browser');
      elseif k == 15  % Diptera: ID is embedded in the URL query string, not appended
        web(strrep(address{k}, 'id_diptera', id{i}), '-browser');
      else
        web([address{k}, id{i}], '-browser');
      end
    end
  end

  if tab
    prt_tab({id_txt,id}, {my_pet_acc,'id'}, my_pet_acc)
  end

end

%% local helper: try accepted name first, fall back to original if lookup returns empty
function result = fetch(acc, orig, fn)
  result = fn(acc);
  if isempty(result) && ~strcmp(orig, acc)
    result = fn(orig);
  end
end
