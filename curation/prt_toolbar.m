%% prt_toolbar
% prints the menu bar that is used for the whole collection

%%
function  prt_toolbar
% created 2019/12/22 Bas Kooijman

%% Syntax
% <../prt_toolbar.m *prt_toolbar*> 

%% Description
% Prints toolbar_amp.html, toolbar_app.html, toolbar_budget.html, toolbar_entry.html, toolbar_AmPtool.html 

%% Remarks
% Sync Github after running this file
% Indent of 2 spaces used for printing to html page

%% Example of use
% prt_toolbar 

tb = []; tbb = []; tbt = []; % initialize character vectors

% insert "??", which is below replaced by '', or '../' or '../../'
% head
tb = [tb, '  <div id="top">\n'];
tb = [tb, '    <div class="logo">\n'];		
tb = [tb, '      <a href="http://www.bio.vu.nl/thb/deb/deblab/"><img src="??img/bannercycle.png"  height = "60px"></a>\n'];
tb = [tb, '    </div>\n\n'];

tb = [tb, '    <div id="navwrapper">\n'];
tb = [tb, '      <div class = "dropdown">\n'];
tb = [tb, '        <button onclick="showDropdown(''deb'')" class="dropbtn">DEB</button>\n'];
tb = [tb, '        <div id="deb" class="dropdown-content">\n'];
tb = [tb, '          <a href="http://www.debtheory.org/wiki/" target="_blank">DEB Portal</a>\n'];
tb = [tb, '          <a href="https://en.wikipedia.org/wiki/Dynamic_energy_budget_theory" target="_blank">DEB Wikipedia</a>\n'];
tb = [tb, '          <a href="https://add-my-pet.github.io/DEBtool_M/docs/index.html" target="_blank">DEB Tool</a>\n'];
tb = [tb, '          <a href="https://www.bio.vu.nl/thb/deb/deblab/" target="_blank">DEB Laboratory</a>\n'];
tb = [tb, '          <a href="https://www.bio.vu.nl/thb/research/bib/Kooy2010_n.pdf" target="_blank">DEB Notation</a>\n'];
tb = [tb, '          <a href="https://www.zotero.org/groups/500643/deb_library/" target="_blank">DEB Library</a>\n'];
tb = [tb, '        </div>\n'];	
tb = [tb, '      </div>\n\n'];

tb = [tb, '      <div class = "dropdown">\n'];
tb = [tb, '        <button onclick="showDropdown(''context'')" class="dropbtn">CONTEXT</button>\n'];
tb = [tb, '        <div id="context" class="dropdown-content">\n'];
tb = [tb, '          <a href="??index.html">AmP Portal</a>\n'];
tb = [tb, '          <a href="http://www.debtheory.org/wiki/index.php?title=AmP_estimation_procedure" target="_blank">AmP Estimation</a>\n'];
tb = [tb, '          <a href="https://add-my-pet.github.io/AmPtool/docs/index.html" target="_blank">AmP Tool</a>\n'];
tb = [tb, '          <a href="??AmPeco.html">AmP Ecology</a>\n'];
tb = [tb, '          <a href="??phyla.html">Phyla</a>\n'];
tb = [tb, '          <a href="??pars.html">Parameters</a>\n'];
tb = [tb, '          <a href="??patterns.html">Patterns</a>\n'];
tb = [tb, '          <a href="??about.html">About</a>\n'];
tb = [tb, '        </div>\n'];
tb = [tb, '      </div>\n\n'];
	
tb = [tb, '      <div class = "dropdown">'];
tb = [tb, '        <button onclick="showDropdown(''collection'')" class="dropbtn">COLLECTION</button>\n'];
tb = [tb, '        <div id="collection" class="dropdown-content">\n'];
tb = [tb, '          <a href="??species_list.html">Species List</a>\n'];
tb = [tb, '          <a href="??species_tree_Animalia.html">Species Tree</a>\n'];
tb = [tb, '          <a href="??species_names.html">Species Names</a>\n'];
tb = [tb, '          <a href="??authors.html">Authors</a>\n'];
tb = [tb, '          <a href="??pie_pSGJRi.html">Energy Budgets</a>\n'];
img_zip = '<IMG SRC="??img/zipicon.png" WIDTH="30px"  BORDER="0">';
table = ['<tr> <td rowspan="2">', img_zip, '</td><td>AmPdata</td></tr><tr><td>', datestr(datenum(date), 'yyyymmdd'), '</td></tr>'];
tb = [tb, '          <a href="??AmPdata/AmPdata.zip"><table>', table, '</table></a>\n'];
tb = [tb, '        </div>\n'];
tb = [tb, '      </div>\n\n'];	

% tb budget
tbb = [tbb, '      <div class = "dropdown">\n'];
tbb = [tbb, '        <button onclick="showDropdown(''budget'')" class="dropbtn">ENERGY BUDGETS</button>\n'];
tbb = [tbb, '        <div id="budget" class="dropdown-content">\n'];
tbb = [tbb, '          <a href="pie_SGJRb.html">Over embryo</a>\n'];
tbb = [tbb, '          <a href="pie_pSGJRb.html">At birth</a>\n'];
tbb = [tbb, '          <a href="pie_pSGJRp.html">At puberty</a>\n'];
tbb = [tbb, '          <a href="pie_pSGJRi.html">At ultimate</a>\n'];
tbb = [tbb, '        </div>\n'];
tbb = [tbb, '      </div>\n\n'];

% tail
tbt = [tbt, '      <div class = "dropdown">\n'];
tbt = [tbt, '        <button onclick="showDropdown(''applications'')" class="dropbtn">APPLICATIONS</button>\n'];
tbt = [tbt, '        <div id="applications" class="dropdown-content">\n'];
tbt = [tbt, '          <a href="??popDyn/popDyn.html">Population Dynamics</a>\n'];
tbt = [tbt, '          <a href="??physBiol/physBiol.html">Physical Biology</a>\n'];
tbt = [tbt, '          <a href="??ecoTox/ecoTox.html">Ecotoxicity</a>\n'];
tbt = [tbt, '        </div>\n'];
tbt = [tbt, '      </div>\n\n'];

tbt = [tbt, '    </div> <!-- end of navwrapper -->\n'];
tbt = [tbt, '  </div> <!-- end of top -->\n'];

% write toolbars
oid_amp = fopen('toolbar_amp.html', 'w+');       
oid_app = fopen('toolbar_app.html', 'w+');       
oid_budget = fopen('toolbar_budget.html', 'w+'); 
oid_entry = fopen('toolbar_entry.html', 'w+');   
oid_AmPtool = fopen('toolbar_AmPtool.html', 'w+');  

fprintf(oid_amp, strrep([tb, tbt], '??', ''));
fprintf(oid_budget, strrep([tb, tbb, tbt], '??', ''));
fprintf(oid_app, strrep([tb, tbt], '??', '../'));
fprintf(oid_entry, strrep([tb, tbt], '??', '../../'));
fprintf(oid_AmPtool, strrep([tb, tbt], '??', 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/'));

fclose all;

movefile toolbar_amp.html '../../add_my_pet/sys/'
movefile toolbar_budget.html '../../add_my_pet/sys/'
movefile toolbar_app.html '../../add_my_pet/sys/'
movefile toolbar_entry.html '../../add_my_pet/sys/'
movefile toolbar_AmPtool.html '../../AmPtool/docs/'

end

