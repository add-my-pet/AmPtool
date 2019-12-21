%% prt_species_list
%  deletes and writes ../../species_list.html 

%%
function prt_species_list
% created by Bas Kooijman; modified 2015/04/14 Starrlight Augustine & Goncalo Marques; 
%   modified 2015/07/21, 2015/08/28 Starrlight Augustine; 2016/11/05, 2017/10/13, 2017/10/24, 2018/01/25 Bas Kooijman

%% Syntax
% <../prt_species_list.m *prt_species_list*>

%% Description
% deletes and writes ../../species_list.html

%% Remarks
% Uses subfunctions open_species_list_html, prt_species_row and close_species_list_html
% Reads from allStat and each row in the table has an id

% get basic data for species_list
data = read_allStat('phylum', 'class', 'order', 'family', 'species', 'species_en', 'model', 'MRE', 'SMSE', 'COMPLETE', 'data'); 
n = size(data,1); % number of entries

fid_Spec = open_species_list_html; % open up species_list.html for writing and delete the old file

for i = 1:n % scan entries
  prt_species_row(fid_Spec, data(i,:)) % write species row
end 

close_species_list(fid_Spec);      % close species_list.html

end

%% subfunction open_species_list_html 
 
function fid_Spec = open_species_list_html
% opens up species_list.html for reading and writing

fid_Spec = fopen('../../add_my_pet_web/species_list.html', 'w+'); % open file for writing, delete existing content
  
