%% prt_authors
% prints authors.html with submitting/modification authors and their entries

%%
function prt_authors
% created 2016/02/23 by Bas Kooijman, modified 2016/12/24, 2017/07/30, 2017/10/20, 2017/11/30, 2022/02/10

%% Syntax
% <../prt_authors.m *prt_authors*>

%% Description
% Writes ../authors.html with all authors and their submitted/modified entries

%% Remarks
% allStat.mat always has fields author and date_subm for each entry, but not always field(s) author_mod_*.
% If author_mod_* exists, date_mod_* must exist as well with a valid date-specification.
% Each author_mod_* field can have one or more authors

%% Example of use
% prt_authors

  % get basic data
  [authorDate, entries] = read_allStat('author', 'date_acc'); 
  ne = length(entries);   
  % authors
  author = cell(0, 1); % convert (2*ne,1)-cell array, to (n,1)-cell array by vertcat all cell-arrays 
  for i=1:ne % scan entries
    authorAdd = authorDate(i,1); 
    author = [author; authorAdd{:}];
  end
  [author, fam] = sort_fam(unique(author)); % alphabetically arranged list of all authors
  na = length(author);   
  % dates
  dates = authorDate(:,2);                  % (ne,>0)-cell array with all dates
    
  % prepare for writing authors.html
  fid_authors = fopen('../../deblab/add_my_pet/authors.html', 'w+'); % open file for writing, delete existing content
  
% write header for authors.html :
fprintf(fid_authors, '<!DOCTYPE html>\n');
fprintf(fid_authors, '<html>\n');
fprintf(fid_authors, '<head>\n');
fprintf(fid_authors, '  <title>AmP authors</title>\n');
fprintf(fid_authors, '  <link rel="stylesheet" type="text/css" href="sys/style.css">\n');
fprintf(fid_authors, '  <style>\n');
fprintf(fid_authors, '    .newspaper {\n');
fprintf(fid_authors, '      -webkit-column-count: 4; /* Chrome, Safari, Opera */\n');
fprintf(fid_authors, '      -moz-column-count: 4; /* Firefox */\n');
fprintf(fid_authors, '      column-count: 4;\n');
fprintf(fid_authors, '    }\n\n');

fprintf(fid_authors, '    .author_dropbtn {\n');
fprintf(fid_authors, '      color: black;\n');
fprintf(fid_authors, '      padding: 0px;\n');
fprintf(fid_authors, '      font-size: 16px;\n');
fprintf(fid_authors, '      border: none;\n');
fprintf(fid_authors, '      cursor: pointer;\n');
fprintf(fid_authors, '    }\n\n');

fprintf(fid_authors, '    .author_dropbtn:hover, .author_dropbtn:focus {\n');
fprintf(fid_authors, '      background-color: #C6EFF7;\n');
fprintf(fid_authors, '    }\n\n');

fprintf(fid_authors, '    .author_dropdown {\n');
fprintf(fid_authors, '      position: relative;\n');
fprintf(fid_authors, '      display: inline-block;\n');
fprintf(fid_authors, '      width: 240px;\n');
fprintf(fid_authors, '    }\n\n');

fprintf(fid_authors, '    .author_dropdown-content {\n');
fprintf(fid_authors, '      display: none;\n');
fprintf(fid_authors, '      position: absolute;\n');
fprintf(fid_authors, '      min-width: 380px;\n');
fprintf(fid_authors, '      overflow: auto;\n');
fprintf(fid_authors, '      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);\n');
fprintf(fid_authors, '      z-index: 1;\n');
fprintf(fid_authors, '    }\n\n');

fprintf(fid_authors, '    .author_dropdown-content a {\n');
fprintf(fid_authors, '      color: black;\n');
fprintf(fid_authors, '      padding: 12px 16px;\n');
fprintf(fid_authors, '      text-decoration: none;\n');
fprintf(fid_authors, '      display: block;\n');
fprintf(fid_authors, '    }\n\n');

fprintf(fid_authors, '    .author_dropdown a:hover {background-color: #f1f1f1}\n\n');

fprintf(fid_authors, '    .show {display:block;}\n\n');

fprintf(fid_authors, '    #Input_an {\n');
fprintf(fid_authors, '      background-image: url(''img/searchicon.png'');\n');
fprintf(fid_authors, '      background-position: 2px -10px;\n');
fprintf(fid_authors, '      background-repeat: no-repeat;\n');
fprintf(fid_authors, '      width: 18%%;\n');
fprintf(fid_authors, '      font-size: 14px;\n');
fprintf(fid_authors, '      padding: 5px 10px 7px 40px;\n');
fprintf(fid_authors, '      border: 1px solid #ddd;\n');
fprintf(fid_authors, '      margin-bottom: 12px;\n');
fprintf(fid_authors, '    }\n\n');

fprintf(fid_authors, '    #author_nm {\n');
fprintf(fid_authors, '      list-style-type: none;\n');
fprintf(fid_authors, '      padding: 0;\n');
fprintf(fid_authors, '      margin: 0;\n');
fprintf(fid_authors, '    }\n\n');

fprintf(fid_authors, '    #author_nm li a {\n');
fprintf(fid_authors, '      border: 1px solid #ddd;\n');
fprintf(fid_authors, '      margin-top: -1px; /* Prevent double borders */\n');
fprintf(fid_authors, '      background-color: #FFFFFF;\n');
fprintf(fid_authors, '      border-color: #FFFFFF;\n');
fprintf(fid_authors, '      padding: 12px;\n');
fprintf(fid_authors, '      text-decoration: none;\n');
fprintf(fid_authors, '      font-size: 16px;\n');
fprintf(fid_authors, '      color: black;\n');
fprintf(fid_authors, '      display: block;\n');
fprintf(fid_authors, '    }\n\n');

