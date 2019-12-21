%% prt_about
% generates ../about.html, ../img/png's

%%
function prt_about
% created 2016/02/23 by Bas Kooijman; modified 2016/04/26, 2016/06/02, 2016/10/24, 2017/10/13, 2018/02/28

%% Syntax
% <../prt_about *prt_about*>

%% Description
% Runs plotting routines, creates png-files and link them in an html-file
%
% Output: 
%
%  * files are written in ../img/about: 
%
%      - entries.png, 
%      - pie_Animal.png
%      - pie_model.png  
%      - COMPLETE.png
%      - MRE.png
%      - COMPLETE_MRE.png
%      - MRE_SMSE.png
%      - DEBlib.png
%
% * file is written in ../../add_my_pet_web/about.html

%% Remarks
% First run write_allStat
% Don't forget to refresh species_tree_js with prt_species_tree_js.m
%   This is done automatically in run_collection_intro
% Don't forget to refresh ../../DEB Library.bib by exporting in Bibtex-mode from Zotero
% After running prt_about, copy png files to 
%   /home/websites/www.bio.vu.nl/webroot/thb/deb/deblab/add_my_pet/img
% and about.html file to
%   /home/websites/www.bio.vu.nl/webroot/thb/deb/deblab/add_my_pet
% to present them on the web.

close all

% write_allStat; % update Staristics structure allStat.mat

pie_Animalia;
tightfig;
saveas (gca, '../../img/about/pie_Animalia.png')
close all

pie_model;
tightfig;
saveas (gca, '../../img/about/pie_model.png')
close all

% # of entries in time
[dates, entries_new, dates_new] = get_date_subm;
surv_dates = surv(dates, 2006); 
surv_dates([1; end - 1; end],:) = [];    
n = size(surv_dates, 1)/2;
    
plot(surv_dates(:,1), n * (1 - surv_dates(:,2)), 'b', 'Linewidth', 2)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('time, yr')
ylabel('# of AmP entries')
xlim([2009; max(dates)])
title([num2str(n), ' @ ', datestr(date,26)])
saveas (gca,'../../img/about/entries.png')
close all

% COMPLETE, MRE plots
CMS = read_allStat('COMPLETE', 'MRE', 'SMSE'); n_entries = size(CMS,1);
C_median = median(CMS(:,1)); M_median = median(CMS(:,2)); S_median = median(CMS(:,3));
plot(CMS(:,1), CMS(:,2), '.b', 'MarkerSize', 20)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('COMPLETE'); ylabel('MRE')
saveas (gca,'../../img/about/COMPLETE_MRE.png')
close all

plot(CMS(:,2), CMS(:,3), '.b', 'MarkerSize', 20)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('MRE'); ylabel('SMSE')
xlim([0 0.55]); ylim([0 0.55])
saveas (gca,'../../img/about/MRE_SMSE.png')
close all

surv_COMPLETE = surv(CMS(:,1),0);
plot([0; C_median; C_median], [0.5;0.5;0], 'r', surv_COMPLETE(:,1), surv_COMPLETE(:,2), 'b', 'Linewidth', 2)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('COMPLETE'); ylabel('survivor function')
saveas (gca,'../../img/about/COMPLETE.png')
close all

surv_MRE = surv(CMS(:,2),0);
plot([0; M_median; M_median], [0.5;0.5;0], 'b', surv_MRE(:,1), surv_MRE(:,2), 'b', 'Linewidth', 2)
surv_SMSE = surv(CMS(:,3),0); hold on
plot([0; S_median; S_median], [0.5;0.5;0], 'r', surv_SMSE(:,1), surv_SMSE(:,2), 'r', 'Linewidth', 2)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('(Symmetic) Mean (Squared) Relative Error')
ylabel('survivor function')
xlim([0 0.55])
saveas (gca,'../../img/about/MRE.png')
close all

% # of DEB papers in time
dates = get_date_DEB('../../DEB Library.bib'); % requires update via Zotero
dates = [dates; (datenum(date) - datenum('01-Jan-000'))/365.25];
surv_dates = surv(dates, 1979); 
surv_dates([1; end - 1; end],:) = [];    
n = 1 + size(surv_dates, 1)/2;
    
plot(surv_dates(:,1), n * (1 - surv_dates(:,2)), 'b', 'Linewidth', 2)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('time, yr')
ylabel('# of DEB publications')
xlim([1979; max(dates)])
title([num2str(n), ' @ ', datestr(date,26)])
saveas (gca,'../../img/about/DEBlib.png')
close all

% Write about.html
path = 'entries_web/'; % path to entries
fid_about = fopen('../../add_my_pet_web/about.html', 'w+'); % open file for writing, delete existing content

