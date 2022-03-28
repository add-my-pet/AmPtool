%% prt_toolbar
% prints the menu bar that is used for the whole collection

%%
function  prt_toolbar
% created 2019/12/22 Bas Kooijman, modified 2021/03/09

%% Syntax
% <../prt_toolbar.m *prt_toolbar*> 

%% Description
% Prints toolbar_amp.html, toolbar_app.html, toolbar_budget.html, toolbar_entry.html, toolbar_AmPtool.html, toolbar_DEBportal 

%% Remarks
% The most toolbars are used in deblab/add_my_pet and parked in deblab/add_my_pet/sys
% but toolbar_AmPtool.html, toolbar_DEBportal on GitHup
% Sync Github after running this file
% Indent of 2 spaces used for printing to html page 

%% Example of use
% prt_toolbar 

WD = cdCur;

path2DEBportal = 'https://add-my-pet.github.io/DEBportal/docs/';
path2DEBtool = 'https://add-my-pet.github.io/DEBtool_M/docs/';
path2AmPtool = 'https://add-my-pet.github.io/AmPtool/docs/';
path2deblab = set_path2server; % set relative path to deblab, while being in add_my_pet
path2AmP = [set_path2server, 'add_my_pet/'];

tbh = ''; % toolbar head
tbh = [tbh, '  <div id="top">\n'];
tbh = [tbh, '    <div class="logo">\n'];		
tbh = [tbh, '      <a href="', path2deblab, '"><img src="', path2AmP, 'img/bannercycle.png"  height = "60px"></a>\n'];
tbh = [tbh, '    </div>\n\n'];

dd_deb = []; % dropdown DEB
dd_deb = [dd_deb, '    <div id="navwrapper">\n'];
dd_deb = [dd_deb, '      <div class="dropdown">\n'];
dd_deb = [dd_deb, '        <button onclick="showDropdown(''deb'')" class="dropbtn">DEB</button>\n'];
dd_deb = [dd_deb, '        <div id="deb" class="dropdown-content">\n'];
dd_deb = [dd_deb, '          <a href="', path2DEBportal, '" target="_blank">DEB Portal</a>\n'];
dd_deb = [dd_deb, '          <a href="https://en.wikipedia.org/wiki/Dynamic_energy_budget_theory" target="_blank">DEB Wikipedia</a>\n'];
dd_deb = [dd_deb, '          <a href="', path2deblab, 'bib/Kooy2010_n.pdf" target="_blank">DEB Notation</a>\n'];
dd_deb = [dd_deb, '          <a href="', path2deblab, '" target="_blank">DEB Laboratory</a>\n'];
dd_deb = [dd_deb, '          <a href="', path2DEBtool, '" target="_blank">DEB Tool</a>\n'];
dd_deb = [dd_deb, '          <a href="', path2DEBportal, 'DEBpapers.html" target="_blank">DEB Papers</a>\n'];
dd_deb = [dd_deb, '          <a href="https://www.zotero.org/groups/500643/deb_library/" target="_blank">DEB Library</a>\n'];
dd_deb = [dd_deb, '          <a href="', path2DEBportal, 'DEBvideos.html" target="_blank">DEB Videos</a>\n'];
dd_deb = [dd_deb, '          <a href="', path2DEBportal,'DEBcalendar.html" target="_blank">DEB Calendar</a>\n'];
dd_deb = [dd_deb, '          <a href="', path2DEBportal, 'DEBevents.html" target="_blank">DEB Events</a>\n'];
dd_deb = [dd_deb, '          <a href="', path2DEBportal, 'DEBnet.html" target="_blank">DEB Net</a>\n'];
dd_deb = [dd_deb, '        </div>\n'];	
dd_deb = [dd_deb, '      </div>\n\n'];

