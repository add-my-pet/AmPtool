%% prt_about
% generates ../about.html, ../img/png's

%%
function prt_about
% created 2016/02/23 by Bas Kooijman; modified 2016/04/26, 2016/06/02, 2016/10/24, 2017/10/13, 2018/02/28, 2021/02/20

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
% * First run write_allStat
% * Don't forget to refresh species_tree_js with prt_species_tree_js.m
%   This is done automatically in run_collection_intro
% * Don't forget to refresh ../../DEB Library.bib by exporting in Bibtex-mode from Zotero
% * After running prt_about, copy png files to 
%   /mnt/group-new/bio.vu.nl/webroot/thb/deb/deblab/add_my_pet/img
% * and about.html file to
%   /mnt/group-new/www.bio.vu.nl/webroot/thb/deb/deblab/add_my_pet
% to present them on the web.

WD = cdCur;
path = '../../deblab/add_my_pet/img/about/';

% write pies for taxa and models
close all
pie_Animalia;
tightfig;
saveas (gca, [path, 'pie_Animalia.png'])
close all
%
pie_model;
tightfig;
saveas (gca, [path, 'pie_model.png'])
close all

% # of entries in time
dates_subm = get_date_subm;
surv_dates_subm = [0 2009 ; surv(dates_subm, 2009)]; 
surv_dates_subm([end - 1; end],:) = [];    
n_subm = size(surv_dates_subm, 1)/2 - 2;
plot(surv_dates_subm(:,1), n_subm * (1 - surv_dates_subm(:,2)), 'b', 'Linewidth', 2)
hold on
%
[dates, entries_new, dates_new] = get_date_acc;
surv_dates = [0 2009 ; surv(dates, 2009)]; 
surv_dates([end - 1; end],:) = [];    
n = size(surv_dates, 1)/2 - 2;
%    
plot(surv_dates(:,1), n * (1 - surv_dates(:,2)), 'r', 'Linewidth', 2)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('time, yr')
ylabel('# of AmP entries')
xlim([2009; max(dates)])
title([num2str(length(dates)), ' @ ', datestr(date,26)])
saveas (gca, [path, 'entries.png'])
close all

% COMPLETE, MRE plots
CMS = read_allStat('COMPLETE', 'MRE', 'SMSE'); n_entries = size(CMS,1);
C_median = median(CMS(:,1)); M_median = median(CMS(:,2)); S_median = median(CMS(:,3));
plot(CMS(:,1), CMS(:,2), '.b', 'MarkerSize', 20)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('COMPLETE'); ylabel('MRE')
saveas (gca, [path, 'COMPLETE_MRE.png'])
close all
%
plot(CMS(:,2), CMS(:,3), '.b', 'MarkerSize', 20)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('MRE'); ylabel('SMSE')
xlim([0 0.55]); ylim([0 0.55])
saveas (gca, [path, 'MRE_SMSE.png'])
close all
%
surv_COMPLETE = surv(CMS(:,1),0);
plot([0; C_median; C_median], [0.5;0.5;0], 'r', surv_COMPLETE(:,1), surv_COMPLETE(:,2), 'b', 'Linewidth', 2)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('COMPLETE'); ylabel('survivor function')
saveas (gca, [path, 'COMPLETE.png'])
close all
%
surv_MRE = surv(CMS(:,2),0);
plot([0; M_median; M_median], [0.5;0.5;0], 'b', surv_MRE(:,1), surv_MRE(:,2), 'b', 'Linewidth', 2)
surv_SMSE = surv(CMS(:,3),0); hold on
plot([0; S_median; S_median], [0.5;0.5;0], 'r', surv_SMSE(:,1), surv_SMSE(:,2), 'r', 'Linewidth', 2)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('\color{red}{SMSE}\color{black}{,} \color{blue}{MRE}')
ylabel('survivor function')
xlim([0 0.55])
saveas (gca, [path, 'MRE.png'])
close all

% # of DEB papers in time
dates = get_date_DEB('../../DEB Library.bib'); % requires update via Zotero
dates = [dates; (datenum(date) - datenum('01-Jan-000'))/365.25];
surv_dates = surv(dates, 1979); 
surv_dates([1; end - 1; end],:) = [];    
n = 1 + size(surv_dates, 1)/2;
%    
plot(surv_dates(:,1), n * (1 - surv_dates(:,2)), 'b', 'Linewidth', 2)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('time, yr')
ylabel('# of DEB publications')
xlim([1979; max(dates)])
title([num2str(n), ' @ ', datestr(date,26)])
saveas (gca, [path, 'DEBlib.png'])
close all

