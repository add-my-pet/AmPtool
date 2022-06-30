%% prt_ecoCodes
% prints an html-page with all ecoCodes for specified AmP entries 

%%
function fileName = prt_ecoCodes(pets, save)
% created 2022/06/130 by Bas Kooijman

%% Syntax
% fileName = <prt_ecoCodes *prt_ecoCodes*>(pets, save)

%% Description
% prints an html-page with all ecoCodes for specified AmP entries as present in allStat; 
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
% * This function uses <read_eco *read_eco*>.
% * Repair id of an entry with <repair_ecoCode.html *repair_ecoCode*>.

%% Example
% prt_ecoCodes(select('Crustacea'))

  if ~exist('save','var')
    save = false;
  end

  if save
    WD0 = cdCur; cd ../../deblab/add_my_pet/
  end
         
  version = datestr(date_allStat, 'yyyy/mm/dd');
  header = {['AmP ', version], 'climate', 'ecozone', 'habitat', 'embryo', 'migrate', 'food', 'gender','reprod'};
  n_rows = length(pets); n_cols = length(header);
  
  val = [pets, read_eco(pets, {'climate','ecozone','habitat','embryo','migrate','food','gender','reprod'})];

  fileName = 'ecoCodes.html';
  oid = fopen(fileName, 'w+'); % open file for writing, delete existing content

  % file head
  fprintf(oid, '<!DOCTYPE html>\n');
  fprintf(oid, '<html>\n');
  fprintf(oid, '<head>\n');
  fprintf(oid, '  <title>%s</title>\n',  'ecoCodes');
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

  fprintf(oid, '    #tabEco {\n');
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
  if n_rows == n_entries 
    fprintf(oid, '<div w3-include-html="sys/toolbar_links.html"></div>\n\n');
    
    fprintf(oid, '    <div id="contentFull">\n\n');
  end

  fprintf(oid, '  <div class="tab">\n');
  fprintf(oid, '  <table id="tabEco">\n');

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
    fprintf(oid, '<td>%s</td> ', val{i,1});
    for j = 2:n_cols
      fprintf(oid, '<td>%s</td> ', cell2str(val{i,j}));
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
  fprintf(oid, '      var table = document.getElementById("tabEco");\n');
  fprintf(oid, '      var styleSheet = document.getElementById("myStyleSheet").sheet;\n\n'); 
  fprintf(oid, '      var rule = "table td:nth-child("+ col +"), table th:nth-child("+ col +") {display: none;}";\n');
  fprintf(oid, '      styleSheet.insertRule(rule);\n');
  fprintf(oid, '    }\n\n');
    
  fprintf(oid, '    function searchList() {\n');
  fprintf(oid, '      var input, filter, table, tr, td, i;\n');
  fprintf(oid, '      input = document.getElementById("Species");\n');
  fprintf(oid, '      filter = input.value.toUpperCase();\n');
  fprintf(oid, '      table = document.getElementById("tabEco");\n');
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

  if n_rows == n_entries
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

function str = cell2str(cell)
  n = length(cell); str = '';
  for i = 1:n
    str = [str, ',', cell{i}];
  end
  if  n > 0
    str(1) = '';
  end
end