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
    'https://eol.org/'; ...
    'https://en.wikipedia.org/wiki/'; ...
    'https://animaldiversity.org/'; ...
    'http://taxonomicon.taxonomy.nl/'; ...
    'https://marinespecies.org/'; ...
    % taxon-specific links
    'https://www.molluscabase.org/'; ...
    'https://www.fishbase.org/'; ...
    'https://amphibiaweb.org/search/'; ...
    'https://reptile-database.reptarium.cz/'; ...
    'https://avibase.bsc-eoc.org/'; ...
    'http://datazone.birdlife.org/'; ...
    'https://www.departments.bucknell.edu/biology/resources/msw3/'; ...
    'https://genomics.senescence.info/'};
     
  address = { ...
    % general adresses
    'https://www.catalogueoflife.org/data/taxon/'; ...
    'https://eol.org/pages/'; ...
    'https://en.wikipedia.org/wiki/'; ...
    'https://animaldiversity.org/accounts/'; ...
    'http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id='; ...
    'https://marinespecies.org/aphia.php?p=taxdetails&id='; ...
    % taxon-specific adresses
    'https://www.molluscabase.org/aphia.php?p=taxdetails&id='; ...
    'https://www.fishbase.se/summary/'; ...
    'https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name='; ...
    'https://reptile-database.reptarium.cz/species?'; ...
    'https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid='; ...
    'http://datazone.birdlife.org/species/factsheet/'; ...
    'https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id='; ...
    'https://genomics.senescence.info/species/entry.php?species='};
    
  my_pet = strrep(my_pet, ' ', '_'); 
  [lin, rank, id_CoL, name_status] = lineage_CoL(my_pet); 
  if isempty(id_CoL)
    fprintf(['Warning from get_id: name not found in CoL\n'])
    id = []; id_txt = []; my_pet_acc = []; 
  else
    my_pet_acc = my_pet;
  end
  if ~strcmp(name_status,'accepted name')
    [id_CoL, my_pet_acc] = get_id_CoL(my_pet); my_pet_acc = strrep(my_pet_acc, ' ', '_');
    fprintf(['Warning from get_id: status of ', my_pet, ' is ', name_status, '; continue with accepted name ', my_pet_acc, '\n'])
  end
     
  select_id(1:6) = true; id = cell(14,1); id_txt = cell(14,1);
  id{1} = id_CoL; id_txt{1} = 'id_CoL';
  id{2} = get_id_EoL(my_pet_acc); id_txt{2} = 'id_EoL';
  if isempty(id{2}); id{2} = get_id_EoL(my_pet); end
  id{3} = get_id_Wiki(my_pet_acc); id_txt{3} = 'id_Wiki';
  if isempty(id{3}); id{3} = get_id_Wiki(my_pet); end
  id{4} = get_id_ADW(my_pet_acc); id_txt{4} = 'id_ADW';
  if isempty(id{4}); id{4} = get_id_ADW(my_pet); end
  id{5} = get_id_Taxo(my_pet_acc); id_txt{5} = 'id_Taxo';
  if isempty(id{5}); id{5} = get_id_Taxo(my_pet); end
  id{6} = get_id_WoRMS(my_pet_acc); id_txt{6} = 'id_WoRMS';
  if isempty(id{6}); id{6} = get_id_WoRMS(my_pet); end
 
  select_id(7:14) = false;
  if ismember(lin(ismember(rank,'Phylum')), 'Mollusca')
    select_id(7) = true;
    id{7} = get_id_molluscabase(my_pet_acc); id_txt{7} = 'id_molluscabase';
    if isempty(id{7}); id{7} = get_id_molluscabase(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), {'Cyclostomata', 'Chondrichthyes', 'Actinopterygii', 'Actinistia', 'Dipnoi'})
    select_id(8) = true;
    id{8} = get_id_fishbase(my_pet_acc); id_txt{8} = 'id_fishbase';
    if isempty(id{8}); id{8} = get_id_fishbase(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), 'Amphibia') 
    select_id(9) = true;
    id{9} = get_id_amphweb(my_pet_acc); id_txt{9} = 'id_amphweb';
    if isempty(id{9}); id{9} = get_id_amphweb(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), {'Reptilia','Squamata','Testudines','Crocodilia'}) 
    select_id(10) = true;
    id{10} = get_id_ReptileDB(my_pet_acc); id_txt{10} = 'id_ReptileDB';
    if isempty(id{10}); id{10} = get_id_ReptileDB(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), 'Aves') 
    select_id(11:12) = true;
    id{11} = get_id_avibase(my_pet_acc); id_txt{11} = 'id_avibase';
    id{12} = get_id_birdlife(my_pet_acc); id_txt{12} = 'id_birdlife';
    if isempty(id{11}); id{11} = get_id_avibase(my_pet); end
    if isempty(id{12}); id{12} = get_id_birdlife(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), 'Mammalia') 
    select_id(13) = true;
    id{13} = get_id_msw3(my_pet_acc); id_txt{13} = 'id_msw3';
    if isempty(id{13}); id{13} = get_id_msw3(my_pet); end
  end
  if ismember(lin(ismember(rank,'Class')), {'Aves', 'Mammalia'}) 
    select_id(14) = true;
    id{14} = get_id_AnAge(my_pet_acc); id_txt{14} = 'id_AnAge';
    if isempty(id{14}); id{14} = get_id_AnAge(my_pet); end
  end
  id = id(select_id); id_txt = id_txt(select_id); 
  ind = 1:14; ind = ind(select_id); n = length(id);
        
  if open
    for i = 1:n
      if isempty(id{i})
        web(links{ind(i)},'-browser');
      else
        web([address{ind(i)}, id{i}],'-browser');
      end
    end
  end
  if tab
    prt_tab({id_txt, id}, {'id','code'},'id')
  end