% Write about.html
path = 'entries_web/'; % path to entries
fid_about = fopen('../../deblab/add_my_pet/about.html', 'w+'); % open file for writing, delete existing content

fprintf(fid_about, '<!DOCTYPE html>\n');
fprintf(fid_about, '<html>\n');
fprintf(fid_about, '<head>\n');
fprintf(fid_about, '  <title>About AmP</title>\n');
fprintf(fid_about, '  <link rel="stylesheet" type="text/css" href="sys/style.css"> \n');
fprintf(fid_about, '  <script src="sys/jscripts.js"></script>\n');
fprintf(fid_about, '  <script>\n');
fprintf(fid_about, '    function changeImage(img){\n');
fprintf(fid_about, '      document.getElementById(''daphnia'').src=img;\n');
fprintf(fid_about, '    }\n');
fprintf(fid_about, '  </script>\n');
fprintf(fid_about, '  <style>\n');
fprintf(fid_about, '    #disclaimer {\n');
fprintf(fid_about, '      padding: 10px 30px;\n');
fprintf(fid_about, '      width: 95%%;\n');
fprintf(fid_about, '    }\n');
fprintf(fid_about, '  </style>\n');
fprintf(fid_about, '</head>\n\n');
fprintf(fid_about, '<body>\n\n');
% ----------------------------------------------------------
fprintf(fid_about, '<div w3-include-html="sys/wallpaper_amp.html"></div>\n');
fprintf(fid_about, '<div w3-include-html="sys/toolbar_amp.html"></div>\n');

fprintf(fid_about, '<!--------------------------------------------------------------->\n');
fprintf(fid_about, '<!--   PART main                                               -->\n');
fprintf(fid_about, '<!--   Where all of the text is placed                         -->\n');
fprintf(fid_about, '<!--   use "contentFull" for 1 column                          -->\n');
fprintf(fid_about, '<!--   use "content" if you want two columns"                  -->\n');
fprintf(fid_about, '<!--------------------------------------------------------------->\n'); 
fprintf(fid_about, '<div id="main">\n');
fprintf(fid_about, '  <div id="main-wrapper">\n');
fprintf(fid_about, '    <div id="content">\n');
fprintf(fid_about, '      <h1 id="portaltop">About Add-my-Pet</h1>\n'); 
fprintf(fid_about, '      <h2 id="aims">Overview of the collection</h2>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/pie_Animalia.png" width="350px">\n');
fprintf(fid_about, '        <div class = "caption">\n');
fprintf(fid_about, '          The collection is complete for large <a href="phyla.html" target="_blank">phyla</a>.<br>\n');
fprintf(fid_about, '          Chordates are complete at order level,<br> primates at family level.\n');
fprintf(fid_about, '          <a href="https://youtu.be/kTZuaEle0zc" target="_blank"><img src="img/YouTube.png"  height = "15px" title="5:04"></a>\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/pie_model.png" width="350px">\n');
fprintf(fid_about, '        <div class="caption">\n');
fprintf(fid_about, '          A <a href="https://add-my-pet.github.io/DEBportal/docs/Typified_models.html" target="_blank">variety of related models</a>\n');
fprintf(fid_about, '          captures animal life-cycle diversity and quantifies properties in <a href="pars.html" target="_blank">parameters</a>.\n');
fprintf(fid_about, '          <a href="https://youtu.be/E4ag2-WzhmQ" target="_blank"><img src="img/YouTube.png"  height = "15px" title="14:14"></a>\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <h2 class="clear"></h2>\n');
fprintf(fid_about, '      Although <a href="https://add-my-pet.github.io/DEBportal/docs/index.html" target="_blank">Dynamic Energy Budget (DEB) theory</a> applies to all organisms,\n');
fprintf(fid_about, '        the AmP collection only deals with <a href="phyla.html">animals</a>.\n');
fprintf(fid_about, '      The reason is that animals eat other organisms, which don''t vary that much in chemical composition. \n');
fprintf(fid_about, '      Given the habitat, their environment can be characterized by the variables food availability and temperature as a first rough approximation.\n');
fprintf(fid_about, '      This characterisation is hard to make "complete" for other organisms, which hampers comparison.\n');
fprintf(fid_about, '      Comparison is the most useful asset of this collection.\n\n');