fprintf(fid_about, '<!DOCTYPE html>\n');
fprintf(fid_about, '<HTML>\n');
fprintf(fid_about, '<HEAD>\n');
fprintf(fid_about, '  <TITLE>About AmP</TITLE>\n');
fprintf(fid_about, '  <link rel="stylesheet" type="text/css" href="sys/style.css"> \n');
fprintf(fid_about, '  <script src="sys/dropdown.js"></script>\n');
fprintf(fid_about, '  <script src="sys/w3data.js"></script>\n');
fprintf(fid_about, '  <script type="text/javascript" language="javascript">\n');
fprintf(fid_about, '    function changeImage(img){\n');
fprintf(fid_about, '      document.getElementById(''daphnia'').src=img;\n');
fprintf(fid_about, '    }\n');
fprintf(fid_about, '  </script>\n');
fprintf(fid_about, '</HEAD>\n\n');
fprintf(fid_about, '<BODY>\n\n');

fprintf(fid_about, '<div w3-include-html="sys/wallpaper_amp.html"></div>\n');
fprintf(fid_about, '<div w3-include-html="sys/toolbar_amp.html"></div>\n');
fprintf(fid_about, '<script>w3IncludeHTML();</script>\n\n');

fprintf(fid_about, '<!--------------------------------------------------------------->\n');
fprintf(fid_about, '<!--   PART main                                               -->\n');
fprintf(fid_about, '<!--   Where all of the text is placed                         -->\n');
fprintf(fid_about, '<!--   use "contentFull" for 1 column                          -->\n');
fprintf(fid_about, '<!--   use "content" if you want two columns"                  -->\n');
fprintf(fid_about, '<!--------------------------------------------------------------->\n'); 
fprintf(fid_about, '<div id = "main">\n');
fprintf(fid_about, '  <div id = "main-wrapper">    \n');
fprintf(fid_about, '    <div id="content">\n');

%%
fprintf(fid_about, '      <H1 id = "portaltop">About Add-my-Pet</H1>\n'); 
fprintf(fid_about, '      <H2 id = "aims">Overview of the collection</H2>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/pie_Animalia.png" width="350px">\n');
fprintf(fid_about, '        <div class = "caption">\n');
fprintf(fid_about, '          The collection is complete for large <a href="phyla.html" target="_blank">phyla</a>. \n');
fprintf(fid_about, '          Chordates are complete at order level, primates at family level.\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/pie_model.png" width="350px"> \n');
fprintf(fid_about, '        <div class = "caption"><font color = "magenta">\n');
fprintf(fid_about, '          A <a href="http://www.debtheory.org/wiki/index.php?title=Typified_models" target="_blank">variety of related models</a> \n');
fprintf(fid_about, '          captures animal life-cycle diversity and quantifies properties in <a href="pars.html" target="_blank">parameters</a>.</font>\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <h2 class="clear"></h2>\n');
fprintf(fid_about, '      Although <a href = "http://www.debtheory.org/wiki/" target = "_blank">Dynamic Energy Budget (DEB) theory</a> applies to all organisms, \n');
fprintf(fid_about, '        the AmP collection only deals with <a href="phyla.html">animals</a>. \n');
fprintf(fid_about, '      The reason is that animals eat other organisms, which don''t vary that much in chemical composition. \n');
fprintf(fid_about, '      Given the habitat, their environment can be characterized by the variables food availability and temperature as a first rough approximation. \n');
fprintf(fid_about, '      This characterisation is hard to make "complete" for other organisms, which hampers comparison. \n');
fprintf(fid_about, '      Comparison is the most useful asset of this collection.\n\n');

fprintf(fid_about, '      <p>\n');
fprintf(fid_about, '      At 2018/01/01, when the collection had 1000 entries, there were \n');
fprintf(fid_about, '      112 <a href="http://www.debtheory.org/wiki/index.php?title=Zero-variate_data" TARGET="_blank">zero-variate data types</a>, and \n');
fprintf(fid_about, '      153 <a href="http://www.debtheory.org/wiki/index.php?title=Uni-variate_data" TARGET="_blank">univariate data types</a>, in \n');
fprintf(fid_about, '      588 combinations, written by 125 <a href = "authors.html">authors</a>. \n');
fprintf(fid_about, '      So, few entries share the same data type combination and the number of data types is very much larger than the number of parameters. \n');
fprintf(fid_about, '      This argues for comparison on the basis of parameters, since all parameters were estimated for all species. \n');
fprintf(fid_about, '      Moreover, by being mechanistic (= based on first principles), DEB models interprete data, rather than just describe it, so can reveal inconsistencies in data \n');
fprintf(fid_about, '        and predict un-measured properties of species as functions of parameters.\n\n');

