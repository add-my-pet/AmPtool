%% prt_my_pet_toolbar
% prints the menu bar which is used for the pages which are specific for a given species

%%
function  prt_my_pet_toolbar(my_pet, destinationFolder)
% created 2018/04/27 Bas Kooijman, modified 2019/07/12 , 2019/12/25

%% Syntax
% <../prt_my_pet_toolbar.m *prt_my_pet_toolbar*> (metaData, destinationFolder)

%% Description
% Prints my_pet_toolbar.html for presentation in my_pet_res.html, my_pet_par.html, my_pet_stat.html.
% Reads links-info from results_my_pet.mat, and assumes that the current directory contains that file
%
% Input:
%
% * my_pet: character string with name of entry
% * destinationFolder : optional string with destination folder the files starting from AmPtool/curation
% are printed to (default: current folder),

%% Remarks
% * Indent of 2 spaces used for printing to html page
% * Edit /sys/drowdown.js for adding dropdwn's

%% Example of use
% prt_my_pet_toolbar('Daphnia_magna') if you wish to print in the current folder

%load(['../../../add_my_pet/entries/', my_pet, '/results_', my_pet,'.mat'])

if exist('destinationFolder','var') && isempty(destinationFolder)
  oid = []; load(['/results_', my_pet,'.mat'],'metaData');
elseif exist('destinationFolder','var') 
  WD = cdCur; load(['../../deblab/add_my_pet/entries/', my_pet, '/results_', my_pet,'.mat']); cd(WD);
  oid = fopen([destinationFolder, metaData.species, '_toolbar.html'], 'w+'); % open file for reading and writing and deletes old content
else
  oid = fopen([my_pet, '_toolbar.html'], 'w+');                    % open file for reading and writing and deletes old content   
  load(['/results_', my_pet,'.mat'],'metaData');
end
genus = strsplit(my_pet,'_'); genus = genus{1}; % identify genus for link to species_tree_Animalia

fprintf(oid, '  <h1 class="alignleft2">\n');
fprintf(oid, '    &nbsp; <a onclick="OpenListAtTaxon(''%s'')" title="click to go to species_list">%s</a> &nbsp;\n', my_pet, my_pet);
fprintf(oid, '    (<a onclick="OpenTreeAtTaxon(''%s'')" title="click to go to species_tree">%s</a>): &nbsp;\n', genus, metaData.species_en); 
fprintf(oid, '  </h1>\n\n');

fprintf(oid, '  <div id="navwrapper">\n');
fprintf(oid, '    <div class = "dropdown"><button onclick="showDropdown(''species'')" class="dropbtn">Results</button>\n');
fprintf(oid, '      <div id="species" class="dropdown-content">\n');
fprintf(oid, '        <a href="%s_par.html">Parameters</a>\n', my_pet);
fprintf(oid, '        <a href="%s_stat.html">Implied traits</a>\n', my_pet);    
fprintf(oid, '        <a href="%s_pop.html">Population traits</a>\n', my_pet);    
fprintf(oid, '        <a href="%s_res.html">Predictions & Data</a>\n', my_pet);
fprintf(oid, '        <a href="%s_bib.bib">Bibliography</a>\n', my_pet);
fprintf(oid, '        <a href="%s_cit.html">Citation</a>\n', my_pet);
fprintf(oid, '      </div>\n');
fprintf(oid, '    </div>\n\n');

WD = cdCur; zip = get_zip(my_pet); n_zip = size(zip, 1);cd(WD); % see if there are any obsolete zip's in the archive
fprintf(oid, '    <div class="dropdown"><button onclick="showDropdown(''code'')" class="dropbtn">Code</button>\n');
fprintf(oid, '      <div id="code" class="dropdown-content">\n');
fprintf(oid, '        <a href="../../entries/%s/mydata_%s.m" target="_blank">mydata</a>\n', my_pet, my_pet);
fprintf(oid, '        <a href="../../entries/%s/pars_init_%s.m" target="_blank">pars_init</a>\n', my_pet, my_pet);
fprintf(oid, '        <a href="../../entries/%s/predict_%s.m" target="_blank">predict</a>\n', my_pet, my_pet);
fprintf(oid, '        <a href="../../entries_zip/%s_%s.zip" TARGET="_top" onMouseOver="window.status=Close submenu; return true;">\n', my_pet, datestr(datenum(metaData.date_acc), 'yyyymmdd'));
fprintf(oid, '          <IMG SRC="../../img/zipicon.png" WIDTH="30px"  BORDER="0">%s</a>\n', datestr(datenum(metaData.date_acc), 'yyyymmdd'));
for i = 1:n_zip % work from bottom to top to get oldest zip's on bottom
fprintf(oid, '        <a href="../../entries_archive/%s_%s.zip" TARGET="_top" onMouseOver="window.status=Close submenu; return true;">\n', my_pet, zip{n_zip-i+1,2});
fprintf(oid, '          <IMG SRC="../../img/zipicon.png" WIDTH="30px"  BORDER="0">%s</a>\n', zip{n_zip-i+1,2});
end
fprintf(oid, '      </div>\n');
fprintf(oid, '    </div>\n\n');

links = get_links(my_pet); n_links = size(links,1);

fprintf(oid, '    <div class="dropdown"><button onclick="showDropdown(''link'')" class="dropbtn">Links</button>\n');
fprintf(oid, '      <div id="link" class="dropdown-content">\n');
for i = 1:n_links
fprintf(oid, '        <a href="%s" target="_blank">%s</a>\n', links{i,1}, links{i,2});
end
fprintf(oid, '      </div>\n');
fprintf(oid, '    </div>\n\n');

fprintf(oid, '    <div class="jump">\n');
fprintf(oid, '      <img onclick="specJump(''%s'',''0'')" src="../../img/specDwn.png" width="40px">\n', my_pet);
fprintf(oid, '      <img onclick="specJump(''%s'',''1'')" src="../../img/specUp.png" width="40px">\n', my_pet);
fprintf(oid, '    </div>\n\n');

fprintf(oid, '  </div> <!-- end of navwrapper -->\n');

fclose(oid);
end



