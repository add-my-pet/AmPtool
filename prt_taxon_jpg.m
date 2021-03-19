%% prt_taxon_jpg
% Creates taxon_jpg.html in current directory

%%
function prt_taxon_jpg(taxon)
% created 2021/03/07 Bas Kooijman

%% Syntax
% <../prt_taxon_jpg.m *prt_taxon_jpg*> 

%% Description
% Writes html file with jpg's with name taxon_jpg.html in current directory, where taxon is replaced by name of taxon.
% The html is opened in the system browser.
% A click on a picture opens species_tree.html at the clicked taxon, where you can see the name of the species and its phylogenetic position.
% Refresh the picture-page if you return to it, to reset previous selections.
%
% Input
%
% * taxon: string with name of taxon

%% Example of use
% prt_taxon_jpg('Mollusca'), which results in opening Mollusca_jpg.html

  taxa = list_taxa(taxon,1); n_taxa = length(taxa); n_jpg = 4;
  fnm = [taxon, '_jpg.html']; oid = fopen(fnm, 'w+'); % open file for writing, delete existing content
  path2jpg = [set_path2server, 'add_my_pet/img/tree/'];
  path2sys = [set_path2server, 'add_my_pet/sys/'];
  path2amp = [set_path2server, 'add_my_pet/'];
     
  fprintf(oid, '<!DOCTYPE html>\n');
  fprintf(oid, '<html>\n');
  fprintf(oid, '<head>\n');
  fprintf(oid, '  <title>%s</title>\n', taxon);
  fprintf(oid, '  <link rel="stylesheet" type="text/css" href="%sstyle.css">\n\n', path2sys); 
  
  fprintf(oid, '  <script src="%sw3data.js"></script>\n', path2sys);
  fprintf(oid, '  <script src="%sftiens4.js"></script>\n', path2sys);
  fprintf(oid, '  <script src="%sspecies_tree_Animalia.js"></script>\n\n', path2sys);
  
  fprintf(oid, '  <script>\n'); 
  fprintf(oid, '    if (document.taxonSearch == undefined) {\n');
  fprintf(oid, '      document.taxonSearch = "";\n');
  fprintf(oid, '    }\n\n');

  fprintf(oid, '    function shTree(taxon) {\n');
  fprintf(oid, '      SetCookie("clickedFolder", taxon);\n');
  fprintf(oid, '      var newURL = "%sspecies_tree_Animalia.html"  + ''?pic="'' + taxon + ''.jpg"'';\n', path2amp);
  fprintf(oid, '      newwin = window.open(newURL);\n');
  fprintf(oid, '      newwin.document.taxonSearch = taxon;\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '  </script>\n\n');
  
  fprintf(oid, '  <style>\n');
  fprintf(oid, '    body {\n');
  fprintf(oid, '      background: #ffffff\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '    .jpgrow{\n');
  fprintf(oid, '      max-width: 1080px;\n');
  fprintf(oid, '      float: left;\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '    .jpg{\n');
  fprintf(oid, '      position: relative;\n');
  fprintf(oid, '      display: inline-block;\n');
  fprintf(oid, '      float: left;\n');
  fprintf(oid, '      padding: 5px;\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '    .jpgcap{\n');
  fprintf(oid, '      text-align: center;\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '  </style>\n');
  fprintf(oid, '</head>\n\n');
  fprintf(oid, '<body>\n\n');


  fprintf(oid, '<div id = "main">\n');
  fprintf(oid, '  <div id = "main-wrapper">\n');
  fprintf(oid, '    <div id="contentFull">\n\n');
			
  for i = 1:n_taxa
    
    if mod(i,n_jpg) == 1
      fprintf(oid, '      <div class="jpgrow">\n');
    end
    fprintf(oid, '        <div class="jpg">\n');
    fprintf(oid, '          <img src="%s%s.jpg"  width="260px" onclick="shTree(''%s'')">\n', path2jpg, taxa{i}, taxa{i});
    fprintf(oid, '          <div class="jpgcap">%s</div>\n', taxa{i});
    fprintf(oid, '        </div><!-- end of jpg -->\n');

    if mod(i,n_jpg) == 0 
      fprintf(oid, '      </div><!-- end of jpgrow -->\n\n');
    end
  end % end of entry scan

  if mod(i,n_jpg) > 0 % close last div if necessary
    fprintf(oid, '      </div><!-- end of jpgrow -->\n\n');    
  end

  fprintf(oid, '    </div> <!-- end of content -->\n\n');

  fprintf(oid, '  </div> <!-- main wrapper -->\n');
  fprintf(oid, '</div> <!-- main -->\n');
  fprintf(oid, '</body>\n');
  fprintf(oid, '</html>\n');
  
  fclose(oid);
  web(fnm,'-browser')

end


