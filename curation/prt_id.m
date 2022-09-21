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
% * This function uses results_my_pet.mat files in local directories of add_my_pet/entries;
% * AmP supports 23 websites: 7 general, 16 taxon-specific. 
% * Repair id of an entry with <repair_id.html *repair_id*>, get existing id's with <get_links.html *get_links*> and new id's with <get_id.html *get_id*>.
% * Check links existing vs new with <check_links.html *check_links*>
% * If the number of style rules in de header is changed, function undoHide should be edited. 

%% Example
% prt_id(select('Crustacea'))

  
  if ~exist('save','var')
    save = false;
  end
  
  if save
    WD0 = cdCur; cd ../../deblab/add_my_pet/
  end

  n = length(pets); 
  linkPets = pets; 
  for i=1:n
    linkPets{i} = ['<a onclick="lnk(1,''', pets{i},  ''')">', pets{i}, '</a>']; 
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
        %eval([nm,'{i} = ''<button onclick="lnk(', pars, ')">', id, '</button>'';']);
        eval([nm,'{i} = ''<a onclick="lnk(', pars, ')">', id, '</a>'';']);
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
   
  n_rows = n; n_cols = length(header);
   
  fileName = 'links.html';
  oid = fopen(fileName, 'w+'); % open file for writing, delete existing content

  % file head
  fprintf(oid, '<!DOCTYPE html>\n');
  fprintf(oid, '<html>\n');
  fprintf(oid, '<head>\n');
  fprintf(oid, '  <title>%s</title>\n',  'Links');
  fprintf(oid, '  <link rel="stylesheet" type="text/css" href="sys/style.css">\n');
  fprintf(oid, '  <script src="sys/jscripts.js"></script>\n');
  fprintf(oid, '  <style id="myStyleSheet">\n');
  
  fprintf(oid, '    body {\n');
  fprintf(oid, '      background-color: #ffffff;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    div.tab {\n');
  fprintf(oid, '      margin: auto;\n'); 
  fprintf(oid, '      padding-top: 90px;\n'); % make room for toolbar
  fprintf(oid, '    }\n\n');
    
  fprintf(oid, '    .head {\n');
  fprintf(oid, '      background-color: #ffe7c6;\n'); % pink header background, also part of style.css
  fprintf(oid, '      color: blue;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    #tabId {\n');
  fprintf(oid, '      border-style: solid hidden solid hidden;\n'); % border top & bottom only
  fprintf(oid, '      font-family: Arial, Helvetica, sans-serif;\n');
  fprintf(oid, '      color: blue;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    .Search {\n');
  fprintf(oid, '      background-image: url(''img/searchicon.png''); /* Add a search icon to input */\n');
  fprintf(oid, '      background-position: 2px -10px; /* Position the search icon */\n');
  fprintf(oid, '      background-repeat: no-repeat; /* Do not repeat the icon image */\n');
  fprintf(oid, '      width: 70%%; /* Width of search field */\n');
  fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
  fprintf(oid, '      padding: 5px 10px 7px 40px; /* Add some padding */\n');
  fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
  fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    tr:nth-child(even){background-color: #f2f2f2}\n\n'); % grey on even rows, also part of style.css
  
  fprintf(oid, '  </style>\n');
  fprintf(oid, '</head>\n\n');
  fprintf(oid, '<body>\n\n');
 
  load('n_entries', 'n_entries')
  if n == n_entries 
    fprintf(oid, '<div w3-include-html="sys/toolbar_links.html"></div>\n\n');
    
    fprintf(oid, '    <div id="contentFull">\n\n');
  end

  fprintf(oid, '  <div class="tab">\n');
  fprintf(oid, '  <table id="tabId">\n');

  % header
  if ~isempty(header)
    fprintf(oid, '    <tr class="head">\n');
    fprintf(oid, '       <th><a class="head" onclick="undoHide()">%s</a></th>\n', header{1});
    for j = 2:n_cols
      fprintf(oid, '       <th><a class="head" onclick="hideCol(%d)">%s</a></th>\n', j, header{j});
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
  fprintf(oid, '      if (styleSheet.cssRules.length > 6){\n'); % there are presently 6 style rules (see above)
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
  fprintf(oid, '        case 1: window.open("entries_web/" + id + "/" + id + "_res.html"); break;\n');
  fprintf(oid, '        case 2: window.open("https://www.catalogueoflife.org/data/taxon/" + id); break;');
  fprintf(oid, '        case 3: window.open("https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=" + id); break;\n');
  fprintf(oid, '        case 4: window.open("https://eol.org/pages/" + id); break;\n');
  fprintf(oid, '        case 5: window.open("https://en.wikipedia.org/wiki/" + id); break;\n');
  fprintf(oid, '        case 6: window.open("https://animaldiversity.org/accounts/" + id); break;\n');
  fprintf(oid, '        case 7: window.open("http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id=" + id); break;\n');
  fprintf(oid, '        case 8: window.open("https://marinespecies.org/aphia.php?p=taxdetails&id=" + id); break;\n');
  fprintf(oid, '        case 9: window.open("https://www.molluscabase.org/aphia.php?p=taxdetails&id=" + id); break;\n');
  fprintf(oid, '        case 10: window.open("https://www.ntnu.no/ub/scorpion-files/" + id); break;\n'); 
  fprintf(oid, '        case 11: window.open("https://wsc.nmbe.ch/species/" + id); break;\n');
  fprintf(oid, '        case 12: window.open("https://www.collembola.org/taxa/" + id); break;\n');
  fprintf(oid, '        case 13: window.open("http://lsid.speciesfile.org/urn:lsid:Orthoptera.speciesfile.org:TaxonName:" + id); break;\n');
  fprintf(oid, '        case 14: window.open("http://lsid.speciesfile.org/urn:lsid:Phasmida.speciesfile.org:TaxonName:" + id); break;\n');
  fprintf(oid, '        case 15: window.open("http://lsid.speciesfile.org/urn:lsid:Aphid.speciesfile.org:TaxonName:" + id); break;\n');
  fprintf(oid, '        case 16: window.open("https://diptera.info/search.php?stext=" + id + "&search=Search&method=OR&forum_id=0&stype=photos"); break;\n');
  fprintf(oid, '        case 17: window.open("http://www.nhm.ac.uk/our-science/data/lepindex/detail/?taxonno=" + id); break;\n');
  fprintf(oid, '        case 18: window.open("https://www.fishbase.se/summary/" + id); break;\n');
  fprintf(oid, '        case 19: window.open("https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=" + id); break;\n');
  fprintf(oid, '        case 20: window.open("https://reptile-database.reptarium.cz/species?" + id); break;\n');
  fprintf(oid, '        case 21: window.open("https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=" + id); break;\n');
  fprintf(oid, '        case 22: window.open("http://datazone.birdlife.org/species/factsheet/" + id); break;\n');
  fprintf(oid, '        case 23: window.open("https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id=" + id); break;\n');
  fprintf(oid, '        case 24: window.open("https://genomics.senescence.info/species/entry.php?species=" + id); break;\n');
  fprintf(oid, '        default:\n');
  fprintf(oid, '      }\n');
  fprintf(oid, '    }\n\n');
  
  fprintf(oid, '    function searchList() {\n');
  fprintf(oid, '      var input, filter, table, tr, td, i;\n');
  fprintf(oid, '      input = document.getElementById("Species");\n');
  fprintf(oid, '      filter = input.value.toUpperCase();\n');
  fprintf(oid, '      table = document.getElementById("tabId");\n');
  fprintf(oid, '      tr = table.getElementsByTagName("tr");\n');
  fprintf(oid, '      for (i = 0; i < tr.length; i++) {\n');
  fprintf(oid, '        td = tr[i].getElementsByTagName("td")[0];\n');
  fprintf(oid, '        if (td) {\n');
  fprintf(oid, '          if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
  fprintf(oid, '            tr[i].style.display = "";\n');
  fprintf(oid, '          } else {\n');
  fprintf(oid, '            tr[i].style.display = "none";\n');
  fprintf(oid, '          }\n');
  fprintf(oid, '        }\n');
  fprintf(oid, '      }\n');
  fprintf(oid, '    }\n');

  fprintf(oid, '  </script>\n\n');

  if n == n_entries
    fprintf(oid, '    </div> <!-- end of content -->\n\n');

    fprintf(oid, '    <div w3-include-html="sys/footer_amp.html"></div>\n');
    fprintf(oid, '    <script>w3IncludeHTML();</script>\n\n');
  end
  
  fprintf(oid, '</body>\n');
  fprintf(oid, '</html>\n');

  fclose(oid);

  web(fileName,'-browser') % open html in systems browser
  pause(2)
  if ~save
    delete(fileName)
  end  
   
  cd(WD0);

end
