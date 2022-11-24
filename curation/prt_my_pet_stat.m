%% prt_my_pet_stat
% Prints my_pet_stat.html 

%%
function prt_my_pet_stat(metaData, metaPar, par, destinationFolder)
% created 2016/03/30 Starrlight; modified 2016/09/23 Starrlight Augustine; 
% 2016/11/05, 2017/05/18 2017/09/29, 2017/10/13, 2018/04/28, 2018/06/25, 2022/04/06 Bas Kooijman

%% Syntax
% <../prt_my_pet_stat.m *prt_my_pet_stat*> (metaData, metaPar, par, destinationFolder) 

%% Description
% Read and writes my_pet_stat.html and write png files in current folder (irrespective of destinationFolder). 
% This page contains a list of implied model properties of my_pet. 
% It calls AmPtool/curation/get_statfields to see what statistics are printed in which order on the web.
%
% Input:
%
% * metaData: structure (output of mydata_my_pet-file)
% * metaPar: structure (output of pars_init_my_pet-file)
% * par: structure (output of pars_init_my_pet-file)
% * destinationFolder: optional string with destination folder to which my_pet_stat.html is printed (default: current folder)

%% Example of use
% * load('results_my_pet.mat');
% prt_my_pet_stat(metaData, metaPar, par, destinationFolder)
% * Removes underscores and makes first letter of english name be in capital:
% * speciesprintnm = [strrep(metaData.species, '_', ' '), ' '];
% * speciesprintnm_en = strrep(metaData.species_en, '_', ' ');
% * if speciesprintnm_en(1)>='a' && speciesprintnm_en(1)<='z'
%   speciesprintnm_en(1)=char(speciesprintnm_en(1)-32);

f = 1; % ad libitum feeding
[stat, txtStat] = statistics_st(metaPar.model, par, metaData.T_typical, f);
stat.z = par.z; txtStat.label.z = 'zoom factor'; txtStat.units.z = '-'; % add zoom factor to statistics which are to be printed 

pie_SGGJR(metaData.species, metaPar.model, par, stat, destinationFolder); % print 4 png-files for energy allocation to destinationFolder

% flds = fieldnmnst_st(stat); % fieldnames of all statistics
[webStatFields, webColStat] = get_statfields(metaPar.model); % which statistics in what order should be printed in the table

if exist('destinationFolder','var')
  fileName = [destinationFolder, metaData.species, '_stat.html'];
else
  fileName = [metaData.species, '_stat.html'];    
end
oid = fopen(fileName, 'w+'); % % open file for writing, delete existing content

fprintf(oid, '<!DOCTYPE html>\n');
fprintf(oid, '<HTML>\n');
fprintf(oid, '<HEAD>\n');
fprintf(oid,['  <TITLE>',metaData.species,'</TITLE>\n']);
fprintf(oid, '  <link rel="stylesheet" type="text/css" href="../../sys/style.css">\n\n');

fprintf(oid, '  <script src="../../sys/jscripts.js"></script>\n');
fprintf(oid, '  <script src="../../sys/ftiens4.js"></script>\n');
fprintf(oid, '  <script src="../../sys/specJump.js"></script>\n');
fprintf(oid, '  <script src="../../sys/species_tree_Animalia.js"></script>\n\n');

fprintf(oid, '</HEAD>\n\n');
fprintf(oid, '<BODY>\n\n');

fprintf(oid, '<div w3-include-html="../../sys/wallpaper_entry.html"></div>\n');
fprintf(oid, '<div w3-include-html="../../sys/toolbar_entry.html"></div>\n');
fprintf(oid,['<div id="top2" w3-include-html="', metaData.species, '_toolbar.html"></div>\n']);

fprintf(oid, '<!--------------------------------------------------------------->\n');
fprintf(oid, '<!--   PART main                                               -->\n');
fprintf(oid, '<!--   Where all of the text is placed                         -->\n');
fprintf(oid, '<!--   use "contentFull" for 1 column                          -->\n');
fprintf(oid, '<!--   use "content" if you want two columns"                  -->\n');
fprintf(oid, '<!--------------------------------------------------------------->\n\n');

