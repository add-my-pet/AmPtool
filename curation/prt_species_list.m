%% prt_species_list
%  deletes and writes ../../deblab/add_my_pet/species_list.html 

%%
function prt_species_list
% created by Bas Kooijman; modified 2015/04/14 Starrlight Augustine & Goncalo Marques; 
%   modified 2015/07/21, 2015/08/28 Starrlight Augustine; 
% 2016/11/05, 2017/10/13, 2017/10/24, 2018/01/25, 2019/12/22, 2021/02/20, 2022/01/08, 2022/06/05  Bas Kooijman

%% Syntax
% <../prt_species_list.m *prt_species_list*>

%% Description
% deletes and writes ../../deblab/add_my_pet/species_list.html 

%% Remarks
% * Uses subfunctions open_species_list_html, prt_species_row and close_species_list_html
% * Reads from allStat and each row in the table has an id

WD = cdCur;
% get basic data for species_list
data = read_allStat('phylum', 'class', 'order', 'family', 'species', 'species_en', 'model', 'MRE', 'SMSE', 'COMPLETE', 'data'); 
n = size(data,1); % number of entries

fid_Spec = open_species_list_html; % open up species_list.html for writing and delete the old file

for i = 1:n % scan entries
  prt_species_row(fid_Spec, data(i,:)) % write species row
end 

close_species_list(fid_Spec);      % close species_list.html

cd(WD);

end

%% subfunction open_species_list_html 
 
function fid_Spec = open_species_list_html
% opens up species_list.html for reading and writing

fid_Spec = fopen('../../deblab/add_my_pet/species_list.html', 'w+'); % open file for writing, delete existing content
  