fprintf(fid_about, '      <p>\n');
fprintf(fid_about, '      To facilitate comparison, the estimated parameters are all expressed at the reference body temperature of 20 &deg;C,\n');
fprintf(fid_about, '        <a href="https://youtu.be/vqHmIW1kfQo" target="_blank"><img src="img/YouTube.png"  height = "15px" title="12:16"></a>\n');
fprintf(fid_about, '        even for endotherms and deep-sea or polar animals, which will probably be very dead at this temperature.\n');
fprintf(fid_about, '      So the temperature correction sometimes has academic elements, which needs to be remembered when it comes to making predictions.\n');
fprintf(fid_about, '      The extended Arrhenius model is used to account for effects of temperature:\n');
fprintf(fid_about, '        i.e. simple Arrhenius applies between a lower and an upper temperature boundary, but outside this tolerance range (dramatically) lower rates apply.\n');
fprintf(fid_about, '      In a few (e.g. polar) cases, where it was necessary to quantify rate reductions for increasing temperatures lower than the reference temperature,\n');
fprintf(fid_about, '        a different (i.e. lower) reference temperature had to be selected, which affects the comparability of species; \n');
fprintf(fid_about, '      the reference temperature needs to fall within the temperature tolerance range for consistency reasons.\n');
fprintf(fid_about, '      The extension is only used if enough data is available; the applied correction factor is given on the "implied traits" page, \n');
fprintf(fid_about, '      so it is always possible to undo the temperature correction.\n\n');

fprintf(fid_about, '      <p>\n');
fprintf(fid_about, '      At 2018/01/01, when the collection had 1000 entries, there were \n');
fprintf(fid_about, '      112 <a href="https://add-my-pet.github.io/DEBportal/docs/Zero-variate_data.html target="_blank">zero-variate data types</a>, and \n');
fprintf(fid_about, '      153 <a href="https://add-my-pet.github.io/DEBportal/docs/Uni-variate_data.html" target="_blank">univariate data types</a>, in \n');
fprintf(fid_about, '      588 combinations, written by 125 <a href="authors.html">authors</a>. \n');
fprintf(fid_about, '      So, few entries share the same data type combination and the number of data types is very much larger than the number of parameters. \n');
fprintf(fid_about, '      This argues for comparison on the basis of parameters, since all parameters were estimated for all species. \n');
fprintf(fid_about, '      Moreover, by being mechanistic (= based on first principles), DEB models interprete data, rather than just describe it, so can reveal inconsistencies in data \n');
fprintf(fid_about, '        and predict un-measured properties of species as functions of parameters.\n\n');

fprintf(fid_about, '      <p>\n');
fprintf(fid_about, '      Apart from extant species, the collection also has a number of extinct ones, demonstrating that DEB models can still be applied if data availability is poor.\n');
fprintf(fid_about, '      Examples are: \n');
fprintf(fid_about, '        <a href="entries_web/Chioninia_coctei/Chioninia_coctei_res.html">giant skink</a>,\n');
fprintf(fid_about, '        <a href="entries_web/Deinosuchus_rugosus/Deinosuchus_rugosus_res.html">Deinosuchus</a>,\n');
fprintf(fid_about, '        <a href="entries_web/Pterodaustro_guinazui/Pterodaustro_guinazui_res.html">Pterodaustro</a>,\n');
fprintf(fid_about, '        <a href="entries_web/Tyrannosaurus_rex/Tyrannosaurus_rex_res.html">Tyrannosaurus</a>,\n');
fprintf(fid_about, '        <a href="entries_web/Archaeopteryx_lithographica/Archaeopteryx_lithographica_res.html">Archaeopteryx</a>,\n');
fprintf(fid_about, '        <a href="entries_web/Pinguinus_impennis/Pinguinus_impennis_res.html">great auk</a> and \n');
fprintf(fid_about, '        <a href="entries_web/Hydrodamalis_gigas/Hydrodamalis_gigas_res.html">Steller''s sea cow</a>. \n');
fprintf(fid_about, '      Needless to say, however: more data generally reduces uncertainty in parameter values.\n\n');