fprintf(fid_about, '      <p>\n');
fprintf(fid_about, '      Apart from extant species, the collection also has a number of extinct ones, demonstrating that DEB models can still be applied if data availability is poor.\n');
fprintf(fid_about, '      Examples are: \n');
fprintf(fid_about, '        <a href="entries_web/Deinosuchus_rugosus/Deinosuchus_rugosus_res.html">Deinosuchus</a>,\n');
fprintf(fid_about, '        <a href="entries_web/Pterodaustro_guinazui/Pterodaustro_guinazui_res.html">Pterodaustro</a>,\n');
fprintf(fid_about, '        <a href="entries_web/Tyrannosaurus_rex/Tyrannosaurus_rex_res.html">Tyrannosaurus</a>,\n');
fprintf(fid_about, '        <a href="entries_web/Archaeopteryx_lithographica/Archaeopteryx_lithographica_res.html">Archaeopteryx</a>,\n');
fprintf(fid_about, '        <a href="entries_web/Pinguinus_impennis/Pinguinus_impennis_res.html">great auk</a> and \n');
fprintf(fid_about, '        <a href="entries_web/Hydrodamalis_gigas/Hydrodamalis_gigas_res.html">Steller''s sea cow</a>. \n');
fprintf(fid_about, '      Needless to say, however: more data generally reduces uncertainty in parameter values.\n\n');

fprintf(fid_about, '      <h2 class="clear">Data completeness and mean relative errors</h2>\n\n');  

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/COMPLETE.png" width="350px">\n');
fprintf(fid_about, '        <div class = "caption">   \n');
fprintf(fid_about, '          <a href="" title="A survivor function gives the fraction that exceeds the value of the argument">Survivor function</a> of <a href="http://www.debtheory.org/wiki/index.php?title=Completeness" target="_blank">data completeness</a>.\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/MRE.png" width="350px">\n');
fprintf(fid_about, '        <div class = "caption">   \n');
fprintf(fid_about, '          Survivor functions of the <a href="http://www.debtheory.org/wiki/index.php?title=AmP_estimation_procedure#Data_quality_and_availability" target="_blank">Mean Relative Error (MRE) and Symmetric Mean Squared Error (SMSE)</a>.\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/COMPLETE_MRE.png" width="350px">\n');
fprintf(fid_about, '        <div class = "caption">   \n');
fprintf(fid_about, '          The relationship between mean relative error and data completeness. \n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/MRE_SMSE.png" width="350px">\n');
fprintf(fid_about, '        <div class = "caption">\n');
fprintf(fid_about, '        The relationship between <a href="http://www.debtheory.org/wiki/index.php?title=Symmetric_mean_squared_error" TARGET="_blanck">symmetric mean squared error (SMSE)</a> and mean relative error. \n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <div w3-include-html="sys/disclaimer.html"></div>\n');
fprintf(fid_about, '      <script>w3IncludeHTML();</script>\n\n');

fprintf(fid_about, '    </div> <!-- end of content -->\n\n');
%%
fprintf(fid_about, '    <!--------------------------------------------------------------->\n');
fprintf(fid_about, '    <!--   Sidebar                                                 -->\n');
fprintf(fid_about, '    <!--------------------------------------------------------------->\n');

fprintf(fid_about, '    <div id = "sidebar">\n\n');  

fprintf(fid_about, '      <H1 id = "portaltop"> &nbsp;</H1> <!--   This is here to make heading across both columns even  -->\n');   
fprintf(fid_about, '      <H2 class="clear">AmP entries in time </H2>\n\n');

fprintf(fid_about, '      <div class="sidelement">\n');
fprintf(fid_about, '        <img src="img/about/entries.png" width="350px">\n');
fprintf(fid_about, '        <div class = "caption">\n');
fprintf(fid_about, '          The Add-my-Pet collection started at 2009/02/12 as part of the \n');
fprintf(fid_about, '          <A HREF ="https://deb2019.sciencesconf.org/" target="_blank">DEB course</A>.<br>\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');
    