fprintf(oid, '<div id = "main">\n');
fprintf(oid, '  <div id = "main-wrapper">\n');
fprintf(oid, '    <div id="contentFull">\n');
fprintf(oid, '      <H1 id = "portaltop">Implied properties for this entry</H1>\n');	
			
% print out text before the tables
% fprintf(oid, '<H2>Implied properties for this entry</H2>');
fprintf(oid,['      <H2>Model: <a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/Typified_models.html" >&nbsp;', metaPar.model,' &nbsp;</a></H2>\n\n']);

% print SGJR pies
fprintf(oid, '      <H3>Energy investment, cumulated over the embryo period (left), and allocation during ontogeny</H3>\n');
fprintf(oid, '      <div>\n');
fprintf(oid,['        <a href = "../../pie_SGJRb.html#', metaData.species, '" >\n']);
fprintf(oid,['          <img src="', metaData.species, '_pie_SGJRb.png"  width="260px"></a>\n']);
fprintf(oid,['        <a href = "../../pie_pSGJRb.html#', metaData.species, '" >\n']);
fprintf(oid,['          <img src="', metaData.species, '_pie_pSGJRb.png" width="260px"></a>\n']);
fprintf(oid,['        <a href = "../../pie_pSGJRp.html#', metaData.species, '" >\n']);
fprintf(oid,['          <img src="', metaData.species, '_pie_pSGJRp.png" width="260px"></a>\n']);
fprintf(oid,['        <a href = "../../pie_pSGJRi.html#', metaData.species, '" >\n']);
fprintf(oid,['          <img src="', metaData.species, '_pie_pSGJRi.png" width="260px"></a>\n']);
fprintf(oid, '      </div>\n\n');
fprintf(oid, '      <div class = "caption">   \n');
fprintf(oid, '        Exploding sectors mean dissipation; numbers denote fractions of mobilized reserve.\n');
fprintf(oid, '        Endpoints are somatic maintenance S, growth G, maturity maintenance J, maturity or reproduction R.\n'); 
fprintf(oid, '        Growth is splitted into overhead and flux fixed in tissue.\n'); 
fprintf(oid, '        Reproduction overhead is not idicated, since it is payed at conversion of buffer to eggs/foetuses.\n'); 
fprintf(oid, '        The change in reserve equals assimilation p_A minus mobilization p_C.\n');
fprintf(oid, '        Wet weight W_w and total energy E_W exclude the reproduction buffer in adults.\n');
fprintf(oid, '        Pies link to budget pages.\n');
fprintf(oid, '      </div>\n\n');
fprintf(oid, '      <p><p>\n');

% print the table with the properties :    
fprintf(oid, '      <TABLE id = "t01">\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH colspan="4">Implied properties at typical temperature (%g deg. C) and abundant food</TH></TR>\n', K2C(metaData.T_typical));
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH>symbol</TH><TH> value</TH><TH> units</TH><TH> description</TH></TR>\n');
for i = 1:length(webStatFields)
  fprintf(oid, '        <TR BGCOLOR = "%s"> <TD>%s</TD> <TD>%g</TD> <TD>%s</TD><TD>%s</TD></TR>\n',...
    webColStat.(webStatFields{i}), webStatFields{i}, stat.(webStatFields{i}), ...
    txtStat.units.(webStatFields{i}), txtStat.label.(webStatFields{i}));
end 
fprintf(oid, '      </TABLE>\n\n');

fprintf(oid, '    </div> <!-- end of content -->\n\n');

fprintf(oid, '    <div w3-include-html="../../sys/footer_amp.html"></div>\n');
fprintf(oid, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(oid, '  </div> <!-- main wrapper -->\n');
fprintf(oid, '</div> <!-- main -->\n');

fprintf(oid, '</BODY>\n');
fprintf(oid, '</HTML>\n');

fclose(oid);
