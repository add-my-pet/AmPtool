%% prt_id
% prints an html-page with all identifiers for specified AmP entries 

%%
function fileName = prt_id(pets, save)
% created 2021/08/14 by Bas Kooijman, modified 2022/05/17, 2022/06/04

%% Syntax
% fileName = <prt_id *prt_id*>(pets, save)

%% Description
% prints an html-page with all identifiers for specified AmP entries as present in results_my_pet.mat files
% Clicking on header labels removes that column; clicking on the first one ("entry") undoes the deletion.
%
% Input:
%
% * pets: cell array with names of existing entries
% * save: optional boolean for saving the table in deblab/add_my_pet/links.html (default 0: do not save)
%
% Output:
%
% * fileName: string with name of output file

%% Remarks
% This function uses results_my_pet.mat files in local directories of add_my_pet/entries;
% AmP supports 23 websites: 7 general, 16 taxon-specific. 
% Repair id of an entry with <repair_id.html *repair_id*>, get existing id's with <get_links.html *get_links*> and new id's with <get_id.html *get_id*>.
% Check links existing vs new with <check_links.html *check_links*>
% If the number of style rules in de header is changed, function undoHide should be edited. 

%% Example
% prt_id(select('Crustacea'))

  
  if ~exist('save','var')
    save = false;
  end
  
  if save
    WD = cdCur; cd ../../deblab/add_my_pet/
  end

  n = length(pets); 
  linkPets = pets; 
  for i=1:n
    linkPets{i} = ['<button onclick="lnk(1,''', pets{i},  ''')">', pets{i}, '</button>']; 
  end

  % initiate
  CoL = cell(n,1); col.CoL = '2';
  ITIS = cell(n,1); col.ITIS = '3';
  EoL = cell(n,1); col.EoL = '4';
  Wiki = cell(n,1); col.Wiki = '5';
  ADW = cell(n,1); col.ADW = '6';
  Taxo = cell(n,1); col.Taxo = '7';
  WoRMS = cell(n,1); col.WoRMS = '8';
  
  molluscabase = cell(n,1); col.molluscabase = '9';
  scorpion = cell(n,1); col.scorpion = '10';
  spider = cell(n,1); col.spider = '11';
  collembola = cell(n,1); col.collembola = '12';
  orthoptera = cell(n,1); col.orthoptera = '13';
  phasmida = cell(n,1); col.phasmida = '14';
  aphid = cell(n,1); col.aphid = '15';
  diptera = cell(n,1); col.diptera = '16';
  lepidoptera = cell(n,1); col.lepidoptera = '17';
  fishbase = cell(n,1); col.fishbase = '18';
  amphweb = cell(n,1); col.amphweb = '19';
  ReptileDB = cell(n,1); col.ReptileDB = '20';
  avibase = cell(n,1); col.avibase = '21';
  birdlife = cell(n,1); col.birdlife = '22';
  MSW3 = cell(n,1); col.MSW3 = '23';
  AnAge = cell(n,1); col.AnAge = '24';

  WD = cdEntr(pets{1});
  for i = 1:n
    cdEntr(pets{i});
    load(['results_', pets{i},'.mat'], 'metaData');
    id = metaData.links; vars_pull(id);
    flds = fields(id); n_flds = length(flds);
    for j = 1:n_flds
       nm = strsplit(flds{j}, '_'); nm = nm{2};
       eval(['id = id_', nm, ';']); idNm = ['''''', id, ''''''];
       pars = [col.(nm), ',',  idNm,];
       if ~isempty(id)
         eval([nm,'{i} = ''<button onclick="lnk(', pars, ')">', id, '</button>'';']);
       end
    end
  end
  cd(WD);
       
  version = datestr(datenum(date),'yyyymmdd');
  header = {['AmP ', version], 'CoL', 'ITIS', 'EoL', 'Wiki', 'ADW', 'Taxo', 'WoRMS', ...
       'molluscabase', 'scorpion', 'spider', 'collembola', 'orthoptera', 'phasmida', 'aphid', 'diptera', 'lepidoptera', ...
       'fishbase' 'amphweb' 'ReptileDB', 'avibase', 'birdlife', 'MSW3', 'AnAge'};
  val = [linkPets, CoL, ITIS, EoL, Wiki, ADW, Taxo, WoRMS, ...
       molluscabase, scorpion, spider, collembola, orthoptera, phasmida, aphid, diptera, lepidoptera, ...
       fishbase, amphweb, ReptileDB, avibase, birdlife, MSW3, AnAge];
   
  n_rows = length(pets); n_cols = length(header);
   
  fileName = 'links.html';
  oid = fopen(fileName, 'w+'); % open file for writing, delete existing content

  % file head
  fprintf(oid, '<!DOCTYPE html>\n');
  fprintf(oid, '<html>\n');
  fprintf(oid, '<head>\n');
  fprintf(oid, '  <title>%s</title>\n',  'Links');
  fprintf(oid, '  <style id="myStyleSheet">\n');
  fprintf(oid, '    div.tab {\n');
  fprintf(oid, '      width: 90%%;\n');
  fprintf(oid, '      margin: auto;\n'); 
  fprintf(oid, '      padding-top: 30px;\n'); 
  fprintf(oid, '    }\n\n');
    
  fprintf(oid, '    .head {\n');
  fprintf(oid, '      background-color: #FFE7C6;\n');                   % pink header background
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    #tabId {\n');
  fprintf(oid, '      border-style: solid hidden solid hidden;\n');     % border top & bottom only
  fprintf(oid, '      font-family: Arial, Helvetica, sans-serif;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    tr:nth-child(even){background-color: #f2f2f2}\n\n');% grey on even rows
  
  fprintf(oid, '    button {\n');
  fprintf(oid, '      background-color: #FFFFFF;\n');
  fprintf(oid, '      color: blue;\n');
  fprintf(oid, '      font-family: Arial, Helvetica, sans-serif;\n');
  fprintf(oid, '      font-size: 0.9em;\n');
  fprintf(oid, '      border-style: none;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '  </style>\n');
  fprintf(oid, '</head>\n\n');
  fprintf(oid, '<body>\n\n');
  
  fprintf(oid, '  <div class="tab">\n');
  fprintf(oid, '  <table id="tabId">\n');

  % header
  if ~isempty(header)
    fprintf(oid, '    <tr class="head">\n');
    fprintf(oid, '       <th><button class="head" onclick="undoHide()">%s</button></th>\n', header{1});
    for j = 2:n_cols
      fprintf(oid, '       <th><button class="head" onclick="hideCol(%d)">%s</button></th>\n', j, header{j});
    end
    fprintf(oid, '    </tr>\n\n');
  end

  % body
  for i = 1:n_rows
    fprintf(oid, '    <tr>\n      ');
    for j = 1:n_cols
      fprintf(oid, '<td>%s</td> ', val{i,j});
    end
    fprintf(oid, '  \n    </tr>\n\n');
  end
 
  % file tail
  fprintf(oid, '  </table>\n'); % close table
  fprintf(oid, '  </div>\n\n');
  
  fprintf(oid, '  <script>\n');
  fprintf(oid, '    function undoHide() {\n');
  fprintf(oid, '      var styleSheet = document.getElementById("myStyleSheet").sheet;\n\n'); 
  fprintf(oid, '      if (styleSheet.cssRules.length > 5){\n'); % there are presently 5 style rules (see above)
  fprintf(oid, '        styleSheet.deleteRule(0);\n');
  fprintf(oid, '      }\n');
  fprintf(oid, '    }\n\n');
      
  fprintf(oid, '    function hideCol(col) {\n');
  fprintf(oid, '      var table = document.getElementById("tabId");\n');
  fprintf(oid, '      var styleSheet = document.getElementById("myStyleSheet").sheet;\n\n'); 
  fprintf(oid, '      var rule = "table td:nth-child("+ col +"), table th:nth-child("+ col +") {display: none;}";\n');
  fprintf(oid, '      styleSheet.insertRule(rule);\n');
  fprintf(oid, '    }\n\n');
  
  fprintf(oid, '    function lnk(col,id) {\n');
  fprintf(oid, '      switch (col) {\n');
  fprintf(oid, '        case 1:\n');
  fprintf(oid, '	      window.location = "https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/" + id + "/" + id + "_res.html";\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 2:\n');
  fprintf(oid, '          window.location = "https://www.catalogueoflife.org/data/taxon/" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 3:\n');
  fprintf(oid, '          window.location = "https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 4:\n');
  fprintf(oid, '          window.location = "https://eol.org/pages/" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 5:\n');
  fprintf(oid, '          window.location = "https://en.wikipedia.org/wiki/" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 6:\n');
  fprintf(oid, '          window.location = "https://animaldiversity.org/accounts/" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 7:\n');
  fprintf(oid, '          window.location = "http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id=" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 8:\n');
  fprintf(oid, '          window.location = "https://marinespecies.org/aphia.php?p=taxdetails&id=" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 9:\n');
  fprintf(oid, '          window.location = "https://www.molluscabase.org/aphia.php?p=taxdetails&id=" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 10:\n');
  fprintf(oid, '          window.location = "https://www.ntnu.no/ub/scorpion-files/" + id;\n'); 
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 11:\n');
  fprintf(oid, '          window.location = "https://wsc.nmbe.ch/species/" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 12:\n');
  fprintf(oid, '          window.location = "https://www.collembola.org/taxa/" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 13:\n');
  fprintf(oid, '          window.location = "http://lsid.speciesfile.org/urn:lsid:Orthoptera.speciesfile.org:TaxonName:" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 14:\n');
  fprintf(oid, '          window.location = "http://lsid.speciesfile.org/urn:lsid:Phasmida.speciesfile.org:TaxonName:" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 15:\n');
  fprintf(oid, '          window.location = "http://lsid.speciesfile.org/urn:lsid:Aphid.speciesfile.org:TaxonName:" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 16:\n');
  fprintf(oid, '          window.location = "https://diptera.info/search.php?stext=" + id + "&search=Search&method=OR&forum_id=0&stype=photos";\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 17:\n');
  fprintf(oid, '          window.location = "http://www.nhm.ac.uk/our-science/data/lepindex/detail/?taxonno=" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 18:\n');
  fprintf(oid, '          window.location = "https://www.fishbase.se/summary/" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 19:\n');
  fprintf(oid, '          window.location = "https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 20:\n');
  fprintf(oid, '          window.location = "https://reptile-database.reptarium.cz/species?" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 21:\n');
  fprintf(oid, '          window.location = "https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 22:\n');
  fprintf(oid, '          window.location = "http://datazone.birdlife.org/species/factsheet/" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 23:\n');
  fprintf(oid, '          window.location = "https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id=" + id;\n');
  fprintf(oid, '	      break;\n');
  fprintf(oid, '        case 24:\n');
  fprintf(oid, '         window.location = "https://genomics.senescence.info/species/entry.php?species=" + id;\n');
  fprintf(oid, '         default:\n');
  fprintf(oid, '      }\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '  </script>\n\n');
  
  fprintf(oid, '</body>\n');
  fprintf(oid, '</html>\n');

  fclose(oid);

  web(fileName,'-browser') % open html in systems browser
  pause(2)
  if ~save
    delete(fileName)
  end  
   
  cd(WD);

end
