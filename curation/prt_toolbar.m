%% prt_toolbar
% prints the menu bar that is used for the whole collection

%%
function  prt_toolbar
% created 2019/12/22 Bas Kooijman, modified 2021/03/09, 2022/05/12, 2022/06/13

%% Syntax
% <../prt_toolbar.m *prt_toolbar*> 

%% Description
% Prints internal html-toolbars deblab, subdeblab, amp, budget, entry, app, 
% and external toolbars DEBportal, AmPestimation, DEBpapers, DEBtool, AmPtool, AmPtox

%% Remarks
% * Some toolbars are used in deblab/add_my_pet and parked in deblab/add_my_pet/sys, but others are used in GitHup.
% * Sync Github after running this file.
% * The internal addresses in the toolbars are relative, 
%   but the external ones are absolute with versions for each server (VU,IUEM)
% * First tool-bar components are set, then collected in toolbars, written in AmP/curation and moved to various places. 

%% Example of use
% prt_toolbar 

WD = cdCur; % cd ../../deblab/add_my_pet/sys/

path2deblab = set_path2server('VU'); 
path2AmP = [set_path2server, 'add_my_pet/'];
% all dropdowns have absolute addresses, but some will be made relative for internal toolbars at the end

taxa = list_taxa('Animalia',1); % all taxa, except entries
genus = list_taxa('Animalia',3); % all genera
notGen = setdiff(taxa,genus); % all taxa, except entries and genera
n_notGen = length(notGen);

%% set toolbar components
bar  = '      <div class="dropdown">|</div>\n\n'; % separator of local from standard dropdowns

srch = '      <div class="dropdown"><input type="text" class="Search" id="Species" onkeyup="searchList()" placeholder="Species .."></div>\n\n';

tax_ani = '    <div class="dropdown" id="taxon">Animalia</div>\n\n';

tbt = []; % toolbar tail (used for external toolbars)
tbt = [tbt, '    </div> <!-- end of navwrapper -->\n'];
tbt = [tbt, '  </div> <!-- end of top -->\n'];

% first some dropdowns that do not use server info
dd_box = []; % dropdown TOOLBOX for dd_DEBtool
dd_box = [dd_box, '      <div class="dropdown">\n'];
dd_box = [dd_box, '        <button onclick="showDropdown(''toolbox'')" class="dropbtn">TOOLBOX</button>\n'];
dd_box = [dd_box, '        <div id="toolbox" class="dropdown-content">\n'];
dd_box = [dd_box, '          <a href="./">DEBtool</a>\n'];
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
dd_box = [dd_box, '          <a href="./DEBtool_lib_misc.html">lib_misc</a></li>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_lib_regr.html">lib_regr</a></li>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_lib_prob.html">lib_prob</a></li>\n'];
dd_box = [dd_box, '          <a href="./DEBtool_lib_pet.html">lib_pet</a></li>\n'];
dd_box = [dd_box, '        </div>\n'];
dd_box = [dd_box, '      </div>\n\n'];

dd_sct = []; % dropdown SECTION for dd_AmPtool
dd_sct = [dd_sct, '      <div class="dropdown">\n'];
dd_sct = [dd_sct, '        <button onclick="showDropdown(''section'')" class="dropbtn">SECTION</button>\n'];
dd_sct = [dd_sct, '        <div id="section" class="dropdown-content">\n'];
dd_sct = [dd_sct, '          <a onclick="OpenPageAtId(''portaltop'')">AmPtool</a>\n'];
dd_sct = [dd_sct, '          <a onclick="OpenPageAtId(''data'')">Data</a>\n'];
dd_sct = [dd_sct, '          <a onclick="OpenPageAtId(''tree'')">Taxonomic tree</a>\n'];
dd_sct = [dd_sct, '          <a onclick="OpenPageAtId(''selection'')">Selection of entries</a>\n'];
dd_sct = [dd_sct, '          <a onclick="OpenPageAtId(''legend'')">Legend</a>\n'];      
dd_sct = [dd_sct, '          <a onclick="OpenPageAtId(''plotting'')">Spotting patterns</a>\n'];
dd_sct = [dd_sct, '          <a onclick="OpenPageAtId(''context'')">Linked websites</a>\n'];      
dd_sct = [dd_sct, '          <a onclick="OpenPageAtId(''distance'')">Distances between species</a>\n'];      
dd_sct = [dd_sct, '        </div>\n'];
dd_sct = [dd_sct, '      </div>\n\n'];