fprintf(fid_authors, '  </style>\n');
fprintf(fid_authors, '  <script src="sys/jscripts.js"></script>\n');
fprintf(fid_authors, '</head>\n\n');
fprintf(fid_authors, '<body>\n\n');

fprintf(fid_authors, '<div w3-include-html="sys/wallpaper_amp.html"></div>\n');
fprintf(fid_authors, '<div w3-include-html="sys/toolbar_amp.html"></div>\n');
	
fprintf(fid_authors, '<div id="main">\n');
fprintf(fid_authors, '  <div id="main-wrapper">    \n');
fprintf(fid_authors, '    <div id="contentFull">\n\n');
fprintf(fid_authors, '      <H2><a href="" title="Locate entries via authors and submission/modification dates by clicking on names.\n');
fprintf(fid_authors, '           Click on entry names to goto entries.">Authors and their submitted entries</a></H2>\n\n');

fprintf(fid_authors, '      <div>\n');
fprintf(fid_authors, '        <input type="text" id="Input_an" onkeyup="Function_an()" placeholder="Search for author names.." title="Type in a name">\n');
fprintf(fid_authors, '      </div>\n\n');

fprintf(fid_authors, '      <div class="newspaper">\n');  
fprintf(fid_authors, '        <ul id="author_nm">\n');
for i = 1:na % scan all authors
fprintf(fid_authors, '          <li>\n');
fprintf(fid_authors, '            <div class="author_dropdown">\n');

    % get lists of entries and dates for current author
    txt_entry = cell(0); txt_date = cell(0); date_num = [];
    for k = 1:ne % scan all entries
      if sum(strcmp(author{i}, authorDate{k,1})) 
        txt_entry = [txt_entry; entries{k}];
        date_num = [date_num; datenum(dates{k,1})];
        txt_date = [txt_date; datestr(date_num(end), 'yyyy/mm/dd')];
      end
    end
    nr = length(date_num);
    
    % sort entries on dates for current author
    [nm, ind] = sort(date_num,'descend');
    txt_entry = txt_entry(ind); txt_date = txt_date(ind);
    
fprintf(fid_authors, '              <button onclick="entries(''%s'')" class="author_dropbtn"><a href="#">%s %s</a></button>\n', fam{i},num2str(nr),author{i});
fprintf(fid_authors, '              <div id="%s" class="author_dropdown-content">\n',fam{i});

    for k = 1:nr % scan all dates/entries for current author
fprintf(fid_authors, '                 <a target="_top" href="entries_web/%s/%s_res.html">%s %s</a>\n', txt_entry{k},txt_entry{k},txt_date{k},txt_entry{k});
    end
 
fprintf(fid_authors, '              </div>\n');
fprintf(fid_authors, '            </div>\n');
fprintf(fid_authors, '          </li>\n\n');
end
fprintf(fid_authors, '        </ul>\n');
fprintf(fid_authors, '      </div> <!-- end of newspaper -->\n\n'); 

fprintf(fid_authors, '      <script>\n');
fprintf(fid_authors, '        function Function_an() {\n');
fprintf(fid_authors, '          var input, filter, ul, li, a, i;\n');
fprintf(fid_authors, '          input = document.getElementById("Input_an");\n');
fprintf(fid_authors, '          filter = input.value.toUpperCase();\n');
fprintf(fid_authors, '          ul = document.getElementById("author_nm");\n');
fprintf(fid_authors, '          li = ul.getElementsByTagName("li");\n');
fprintf(fid_authors, '          for (i = 0; i < li.length; i++) {\n');
fprintf(fid_authors, '            a = li[i].getElementsByTagName("a")[0];\n');
fprintf(fid_authors, '            if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
fprintf(fid_authors, '              li[i].style.display = "";\n');
fprintf(fid_authors, '            } else {\n');
fprintf(fid_authors, '              li[i].style.display = "none";\n');
fprintf(fid_authors, '            }\n');
fprintf(fid_authors, '          }\n');
fprintf(fid_authors, '        }\n\n');

fprintf(fid_authors, '        function entries(fam) {\n');
fprintf(fid_authors, '          document.getElementById(fam).classList.toggle("show");\n');
fprintf(fid_authors, '        }\n\n');

fprintf(fid_authors, '      </script>\n\n');

fprintf(fid_authors, '    </div> <!-- end of contentFull -->\n\n');

fprintf(fid_authors, '    <div w3-include-html="sys/footer_amp.html"></div>\n');
fprintf(fid_authors, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(fid_authors, '  </div> <!-- main wrapper -->\n');
fprintf(fid_authors, '</div> <!-- main -->\n');

fprintf(fid_authors, '</body>\n');
fprintf(fid_authors, '</html>\n');
fclose(fid_authors);
  
end

%% subfunction

function [sauthor, sfam] = sort_fam(author)
  % orders a cell-array of authors to their names after the last space
  
  n = length(author); fam = author;
  for i = 1:n
    name = author(i); name = name{:}; 
    name(1:max(strfind(name, ' '))) = [];
    fam(i) = {name};
  end
  [nm index] = sort(fam);
  sauthor = author(index);
  sfam = fam(index);
end