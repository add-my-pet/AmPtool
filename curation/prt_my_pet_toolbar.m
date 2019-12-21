%% prt_my_pet_toolbar
% prints the menu bar which is used for the pages which are specific for a given species

%%
function  prt_my_pet_toolbar(species, species_en, date_acc, destinationFolder)
% created 2018/04/27 Bas Kooijman, modified 2019/07/12 

%% Syntax
% <../prt_my_pet_toolbar.m *prt_my_pet_toolbar*> (species, species_en, date_acc, destinationFolder)

%% Description
% Prints my_pet_toolbar.html for presentation in my_pet_res.html, my_pet_par.html, my_pet_stat.html, 
%
% Input:
%
% * species: string, scientific name of the species (Genus_species)
% * species_en: string, common name of the species 
% * date_acc: 3-vector with date of acceptance (from metaData.date_acc)
% * destinationFolder : optional string with destination folder the files are printed to (default: current folder)

%% Remarks
% Indent of 2 spaces used for printing to html page
% Edit /sys/drowdown.js for adding dropdwn's

%% Example of use
% load('results_my_pet.mat');
% prt_my_pet_toolbar(metaData.species,metaData.species_en,metaData.date_acc) if you wish to print in the current folder

genus = strsplit(species,'_'); genus = genus{1}; % identify genus for link to species_tree_Animalia

if exist('destinationFolder','var') && isempty('destinationFolder')
  oid = [];
elseif exist('destinationFolder','var') 
  oid = fopen([destinationFolder, species, '_toolbar.html'], 'w+'); % open file for reading and writing and deletes old content
else
  oid = fopen([species, '_toolbar.html'], 'w+');                    % open file for reading and writing and deletes old content   
end

fprintf(oid, '  <h1 class="alignleft2">\n');
fprintf(oid, '    &nbsp; <a onclick="OpenListAtTaxon(''%s'')" title="click to go to species_list">%s</a> &nbsp;\n', species, species);
fprintf(oid, '    (<a onclick="OpenTreeAtTaxon(''%s'')" title="click to go to species_tree">%s</a>): &nbsp;\n', genus, species_en);
fprintf(oid, '  </h1>\n\n');

fprintf(oid, '  <div id="navwrapper">\n');
fprintf(oid, '    <div class = "dropdown"><button onclick="showDropdown(''species'')" class="dropbtn">Results</button>\n');
fprintf(oid, '      <div id="species" class="dropdown-content">\n');
fprintf(oid, '        <a href="%s_par.html">Parameters</a>\n', species);
fprintf(oid, '        <a href="%s_stat.html">Implied traits</a>\n', species);    
fprintf(oid, '        <a href="%s_pop.html">Population traits</a>\n', species);    
fprintf(oid, '        <a href="%s_res.html">Predictions & Data</a>\n', species);
fprintf(oid, '        <a href="%s_bib.bib">Bibliography</a>\n', species);
fprintf(oid, '        <a href="%s_cit.html">Citation</a>\n', species);
fprintf(oid, '      </div>\n');
fprintf(oid, '    </div>\n\n');

zip = get_zip(species); n_zip = size(zip, 1); % see if there are any obsolete zip's in the archive
fprintf(oid, '    <div class = "dropdown"><button onclick="showDropdown(''code'')" class="dropbtn">Code</button>\n');
fprintf(oid, '      <div id="code" class="dropdown-content">\n');
fprintf(oid, '        <a href="../../entries/%s/mydata_%s.m" target="_blank">mydata</a>\n', species, species);
fprintf(oid, '        <a href="../../entries/%s/pars_init_%s.m" target="_blank">pars_init</a>\n', species, species);
fprintf(oid, '        <a href="../../entries/%s/predict_%s.m" target="_blank">predict</a>\n', species, species);
fprintf(oid, '        <a HREF="../../entries_zip/%s_%s.zip" TARGET="_top" onMouseOver="window.status=Close submenu; return true;">\n', species, datestr(datenum(date_acc), 'yyyymmdd'));
fprintf(oid, '          <IMG SRC="../../img/zipicon.png" WIDTH="30px"  BORDER="0">%s</a>\n', datestr(datenum(date_acc), 'yyyymmdd'));
for i = 1:n_zip % work from bottom to top to get oldest zip's on bottom
fprintf(oid, '        <a HREF="../../entries_archive/%s_%s.zip" TARGET="_top" onMouseOver="window.status=Close submenu; return true;">\n', species, zip{n_zip-i+1,2});
fprintf(oid, '          <IMG SRC="../../img/zipicon.png" WIDTH="30px"  BORDER="0">%s</a>\n', zip{n_zip-i+1,2});
end
fprintf(oid, '      </div>\n');
fprintf(oid, '    </div>\n\n');

links = get_link(species); n_link = size(links,1);
fprintf(oid, '    <div class = "dropdown"><button onclick="showDropdown(''link'')" class="dropbtn">Links</button>\n');
fprintf(oid, '      <div id="link" class="dropdown-content">\n');
for i = 1:n_link
fprintf(oid, '        <a href="%s" target="_blank">%s</a>\n', links{i,1}, links{i,2});
end
fprintf(oid, '      </div>\n');
fprintf(oid, '    </div>\n\n');

fprintf(oid, '  </div> <!-- end of navwrapper -->\n');

fclose(oid);
end