dd_con = []; % dropdown CONTEXT
dd_con = [dd_con, '      <div class="dropdown">\n'];
dd_con = [dd_con, '        <button onclick="showDropdown(''context'')" class="dropbtn">CONTEXT</button>\n'];
dd_con = [dd_con, '        <div id="context" class="dropdown-content">\n'];
dd_con = [dd_con, '          <a href="', path2AmP, 'index.html">AmP Portal</a>\n'];
dd_con = [dd_con, '          <a href="', path2DEBportal, 'AmPestimation.html" target="_blank">AmP Estimation</a>\n'];
dd_con = [dd_con, '          <a href="', path2AmPtool, '" target="_blank">AmP Tool</a>\n'];
dd_con = [dd_con, '          <a href="', path2AmP, 'AmPeco.html">AmP Ecology</a>\n'];
dd_con = [dd_con, '          <a href="', path2AmP, 'phyla.html">Phyla</a>\n'];
dd_con = [dd_con, '          <a href="', path2AmP, 'pars.html">Parameters</a>\n'];
dd_con = [dd_con, '          <a href="', path2AmP, 'patterns.html">Patterns</a>\n'];
dd_con = [dd_con, '          <a href="', path2DEBportal, 'AmPeps.html">Entry prepare</a>\n'];
dd_con = [dd_con, '          <a href="', path2AmP, 'about.html">About</a>\n'];
dd_con = [dd_con, '        </div>\n'];
dd_con = [dd_con, '      </div>\n\n'];
	
dd_col = [];  % dropdown COLLECTION
dd_col = [dd_col, '      <div class="dropdown">\n'];
dd_col = [dd_col, '        <button onclick="showDropdown(''collection'')" class="dropbtn">COLLECTION</button>\n'];
dd_col = [dd_col, '        <div id="collection" class="dropdown-content">\n'];
dd_col = [dd_col, '          <a href="', path2AmP, 'species_list.html">Species List</a>\n'];
dd_col = [dd_col, '          <a href="', path2AmP, 'species_tree_Animalia.html">Species Tree</a>\n'];
dd_col = [dd_col, '          <a href="', path2AmP, 'species_names.html">Species Names</a>\n'];
dd_col = [dd_col, '          <a href="', path2AmP, 'authors.html">Authors</a>\n'];
dd_col = [dd_col, '          <a href="', path2AmP, 'pie_pSGJRi.html">Energy Budgets</a>\n'];
img_zip = ['<IMG SRC="', path2AmP,'img/zipicon.png" WIDTH="30px"  BORDER="0">'];
table = ['<tr> <td rowspan="2">', img_zip, '</td><td>AmPdata</td></tr><tr><td>', datestr(datenum(date), 'yyyymmdd'), '</td></tr>'];
dd_col = [dd_col, '          <a href="', path2AmP, 'AmPdata/AmPdata.zip"><table>', table, '</table></a>\n'];
dd_col = [dd_col, '        </div>\n'];
dd_col = [dd_col, '      </div>\n\n'];	

dd_app = []; % dropdown APPLICATIONS
dd_app = [dd_app, '      <div class="dropdown">\n'];
dd_app = [dd_app, '        <button onclick="showDropdown(''applications'')" class="dropbtn">APPLICATIONS</button>\n'];
dd_app = [dd_app, '        <div id="applications" class="dropdown-content">\n'];
dd_app = [dd_app, '          <a href="', path2AmP, 'popDyn/popDyn.html">Population Dynamics</a>\n'];
dd_app = [dd_app, '          <a href="', path2AmP, 'physBiol/physBiol.html">Physical Biology</a>\n'];
dd_app = [dd_app, '          <a href="https://add-my-pet.github.io/AmPtox/docs/">AmPtox</a>\n'];
dd_app = [dd_app, '        </div>\n'];
dd_app = [dd_app, '      </div>\n\n'];

dd_bud = []; % dropdown ENERGY BUDGETS
dd_bud = [dd_bud, '      <div class="dropdown">\n'];
dd_bud = [dd_bud, '        <button onclick="showDropdown(''budget'')" class="dropbtn">ENERGY BUDGETS</button>\n'];
dd_bud = [dd_bud, '        <div id="budget" class="dropdown-content">\n'];
dd_bud = [dd_bud, '          <a href="', path2AmP, 'pie_SGJRb.html">Over embryo</a>\n'];
dd_bud = [dd_bud, '          <a href="', path2AmP, 'pie_pSGJRb.html">At birth</a>\n'];
dd_bud = [dd_bud, '          <a href="', path2AmP, 'pie_pSGJRp.html">At puberty</a>\n'];
dd_bud = [dd_bud, '          <a href="', path2AmP, 'pie_pSGJRi.html">At ultimate</a>\n'];
dd_bud = [dd_bud, '        </div>\n'];
dd_bud = [dd_bud, '      </div>\n\n'];

