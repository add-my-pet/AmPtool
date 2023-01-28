%% prt_species_names
%  deletes and writes ../../deblab/add_my_pet/species_names.html 

%%
function prt_species_names
% created at 2016/12/30 by Bas Kooijman, modified 2017/10/13, 2017/10/20, 2017/10/24, 2017/10/25, 2021/02/20, 2022/02/10

%% Syntax
% <../../add_my_pet/prt_species_names.m *prt_species_names*>

%% Description
% deletes and writes ../../deblab/add_my_pet/species_names.html with scientific and common names on alphabeth

[nms, entries] = read_allStat('species','species_en');
n = length(entries); 
[x, index] = sort(nms(:,1)); nms = nms(index,:); 
snm = nms(:,1); cnm = nms(:,2); snm_prt = snm; 
for i = 1:n
  snm_prt{i} = strrep(snm{i}, '_', ' '); % replace "_" by space
  cnm{i} = strrep(cnm{i}, '\', '\\');
  cnm_prt = cnm{i}; % replace \ by \\ to aboid problems with fprintf
  if cnm_prt(1)>='a' && cnm_prt(1)<='z'  % puts first letter of common name in capital:
    cnm_prt(1) = char(cnm_prt(1) - 32);
    cnm{i} = cnm_prt;
  end
end
nms(:,2) = cnm; [cnm, index] = sort(cnm);

WD = cdCur;
fid_Spec = fopen('../../deblab/add_my_pet/species_names.html', 'w+'); % open file for writing, delete existing content
  
% make the header for species_names.html
fprintf(fid_Spec, '<!DOCTYPE html>\n');
fprintf(fid_Spec, '<HTML>\n');
fprintf(fid_Spec, '<HEAD>\n');
fprintf(fid_Spec, '  <TITLE>Species Names</TITLE>\n');
fprintf(fid_Spec, '  <link rel="stylesheet" type="text/css" href="sys/style.css">\n');
fprintf(fid_Spec, '  <script src="sys/jscripts.js"></script>\n');

fprintf(fid_Spec, '  <style>\n');
fprintf(fid_Spec, '    .newspaper {\n');
fprintf(fid_Spec, '      -webkit-column-count: 5; /* Chrome, Safari, Opera */\n');
fprintf(fid_Spec, '      -moz-column-count: 5; /* Firefox */\n');
fprintf(fid_Spec, '      column-count: 5;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    * {\n');
fprintf(fid_Spec, '      box-sizing: border-box;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #Input_sn {\n');
fprintf(fid_Spec, '      background-image: url(''img/searchicon.png'');\n');
fprintf(fid_Spec, '      background-position: 2px -10px;\n');
fprintf(fid_Spec, '      background-repeat: no-repeat;\n');
fprintf(fid_Spec, '      width: 18%%;\n');
fprintf(fid_Spec, '      font-size: 14px;\n');
fprintf(fid_Spec, '      padding: 5px 10px 7px 40px;\n');
fprintf(fid_Spec, '      border: 1px solid #ddd;\n');
fprintf(fid_Spec, '      margin-bottom: 12px;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #scientific_nm {\n');
fprintf(fid_Spec, '      list-style-type: none;\n');
fprintf(fid_Spec, '      padding: 0;\n');
fprintf(fid_Spec, '      margin: 0;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #scientific_nm li a {\n');
fprintf(fid_Spec, '      border: 1px solid #ddd;\n');
fprintf(fid_Spec, '      margin-top: -1px; /* Prevent double borders */\n');
fprintf(fid_Spec, '      background-color: #f6f6f6;\n');
fprintf(fid_Spec, '      padding: 12px;\n');
fprintf(fid_Spec, '      text-decoration: none;\n');
fprintf(fid_Spec, '      font-size: 16px;\n');
fprintf(fid_Spec, '      color: black;\n');
fprintf(fid_Spec, '      display: block\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #common_nm li a:hover:not(.header) {\n');
fprintf(fid_Spec, '      background-color: #eee;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #Input_cn {\n');
fprintf(fid_Spec, '      background-image: url(''img/searchicon.png'');\n');
fprintf(fid_Spec, '      background-position: 2px -10px;\n');
fprintf(fid_Spec, '      background-repeat: no-repeat;\n');
fprintf(fid_Spec, '      width: 18%%;\n');
fprintf(fid_Spec, '      font-size: 14px;\n');
fprintf(fid_Spec, '      padding: 5px 10px 7px 40px;\n');
fprintf(fid_Spec, '      border: 1px solid #ddd;\n');
fprintf(fid_Spec, '      margin-bottom: 12px;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #common_nm {\n');
fprintf(fid_Spec, '      list-style-type: none;\n');
fprintf(fid_Spec, '      padding: 0;\n');
fprintf(fid_Spec, '      margin: 0;\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #common_nm li a {\n');
fprintf(fid_Spec, '      border: 1px solid #ddd;\n');
fprintf(fid_Spec, '      margin-top: -1px; /* Prevent double borders */\n');
fprintf(fid_Spec, '      background-color: #f6f6f6;\n');
fprintf(fid_Spec, '      padding: 12px;\n');
fprintf(fid_Spec, '      text-decoration: none;\n');
fprintf(fid_Spec, '      font-size: 16px;\n');
fprintf(fid_Spec, '      color: black;\n');
fprintf(fid_Spec, '      display: block\n');
fprintf(fid_Spec, '    }\n\n');

fprintf(fid_Spec, '    #common_nm li a:hover:not(.header) {\n');
fprintf(fid_Spec, '      background-color: #eee;\n');
fprintf(fid_Spec, '      }\n\n');

fprintf(fid_Spec, '  </style>\n');
fprintf(fid_Spec, '</HEAD>\n\n');
fprintf(fid_Spec, '<BODY>\n\n');

fprintf(fid_Spec, '<div w3-include-html="sys/wallpaper_amp.html"></div>\n');
fprintf(fid_Spec, '<div w3-include-html="sys/toolbar_amp.html"></div>\n');
	
fprintf(fid_Spec, '<div id="main">\n');
fprintf(fid_Spec, '  <div id="main-wrapper-species">    \n');
fprintf(fid_Spec, '    <div id="contentFull">\n\n');

fprintf(fid_Spec, '      <div>\n');
fprintf(fid_Spec, '        <input type="text" id="Input_sn" onkeyup="Function_sn()" placeholder="Search for scientific names.." title="Type in a name">\n');
fprintf(fid_Spec, '        <input type="text" id="Input_cn" onkeyup="Function_cn()" placeholder="Search for common names.." title="Type in a name">\n');
fprintf(fid_Spec, '      </div>\n\n');

fprintf(fid_Spec, '      <H2 id="scientific_name"><a href="#common_name" title="Locate entries by scientific name.\n');
fprintf(fid_Spec, '        Goto entries by clicking on entry names.\n');
fprintf(fid_Spec, '        Click here for common names">Scientific names</a></H2>\n');
fprintf(fid_Spec, '      <div class="newspaper">\n'); 
fprintf(fid_Spec, '        <ul id="scientific_nm">\n');

for i = 1:n
fprintf(fid_Spec, '          <li><a target="_top" href="entries_web/%s/%s_res.html" title="%s">%s</a></li>\n', snm{i},snm{i},nms{i,2},snm_prt{i});
end
fprintf(fid_Spec, '        </ul>\n');
fprintf(fid_Spec, '      </div>\n\n');  

fprintf(fid_Spec, '      <H2 id="common_name"><a href="#scientific_name" title="Locate entries by common name.\n');
fprintf(fid_Spec, '        Species can have several common names, only one was chosen.\n');
fprintf(fid_Spec, '        Goto entries by clicking on entry names.\n');
fprintf(fid_Spec, '        Click here for scientific names">Common names</a></H2>\n\n');

fprintf(fid_Spec, '      <div class="newspaper">\n');  
fprintf(fid_Spec, '        <ul id="common_nm">');
for i = 1:n
fprintf(fid_Spec, '          <li><a target="_top" href="entries_web/%s/%s_res.html" title="%s">%s</a></li>\n', snm{index(i)},snm{index(i)},snm_prt{index(i)},cnm{i});
end
fprintf(fid_Spec, '        </ul>\n');
fprintf(fid_Spec, '      </div>\n\n'); 

fprintf(fid_Spec, '      <script>\n');
fprintf(fid_Spec, '        function Function_sn() {\n');
fprintf(fid_Spec, '          var input, filter, h2, ul, li, a, i;\n');
fprintf(fid_Spec, '          input = document.getElementById("Input_sn");\n');
fprintf(fid_Spec, '          filter = input.value.toUpperCase();\n');
fprintf(fid_Spec, '          h2 = document.getElementById("common_name");\n');
fprintf(fid_Spec, '          h2.style.display = "none";\n');
fprintf(fid_Spec, '          h2 = document.getElementById("scientific_name");\n');
fprintf(fid_Spec, '          h2.style.display = "";\n');
fprintf(fid_Spec, '          ul = document.getElementById("common_nm");\n');
fprintf(fid_Spec, '          ul.style.display = "none";\n');
fprintf(fid_Spec, '          ul = document.getElementById("scientific_nm");\n');
fprintf(fid_Spec, '          ul.style.display = "";\n');
fprintf(fid_Spec, '          li = ul.getElementsByTagName("li");\n');
fprintf(fid_Spec, '          for (i = 0; i < li.length; i++) {\n');
fprintf(fid_Spec, '            a = li[i].getElementsByTagName("a")[0];\n');
fprintf(fid_Spec, '            if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_Spec, '              li[i].style.display = "";\n');
fprintf(fid_Spec, '            } else {\n');
fprintf(fid_Spec, '              li[i].style.display = "none";\n');
fprintf(fid_Spec, '            }\n');
fprintf(fid_Spec, '          }\n');
fprintf(fid_Spec, '        }\n\n');

fprintf(fid_Spec, '        function Function_cn() {\n');
fprintf(fid_Spec, '          var input, filter, h2, ul, li, a, i;\n');
fprintf(fid_Spec, '          input = document.getElementById("Input_cn");\n');
fprintf(fid_Spec, '          filter = input.value.toUpperCase();\n');
fprintf(fid_Spec, '          h2 = document.getElementById("scientific_name");\n');
fprintf(fid_Spec, '          h2.style.display = "none";\n');
fprintf(fid_Spec, '          h2 = document.getElementById("common_name");\n');
fprintf(fid_Spec, '          h2.style.display = "";\n');
fprintf(fid_Spec, '          ul = document.getElementById("scientific_nm");\n');
fprintf(fid_Spec, '          ul.style.display = "none";\n');
fprintf(fid_Spec, '          ul = document.getElementById("common_nm");\n');
fprintf(fid_Spec, '          ul.style.display = "";\n');
fprintf(fid_Spec, '          li = ul.getElementsByTagName("li");\n');
fprintf(fid_Spec, '          for (i = 0; i < li.length; i++) {\n');
fprintf(fid_Spec, '            a = li[i].getElementsByTagName("a")[0];\n');
fprintf(fid_Spec, '            if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_Spec, '              li[i].style.display = "";\n');
fprintf(fid_Spec, '            } else {\n');
fprintf(fid_Spec, '            li[i].style.display = "none";\n');
fprintf(fid_Spec, '            }\n');
fprintf(fid_Spec, '          }\n');
fprintf(fid_Spec, '        }\n');
fprintf(fid_Spec, '      </script>\n\n');

fprintf(fid_Spec, '    </div> <!-- end of content -->\n\n');

fprintf(fid_Spec, '    <div w3-include-html="sys/footer_amp.html"></div>\n');
fprintf(fid_Spec, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(fid_Spec, '  </div> <!-- main wrapper -->\n');
fprintf(fid_Spec, '</div> <!-- main -->\n');

fprintf(fid_Spec, '</BODY>\n');
fprintf(fid_Spec, '</HTML>\n');
fclose(fid_Spec);

cd(WD);
end