% make head and header for species_list.html :
fprintf(fid_Spec, '<!DOCTYPE html>\n');
fprintf(fid_Spec, '<html>\n\n'); % open html
fprintf(fid_Spec, '<head>\n');   % open head
fprintf(fid_Spec, '  <title>Species List</title>\n');
fprintf(fid_Spec, '  <link rel="stylesheet" type="text/css" href="sys/style.css">\n');
fprintf(fid_Spec, '  <script src="sys/jscripts.js"></script>\n');
fprintf(fid_Spec, '  <style>\n');
fprintf(fid_Spec, '    .Search {\n');
fprintf(fid_Spec, '      background-image: url(''img/searchicon.png''); /* Add a search icon to input */\n');
fprintf(fid_Spec, '      background-position: 2px -10px; /* Position the search icon */\n');
fprintf(fid_Spec, '      background-repeat: no-repeat; /* Do not repeat the icon image */\n');
fprintf(fid_Spec, '      width: 10%%; /* Width of search field */\n');
fprintf(fid_Spec, '      font-size: 14px; /* Increase font-size */\n');
fprintf(fid_Spec, '      padding: 5px 10px 7px 40px; /* Add some padding */\n');
fprintf(fid_Spec, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(fid_Spec, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #speciesTable {\n');
fprintf(fid_Spec, '      border-collapse: collapse; /* Collapse borders */\n');
fprintf(fid_Spec, '      width: 100%%; /* Full-width */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #speciesTable th, #speciesTable td {\n');
fprintf(fid_Spec, '      text-align: left; /* Left-align text */\n');
fprintf(fid_Spec, '      padding: 12px; /* Add padding */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #speciesTable tr.header, #speciesTable tr:hover {\n');
fprintf(fid_Spec, '      /* Add a grey background color to the table header and on hover */\n');
fprintf(fid_Spec, '      background-color: #f1f1f1;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    .ent {\n'); % entry
fprintf(fid_Spec, '      color: blue;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    .mod {\n'); % model
fprintf(fid_Spec, '      background-color: #ffc6a5;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    .mre {\n'); % MRE
fprintf(fid_Spec, '      background-color: #ffe7c6;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    .smse {\n'); % SMSE
fprintf(fid_Spec, '      background-color: #ffe7c6;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    .com {\n'); % COMPLETE
fprintf(fid_Spec, '      background-color: #ffce9c;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    .d0 {\n'); % data_0
fprintf(fid_Spec, '      background-color: #ffffc6;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    .d1 {\n'); % data_1
fprintf(fid_Spec, '      background-color: #ffff9c;\n');
fprintf(fid_Spec, '    }\n');

fprintf(fid_Spec, '  </style>\n');

fprintf(fid_Spec, '</head>\n\n'); % close head

fprintf(fid_Spec, '<body>\n\n');  % open body

fprintf(fid_Spec, '<div w3-include-html="sys/wallpaper_amp.html"></div>\n');
fprintf(fid_Spec, '<div w3-include-html="sys/toolbar_amp.html"></div>\n');
	
fprintf(fid_Spec, '<div id="main">\n');
fprintf(fid_Spec, '  <div id="main-wrapper-species">    \n');
fprintf(fid_Spec, '    <div id="contentFull">\n\n');
fprintf(fid_Spec, '      <H2><a href="" title="Goto entries by clicking on entry names">Species list: taxonomic view</a></H2>\n\n');

fprintf(fid_Spec, '      <div>\n');
fprintf(fid_Spec, '        <input type="text" class="Search" id="Phylum" onkeyup="searchList(''Phylum'',0)" placeholder="Phylum ..">\n');
fprintf(fid_Spec, '        <input type="text" class="Search" id="Class"  onkeyup="searchList(''Class'',1)" placeholder="Class ..">\n');
fprintf(fid_Spec, '        <input type="text" class="Search" id="Order"  onkeyup="searchList(''Order'',2)" placeholder="Order ..">\n');
fprintf(fid_Spec, '        <input type="text" class="Search" id="Family" onkeyup="searchList(''Family'',3)" placeholder="Family ..">\n');
fprintf(fid_Spec, '        <input type="text" class="Search" id="Species" onkeyup="searchList(''Species'',4)" placeholder="Species ..">\n');
fprintf(fid_Spec, '        <input type="text" class="Search" id="Common name" onkeyup="searchList(''Common name'',5)" placeholder="Common name ..">\n');
fprintf(fid_Spec, '        <input type="text" class="Search" id="Model" onkeyup="searchList(''Model'',6)" placeholder="Model ..">\n');
fprintf(fid_Spec, '      </div>\n\n');

fprintf(fid_Spec, '      <table id="speciesTable">\n'); % open species table
fprintf(fid_Spec, '        <tr HEIGHT=60 BGCOLOR = "#FFE7C6">\n');
fprintf(fid_Spec, '          <th><a class="link" target = "_blank" href="phyla.html">phylum</a></th>\n');
fprintf(fid_Spec, '          <th>class</th> <th>order</th> <th>family</th> <th>species</th> <th>common name</th>\n');
fprintf(fid_Spec, '          <th BGCOLOR="#FFC6A5"><a class="link" target="_blank" href="https://add-my-pet.github.io/DEBportal/docs/Typified_models.html">&nbsp; model &nbsp;</a></th>\n');
fprintf(fid_Spec, '          <th BGCOLOR="#FFE7C6"><a class="link" target="_blank" href="https://add-my-pet.github.io/DEBportal/docs/AmPestimation.html">&nbsp; MRE &nbsp;</a></th>\n');
fprintf(fid_Spec, '          <th BGCOLOR="#FFE7C6"><a class="link" target="_blank" href="https://add-my-pet.github.io/DEBportal/docs/AmPestimation.html" >&nbsp; SMSE &nbsp;</a></th>\n');
fprintf(fid_Spec, '          <th BGCOLOR="#FFCE9C"><a class="link" target="_blank" href="https://add-my-pet.github.io/DEBportal/docs/Completeness.html" >&nbsp; complete &nbsp;</a></th>\n');
fprintf(fid_Spec, '          <th BGCOLOR="#FFFFC6"><a class="link" target="_blank" href="https://add-my-pet.github.io/DEBportal/docs/AmPestimation.html" >&nbsp; data &nbsp;</a></th>\n');
fprintf(fid_Spec, '        </tr>\n\n');

end

%% subfunction prt_species_row

function prt_species_row(fid_Spec, id)
% places a row in species_list.html which has previously been opened for reading and writing

  % unpack data
  phylum = id{1}; class = id{2}; order = id{3}; family = id{4}; species = id{5}; species_en = id{6}; 
  model = id{7}; MRE = id{8}; SMSE = id{9}; COMPLETE = id{10}; data = id{11};
  
  fprintf(fid_Spec, '        <tr id="%s">\n', species); % open and identify the species row

  % edit species and species_en
  species_prt = strrep(species, '_', ' ');      % remove underscores 
  species_txt = ['''', species, ''''];
  if species_en(1) >= 'a' && species_en(1)<='z' % put first letter of common name in capital
    species_en(1) = char(species_en(1) - 32);
  end

  % separate zero- and uni-variate data
  sel = ~contains(data, '-'); data_0 = data(sel); data_1 = data(~sel);
  n_data_0 = length(data_0); n_data_1 = length(data_1); 
  
  fprintf(fid_Spec, '          <td>%s</td>  <td>%s</td> <td>%s</td> <td>%s</td>\n', phylum, class, order, family);
  %fprintf(fid_Spec, '          <td><button onclick="lnk(%s)">%s</button></td> <td>%s</td>\n', species_txt, species_prt, species_en);
  fprintf(fid_Spec, '          <td><a class="ent" onclick="lnk(%s)">%s</a></td> <td>%s</td>\n', species_txt, species_prt, species_en);
  fprintf(fid_Spec, '          <td class="mod">%s</td> <td class="mre">%8.3f</td> <td class="smse">%8.3f</td> <td class="com">%g</td>\n', model, MRE, SMSE, COMPLETE);
  fprintf(fid_Spec, '          ');
  for i = 1:n_data_0 % scan zero-variate data
    fprintf(fid_Spec, '<td class="d0">%s</td> ', data_0{i});      
  end
  fprintf(fid_Spec, '\n          ');
  for i = 1:n_data_1 % scan univariate data
    fprintf(fid_Spec, '<td class="d1">%s</td> ', data_1{i});  
  end
  fprintf(fid_Spec, '\n        </tr>\n\n'); % close the species row
end

%% subfunction close_species_list

function close_species_list(fid_Spec)
% completes the table of species and closes species_list.html

fprintf(fid_Spec, '      </table>\n\n'); % close species table

fprintf(fid_Spec, '      <script>\n');
fprintf(fid_Spec, '        function searchList(idBox,nBox) {\n');
fprintf(fid_Spec, '          // Declare variables\n');
fprintf(fid_Spec, '          var input, filter, table, tr, td, i;\n');
fprintf(fid_Spec, '          input = document.getElementById(idBox);\n');
fprintf(fid_Spec, '          filter = input.value.toUpperCase();\n');
fprintf(fid_Spec, '          table = document.getElementById("speciesTable");\n');
fprintf(fid_Spec, '          tr = table.getElementsByTagName("tr");\n\n');

fprintf(fid_Spec, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(fid_Spec, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(fid_Spec, '          td = tr[i].getElementsByTagName("td")[nBox];\n');
fprintf(fid_Spec, '          if (td) {\n');
fprintf(fid_Spec, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_Spec, '              tr[i].style.display = "";\n');
fprintf(fid_Spec, '            } else {\n');
fprintf(fid_Spec, '              tr[i].style.display = "none";\n');
fprintf(fid_Spec, '              }\n');
fprintf(fid_Spec, '            }\n');
fprintf(fid_Spec, '          }\n');
fprintf(fid_Spec, '        }\n\n');

fprintf(fid_Spec, '        function lnk(id) {\n');
fprintf(fid_Spec, '          window.open("entries_web/" + id + "/" + id + "_res.html");\n');
fprintf(fid_Spec, '        }\n');
fprintf(fid_Spec, '      </script>\n\n');

fprintf(fid_Spec, '    </div> <!-- end of content -->\n\n');

fprintf(fid_Spec, '    <div w3-include-html="sys/footer_amp.html"></div>\n');
fprintf(fid_Spec, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(fid_Spec, '  </div> <!-- main wrapper -->\n');
fprintf(fid_Spec, '</div> <!-- main -->\n');

fprintf(fid_Spec, '</body>\n'); % close body
fprintf(fid_Spec, '</html>\n'); % close html
fclose(fid_Spec);
end