dd_cod = []; % dropdown PACKAGE
dd_col = [dd_col, '      <div class="dropdown">\n'];
dd_col = [dd_col, '        <button onclick="showDropdown(''code'')" class="dropbtn">PACKAGE</button>\n'];
dd_col = [dd_col, '        <div id="code" class="dropdown-content">\n'];
dd_col = [dd_col, '          <a href="', path2DEBtool, 'index.html" target="_blank">DEB Tool</a>\n'];
dd_col = [dd_col, '          <a href="', path2AmPtool, 'index.html" target="_blank">AmP Tool</a>\n'];
dd_col = [dd_col, '          <a href="http://www.debtox.info/software.php" target="_blank">DEB Tox</a>\n'];
dd_col = [dd_col, '          <a href="https://jornbr.home.xs4all.nl/plotreader/" target="_blank">Plot Reader</a>\n'];
dd_col = [dd_col, '        </div>\n'];
dd_col = [dd_col, '      </div>\n\n'];

dd_dat = []; % dropdown DATA BASES
dd_dat = [dd_dat, '      <div class="dropdown">\n'];
dd_dat = [dd_dat, '        <button onclick="showDropdown(''data'')" class="dropbtn">DATA BASES</button>\n'];
dd_dat = [dd_dat, '        <div id="data" class="dropdown-content">\n'];
dd_dat = [dd_dat, '          <a href="', path2AmP, 'index.html" target="_blank">Add_my_Pet</a>\n'];
dd_dat = [dd_dat, '          <a href="http://bioforecasts.science.unimelb.edu.au/app_direct/deb/" target="_blank">DEB Shiny app</a>\n'];
dd_dat = [dd_dat, '          <a href="https://deb.bolding-bruggeman.com/" target="_blank">DEB species explorer</a>\n'];
dd_dat = [dd_dat, '          <a href="http://www.ibi.vu.nl/programs/phylopars/phytoplankton" target="_blank">Phyto_pars</a>\n'];
dd_dat = [dd_dat, '        </div>\n'];
dd_dat = [dd_dat, '      </div>\n\n'];

dd_sup = []; % dropdown SUPPORT
dd_sup = [dd_sup, '      <div class="dropdown">\n'];
dd_sup = [dd_sup, '        <button onclick="showDropdown(''support'')" class="dropbtn">SUPPORT</button>\n'];
dd_sup = [dd_sup, '        <div id="support" class="dropdown-content">\n'];
dd_sup = [dd_sup, '          <a href="', path2deblab, 'bib/Kooy2010_n.pdf" target="_blank">Notation</a>\n'];
dd_sup = [dd_sup, '          <a href="', path2deblab, 'bib/Kooy2010_i.pdf" target="_blank">Summary of concepts</a>\n'];
dd_sup = [dd_sup, '          <a href="', path2deblab, 'bib/Kooy2010_c.pdf" target="_blank">Comments</a>\n'];
dd_sup = [dd_sup, '          <a href="', path2deblab, 'bib/Kooy2010_e.pdf" target="_blank">Errata</a>\n'];
dd_sup = [dd_sup, '          <a href="', path2deblab, 'micro-lectures/micro-lectures.zip" target="_blank">Micro-lectures</a>\n'];   
dd_sup = [dd_sup, '          <a href="', path2deblab, 'cycle/cycle_pr.htm" target="_blank">Life-cycles</a>\n'];
dd_sup = [dd_sup, '        </div>\n'];
dd_sup = [dd_sup, '      </div>\n\n'];

dd_cou = []; % dropdown COURSE
dd_cou = [dd_cou, '      <div class="dropdown">\n'];
dd_cou = [dd_cou, '        <button onclick="showDropdown(''course'')" class="dropbtn">COURSE</button>\n'];
dd_cou = [dd_cou, '        <div id="course" class="dropdown-content">\n'];
dd_cou = [dd_cou, '          <a href="https://deb2023.sciencesconf.org/"  target="_blank">Upcoming</a>\n'];
dd_cou = [dd_cou, '          <a href="', path2deblab, 'course/exercise" target="_blank">Exercises</a>\n'];
dd_cou = [dd_cou, '          <a href="', path2deblab, 'course/quizz/quizz" target="_blank">Quizzes</a>\n'];
dd_cou = [dd_cou, '          <a href="', path2deblab, 'course/essays" target="_blank">Essays</a>\n'];
dd_cou = [dd_cou, '          <a href="http://www.zotero.org/groups/500643/deb_library/" target="_blank">Theses</a>\n'];
dd_cou = [dd_cou, '          <a href="', path2deblab, 'course/archieve/quest2001.html" target="_blank">Questions</a>\n'];      
dd_cou = [dd_cou, '          <a href="', path2deblab, 'tb/tb.pdf" target="_blank">Methods in TB</a>\n'];
dd_cou = [dd_cou, '        </div>\n'];
dd_cou = [dd_cou, '      </div>\n\n'];

