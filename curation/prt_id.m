%% prt_id
% prints an html-page with all identifiers for specified AmP entries 

%%
function fileName = prt_id(pets, save)
% created 2021/08/14 by Bas Kooijman, modified 2022/05/17

%% Syntax
% fileName = <prt_id *prt_id*>(pets, save)

%% Description
% prints an html-page with all identifiers for specified AmP entries as present in results_my_pet.mat files
% Clicking on header labels removes that column; clicking on the first one ("entry") undoes the deletion.
%
% Input:
%
% * pets: cell array with names of existing entries
% * save: optional boolean for saving the table in AmPTool/curation (default 0: do not save)
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

  WD = cdCur;
  
  if ~exist('save','var')
    save = false;
  end

  n = length(pets); 
     
  % initiate
  CoL = cell(n,1); 
  ITIS = cell(n,1); 
  EoL = cell(n,1); 
  Wiki = cell(n,1); 
  ADW = cell(n,1); 
  Taxo = cell(n,1); 
  WoRMS = cell(n,1); 
  molluscabase = cell(n,1); 
  scorpion = cell(n,1); 
  spider = cell(n,1); 
  collembola = cell(n,1); 
  orthoptera = cell(n,1); 
  phasmida = cell(n,1); 
  aphid = cell(n,1); 
  diptera = cell(n,1); 
  lepidoptera = cell(n,1); 
  fishbase = cell(n,1); 
  amphweb = cell(n,1);
  ReptileDB = cell(n,1); 
  avibase = cell(n,1); 
  birdlife = cell(n,1); 
  MSW3 = cell(n,1); 
  AnAge = cell(n,1); 

  for i = 1:n
    cdEntr(pets{i});
    load(['results_', pets{i},'.mat'], 'metaData');
    id = metaData.links; vars_pull(id);
    flds = fields(id); n_flds = length(flds);
    for j = 1:n_flds
       nm = strsplit(flds{j}, '_'); nm = nm{2};
       eval([nm,'{i} = id_', nm, ';']);
    end
  end
     
  cdCur;
  
  title = ['id_', datestr(datenum(date),'yyyymmdd')];
  header = {'AmP entry', 'CoL', 'ITIS', 'EoL', 'Wiki', 'ADW', 'Taxo', 'WoRMS', ...
       'molluscabase', 'scorpion', 'spider', 'collembola', 'orthoptera', 'phasmida', 'aphid', 'diptera', 'lepidoptera', ...
       'fishbase' 'amphweb' 'ReptileDB', 'avibase', 'birdlife', 'MSW3', 'AnAge'};
  val = [pets, CoL, ITIS, EoL, Wiki, ADW, Taxo, WoRMS, ...
       molluscabase, scorpion, spider, collembola, orthoptera, phasmida, aphid, diptera, lepidoptera, ...
       fishbase, amphweb, ReptileDB, avibase, birdlife, MSW3, AnAge];
   
  n_rows = length(pets); n_cols = length(header);
        
  fileName = [title, '.html']; % char string with file name of output file
  oid = fopen(fileName, 'w+'); % open file for writing, delete existing content

  % file head
  fprintf(oid, '<!DOCTYPE html>\n');
  fprintf(oid, '<html>\n');
  fprintf(oid, '<head>\n');
  fprintf(oid, '  <title>%s</title>\n',  title);
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
  fprintf(oid, '      background-color: #FFE7C6;\n');
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
    fprintf(oid, '       <th><button onclick="undoHide()">%s</button></th>\n', header{1});
    for j = 2:n_cols
      fprintf(oid, '       <th><button onclick="hideCol(%d)">%s</button></th>\n', j, header{j});
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
      
  fprintf(oid, '    function hideCol(column) {\n');
  fprintf(oid, '      var table = document.getElementById("tabId");\n');
  fprintf(oid, '      var styleSheet = document.getElementById("myStyleSheet").sheet;\n\n'); 
  fprintf(oid, '      var rule = "table td:nth-child("+ column +"), table th:nth-child("+ column +") {display: none;}";\n');
  fprintf(oid, '      styleSheet.insertRule(rule);\n');
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