dd_sec = []; % dropdown SECTION for dd_AmPestimation
dd_sec = [dd_sec, '      <div class="dropdown">\n'];
dd_sec = [dd_sec, '        <button onclick="showDropdown(''section'')" class="dropbtn">SECTION</button>\n'];
dd_sec = [dd_sec, '        <div id="section" class="dropdown-content">\n'];
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Introduction'')">Introduction</a>\n'];
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Models'')">Typified models</a>\n'];
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Data'')">Data & data types</a>\n'];
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Weight'')">Weight coefficients</a>\n'];
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Loss'')">Loss function</a>\n'];      
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Minimization'')">Minimization of loss function</a>\n'];
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Evaluation'')">Evaluation of estimates</a>\n'];      
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Multi-species'')">Multi-species parameter estimation</a>\n'];      
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Augmented'')">Augmented loss function</a>\n'];      
dd_sec = [dd_sec, '          <a onclick="OpenPageAtId(''Remarks'')">General remarks</a>\n'];      
dd_sec = [dd_sec, '        </div>\n'];
dd_sec = [dd_sec, '      </div>\n\n'];

dd_top = []; % dropdown TOPIC for dd_DEBpapers
dd_top = [dd_top, '      <div class="dropdown">\n'];
dd_top = [dd_top, '        <button onclick="showDropdown(''topic'')" class="dropbtn">TOPIC</button>\n'];
dd_top = [dd_top, '        <div id="topic" class="dropdown-content">\n'];
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''DEBlib'')">DEB library</a>\n'];
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''SIs'')">Special issues</a>\n'];
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''Editorials'')">Editorials</a>\n'];
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''Intros'')">Introductions</a>\n'];
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''Evolution'')">Evolutionary context</a>\n'];      
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''Estimation'')">Parameter estimation</a>\n'];
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''Species'')">Species accounts</a>\n'];      
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''Patterns'')">Patterns in parameter values</a>\n'];      
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''PopDyn'')">Population dynamics</a>\n'];      
dd_top = [dd_top, '          <a onclick="OpenPageAtId(''Tumors'')">Tumor growth</a>\n'];      
dd_top = [dd_top, '        </div>\n'];
dd_top = [dd_top, '      </div>\n\n'];

