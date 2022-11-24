%% gallery_png
% Creates taxon_png.html in current directory with figures of directory entries

%%
function gallery_png(taxon)
% created 2021/06/24 Bas Kooijman

%% Syntax
% <../gallery_png.m *gallery_png*> (taxon)

%% Description
% Writes fig_png.html file with png's for figure files in the directory entries with name taxon_png.html in current directory, where taxon is replaced by name of taxon.
% The html is opened in the system browser.
% A click on a picture to go to the entry
%
% Input
%
% * pets: cell-array with names of entries

%% Remarks
% works only if all entries are locally available

%% Example of use
% gallery_png('Cephalopoda'), which results in opening Cephalopoda_png.html

  WD = pwd; % current work directory
  
  if isstring(taxon)
    pets = select(taxon); 
  else
    pets = taxon;
  end
  n_pets = length(pets); n_row = 4;
  fnm = 'fig_png.html'; oid = fopen(fnm, 'w+'); % open file for writing, delete existing content
  path2pet = [set_path2server, 'add_my_pet/entries/'];
  path2sys = [set_path2server, 'add_my_pet/sys/'];
  
  pet = cell(0,1); png = cell(0,1);
  for i = 1:n_pets
     cdEntr(pets{i});
     if ismac || isunix
       list = strsplit(ls); list(end) = [];
     else
       list = cellstr(ls);
     end
     list = list(Contains(list,'.png')); n_pngi = length(list);
     for j = 1: n_pngi
       pet = [pet; pets{i}]; png = [png; list{j}];
     end
  end
  n_png = length(png);
  
  cd(WD);
     
  fprintf(oid, '<!DOCTYPE html>\n');
  fprintf(oid, '<html>\n');
  fprintf(oid, '<head>\n');
  fprintf(oid, '  <title>%s</title>\n', fnm);
  fprintf(oid, '  <link rel="stylesheet" type="text/css" href="%sstyle.css">\n\n', path2sys); 
  
  fprintf(oid, '  <script src="%sw3data.js"></script>\n', path2sys);
  fprintf(oid, '  <script src="%sftiens4.js"></script>\n', path2sys);
  
  fprintf(oid, '  <style>\n');
  fprintf(oid, '    body {\n');
  fprintf(oid, '      background: #ffffff;\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '    .pngrow{\n');
  fprintf(oid, '      max-width: 1080px;\n');
  fprintf(oid, '      float: left;\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '    .png{\n');
  fprintf(oid, '      position: relative;\n');
  fprintf(oid, '      display: inline-block;\n');
  fprintf(oid, '      float: left;\n');
  fprintf(oid, '      padding: 5px;\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '    .pngcap{\n');
  fprintf(oid, '      text-align: center;\n');
  fprintf(oid, '    }\n');
  fprintf(oid, '  </style>\n');
  fprintf(oid, '</head>\n\n');
  fprintf(oid, '<body>\n\n');

  fprintf(oid, '<div id = "main">\n');
  fprintf(oid, '  <div id = "main-wrapper">\n');
  fprintf(oid, '    <div id="contentFull">\n\n');
			
  for i = 1:n_png
    
    if mod(i,n_row) == 1
      fprintf(oid, '      <div class="pngrow">\n');
    end
    fprintf(oid, '        <div class="png">\n');
    fprintf(oid, '          <img src="%s/%s/%s"  width="260px">\n', path2pet, pet{i}, png{i});
    fprintf(oid, '          <div class="pngcap"><a href="%s%s" target="_blank">%s</a></div>\n', path2pet, pet{i}, pet{i});
    fprintf(oid, '        </div><!-- end of png -->\n');

    if mod(i,n_row) == 0 
      fprintf(oid, '      </div><!-- end of pngrow -->\n\n');
    end
  end % end of entry scan

  if mod(i,n_row) > 0 % close last div if necessary
    fprintf(oid, '      </div><!-- end of pngrow -->\n\n');    
  end

  fprintf(oid, '    </div> <!-- end of content -->\n\n');

  fprintf(oid, '  </div> <!-- main wrapper -->\n');
  fprintf(oid, '</div> <!-- main -->\n');
  fprintf(oid, '</body>\n');
  fprintf(oid, '</html>\n');
  
  fclose(oid);
  web(fnm,'-browser')

  
end


function sel = Contains(nm, str)
  % this fuction is the same as Matlab built-in-function contains, but the R2016a version does not work with cell input
  n = length(nm); sel = true(n,1);
  for i=1:n
    sel(i) = ~isempty(strfind(nm{i}, str));
  end
end