dd_box = []; % dropdown toolbox
dd_box = [dd_box, '      <div class="dropdown">\n'];
dd_box = [dd_box, '        <button onclick="showDropdown(''toolbox'')" class="dropbtn">TOOLBOX</button>\n'];
dd_box = [dd_box, '        <div id="toolbox" class="dropdown-content">\n'];
dd_box = [dd_box, '          <a href="./DEBtool_lib.html/">lib</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_enzyme.html">enzyme</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_microbe.html">microbe</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_alga.html">alga</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_animal.html">animal</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_iso_21.html">iso_21</a>\n'];      
dd_box = [dd_box, '          <a href="./DEBtool_plant.html">plant</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_community.html">community</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_symbi.html">symbi</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_tox.html">tox</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_degrad.html">degrad</a>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_fig_3.html">fig_3</a>\n'];
dd_box = [dd_box, '        </div>\n'];
dd_box = [dd_box, '      </div>\n\n'];

tbt = []; % toolbar tail
tbt = [tbt, '    </div> <!-- end of navwrapper -->\n'];
tbt = [tbt, '  </div> <!-- end of top -->\n'];

% write toolbars
oid_amp = fopen('toolbar_amp.html', 'w+');       
oid_app = fopen('toolbar_app.html', 'w+');       
oid_budget = fopen('toolbar_budget.html', 'w+'); 
oid_entry = fopen('toolbar_entry.html', 'w+');   
oid_AmPtool = fopen('toolbar_AmPtool.html', 'w+');  
oid_DEBtool = fopen('toolbar_DEBtool.html', 'w+');  
oid_DEBportal = fopen('toolbar_DEBportal.html', 'w+');  
oid_AmPtox = fopen('toolbar_AmPtox.html', 'w+');  
oid_deblab = fopen('toolbar_deblab.html', 'w+');  
oid_subdeblab = fopen('toolbar_subdeblab.html', 'w+');  

fprintf(oid_amp, [tbh, dd_deb, dd_con, dd_col, dd_app, tbt]);
fprintf(oid_budget, [tbh, dd_deb, dd_con, dd_col, dd_bud, dd_app, tbt]);
fprintf(oid_app, [tbh, dd_deb, dd_con, dd_col, dd_app, tbt]);
fprintf(oid_entry, [tbh, dd_deb, dd_con, dd_col, dd_app, tbt]);
fprintf(oid_AmPtool, [tbh, dd_deb, dd_con, dd_col, dd_app, tbt]);
fprintf(oid_DEBtool, [tbh, dd_box, dd_deb, dd_con, dd_col, dd_app, tbt]);
fprintf(oid_DEBportal, [tbh, dd_deb, dd_con, dd_col, dd_app, tbt]);
fprintf(oid_AmPtox, [tbh, dd_deb, dd_con, dd_col, dd_app, tbt]);
fprintf(oid_deblab, [tbh, dd_deb, dd_cod, dd_dat, dd_sup, dd_cou, dd_app, tbt]);
fprintf(oid_subdeblab, [tbh, dd_deb, dd_cod, dd_dat, dd_sup, dd_cou, dd_app, tbt]);

fclose all;

movefile toolbar_amp.html '../../deblab/add_my_pet/sys/'
movefile toolbar_budget.html '../../deblab/add_my_pet/sys/'
movefile toolbar_app.html '../../deblab/add_my_pet/sys/'
movefile toolbar_entry.html '../../deblab/add_my_pet/sys/'
movefile toolbar_deblab.html '../../deblab/add_my_pet/sys/'
movefile toolbar_subdeblab.html '../../deblab/add_my_pet/sys/'
movefile toolbar_AmPtool.html '../../AmPtool/docs/'
movefile toolbar_DEBtool.html '../../DEBtool_M/docs/'
movefile toolbar_DEBportal.html '../../DEBportal/docs/'
movefile toolbar_AmPtox.html '../../AmPtox/docs/'

cd(WD);
end

