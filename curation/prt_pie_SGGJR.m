%% prt_pie_SGGJR
% Creates pie_pSGGJRb.html, pie_pSGGJRp.html, pie_pSGGJRp.html, pie_SGGJRb.html    

%%
function prt_pie_SGGJR
% created 2017/05/12 Bas Kooijman, modified 2017/10/14

%% Syntax
% <../prt_pie_SGGJR.m *prt_pie_SGGJR*> 

%% Description
% Writes html files that present 4 types of allocation pies (png files) that are in dir
% add_py_pet/entries_web. These html-files should be parked in dir add_my_pet/add_my_pet_web/.
% Function select is used to identify all entries

%% Example of use
% prt_pie_SGGJR

  
  [nms_en entries] = read_allStat('species_en'); n_entries = length(entries);
  pie = {'pie_pSGJRb', 'pie_pSGJRp', 'pie_pSGJRi', 'pie_SGJRb'}; n_pie = length(pie);
  header = {'Energy budget at birth','Energy budget at puberty','Energy budget at ultimate','Cumulated energy budget over embryo period'};
  header_txt = {...
      ['Exploding sectors mean dissipation; numbers denote fractions of mobilized reserve.\n', ...
       'Endpoints are somatic maintenance S, growth G, maturity maintenance J, maturity R.\n', ...
       'Allocation to growth is splitted into overheads and the part that is fixed in tissue.\n', ...
       'The change in reserve equals assimilation p_A minus mobilization p_C. ', ...
       'Wet weight W_w and total energy E_W quantify body size. Pies link to entry pages.\n'], ...
      ['Exploding sectors mean dissipation; numbers denote fractions of mobilized reserve.\n', ...
       'Endpoints are somatic maintenance S, growth G, maturity maintenance J, maturity R.\n', ...
       'Allocation to growth is splitted into overheads and the part that is fixed in tissue.\n', ...
       'The change in reserve equals assimilation p_A minus mobilization p_C.\n', ...
       'Wet weight W_w and total energy E_W quantify body size. Pies link to entry pages.\n'], ...
      ['Exploding sectors mean dissipation; numbers denote fractions of mobilized reserve.\n', ...
       'Endpoints are somatic maintenance S, growth G, maturity maintenance J, reproduction R.\n', ...
       'Reproduction overheads are not plotted, since they are payed at the conversion of buffer contents to eggs/foetuses.\n', ...
       'The change in reserve equals assimilation p_A minus mobilization p_C.\n', ...
       'Wet weight W_w and total energy E_W exclude the reproduction buffer. Pies link to entry pages.'], ...
      ['Exploding sectors mean dissipation; numbers denote fractions of initial reserve E_0.\n', ...
       'The scaled reserve density at birth is e_b. Pies link to entry pages.\n']};

for  j = 1:n_pie % scan pies
    
oid = fopen(['../../deblab/add_my_pet/', pie{j}, '.html'], 'w+'); % open file for writing, delete existing content

fprintf(oid, '<!DOCTYPE html>\n');
fprintf(oid, '<HTML>\n');
fprintf(oid, '<HEAD>\n');
fprintf(oid, '  <TITLE>%s</TITLE>\n', pie{j});
fprintf(oid, '  <link rel="stylesheet" type="text/css" href="sys/style.css">\n'); 
fprintf(oid, '  <script src="sys/jscripts.js"></script>\n');
fprintf(oid, '  <style>\n');
fprintf(oid, '    .pierow{\n');
fprintf(oid, '      max-width: 1080px;\n');
fprintf(oid, '      float: left;\n');
fprintf(oid, '    }\n');
fprintf(oid, '    .pie{\n');
fprintf(oid, '      position: relative;\n');
fprintf(oid, '      display: inline-block;\n');
fprintf(oid, '      float: left;\n');
fprintf(oid, '      padding: 5px;\n');
fprintf(oid, '    }\n');
fprintf(oid, '    .piecap{\n');
fprintf(oid, '      text-align: center;\n');
fprintf(oid, '    }\n');
fprintf(oid, '    .headercap{\n');
fprintf(oid, '      text-align: center;\n');
fprintf(oid, '      max-width: 1000px;\n');
fprintf(oid, '    }\n');
fprintf(oid, '  </style>\n');
fprintf(oid, '</HEAD>\n\n');
fprintf(oid, '<BODY>\n\n');

fprintf(oid, '<div w3-include-html="sys/wallpaper_amp.html"></div>\n');
fprintf(oid, '<div w3-include-html="sys/toolbar_budget.html"></div>\n');

fprintf(oid, '<!--------------------------------------------------------------->\n');
fprintf(oid, '<!--   PART main                                               -->\n');
fprintf(oid, '<!--   Where all of the text is placed                         -->\n');
fprintf(oid, '<!--   use "contentFull" for 1 column                          -->\n');
fprintf(oid, '<!--   use "content" if you want two columns"                  -->\n');
fprintf(oid, '<!--------------------------------------------------------------->\n\n');

fprintf(oid, '<div id="main">\n');
fprintf(oid, '  <div id="main-wrapper">\n');
fprintf(oid, '    <div id="contentFull">\n');
fprintf(oid,['      <H1 id="pie" align="center">', header{j}, '</H1>\n']);	
fprintf(oid, '      <div class="headercap">\n');	
fprintf(oid,['        ', header_txt{j}, '<br>\n']);	
fprintf(oid, '      </div>\n');	
			

for i = 1:n_entries % print SGJR pies
nm_en = nms_en{i};  % get common name
if nm_en(1)>='a' && nm_en(1)<='z' % replace lower case by uppercase if necessary
  nm_en(1)=char(nm_en(1)-32);
end
if mod(i,4) == 1
fprintf(oid, '      <div class="pierow">\n');
end
fprintf(oid,['        <div class="pie" id="', entries{i},'">\n']);
fprintf(oid,['          <a href="entries_web/', entries{i}, '/', entries{i},'_stat.html">\n']);
fprintf(oid,['          <img src="entries_web/', entries{i}, '/', entries{i}, '_', pie{j}, '.png"  width="260px"></a>\n']);
fprintf(oid,'           <div class="piecap">\n');
fprintf(oid,['             <i>', strrep(entries{i}, '_', ' '), '</i><br>\n']);
fprintf(oid,['             ', nm_en, '\n']);
fprintf(oid,'           </div>\n');
fprintf(oid, '        </div><!-- end of pie -->\n');

if mod(i,4) == 0 
fprintf(oid, '      </div><!-- end of pierow -->\n\n');
end
end % end of entry scan

if mod(i,4) > 0 % close last div if necessary
fprintf(oid, '      </div><!-- end of pierow -->\n\n');    
end

fprintf(oid, '    </div> <!-- end of content -->\n\n');

fprintf(oid, '    <div w3-include-html="sys/footer_amp.html"></div>\n');
fprintf(oid, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(oid, '  </div> <!-- main wrapper -->\n');
fprintf(oid, '</div> <!-- main -->\n');

fprintf(oid, '</BODY>\n');
fprintf(oid, '</HTML>\n');

fclose(oid);

end

end