dd_taxa = []; % dropdown taxaSearch for taxa
dd_taxa = [dd_taxa,  '    <div class="taxaSearch">\n'];
dd_taxa = [dd_taxa,  '      <input id="TaxonDropdownInput" class="taxaSearch_dropbtn" onclick="showDropdown(''TaxonDropdown'')" onkeyup="InputTaxaSearch(''TaxonDropdown'')"\n'];
dd_taxa = [dd_taxa,  '        placeholder="Taxon.." type="text" title="Type part of name and click on list">\n'];
dd_taxa = [dd_taxa,  '      <div id="TaxonDropdown" class="taxaSearch-content">\n'];
dd_taxa = [dd_taxa,  '        <ul id="TaxonDropdownSearchlist" class="taxaSearch">\n'];
for j = 1:n_notGen
dd_taxa = [dd_taxa,  '          <li><a onclick="taxaSel(''',notGen{j},''')">',notGen{j},'</a></li>\n'];
end    
dd_taxa = [dd_taxa,  '        </ul> <!-- end TaxonDropdownSearchlist -->\n'];
dd_taxa = [dd_taxa,  '      </div> <!-- end TaxonDropdown -->\n'];
dd_taxa = [dd_taxa,  '    </div> <!-- end taxaSearch -->\n\n'];

% now dropdowns that do use server info
[tbh, tbh_taxa, dd_std, dd_bud, dd_sup, dd_cou, dd_ser] = set_dd('VU'); % set remaining tb-head and dropdowns

%% write toolbars in AmPtool\curation 
oid_deblab = fopen('toolbar_deblab.html', 'w+');  
oid_subdeblab = fopen('toolbar_subdeblab.html', 'w+');  
oid_amp = fopen('toolbar_amp.html', 'w+');       
oid_entry = fopen('toolbar_entry.html', 'w+');   
oid_budget = fopen('toolbar_budget.html', 'w+'); 
oid_app = fopen('toolbar_app.html', 'w+');   
oid_links = fopen('toolbar_links.html', 'w+');  
oid_taxa = fopen('toolbar_taxa.html', 'w+');  
%
oid_DEBportal_VU = fopen('toolbar_DEBportal_VU.html', 'w+');  
oid_AmPestimation_VU = fopen('toolbar_AmPestimation_VU.html', 'w+');  
oid_DEBpapers_VU = fopen('toolbar_DEBpapers_VU.html', 'w+');  
oid_DEBtool_VU = fopen('toolbar_DEBtool_VU.html', 'w+');  
oid_AmPtool_VU = fopen('toolbar_AmPtool_VU.html', 'w+');  
oid_AmPtox_VU = fopen('toolbar_AmPtox_VU.html', 'w+');  
%
oid_DEBportal_IUEM = fopen('toolbar_DEBportal_IUEM.html', 'w+');  
oid_AmPestimation_IUEM = fopen('toolbar_AmPestimation_IUEM.html', 'w+');  
oid_DEBpapers_IUEM = fopen('toolbar_DEBpapers_IUEM.html', 'w+');  
oid_DEBtool_IUEM = fopen('toolbar_DEBtool_IUEM.html', 'w+');  
oid_AmPtool_IUEM = fopen('toolbar_AmPtool_IUEM.html', 'w+');  
oid_AmPtox_IUEM = fopen('toolbar_AmPtox_IUEM.html', 'w+');  

% all toolbars start with tbh and end with tbt; bar separates local from standard dropdowns
%
% internal toolbars (no server info, relative addresses only)
fprintf(oid_deblab, strrep([tbh, dd_sup, dd_cou, bar, dd_std, tbt], path2deblab, ''));
fprintf(oid_subdeblab, strrep([tbh, dd_sup, dd_cou, bar, dd_std, tbt], path2deblab, '../'));
fprintf(oid_amp, strrep([tbh, dd_std, tbt], path2AmP, ''));
fprintf(oid_entry, strrep([tbh, dd_std, tbt], path2AmP, '../../'));
fprintf(oid_budget, strrep([tbh, dd_bud, bar, dd_std, tbt], path2AmP, ''));
fprintf(oid_app, strrep([tbh, dd_std, tbt], path2AmP, '../'));
fprintf(oid_links, strrep([tbh, srch, bar, dd_std, tbt], path2AmP, ''));
fprintf(oid_taxa, strrep([tbh_taxa, dd_taxa, tax_ani, bar, dd_std, tbt], path2AmP, ''));
%
% external toolbars for VU
fprintf(oid_DEBportal_VU, [tbh, dd_std, dd_ser, tbt]);
fprintf(oid_AmPestimation_VU, [tbh, dd_sec, bar, dd_std, dd_ser, tbt]);
fprintf(oid_DEBpapers_VU, [tbh, dd_top, bar, dd_std, dd_ser, tbt]);
fprintf(oid_DEBtool_VU,   [tbh, dd_box, bar, dd_box, bar, dd_std, dd_ser, tbt]);
fprintf(oid_AmPtool_VU,   [tbh, dd_sct, bar, dd_std, dd_ser, tbt]);
fprintf(oid_AmPtox_VU,    [tbh, dd_std, dd_ser, tbt]);
%
% external toolbars for IUEM
[tbh, tbh_taxa, dd_std, dd_bud, dd_sup, dd_cou, dd_ser] = set_dd('IUEM'); % set remaining tb-head and dropdowns
fprintf(oid_DEBportal_IUEM, [tbh, dd_std, dd_ser, tbt]);
fprintf(oid_AmPestimation_IUEM, [tbh, dd_sec, bar, dd_std, dd_ser, tbt]);
fprintf(oid_DEBpapers_IUEM, [tbh, dd_top, bar, dd_std, dd_ser, tbt]);
fprintf(oid_DEBtool_IUEM,   [tbh, dd_box, bar, dd_std, dd_ser, tbt]);
fprintf(oid_AmPtool_IUEM,   [tbh, dd_sct, bar, dd_std, dd_ser, tbt]);
fprintf(oid_AmPtox_IUEM,    [tbh, dd_std, dd_ser, tbt]);

fclose all;

%% move toolbars
% move internal toolbars, being in AmPtool\curation
movefile toolbar_deblab.html '../../deblab/add_my_pet/sys/'
movefile toolbar_subdeblab.html '../../deblab/add_my_pet/sys/'
movefile toolbar_amp.html '../../deblab/add_my_pet/sys/'
movefile toolbar_entry.html '../../deblab/add_my_pet/sys/'
movefile toolbar_budget.html '../../deblab/add_my_pet/sys/'
movefile toolbar_app.html '../../deblab/add_my_pet/sys/'
movefile toolbar_links.html '../../deblab/add_my_pet/sys/'
movefile toolbar_taxa.html '../../deblab/add_my_pet/sys/'

% move external toolbars, being in AmPtool\curation
movefile toolbar_DEBportal_VU.html '../../DEBportal/docs/sys/'
movefile toolbar_DEBportal_IUEM.html '../../DEBportal/docs/sys/'
movefile toolbar_AmPestimation_VU.html '../../DEBportal/docs/sys/'
movefile toolbar_AmPestimation_IUEM.html '../../DEBportal/docs/sys/'
movefile toolbar_DEBpapers_VU.html '../../DEBportal/docs/sys/'
movefile toolbar_DEBpapers_IUEM.html '../../DEBportal/docs/sys/'
%
movefile toolbar_DEBtool_VU.html '../../DEBtool_M/docs/sys/'
movefile toolbar_DEBtool_IUEM.html '../../DEBtool_M/docs/sys/'
%
movefile toolbar_AmPtool_VU.html '../../AmPtool/docs/sys/'
movefile toolbar_AmPtool_IUEM.html '../../AmPtool/docs/sys/'
%
movefile toolbar_AmPtox_VU.html '../../AmPtox/docs/sys/'
movefile toolbar_AmPtox_IUEM.html '../../AmPtox/docs/sys/'

cd(WD);
end

function [tbh, tbh_taxa, dd_std, dd_bud, dd_sup, dd_cou, dd_ser] = set_dd(svr)

  % set toolbar dropdowns for server svr
  path2DEBportal = 'https://debportal.debtheory.org/docs/';
  path2DEBtool = 'https://debtool.debtheory.org/docs/';
  path2AmPtool = 'https://amptool.debtheory.org/docs/';
  %
  path2deblab = set_path2server(svr); 
  path2AmP = [path2deblab, 'add_my_pet/'];
 
  tbh = ''; % toolbar head
  tbh = [tbh, '  <div id="top">\n'];
  tbh = [tbh, '    <div class="logo">\n'];		
  tbh = [tbh, '      <img src="', path2AmP, 'img/bannercycle.png" height="55px">\n'];
  tbh = [tbh, '    </div>\n\n'];
  tbh = [tbh, '    <div id="navwrapper">\n'];

  tbh_taxa = ''; % toolbar head for taxalery toolbar
  tbh_taxa = [tbh_taxa, '  <div id="top">\n'];
  tbh_taxa = [tbh_taxa, '    <div class="logo">\n'];		
  tbh_taxa = [tbh_taxa, '      <img src="', path2AmP, 'img/bannercycle.png" onclick="taxaSel(''Animalia'')" height="55px">\n'];
  tbh_taxa = [tbh_taxa, '    </div>\n\n'];
  tbh_taxa = [tbh_taxa, '    <div id="navwrapper">\n'];

  %% standard dropdowns (for all toolbars)
  dd_deb = []; % dropdown DEB
  dd_deb = [dd_deb, '      <div class="dropdown">\n'];
  dd_deb = [dd_deb, '        <button onclick="showDropdown(''deb'')" class="dropbtn">DEB</button>\n'];
  dd_deb = [dd_deb, '        <div id="deb" class="dropdown-content">\n'];
  dd_deb = [dd_deb, '          <a href="', path2DEBportal, '" target="_blank">DEB Portal</a>\n'];
  dd_deb = [dd_deb, '          <a href="https://en.wikipedia.org/wiki/Dynamic_energy_budget_theory" target="_blank">DEB Wikipedia</a>\n'];
  dd_deb = [dd_deb, '          <a href="', path2deblab, 'bib/Kooy2010_n.pdf" target="_blank">DEB Notation</a>\n'];
  dd_deb = [dd_deb, '          <a href="', path2deblab, '" target="_blank">DEB Laboratory</a>\n'];
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
  dd_con = [dd_con, '          <a href="', path2AmP, 'AmPeco.html">AmP Ecology</a>\n'];
  dd_con = [dd_con, '          <a href="', path2AmP, 'phyla.html">Phyla</a>\n'];  
  dd_con = [dd_con, '          <a href="', path2AmP, 'taxa.html">Taxa</a>\n'];
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
  dd_col = [dd_col, '          <a href="', path2AmP, 'ecoCodes.html">EcoCodes</a>\n'];
  dd_col = [dd_col, '          <a href="', path2AmP, 'links.html">Links</a>\n'];
  img_zip = ['<IMG SRC="', path2AmP,'img/zipicon.png" WIDTH="30px"  BORDER="0">'];
  table = ['<tr> <td rowspan="2">', img_zip, '</td><td>AmPdata</td></tr><tr><td>', datestr(datenum(date), 'yyyymmdd'), '</td></tr>'];
  dd_col = [dd_col, '          <a href="', path2AmP, 'AmPdata/AmPdata.zip"><table>', table, '</table></a>\n'];
  dd_col = [dd_col, '        </div>\n'];
  dd_col = [dd_col, '      </div>\n\n'];	

  dd_app = []; % dropdown APPS
  dd_app = [dd_app, '      <div class="dropdown">\n'];
  dd_app = [dd_app, '        <button onclick="showDropdown(''applications'')" class="dropbtn">APPS</button>\n'];
  dd_app = [dd_app, '        <div id="applications" class="dropdown-content">\n'];
  dd_app = [dd_app, '          <a href="', path2AmP, 'popDyn/popDyn.html">Population Dynamics</a>\n'];
  dd_app = [dd_app, '          <a href="', path2AmP, 'physBiol/physBiol.html">Physical Biology</a>\n'];
  dd_app = [dd_app, '          <a href="https://add-my-pet.github.io/AmPtox/docs/">AmPtox</a>\n'];
  dd_app = [dd_app, '        </div>\n'];
  dd_app = [dd_app, '      </div>\n\n'];

  dd_pac = []; % dropdown PACKAGE
  dd_pac = [dd_pac, '      <div class="dropdown">\n'];
  dd_pac = [dd_pac, '        <button onclick="showDropdown(''package'')" class="dropbtn">PACKAGE</button>\n'];
  dd_pac = [dd_pac, '        <div id="package" class="dropdown-content">\n'];
  dd_pac = [dd_pac, '          <a href="', path2DEBtool, 'index.html" target="_blank">DEB Tool</a>\n'];
  dd_pac = [dd_pac, '          <a href="', path2AmPtool, 'index.html" target="_blank">AmP Tool</a>\n'];
  dd_pac = [dd_pac, '          <a href="http://bioforecasts.science.unimelb.edu.au/app_direct/deb_sea/" target="_blank">DEBsea Shiny App</a>\n'];
  dd_pac = [dd_pac, '          <a href="http://bioforecasts.science.unimelb.edu.au/app_direct/deb/" target="_blank">DEB Shiny App</a>\n'];
  dd_pac = [dd_pac, '          <a href="http://www.debtox.info/software.php" target="_blank">DEB Tox</a>\n'];
  dd_pac = [dd_pac, '          <a href="https://github.com/jornbr/plotreader/releases/download/v1.56/PlotReader.msi" target="_blank">Plot Reader</a>\n'];
  dd_pac = [dd_pac, '        </div>\n'];
  dd_pac = [dd_pac, '      </div>\n\n'];

  dd_std = [dd_deb, dd_con, dd_col, dd_pac, dd_app]; % standard dropdowns for all toolbars

  %% local dropdowns
  dd_bud = []; % dropdown ENERGY BUDGET
  dd_bud = [dd_bud, '      <div class="dropdown">\n'];
  dd_bud = [dd_bud, '        <button onclick="showDropdown(''budget'')" class="dropbtn">ENERGY BUDGET</button>\n'];
  dd_bud = [dd_bud, '        <div id="budget" class="dropdown-content">\n'];
  dd_bud = [dd_bud, '          <a href="', path2AmP, 'pie_SGJRb.html">Over embryo</a>\n'];
  dd_bud = [dd_bud, '          <a href="', path2AmP, 'pie_pSGJRb.html">At birth</a>\n'];
  dd_bud = [dd_bud, '          <a href="', path2AmP, 'pie_pSGJRp.html">At puberty</a>\n'];
  dd_bud = [dd_bud, '          <a href="', path2AmP, 'pie_pSGJRi.html">At ultimate</a>\n'];
  dd_bud = [dd_bud, '        </div>\n'];
  dd_bud = [dd_bud, '      </div>\n\n'];

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
  dd_cou = [dd_cou, '          <a href="', path2deblab, 'course/archieve/questions/quest2001.html" target="_blank">Questions</a>\n'];      
  dd_cou = [dd_cou, '          <a href="', path2deblab, 'tb/tb.pdf" target="_blank">Methods in TB</a>\n'];
  dd_cou = [dd_cou, '        </div>\n'];
  dd_cou = [dd_cou, '      </div>\n\n'];
  
  dd_ser = []; % dropdown SERVER
  dd_ser = [dd_ser, '      <div class="dropdown">\n'];
  %dd_ser = [dd_ser, '        <button onclick="showDropdown(''server'')" class="dropbtn"><img src="img/server_', svr, '.png" height="40px"></button>\n'];
  dd_ser = [dd_ser, '        <button onclick="showDropdown(''server'')" class="dropbtn">SERVER</button>\n'];
  dd_ser = [dd_ser, '        <div id="server" class="dropdown-content">\n'];
  dd_ser = [dd_ser, '          <a onclick="changeServer(''VU'')">VU</a>\n'];
  dd_ser = [dd_ser, '          <a onclick="changeServer(''IUEM'')">IUEM</a>\n'];
  dd_ser = [dd_ser, '        </div>\n'];
  dd_ser = [dd_ser, '      </div>\n\n'];
  % the names server_VU.png and server_IUEM.png gave problems
  dd_ser = [dd_ser, '      <div class="icon"><img src="img/server', lower(svr), '.png" height="35px"></div>\n\n']; % icon for server

end
