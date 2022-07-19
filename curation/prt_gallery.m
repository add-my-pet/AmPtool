%% prt_gallery
% writes gallery.html with jpg's of nodes

%%
function prt_gallery
% created 2022/07/16 Bas Kooijman

%% Syntax
% <../prt_gallery.m *prt_gallery*> 

%% Description
% Writes gallery.html in directory add_my_pet with taxon jpg's, where taxon.
% The toolbar_gal.html, written by prt_toolbar has search/selection options.
% A click on a picture opens species_tree.html at the clicked taxon, where you can see the name of the species and its phylogenetic position.
% Refresh the picture-page if you return to it, to reset previous selections.
%
% Output:
% 
% * writes files ../../add_my_pet/gallery.html 
% * writes files ../../add_my_pet/sys/gallery_search.html for i = 1, 2, ..

%% Remarks
% The page show all taxa (genus-level and higher), but the search-dropdown only allows selection above the genus-level.

%% Example of use
% prt_gallery, which results in add_my_pet/gallery.html

  % for 3300 entries, there are 4000 taxa (excluding entries) and 2100 genera
  taxa = list_taxa('Animalia',1); n_taxa = length(taxa); % all taxa, except entries
  genus = list_taxa('Animalia',3); % all genera
  notGen = setdiff(taxa,genus); n_notGen = length(notGen); % all taxa, except entries and genera
  
  WD = cdCur; cd ../../deblab/add_my_pet
  fnm = 'gallery.html'; oid = fopen(fnm, 'w+'); % open file for writing, delete existing content
     
  fprintf(oid, '<!DOCTYPE html>\n');
  fprintf(oid, '<html>\n');
  fprintf(oid, '<head>\n');
  fprintf(oid, '  <title>%s</title>\n', 'Gallery');
  fprintf(oid, '  <link rel="stylesheet" type="text/css" href="sys/style.css">\n');
  
  fprintf(oid, '  <script src="sys/jscripts.js"></script>\n');
  fprintf(oid, '  <script src="sys/galSel.js"></script>\n');
  
  fprintf(oid, '  <script>\n'); 
  fprintf(oid, '    function shTree(taxon) {\n');
  fprintf(oid, '      var newURL = "species_tree_Animalia.html?pic=" + ''"'' + taxon + ".jpg" + ''"'';\n');
  fprintf(oid, '      newwin = window.open(newURL);\n');
  fprintf(oid, '      TreeSearch(taxon);\n');
  fprintf(oid, '    }\n\n'); 
  
  fprintf(oid, '    function InputGalSearch(Dropdown) {\n');
  fprintf(oid, '      var input, filter, ul, li, tag, i;\n');
  fprintf(oid, '      input = document.getElementById(Dropdown+''Input'');\n');
  fprintf(oid, '      filter = input.value.toUpperCase();\n');
  fprintf(oid, '      ul = document.getElementById(Dropdown+''Searchlist'');\n');
  fprintf(oid, '      li = ul.getElementsByTagName("li");\n\n');
  
  fprintf(oid, '      for (i = 0; i < li.length; i++) {\n');
  fprintf(oid, '        tag = li[i].getElementsByTagName("a")[0];\n');
  fprintf(oid, '        if (tag.innerHTML.toUpperCase().indexOf(filter) > -1) {\n');
  fprintf(oid, '          li[i].style.display = "block";\n');
  fprintf(oid, '        } else {\n');
  fprintf(oid, '          li[i].style.display = "none";\n');
  fprintf(oid, '        }\n');
  fprintf(oid, '      }\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    // Close the dropdown if the user clicks outside of it\n');
  fprintf(oid, '    window.onclick = function(event) {\n');
  fprintf(oid, '      if (!event.target.matches(''.galSearch_dropbtn'')) {\n');
  fprintf(oid, '        var dropdowns = document.getElementsByClassName("galSearch-content");\n');
  fprintf(oid, '        var i;\n');
  fprintf(oid, '        for (i = 0; i < dropdowns.length; i++) {\n');
  fprintf(oid, '          var openDropdown = dropdowns[i];\n');
  fprintf(oid, '          if (openDropdown.classList.contains(''show'')) {\n');
  fprintf(oid, '            openDropdown.classList.remove(''show'');\n');
  fprintf(oid, '          }\n');
  fprintf(oid, '        }\n');
  fprintf(oid, '      }\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '  </script>\n\n');

  fprintf(oid, '  <style>\n');
  fprintf(oid, '    .galSearch_dropbtn {\n');
  fprintf(oid, '      background-image: url(''img/searchicon.png''); /* Add a search icon to input */\n');
  fprintf(oid, '      background-position: 2px -10px; /* Position the search icon */\n');
  fprintf(oid, '      background-repeat: no-repeat; /* Do not repeat the icon image */\n');
  fprintf(oid, '      width: 80px; /* Width of search field */\n');
  fprintf(oid, '      font-size: 14px; /* Increase font-size */\n');
  fprintf(oid, '      padding: 5px 10px 7px 40px; /* Add some padding */\n');
  fprintf(oid, '      border: 1px solid #ddd; /* Add a grey border */\n');
  fprintf(oid, '      margin-bottom: 12px; /* Add some space below the input */\n');
  fprintf(oid, '      cursor: pointer;\n');  
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    .galSearch_dropbtn:hover, .galSearch_dropbtn:focus {\n');
  fprintf(oid, '      background-color: #f9f9f9;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    .galSearch {\n');
  fprintf(oid, '      position: relative;\n');
  fprintf(oid, '      display: inline-block;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    .galSearch-content {\n');
  fprintf(oid, '      display: none;\n');
  fprintf(oid, '      position: absolute;\n');
  fprintf(oid, '      background-color: #f9f9f9;\n');
  fprintf(oid, '      min-width: 100px;\n');
  fprintf(oid, '      overflow: auto;\n');
  fprintf(oid, '      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);\n'); 
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    .galSearch-content a {\n');
  fprintf(oid, '      color: black;\n');
  fprintf(oid, '      padding: 12px 16px;\n');
  fprintf(oid, '      text-decoration: none;\n');
  fprintf(oid, '      display: block;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    .show {display:block;}\n\n');

  fprintf(oid, '    div.galSearch {\n');
  fprintf(oid, '      padding: 20px 0px 0px 20px;\n');
  fprintf(oid, '      margin: 0px;\n');
  fprintf(oid, '      float: left;\n');
  fprintf(oid, '	  max-width: 180px;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    ul.galSearch {\n');
  fprintf(oid, '      list-style-type: none;\n');
  fprintf(oid, '      font-size: 14px;\n');
  fprintf(oid, '      margin: 0;\n');
  fprintf(oid, '      padding: 0;\n');
  fprintf(oid, '      line-height: 10%%;\n');
  fprintf(oid, '      max-width: 200px;\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    .jpg{\n');
  fprintf(oid, '      position: relative;\n');
  fprintf(oid, '      display: inline-block;\n');
  fprintf(oid, '      float: left;\n');
  fprintf(oid, '      padding: 5px;\n');
  fprintf(oid, '    }\n\n');
  
  fprintf(oid, '    .jpgcap{\n');
  fprintf(oid, '      text-align: center;\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '  </style>\n');
  fprintf(oid, '</head>\n\n');
  fprintf(oid, '<body>\n\n');

  fprintf(oid, '<div w3-include-html="sys/wallpaper_amp.html"></div>\n');
  fprintf(oid, '<div w3-include-html="sys/toolbar_gal.html"></div>\n\n');

  fprintf(oid, '<div id = "main">\n');
  fprintf(oid, '  <div id = "main-wrapper">\n');
  fprintf(oid, '    <div id="contentFull">\n\n');
			
  for i = 1:n_taxa % for each jpg is one jpgcap
    fprintf(oid, '      <div class="jpg"><img src="img/tree/%s.jpg"  width="260px" onclick="shTree(''%s'')"><div class="jpgcap">%s</div></div>\n', taxa{i},taxa{i},taxa{i});
  end 

  fprintf(oid, '    </div> <!-- end of contentFull -->\n\n');
  
  fprintf(oid, '    <div w3-include-html="sys/footer_amp.html"></div>\n');
  fprintf(oid, '    <script>w3IncludeHTML();</script>\n\n');

  fprintf(oid, '  </div> <!-- main wrapper -->\n');
  fprintf(oid, '</div> <!-- main -->\n');
  fprintf(oid, '</body>\n');
  fprintf(oid, '</html>\n');
  fclose(oid);
 
  % write galSel.js, which is used by dropdown galSearch in toolbar_gal.html of gallery.html for selection of taxa that are shown
  
  fid = fopen('sys/galSel.js', 'w+'); % open file for writing, delete existing content
  fprintf(fid, 'function galSel(taxon){\n');
  fprintf(fid, '  var i, id, taxa;\n');
  fprintf(fid, '  document.getElementById("taxon").innerHTML = "taxon;\n');
  fprintf(fid, '  const z = document.getElementsByClassName("jpg");\n');
  fprintf(fid, '  switch(taxon) {\n');
  for i = 1:n_notGen
    taxa = list_taxa(notGen{i},1); n_taxa = length(taxa);
    txt = '['; for j = 1:n_taxa; txt = [txt, '"', taxa{j}, '",']; end; txt(end) = ']';
    fprintf(fid, '    case ''%s'':\n', notGen{i});
    fprintf(fid, '      taxa = %s;\n', txt);
    fprintf(fid, '      for (i = 0; i < z.length; i++) {\n');
    fprintf(fid, '        id = document.getElementsByClassName("jpgcap")[i].innerHTML;\n');
    fprintf(fid, '        if (taxa.includes(id)) {\n');
    fprintf(fid, '          z[i].style.display = "";\n');
    fprintf(fid, '        } else {\n');
    fprintf(fid, '          z[i].style.display = "none";\n');
    fprintf(fid, '        }\n');
    fprintf(fid, '      } break;\n');
  end
  fprintf(fid, '    default:\n');
  fprintf(fid, '      for (i = 0; i < z.length; i++) {z[i].style.display = "";}\n');
  fprintf(fid, '      document.getElementById("taxon").innerHTML = "Animalia";\n');
  fprintf(fid, '  }\n');
  fprintf(fid, '}\n');
  fclose(fid);

  cd(WD)

end