fprintf(fid_about, '      <h2 class="clear">Data completeness and mean relative errors\n');  
fprintf(fid_about, '         <a href="https://www.youtube.com/watch?v=WKtPWGmJzJI" target="_blank"><img src="img/YouTube.png"  height = "40px" align="right" title="13:54"></a></h2>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/COMPLETE.png" width="350px">\n');
fprintf(fid_about, '        <div class="caption">   \n');
fprintf(fid_about, '          <a href="" title="A survivor function gives the fraction that exceeds the value of the argument">Survivor function</a> of <a href="https://add-my-pet.github.io/DEBportal/docs/Completeness.html" target="_blank">data completeness</a>.\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/MRE.png" width="350px">\n');
fprintf(fid_about, '        <div class = "caption">   \n');
fprintf(fid_about, '          Survivor functions of the <a href="https://add-my-pet.github.io/DEBportal/docs/AmPestimation.html" target="_blank">Mean Relative Error (MRE) and Symmetric Mean Squared Error (SMSE)</a>.\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/COMPLETE_MRE.png" width="350px">\n');
fprintf(fid_about, '        <div class="caption">   \n');
fprintf(fid_about, '          The relationship between mean relative<br> error and data completeness. \n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <div class="sidelement2">\n');
fprintf(fid_about, '        <img src="img/about/MRE_SMSE.png" width="350px">\n');
fprintf(fid_about, '        <div class="caption">\n');
fprintf(fid_about, '        The relationship between <a href="https://add-my-pet.github.io/DEBportal/docs/AmPestimation.html" target="_blank">symmetric mean squared error (SMSE)</a> and mean relative error. \n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '    </div> <!-- end of content -->\n\n');

fprintf(fid_about, '    <!--------------------------------------------------------------->\n');
fprintf(fid_about, '    <!--   Sidebar                                                 -->\n');
fprintf(fid_about, '    <!--------------------------------------------------------------->\n');

fprintf(fid_about, '    <div id="sidebar">\n\n');  

fprintf(fid_about, '      <h1 id="portaltop"> &nbsp;</h1> <!--   This is here to make heading across both columns even  -->\n');   
fprintf(fid_about, '      <h2 class="clear">AmP entries in time </h2>\n\n');

fprintf(fid_about, '      <div class="sidelement">\n');
fprintf(fid_about, '        <img src="img/about/entries.png" width="350px">\n');
fprintf(fid_about, '        <div class="caption">\n');
fprintf(fid_about, '          The Add-my-Pet collection started at 2009/02/12 as part of the \n');
fprintf(fid_about, '          <A href="AmP@DEB2021.html" target="_blank">DEB course</A>.\n');
fprintf(fid_about, '          Dates of <font color="blue">first submission</font> and <font color="red">latest modification</font> are shown.<br>\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');
    
fprintf(fid_about, '      <table id="t02"> <!-- Latest additions -->\n'); 
fprintf(fid_about, '        <tr><th colspan="2"><b>Latest additions to the collection:</b></th></tr>\n');
fprintf(fid_about, '        <tr>\n');
fprintf(fid_about, '          <td width=300><a href="%s%s/%s_res.html"><i>%s</i></a></td>\n', path,entries_new{1},entries_new{1},entries_new{1});
fprintf(fid_about, '          <td width=100>%s</td>\n', dates_new(1,:));
fprintf(fid_about, '        </tr>\n');
fprintf(fid_about, '        <tr>\n');
fprintf(fid_about, '          <td width=300><a href="%s%s/%s_res.html"><i>%s</i></a></td>\n', path,entries_new{2},entries_new{2},entries_new{2});
fprintf(fid_about, '          <td width=100>%s</td>\n', dates_new(2,:));
fprintf(fid_about, '        </tr>\n');
fprintf(fid_about, '        <tr>\n');
fprintf(fid_about, '          <td width=300><a href="%s%s/%s_res.html"><i>%s</i></a></td>\n', path,entries_new{3},entries_new{3},entries_new{3});
fprintf(fid_about, '          <td width=100>%s</td>\n', dates_new(3,:));
fprintf(fid_about, '        </tr>\n');
fprintf(fid_about, '        <tr>\n');
fprintf(fid_about, '          <td width=300><a href="%s%s/%s_res.html"><i>%s</i></a></td>\n', path,entries_new{4},entries_new{4},entries_new{4});
fprintf(fid_about, '          <td width=100>%s</td>\n', dates_new(4,:));
fprintf(fid_about, '        </tr>\n');
fprintf(fid_about, '        <tr>\n');
fprintf(fid_about, '          <td width=300><a href="%s%s/%s_res.html"><i>%s</i></a></td>\n', path,entries_new{5},entries_new{5},entries_new{5});
fprintf(fid_about, '          <td width=100>%s</td>\n', dates_new(5,:));
fprintf(fid_about, '        </tr>\n');
fprintf(fid_about, '      </table>\n\n');

fprintf(fid_about, '      <h2 class="clear">DEB research & DEBtool</h2>\n\n');

fprintf(fid_about, '      <div>\n');
fprintf(fid_about, '        <center>\n');
fprintf(fid_about, '          <img src="img/about/daphnia1a.gif" width="160" id="daphnia" onmouseover="changeImage(''img/about/daphnia1b.gif'')"/>\n');
fprintf(fid_about, '        </center>\n');
fprintf(fid_about, '      </div>\n');
fprintf(fid_about, '      <div class="caption" onmouseover="changeImage(''img/about/daphnia1a.gif'')">\n');
fprintf(fid_about, '        <a href="DEBcalendar.html" target="_blank">DEB research started in the spring of 1979</a> \n');
fprintf(fid_about, '          with a study on how toxicants affect reproduction in the waterflea <i>Dapnia magna</i>, \n');
fprintf(fid_about, '          including consequences for populations.<br>\n'); 
fprintf(fid_about, '        Software package <a href="/thb/deb/deblab/debtool/DEBtool_M/manual/" target="_top">DEBtool</a> was developed \n');
fprintf(fid_about, '          since 2000 to support applications of DEB theory, such as Add-my-Pet.\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <h2 class="clear">DEB publications in time</h2>\n\n');

fprintf(fid_about, '      <div class="sidelement">\n');
fprintf(fid_about, '        <img src="img/about/DEBlib.png" width="350px">\n');
fprintf(fid_about, '        <div class="caption">\n');
fprintf(fid_about, '          Publications in which DEB theory plays a substantial role.\n');
fprintf(fid_about, '          <a href="https://www.zotero.org/groups/500643/deb_library/" target="_blank">They can be found in the DEB library on Zotero</a>, \n');
fprintf(fid_about, '          including all pdf''s, which you can access if you become member (no fees): First register to Zotero, or login, and hit the Join-group button.\n');
fprintf(fid_about, '          You then receive an invitation email, confirming your membership.\n');
fprintf(fid_about, '        </div>\n');
fprintf(fid_about, '      </div>\n\n');

fprintf(fid_about, '      <h2 class="clear">Background documentation </h2>\n\n');
    
fprintf(fid_about, '      <a href="https://add-my-pet.github.io/DEBportal/docs/DEBpapers" target="_blank">\n');
fprintf(fid_about, '      An increasing number of papers has been published on the add-my-pet collection, \n');
fprintf(fid_about, '        both on the methodology and ecological and evolutionary patterns in parameter values among species.</a>\n\n');

fprintf(fid_about, '      <p>\n');
fprintf(fid_about, '      Many papers have been written on specific entries, which have been cited at entry-pages.\n');

fprintf(fid_about, '    </div> <!-- end of sidebar -->\n\n');

fprintf(fid_about, '    <div id="disclaimer">\n');
fprintf(fid_about, '      <div w3-include-html="sys/disclaimer.html"></div>\n');
fprintf(fid_about, '      <div w3-include-html="sys/footer_amp.html"></div>\n');
fprintf(fid_about, '      <script>w3IncludeHTML();</script>\n');
fprintf(fid_about, '    </div>\n');

fprintf(fid_about, '  </div> <!-- main wrapper -->\n');
fprintf(fid_about, '</div> <!-- main -->\n\n');
% ----------------------------------------------------------
fprintf(fid_about, '</body>\n');
fprintf(fid_about, '</html>\n');
fclose(fid_about);

cd(WD);
