%% prt_SpecPerGenus
% Print list of genera with number of AmP entries for a taxon SpecPerGenus.html

%%
function [nm, n_spec] = prt_SpecPerGenus(taxon)
  % created by Bas Kooijman 2023/01/18
  
  %% Syntax 
  % [nm, n_spec] = <../prt_SpecPerGenus.m *prt_SpecPerGenus*>(taxon)
  
  %% Description
  % Print list of genera with number of AmP entries for a taxon to SpecPerGenus.html in local directory and open it in browser. 
  % Click on names to go to species_tree.
  %
  % Input:
  %
  % * taxon: optional string with name of taxon (default 'Animalia')
  %
  % Output
  %
  % * nm: n-cellstring with names of genera
  % * n_spec: n-vector number of entries per genus
  
  %% Remarks
  % If species_tree does not open correctly, click on picture to reload.
  % Visit
  % <file:///C:/Users/bas.xps/Documents/deb/deblab/add_my_pet/entries_zip/
  % *AmP/entries_zip/*> for the zip-files.
  
  %% Example of use 
  % prt_SpecPerGenus('Amphibia');

  path = [set_path2server, 'add_my_pet/'];
  if ~exist('taxon','var')
    taxon = 'Animalia';
  end
  nm = list_taxa(taxon, 3); % genera
  version = datestr(datenum(date),'yyyy/mm/dd');

  n_gen = length(nm); n_spec = zeros(n_gen,1);
  for i=1:n_gen
    n_spec(i) = length(select(nm{i})); % number of species
  end

  % prepare for writing SpecPerGenus.html
  fid_SpG = fopen('SpecPerGenus.html', 'w+'); % open file for writing, delete existing content
  
  % write header for SpecPerGenus.html :
  fprintf(fid_SpG, '<!DOCTYPE html>\n');
  fprintf(fid_SpG, '<html>\n');
  fprintf(fid_SpG, '<head>\n');
  fprintf(fid_SpG, '  <title>SpecPerGenus</title>\n');
  fprintf(fid_SpG, '  <link rel="stylesheet" type="text/css" href="%ssys/style.css">\n', path);
  fprintf(fid_SpG, '  <style>\n');
  fprintf(fid_SpG, '    body {\n');
  fprintf(fid_SpG, '      background-color: white;\n');
  fprintf(fid_SpG, '    }\n\n');

  fprintf(fid_SpG, '    .Search {\n');
  fprintf(fid_SpG, '      float: right;\n');
  fprintf(fid_SpG, '      width: 10%%; /* Width of search field */\n');
  fprintf(fid_SpG, '      font-size: 14px; /* Increase font-size */\n');
  fprintf(fid_SpG, '      padding: 5px 5px 7px 5px; /* Add some padding */\n');
  fprintf(fid_SpG, '      margin-bottom: 12px; /* Add some space below the input */\n');
  fprintf(fid_SpG, '    }\n\n');

  fprintf(fid_SpG, '    #genera {\n');
  fprintf(fid_SpG, '      list-style-type: '''';\n');
  fprintf(fid_SpG, '    }\n\n');

  fprintf(fid_SpG, '    .newspaper {\n');
  fprintf(fid_SpG, '      -webkit-column-count: 5; /* Chrome, Safari, Opera */\n');
  fprintf(fid_SpG, '      -moz-column-count: 5; /* Firefox */\n');
  fprintf(fid_SpG, '      column-count: 5;\n');
  fprintf(fid_SpG, '    }\n');
  fprintf(fid_SpG, '  </style>\n');
  fprintf(fid_SpG, '  <script src="%ssys/jscripts.js"></script>\n', path);
  fprintf(fid_SpG, '</head>\n\n');
  fprintf(fid_SpG, '<body>\n\n');
	
  fprintf(fid_SpG, '<div>\n');
  fprintf(fid_SpG, '  <div id="main-wrapper">    \n');
  fprintf(fid_SpG, '    <div id="contentFull">\n\n');
  fprintf(fid_SpG, '      <H2><a href="" title="Click on a name to go to species-tree and on the picture to re-load, in case of unsuccessful loading">');
  fprintf(fid_SpG, '        Genera of %s with number of AmP entries</a> %s\n', taxon, version);
  fprintf(fid_SpG, '        <div class="Search">\n');
  fprintf(fid_SpG, '          <input id="select" type="text" onkeyup="searchList()" placeholder="select >0">\n');
  fprintf(fid_SpG, '        </div>\n');
  fprintf(fid_SpG, '      </H2>\n\n');

  fprintf(fid_SpG, '      <table id="t00"><tr><td>\n');  
  fprintf(fid_SpG, '      <div class="newspaper">\n');  
  fprintf(fid_SpG, '        <ul id="genera">\n');
  for i = 1:n_gen % scan all genera
  fprintf(fid_SpG, '          <li class="%d"><a onclick="OpenTreeAtTaxonLoc(''%s'')">%s %g</a></li>\n', n_spec(i), nm{i}, nm{i}, n_spec(i));
  end
  fprintf(fid_SpG, '        </ul>\n');
  fprintf(fid_SpG, '      </div> <!-- end of newspaper -->\n'); 
  fprintf(fid_SpG, '      </td></tr></table>\n\n');  

  fprintf(fid_SpG, '      <script>\n');
  fprintf(fid_SpG, '        function searchList() {\n');
  fprintf(fid_SpG, '          // Declare variables\n');
  fprintf(fid_SpG, '          var ul, li, i, n, nSel;\n');
  fprintf(fid_SpG, '          nSel = Number(document.getElementById("select").value);\n');
  fprintf(fid_SpG, '          ul = document.getElementById("genera");\n');
  fprintf(fid_SpG, '          li = ul.getElementsByTagName("li");\n\n');

  fprintf(fid_SpG, '          // Loop through all items, and hide those who don''t match the search query\n');
  fprintf(fid_SpG, '          for (i = 0; i < li.length; i++) {\n');
  fprintf(fid_SpG, '            n = Number(li[i].className);\n');
  fprintf(fid_SpG, '            if (n > nSel) {\n');
  fprintf(fid_SpG, '              li[i].style.display = "";\n');
  fprintf(fid_SpG, '            } else {\n');
  fprintf(fid_SpG, '              li[i].style.display = "none";\n');
  fprintf(fid_SpG, '            }\n');
  fprintf(fid_SpG, '          }\n');
  fprintf(fid_SpG, '        }\n\n');

  fprintf(fid_SpG, '        function OpenTreeAtTaxonLoc(taxon) {\n');
  fprintf(fid_SpG, '          var newURL = "%sspecies_tree_Animalia.html"  + ''?pic="'' + taxon + ''.jpg"'';\n', path);
  fprintf(fid_SpG, '          newwin = window.open(newURL);\n');
  fprintf(fid_SpG, '          SetCookie("clickedFolder", taxon);\n');
  fprintf(fid_SpG, '          newwin.document.taxonSearch = taxon;\n');
  fprintf(fid_SpG, '        }\n');    

  fprintf(fid_SpG, '      </script>\n\n');

  fprintf(fid_SpG, '    </div> <!-- end of contentFull -->\n\n');

  fprintf(fid_SpG, '  </div> <!-- main wrapper -->\n');
  fprintf(fid_SpG, '</div> <!-- main -->\n');

  fprintf(fid_SpG, '</body>\n');
  fprintf(fid_SpG, '</html>\n');
  fclose(fid_SpG);

  web('SpecPerGenus.html', '-browser')
  
end
