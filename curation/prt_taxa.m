%% prt_taxa
% writes taxa.html with jpg's of nodes

%%
function prt_taxa
% created 2022/07/16 Bas Kooijman

%% Syntax
% <../prt_taxa.m *prt_taxa*> 

%% Description
% Writes taxa.amp and taxaSel.js in directory add_my_pet with taxon jpg's, to be included in taxa.html
% The toolbar_tax.html, written by prt_toolbar has search/selection options.
% A click on a thumbnail opens species_tree.html at the clicked taxon, where you can see the name of the species and its phylogenetic position.
% Refresh the taxa-page by clicking on the logo-icon.
%
% Output:
% 
% * writes file ../../add_my_pet/taxa.amp
% * writes file ../../add_my_pet/sys/taxaSel.js 

%% Remarks
% The page show all taxa (genus-level and higher), but the search-dropdown only allows selection above the genus-level.
% Writes both taxa.txt and taxaSel.js, since each AmP addition requires a new update of both. 

%% Example of use
% prt_taxa

  % for 3300 entries, there are 4000 taxa (excluding entries) and 2100 genera
  taxa = list_taxa('Animalia',1); n_taxa = length(taxa); % all taxa, except entries
  genus = list_taxa('Animalia',3); % all genera
  notGen = setdiff(taxa,genus); n_notGen = length(notGen); % all taxa, except entries and genera
  
  WD = cdCur; cd ../../deblab/add_my_pet

  % write taxa.txt, which is included in static taxa.html

  oid = fopen('taxa.amp', 'w+'); % open file for writing, delete existing content
  for i = 1:n_taxa % for each jpg is one jpgcap
    fprintf(oid, '<div class="jpg"><img src="img/tree/%s.jpg"  width="260px" onclick="shTree(''%s'')"><div class="jpgcap">%s</div></div>\n', taxa{i},taxa{i},taxa{i});
  end 
  fclose(oid);

  % write taxaSel.js, which is used by dropdown taxaSearch in toolbar_taxa.html of taxa.html for selection of taxa that are shown
  
  fid = fopen('sys/taxaSel.js', 'w+'); % open file for writing, delete existing content
  fprintf(fid, 'function taxaSel(taxon){\n');
  fprintf(fid, '  var i, id, taxa;\n');
  fprintf(fid, '  document.getElementById("taxon").innerHTML = taxon;\n');
  fprintf(fid, '  const z = document.getElementsByClassName("jpg");\n');
  fprintf(fid, '  switch(taxon) {\n');
  for i = 1:n_notGen
    taxa = list_taxa(notGen{i},1); n_taxa = length(taxa);
    txt = '['; for j = 1:n_taxa; txt = [txt, '"', taxa{j}, '",']; end; txt(end) = ']';
    fprintf(fid, '    case ''%s'':\n', notGen{i});
    fprintf(fid, '      taxa = %s;\n', txt);
    fprintf(fid, '      for (i = 0; i < z.length; i++) {\n');
    fprintf(fid, '        id = document.getElementsByClassName("jpgcap")[i].innerHTML;\n');
    fprintf(fid, '        if (taxa.includes(id)) {z[i].style.display = "";} else {z[i].style.display = "none";}\n');
    fprintf(fid, '      } break;\n');
  end
  fprintf(fid, '    default:\n');
  fprintf(fid, '      for (i = 0; i < z.length; i++) {z[i].style.display = "";}\n');
  fprintf(fid, '  }\n');
  fprintf(fid, '}\n');
  fclose(fid);

  cd(WD)

end