fprintf(fid_about, '      <TABLE id="t02"> <!-- Latest additions -->\n'); 
fprintf(fid_about, '        <TR><TH colspan="2"><b>Latest additions to the collection:</b></TH></TR>\n');
fprintf(fid_about, '        <TR>\n');
fprintf(fid_about,['          <TD WIDTH=300><a HREF = "', path, entries_new{1}, '/', entries_new{1}, '_res.html"><I>', entries_new{1}, '</I></a></TD>\n']);
fprintf(fid_about,['          <TD WIDTH=100>', dates_new(1,:), '</TD>\n']);
fprintf(fid_about, '        </TR>\n');
fprintf(fid_about, '        <TR>\n');
fprintf(fid_about,['          <TD WIDTH=300><a HREF = "', path, entries_new{2}, '/', entries_new{2}, '_res.html"><I>', entries_new{2}, '</I></a></TD>\n']);
fprintf(fid_about,['          <TD WIDTH=100>', dates_new(2,:), '</TD>\n']);
fprintf(fid_about, '        </TR>\n');
fprintf(fid_about, '        <TR>\n');
fprintf(fid_about,['          <TD WIDTH=300><a HREF = "', path, entries_new{3}, '/', entries_new{3}, '_res.html"><I>', entries_new{3}, '</I></a></TD>\n']);
fprintf(fid_about,['          <TD WIDTH=100>', dates_new(3,:), '</TD>\n']);
fprintf(fid_about, '        </TR>\n');
fprintf(fid_about, '        <TR>\n');
fprintf(fid_about,['          <TD WIDTH=300><a HREF = "', path, entries_new{4}, '/', entries_new{4}, '_res.html"><I>', entries_new{4}, '</I></a></TD>\n']);
fprintf(fid_about,['          <TD WIDTH=100>', dates_new(4,:), '</TD>\n']);
fprintf(fid_about, '        </TR>\n');
fprintf(fid_about, '        <TR>\n');
fprintf(fid_about,['          <TD WIDTH=300><a HREF = "', path, entries_new{5}, '/', entries_new{5}, '_res.html"><I>', entries_new{5}, '</I></a></TD>\n']);
fprintf(fid_about,['          <TD WIDTH=100>', dates_new(5,:), '</TD>\n']);
fprintf(fid_about, '        </TR>\n');
fprintf(fid_about, '      </TABLE>\n\n');

fprintf(fid_about, '      <H2 class="clear">DEB research & DEBtool</H2>\n\n');

fprintf(fid_about, '      <div>\n');
fprintf(fid_about, '        <center>\n');
fprintf(fid_about, '          <img src="img/about/daphnia1a.gif" width="160" id="daphnia" onmouseover="changeImage(''img/about/daphnia1b.gif'')"/>\n');
fprintf(fid_about, '        </center>\n');
fprintf(fid_about, '      </div>\n');
fprintf(fid_about, '      <div class = "caption" onmouseover="changeImage(''img/about/daphnia1a.gif'')">\n');
fprintf(fid_about, '        DEB research started in the spring of 1979 \n');
fprintf(fid_about, '          with a study on how toxicants affect reproduction in the waterflea <i>Dapnia magna</i>, \n');
fprintf(fid_about, '          including consequences for populations.<br>\n'); 
fprintf(fid_about, '        Software package <a href="/thb/deb/deblab/debtool/DEBtool_M/manual/" target="_top">DEBtool</a> was developed \n');
fprintf(fid_about, '          since 2000 to support applications of DEB theory, such as Add-my-Pet.\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <H2 class="clear">DEB publications in time</H2>\n\n');

fprintf(fid_about, '      <div class="sidelement">\n');
fprintf(fid_about, '        <img src="img/about/DEBlib.png" width="350px">\n');
fprintf(fid_about, '        <div class = "caption">   \n');
fprintf(fid_about, '          Publications in which DEB theory plays a substantial role.\n');
fprintf(fid_about, '          <a HREF ="https://www.zotero.org/groups/500643/deb_library/" target="_blank">They can be found in the DEB library on Zotero</a>, \n');
fprintf(fid_about, '          including all pdf''s, which you can access if you become <a href="index.html#DEBlib">member</a> (no fees).\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <H2 class="clear">Background documentation </H2>\n\n');
    
fprintf(fid_about, '      <a href="http://www.debtheory.org/wiki/index.php?title=AmP_estimation_procedure#References:_Add-my-pet_papers" TARGET="_blank">\n');
fprintf(fid_about, '      An increasing number of papers has been published on the add-my-pet collection, \n');
fprintf(fid_about, '        both on the methodology and ecological and evolutionary patterns in parameter values among species.</a>\n\n');

fprintf(fid_about, '      <p>\n');
fprintf(fid_about, '      Many papers have been written on specific entries, which have been cited at entry-pages. \n');

fprintf(fid_about, '    </div> <!-- end of sidebar -->\n\n');

fprintf(fid_about, '    <div w3-include-html="sys/footer_amp.html"></div>\n');
fprintf(fid_about, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(fid_about, '  </div> <!-- main wrapper -->\n');
fprintf(fid_about, '</div> <!-- main -->\n\n');
% ----------------------------------------------------------
fprintf(fid_about, '</BODY>\n');
fprintf(fid_about, '</HTML>\n');
fclose(fid_about);