% make head and header for species_list.html :
fprintf(fid_Spec, '<!DOCTYPE html>\n');
fprintf(fid_Spec, '<HTML>\n\n'); % open html
fprintf(fid_Spec, '<HEAD>\n');   % open head
fprintf(fid_Spec, '  <TITLE>Species List</TITLE>\n');
fprintf(fid_Spec, '  <link rel="stylesheet" type="text/css" href="sys/style.css"> \n');
fprintf(fid_Spec, '  <script src="sys/dropdown.js"></script>\n');
fprintf(fid_Spec, '  <script src="sys/w3data.js"></script>\n');
fprintf(fid_Spec, '  <style>\n');
fprintf(fid_Spec, '    #InputPhylum {\n');
fprintf(fid_Spec, '      background-image: url(''img/searchicon.png''); /* Add a search icon to input */\n');
fprintf(fid_Spec, '      background-position: 2px -10px; /* Position the search icon */\n');
fprintf(fid_Spec, '      background-repeat: no-repeat; /* Do not repeat the icon image */\n');
fprintf(fid_Spec, '      width: 5%%; /* Width of search field */\n');
fprintf(fid_Spec, '      font-size: 14px; /* Increase font-size */\n');
fprintf(fid_Spec, '      padding: 5px 10px 7px 40px; /* Add some padding */\n');
fprintf(fid_Spec, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(fid_Spec, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #InputClass {\n');
fprintf(fid_Spec, '      background-image: url(''img/searchicon.png''); /* Add a search icon to input */\n');
fprintf(fid_Spec, '      background-position: 2px -10px; /* Position the search icon */\n');
fprintf(fid_Spec, '      background-repeat: no-repeat; /* Do not repeat the icon image */\n');
fprintf(fid_Spec, '      width: 5%%; /* Width of search field */\n');
fprintf(fid_Spec, '      font-size: 14px; /* Increase font-size */\n');
fprintf(fid_Spec, '      padding: 5px 10px 7px 40px; /* Add some padding */\n');
fprintf(fid_Spec, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(fid_Spec, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #InputOrder {\n');
fprintf(fid_Spec, '      background-image: url(''img/searchicon.png''); /* Add a search icon to input */\n');
fprintf(fid_Spec, '      background-position: 2px -10px; /* Position the search icon */\n');
fprintf(fid_Spec, '      background-repeat: no-repeat; /* Do not repeat the icon image */\n');
fprintf(fid_Spec, '      width: 5%%; /* Width of search field */\n');
fprintf(fid_Spec, '      font-size: 14px; /* Increase font-size */\n');
fprintf(fid_Spec, '      padding: 5px 10px 7px 40px; /* Add some padding */\n');
fprintf(fid_Spec, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(fid_Spec, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #InputFamily {\n');
fprintf(fid_Spec, '      background-image: url(''img/searchicon.png''); /* Add a search icon to input */\n');
fprintf(fid_Spec, '      background-position: 2px -10px; /* Position the search icon */\n');
fprintf(fid_Spec, '      background-repeat: no-repeat; /* Do not repeat the icon image */\n');
fprintf(fid_Spec, '      width: 5%%; /* Width of search field */\n');
fprintf(fid_Spec, '      font-size: 14px; /* Increase font-size */\n');
fprintf(fid_Spec, '      padding: 5px 10px 7px 40px; /* Add some padding */\n');
fprintf(fid_Spec, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(fid_Spec, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #InputSname {\n');
fprintf(fid_Spec, '      background-image: url(''img/searchicon.png''); /* Add a search icon to input */\n');
fprintf(fid_Spec, '      background-position: 2px -10px; /* Position the search icon */\n');
fprintf(fid_Spec, '      background-repeat: no-repeat; /* Do not repeat the icon image */\n');
fprintf(fid_Spec, '      width: 5%%; /* Width of search field */\n');
fprintf(fid_Spec, '      font-size: 14px; /* Increase font-size */\n');
fprintf(fid_Spec, '      padding: 5px 10px 7px 40px; /* Add some padding */\n');
fprintf(fid_Spec, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(fid_Spec, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #InputCname {\n');
fprintf(fid_Spec, '      background-image: url(''img/searchicon.png''); /* Add a search icon to input */\n');
fprintf(fid_Spec, '      background-position: 2px -10px; /* Position the search icon */\n');
fprintf(fid_Spec, '      background-repeat: no-repeat; /* Do not repeat the icon image */\n');
fprintf(fid_Spec, '      width: 7%%; /* Width of search field */\n');
fprintf(fid_Spec, '      font-size: 14px; /* Increase font-size */\n');
fprintf(fid_Spec, '      padding: 5px 10px 7px 40px; /* Add some padding */\n');
fprintf(fid_Spec, '      border: 1px solid #ddd; /* Add a grey border */\n');
fprintf(fid_Spec, '      margin-bottom: 12px; /* Add some space below the input */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #speciesTable {\n');
fprintf(fid_Spec, '      border-collapse: collapse; /* Collapse borders */\n');
fprintf(fid_Spec, '      width: 100%%; /* Full-width */\n\n');
fprintf(fid_Spec, '    }\n');

fprintf(fid_Spec, '    #speciesTable th, #speciesTable td {\n');
fprintf(fid_Spec, '      text-align: left; /* Left-align text */\n');
fprintf(fid_Spec, '      padding: 12px; /* Add padding */\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #speciesTable tr.header, #speciesTable tr:hover {\n');
fprintf(fid_Spec, '      /* Add a grey background color to the table header and on hover */\n');
fprintf(fid_Spec, '      background-color: #f1f1f1;\n');
fprintf(fid_Spec, '    }\n');
fprintf(fid_Spec, '  </style>\n');

fprintf(fid_Spec, '</HEAD>\n\n'); % close head

fprintf(fid_Spec, '<BODY>\n\n');  % open body

fprintf(fid_Spec, '<div w3-include-html="sys/wallpaper_amp.html"></div>\n');
fprintf(fid_Spec, '<div w3-include-html="sys/toolbar_amp.html"></div>\n');
fprintf(fid_Spec, '<script>w3IncludeHTML();</script>\n\n');
	
fprintf(fid_Spec, '<div id = "main">\n');
fprintf(fid_Spec, '  <div id = "main-wrapper-species">    \n');
fprintf(fid_Spec, '    <div id="contentFull">\n\n');
fprintf(fid_Spec, '      <H2><a href="" title="Goto entries by clicking on entry names">Species list: taxonomic view</a></H2>\n\n');

fprintf(fid_Spec, '      <div>\n');
fprintf(fid_Spec, '        <input type="text" id="InputPhylum" onkeyup="FunctionPhylum()" placeholder="Phylum ..">\n');
fprintf(fid_Spec, '        <input type="text" id="InputClass"  onkeyup="FunctionClass()"  placeholder="Class ..">\n');
fprintf(fid_Spec, '        <input type="text" id="InputOrder"  onkeyup="FunctionOrder()"  placeholder="Order ..">\n');
fprintf(fid_Spec, '        <input type="text" id="InputFamily" onkeyup="FunctionFamily()" placeholder="Family ..">\n');
fprintf(fid_Spec, '        <input type="text" id="InputSname"  onkeyup="FunctionSname()"  placeholder="Species ..">\n');
fprintf(fid_Spec, '        <input type="text" id="InputCname"  onkeyup="FunctionCname()"  placeholder="Common name ..">\n');
fprintf(fid_Spec, '      </div>\n\n');

fprintf(fid_Spec, '      <table id="speciesTable">\n'); % open species table
fprintf(fid_Spec, '        <TR HEIGHT=60 BGCOLOR = "#FFE7C6">\n');
fprintf(fid_Spec, '          <TH><a class="link" target = "_blank" href="http://www.bio.vu.nl/thb/deb/deblab/add_my_pet/phyla.html">phylum</a></TH>\n');
fprintf(fid_Spec, '          <TH>class</TH> <TH>order</TH> <TH>family</TH> <TH>species</TH> <TH>common name</TH>\n');
fprintf(fid_Spec, '          <TH BGCOLOR = "#FFC6A5"><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Typified_models">&nbsp; type &nbsp;</a></TH>\n');
fprintf(fid_Spec, '          <TH BGCOLOR = "#FFE7C6"><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Mean_relative_error">&nbsp; MRE &nbsp;</a></TH>\n');
fprintf(fid_Spec, '          <TH BGCOLOR = "#FFE7C6"><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=SMSE" >&nbsp; SMSE &nbsp;</a></TH>\n');
fprintf(fid_Spec, '          <TH BGCOLOR = "#FFCE9C"><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Completeness" >&nbsp; complete &nbsp;</a></TH>\n');
fprintf(fid_Spec, '          <TH BGCOLOR = "#FFFFC6"><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Data_types" >&nbsp; data &nbsp;</a></TH>\n');
fprintf(fid_Spec, '        </TR>\n\n');

end

%% subfunction prt_species_row

function prt_species_row(fid_Spec, id)
% places a row in species_list.html which has previously been opened for reading and writing

  % unpack data
  phylum = id{1}; class = id{2}; order = id{3}; family = id{4}; species = id{5}; species_en = id{6}; 
  model = id{7}; MRE = id{8}; SMSE = id{9}; COMPLETE = id{10}; data = id{11};
  
  fprintf(fid_Spec,['        <TR id = "', species, '">\n']); % open and identify the species row

  % edit species and species_en
  species_prt = strrep(species, '_', ' ');      % remove underscores 
  if species_en(1) >= 'a' && species_en(1)<='z' % put first letter of common name in capital
    species_en(1) = char(species_en(1) - 32);
  end

  % separate zero- and uni-variate data
  sel = cellfun(@isempty, strfind(data, '-')); data_0 = data(sel); data_1 = data(~sel);
  n_data_0 = length(data_0); n_data_1 = length(data_1); 
  
  fprintf(fid_Spec,['          <TD>', phylum, '</TD>  <TD>', class, '</TD> <TD>', order, '</TD> <TD>', family, '</TD>\n']);
  fprintf(fid_Spec,['          <TD><A TARGET="_top" HREF="entries_web/', species, '/', species, '_res.html">', species_prt, '</A></TD> <TD>', species_en, '</TD>\n']);
  fprintf(fid_Spec, '          <TD style="text-align:center"  BGCOLOR = "#FFC6A5">%s</TD>\n', model);
  fprintf(fid_Spec, '          <TD style="text-align:center"  BGCOLOR = "#FFE7C6">%8.3f</TD>\n', MRE);
  fprintf(fid_Spec, '          <TD style="text-align:center"  BGCOLOR = "#FFE7C6">%8.3f</TD>\n', SMSE);
  fprintf(fid_Spec, '          <TD style="text-align:center"  BGCOLOR = "#FFCE9C">%g</TD>\n', COMPLETE);
  for i = 1:n_data_0 % scan zero-variate data
    fprintf(fid_Spec, '          <TD BGCOLOR = "#FFFFC6">%s</TD>\n', data_0{i});      
  end
  for i = 1:n_data_1 % scan univariate data
    fprintf(fid_Spec, '          <TD BGCOLOR = "#FFFF9C">%s</TD>\n', data_1{i});  
  end
  fprintf(fid_Spec, '        </TR>\n\n'); % close the species row
  
end

%% subfunction close_species_list

function close_species_list(fid_Spec)
% completes the table of species and closes species_list.html

fprintf(fid_Spec, '      </table>\n\n'); % close species table

fprintf(fid_Spec, '      <script>\n');
fprintf(fid_Spec, '        function FunctionPhylum() {\n');
fprintf(fid_Spec, '          // Declare variables\n');
fprintf(fid_Spec, '          var input, filter, table, tr, td, i;\n');
fprintf(fid_Spec, '          input = document.getElementById("InputPhylum");\n');
fprintf(fid_Spec, '          filter = input.value.toUpperCase();\n');
fprintf(fid_Spec, '          table = document.getElementById("speciesTable");\n');
fprintf(fid_Spec, '          tr = table.getElementsByTagName("tr");\n\n');

fprintf(fid_Spec, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(fid_Spec, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(fid_Spec, '          td = tr[i].getElementsByTagName("td")[0];\n');
fprintf(fid_Spec, '          if (td) {\n');
fprintf(fid_Spec, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_Spec, '              tr[i].style.display = "";\n');
fprintf(fid_Spec, '            } else {\n');
fprintf(fid_Spec, '              tr[i].style.display = "none";\n');
fprintf(fid_Spec, '              }\n');
fprintf(fid_Spec, '            }\n');
fprintf(fid_Spec, '          }\n');
fprintf(fid_Spec, '        }\n\n');
 
fprintf(fid_Spec, '        function FunctionClass() {\n');
fprintf(fid_Spec, '          // Declare variables\n');
fprintf(fid_Spec, '          var input, filter, table, tr, td, i;\n');
fprintf(fid_Spec, '          input = document.getElementById("InputClass");\n');
fprintf(fid_Spec, '          filter = input.value.toUpperCase();\n');
fprintf(fid_Spec, '          table = document.getElementById("speciesTable");\n');
fprintf(fid_Spec, '          tr = table.getElementsByTagName("tr");\n\n');

fprintf(fid_Spec, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(fid_Spec, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(fid_Spec, '          td = tr[i].getElementsByTagName("td")[1];\n');
fprintf(fid_Spec, '          if (td) {\n');
fprintf(fid_Spec, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_Spec, '              tr[i].style.display = "";\n');
fprintf(fid_Spec, '            } else {\n');
fprintf(fid_Spec, '              tr[i].style.display = "none";\n');
fprintf(fid_Spec, '              }\n');
fprintf(fid_Spec, '            }\n');
fprintf(fid_Spec, '          }\n');
fprintf(fid_Spec, '        }\n\n');

fprintf(fid_Spec, '        function FunctionOrder() {\n');
fprintf(fid_Spec, '          // Declare variables\n');
fprintf(fid_Spec, '          var input, filter, table, tr, td, i;\n');
fprintf(fid_Spec, '          input = document.getElementById("InputOrder");\n');
fprintf(fid_Spec, '          filter = input.value.toUpperCase();\n');
fprintf(fid_Spec, '          table = document.getElementById("speciesTable");\n');
fprintf(fid_Spec, '          tr = table.getElementsByTagName("tr");\n\n');

fprintf(fid_Spec, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(fid_Spec, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(fid_Spec, '          td = tr[i].getElementsByTagName("td")[2];\n');
fprintf(fid_Spec, '          if (td) {\n');
fprintf(fid_Spec, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_Spec, '              tr[i].style.display = "";\n');
fprintf(fid_Spec, '            } else {\n');
fprintf(fid_Spec, '              tr[i].style.display = "none";\n');
fprintf(fid_Spec, '              }\n');
fprintf(fid_Spec, '            }\n');
fprintf(fid_Spec, '          }\n');
fprintf(fid_Spec, '        }\n\n');

fprintf(fid_Spec, '        function FunctionFamily() {\n');
fprintf(fid_Spec, '          // Declare variables\n');
fprintf(fid_Spec, '          var input, filter, table, tr, td, i;\n');
fprintf(fid_Spec, '          input = document.getElementById("InputFamily");\n');
fprintf(fid_Spec, '          filter = input.value.toUpperCase();\n');
fprintf(fid_Spec, '          table = document.getElementById("speciesTable");\n');
fprintf(fid_Spec, '          tr = table.getElementsByTagName("tr");\n\n');

fprintf(fid_Spec, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(fid_Spec, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(fid_Spec, '          td = tr[i].getElementsByTagName("td")[3];\n');
fprintf(fid_Spec, '          if (td) {\n');
fprintf(fid_Spec, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_Spec, '              tr[i].style.display = "";\n');
fprintf(fid_Spec, '            } else {\n');
fprintf(fid_Spec, '              tr[i].style.display = "none";\n');
fprintf(fid_Spec, '              }\n');
fprintf(fid_Spec, '            }\n');
fprintf(fid_Spec, '          }\n');
fprintf(fid_Spec, '        }\n\n');

fprintf(fid_Spec, '        function FunctionSname() {\n');
fprintf(fid_Spec, '          // Declare variables\n');
fprintf(fid_Spec, '          var input, filter, table, tr, td, i;\n');
fprintf(fid_Spec, '          input = document.getElementById("InputSname");\n');
fprintf(fid_Spec, '          filter = input.value.toUpperCase();\n');
fprintf(fid_Spec, '          table = document.getElementById("speciesTable");\n');
fprintf(fid_Spec, '          tr = table.getElementsByTagName("tr");\n\n');

fprintf(fid_Spec, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(fid_Spec, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(fid_Spec, '          td = tr[i].getElementsByTagName("td")[4];\n');
fprintf(fid_Spec, '          if (td) {\n');
fprintf(fid_Spec, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_Spec, '              tr[i].style.display = "";\n');
fprintf(fid_Spec, '            } else {\n');
fprintf(fid_Spec, '              tr[i].style.display = "none";\n');
fprintf(fid_Spec, '              }\n');
fprintf(fid_Spec, '            }\n');
fprintf(fid_Spec, '          }\n');
fprintf(fid_Spec, '        }\n\n');

fprintf(fid_Spec, '        function FunctionCname() {\n');
fprintf(fid_Spec, '          // Declare variables\n');
fprintf(fid_Spec, '          var input, filter, table, tr, td, i;\n');
fprintf(fid_Spec, '          input = document.getElementById("InputCname");\n');
fprintf(fid_Spec, '          filter = input.value.toUpperCase();\n');
fprintf(fid_Spec, '          table = document.getElementById("speciesTable");\n');
fprintf(fid_Spec, '          tr = table.getElementsByTagName("tr");\n\n');

fprintf(fid_Spec, '          // Loop through all table rows, and hide those who don''t match the search query\n');
fprintf(fid_Spec, '          for (i = 0; i < tr.length; i++) {\n');
fprintf(fid_Spec, '          td = tr[i].getElementsByTagName("td")[5];\n');
fprintf(fid_Spec, '          if (td) {\n');
fprintf(fid_Spec, '            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_Spec, '              tr[i].style.display = "";\n');
fprintf(fid_Spec, '            } else {\n');
fprintf(fid_Spec, '              tr[i].style.display = "none";\n');
fprintf(fid_Spec, '              }\n');
fprintf(fid_Spec, '            }\n');
fprintf(fid_Spec, '          }\n');
fprintf(fid_Spec, '        }\n');
fprintf(fid_Spec, '      </script>\n\n');

fprintf(fid_Spec, '    </div> <!-- end of content -->\n\n');

fprintf(fid_Spec, '    <div w3-include-html="sys/footer_amp.html"></div>\n');
fprintf(fid_Spec, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(fid_Spec, '  </div> <!-- main wrapper -->\n');
fprintf(fid_Spec, '</div> <!-- main -->\n');

fprintf(fid_Spec, '</BODY>\n'); % close body
fprintf(fid_Spec, '</HTML>\n'); % close html
fclose(fid_Spec);

end