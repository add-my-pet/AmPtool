%% prt_species_tree_taxa_js
% writes species_tree_taxa{i}.js and species_tree_taxa{i}_taxon.html that are used by species_tree_taxa{i}.html

%%
function prt_species_tree_taxa_js(taxa)
% created 2016/03/06 by Bas Kooijman, 
% modified 2016/06/01 Starrlight Augustine, 2016/06/02, 2016/10/08, 2017/10/13, 2018/06/15, 2018/06/26, 2021/02/20, 2022/02/09 Bas Kooijman

%% Syntax
% <../prt_species_tree_taxa_js.m *prt_species_tree_taxa_js*> (taxa) 

%% Description
% Clears and creates files that are used by  species_tree_taxa{i}.html for tree navigation.
% These support files are a js-file that defined the tree and a search.html files that define the search dropdowns
%
% Input:
%
% * taxa: optional cell string with taxa of the roots of the trees, default: 'Animalia' 
%
% Output:
% 
% * writes files ../../add_my_pet/species_tree_taxa{i}_taxon.html for i = 1, 2, ..
% * writes files ../../add_my_pet/sys/species_tree_taxa{i}_search.html for i = 1, 2, ..
% * writes files ../../add_my_pet/sys/species_tree_taxa{i}.js for i = 1, 2, ..

%% Remarks
% file ../../add_my_pet/species_tree_taxa{i}.html calls 
%  * java-scripts ../../add_my_pet/sys/ftiens4.js, ua.js
%  * gif's ../../add_my_pet/img/nm.gif
%  * jpg's ../../add_my_pet/img/tree/nm.jpg
%  * txt's ../../add_my_pet/img/tree/nm.txt

%% Example of use
% * prt_species_tree_taxa_js; open ../../species_tree_Animalia.html  to see the results
% * prt_species_tree_taxa_js({'Tetrapoda'}); open ../../species_tree_Tetrapoda.html to see the result
    
%  check_entries; % test presence of entries in tree against local and server
  
  if ~exist('taxa','var')
    taxa = {'Animalia'};
  end
    
  n = length(taxa);
    
  for i = 1:n
    pedigree_taxa = pedigree(taxa{i});
    fid_tv = fopen(['../../deblab/add_my_pet/sys/species_tree_',taxa{i},'.js'], 'w+'); % open file for writing, delete existing content

    % write header
    fprintf(fid_tv, '//\n');
    fprintf(fid_tv, '// Copyright (c) 2006 by Conor O''''Mahony.\n');
    fprintf(fid_tv, '// For enquiries, please email GubuSoft@GubuSoft.com\n');
    fprintf(fid_tv, '// Please keep all copyright notices below.\n');
    fprintf(fid_tv, '// Original author of TreeView script is Marcelino Martins.\n');
    fprintf(fid_tv, '// This document includes the TreeView script.\n');
    fprintf(fid_tv, '// The TreeView script can be found at http://www.TreeView.net.\n');
    fprintf(fid_tv, '// The script is Copyright (c) 2006 by Conor O''''Mahony.\n');
    fprintf(fid_tv, '//\n');
    fprintf(fid_tv, '// You can find general instructions for this file at www.treeview.net.\n');
    fprintf(fid_tv, '//\n\n');
  
    % write specs
    fprintf(fid_tv, 'USETEXTLINKS = 1\n'); % 0: The icon is the only link to a destination; 1: Both the icon and the text are links to the destination
    fprintf(fid_tv, 'STARTALLOPEN = 0\n'); % 0: Expand only the root node. Do not open other folders; 1: Expand all folders, showing every node in the tree. 
    fprintf(fid_tv, 'USEFRAMES = 0\n');    % 0: Use TreeView in a frame-less layout; 1: Use TreeView in a frame-based layout where the tree is in its own frame
    fprintf(fid_tv, 'USEICONS = 0\n');     % 0: Do not display the icons; 1: Display the icons
    fprintf(fid_tv, 'WRAPTEXT = 1\n');     % 0: The text portion of a node will appear on one line only; 1: The text portion of a node will wrap to always be visible 
    fprintf(fid_tv, 'PRESERVESTATE = 1\n');% 0: Do not store the state of the tree across page loads; 1: Store the state of the tree in cookies, and use that state on next visit
    fprintf(fid_tv, 'HIGHLIGHT = 1\n');    % 0: Do not highlight the selected node; 1: Highlight the selected node
    fprintf(fid_tv, 'ICONPATH = ''img/''\n\n'); % path to icons for tree
  
    % build tree
    nl = strfind(pedigree_taxa, char(10)); node = pedigree_taxa(1:nl-1); pedigree_taxa(1:nl) = [];
    fprintf(fid_tv, 'foldersTree = gFld("<b>%s</b>", "species_tree_%s.html?pic=%%22%s%%2Ejpg%%22")\n',node,taxa{i},node);
    fprintf(fid_tv, 'foldersTree.xID = "%s"\n',taxa{i});
    j = 0; % initiate leave counter

    while length(pedigree_taxa) > 3
      nl = strfind(pedigree_taxa, newline); node = pedigree_taxa(1:nl-1); pedigree_taxa(1:nl) = []; 
      level = max(strfind(node, char(9))); node(1:level) = []; L = ['L', num2str(level)]; Lnew = ['L', num2str(1 + level)];
      if level == 1
        fprintf(fid_tv, 'L2 = insFld(foldersTree, gFld("%s", "species_tree_%s.html?pic=%%22%s%%2Ejpg%%22"))\n',node,taxa{i},node);
        fprintf(fid_tv, 'L2.xID = "%s"\n',node);
        %fprintf(fid_tv, ['L2 = insFld(foldersTree, gFld("', node, '", ""))\n']);
      elseif isempty(strfind(node, '_')) && isempty(strfind(node, ' ')) 
        fprintf(fid_tv, '%s = insFld(%s, gFld("%s", "species_tree_%s.html?pic=%%22%s%%2Ejpg%%22"))\n',Lnew,L,node,taxa{i},node);
        fprintf(fid_tv, '%s.xID = "%s"\n', Lnew,node);
        %fprintf(fid_tv, [Lnew, ' = insFld(', L, ', gFld("', node, '", ""))\n']);
      else
        j = j + 1; nm = ['lv', num2str(j)]; % name for leave
        fprintf(fid_tv, '%s = insDoc(%s, gLnk("S", "%s", "entries_web/%s/%s_res.html"))\n',nm,L,node,node,node); 
        fprintf(fid_tv, '%s.xID = "%s"\n', nm,node);
      end
    end
    
    fprintf(fid_tv, 'foldersTree.treeID = "%s"\n',taxa{i});
    fclose(fid_tv);
    
    % write species_tree_taxa{i}_search.html, which is used by species_tree_taxa{i}.html for searching taxon, genus, family, order, class
    
    fid_tv = fopen(['../../deblab/add_my_pet/sys/species_tree_', taxa{i}, '_search.html'], 'w+'); % open file for writing, delete existing content

    % taxon 
    fprintf(fid_tv, '<div class="TreeSearch"> <!-- taxon -->\n');
    fprintf(fid_tv, '  <input id="TaxonDropdownInput" class="TreeSearch_dropbtn" onclick="showDropdown(''TaxonDropdown'')" onkeyup="InputTreeSearch(''TaxonDropdown'')" \n');
    fprintf(fid_tv, '    placeholder="Taxon.." type="text" title="Type part of name and click on list">\n');
    fprintf(fid_tv, '  <div id="TaxonDropdown" class="TreeSearch-content">\n');
    fprintf(fid_tv, '    <ul id="TaxonDropdownSearchlist" class="TreeSearch">\n');
    %
    list = list_taxa(taxa{i}, 1); % ordered list of all nodes, excluding leaves
    n = length(list);
    for j = 1:n
    fprintf(fid_tv, '      <li><a onclick="TreeSearch(''%s'')">%s</a></li>\n',list{j},list{j});
    end
    fprintf(fid_tv, '    </ul> <!-- end TaxonDropdownSearchlist -->\n');
    fprintf(fid_tv, '  </div> <!-- end TaxonDropdown -->\n');
    fprintf(fid_tv, '</div> <!-- end taxon -->\n\n');

    % genus
    fprintf(fid_tv, '<div class="TreeSearch"> <!-- genus -->\n');
    fprintf(fid_tv, '  <input id="GenusDropdownInput" class="TreeSearch_dropbtn" onclick="showDropdown(''GenusDropdown'')" onkeyup="InputTreeSearch(''GenusDropdown'')" \n');
    fprintf(fid_tv, '    placeholder="Genus.." type="text" title="Type part of name and click on list"></input>\n');
    fprintf(fid_tv, '  <div id="GenusDropdown" class="TreeSearch-content">\n');
    fprintf(fid_tv, '    <ul id="GenusDropdownSearchlist" class="TreeSearch">\n');
    %
    list = list_taxa(taxa{i}, 3); % ordered list of genera
    n = length(list);
    for j = 1:n
    fprintf(fid_tv, '      <li><a onclick="TreeSearch(''%s'')">%s</a></li>\n',list{j},list{j});
    end
    fprintf(fid_tv, '    </ul> <!-- end GenusDropdownSearchlist -->\n');
    fprintf(fid_tv, '  </div> <!-- end GenusDropdown -->\n');
    fprintf(fid_tv, '</div> <!-- end genus -->\n\n');

    % family
    fprintf(fid_tv, '<div class="TreeSearch"> <!-- family -->\n');
    fprintf(fid_tv, '  <input id="FamilyDropdownInput" class="TreeSearch_dropbtn" onclick="showDropdown(''FamilyDropdown'')" onkeyup="InputTreeSearch(''FamilyDropdown'')" \n');
    fprintf(fid_tv, '    placeholder="Family.." type="text" title="Type part of name and click on list"></input>\n');
    fprintf(fid_tv, '  <div id="FamilyDropdown" class="TreeSearch-content">\n');
    fprintf(fid_tv, '    <ul id="FamilyDropdownSearchlist" class="TreeSearch">\n');
    %
    list = list_taxa(taxa{i}, 4); % ordered list of all families
    n = length(list);
    for j = 1:n
    fprintf(fid_tv, '      <li><a onclick="TreeSearch(''%s'')">%s</a></li>\n',list{j},list{j});
    end
    fprintf(fid_tv, '    </ul> <!-- end FamilyDropdownSearchlist -->\n');
    fprintf(fid_tv, '  </div> <!-- end FamilyDropdown -->\n');
    fprintf(fid_tv, '</div> <!-- end family -->\n\n');

    % order
    fprintf(fid_tv, '<div class="TreeSearch"> <!-- order -->\n');
    fprintf(fid_tv, '  <input id="OrderDropdownInput" class="TreeSearch_dropbtn" onclick="showDropdown(''OrderDropdown'')" onkeyup="InputTreeSearch(''OrderDropdown'')" \n');
    fprintf(fid_tv, '    placeholder="Order.." type="text" title="Type part of name and click on list"></input>\n');
    fprintf(fid_tv, '  <div id="OrderDropdown" class="TreeSearch-content">\n');
    fprintf(fid_tv, '    <ul id="OrderDropdownSearchlist" class="TreeSearch">\n');
    %
    list = list_taxa(taxa{i}, 5); % ordered list of all orders
    n = length(list);
    for j = 1:n
    fprintf(fid_tv, '      <li><a onclick="TreeSearch(''%s'')">%s</a></li>\n', list{j},list{j});
    end   
    fprintf(fid_tv, '    </ul> <!-- end OrderDropdownSearchList -->\n');
    fprintf(fid_tv, '  </div> <!-- end OrderDropdown -->\n');
    fprintf(fid_tv, '</div> <!-- end order -->\n\n');

    % class
    if strcmp(taxa{i},'Animalia') || strcmp(taxa{i},'Mollusca') || strcmp(taxa{i},'Tetrapoda')
    fprintf(fid_tv, '<div class="TreeSearch"> <!-- class -->\n');
    fprintf(fid_tv, '  <input id="ClassDropdownInput" class="TreeSearch_dropbtn" onclick="showDropdown(''ClassDropdown'')" onkeyup="InputTreeSearch(''ClassDropdown'')"\n');
    fprintf(fid_tv, '    placeholder="Class.." type="text" title="Type part of name and click on list"></input>\n');
    fprintf(fid_tv, '  <div id="ClassDropdown" class="TreeSearch-content">\n');
    fprintf(fid_tv, '    <ul id="ClassDropdownSearchlist" class="TreeSearch">\n');
    %
    list = list_taxa(taxa{i}, 6); % ordered list of all classes
    n = length(list);
    for j = 1:n
    fprintf(fid_tv, '      <li><a onclick="TreeSearch(''%s'')">%s</a></li>\n',list{j},list{j});
    end
    fprintf(fid_tv, '    </ul> <!-- end ClassDropdownSearchList -->\n');
    fprintf(fid_tv, '  </div> <!-- end ClassDropdown -->\n');
    fprintf(fid_tv, '</div> <!-- end class -->\n\n');
    end
    
    % phylum
    fprintf(fid_tv, '<div class="TreeSearch"> <!-- phylum -->\n');
    fprintf(fid_tv, '  <input id="PhylumDropdownInput" class="TreeSearch_dropbtn" onclick="showDropdown(''PhylumDropdown'')" onkeyup="InputTreeSearch(''PhylumDropdown'')"\n');
    fprintf(fid_tv, '    placeholder="Phylum .." type="text" title="Type part of name and click on list"></input>\n');
    fprintf(fid_tv, '  <div id="PhylumDropdown" class="TreeSearch-content">\n');
    fprintf(fid_tv, '    <ul id="PhylumDropdownSearchlist" class="TreeSearch">\n');
    %
    list = list_taxa(taxa{i}, 7); % ordered list of all phyla
    n = length(list);
    for j = 1:n
    fprintf(fid_tv, '      <li><a onclick="TreeSearch(''%s'')">%s</a></li>\n',list{j},list{j});
    end
    fprintf(fid_tv, '    </ul> <!-- end PhylumDropdownSearchList -->\n');
    fprintf(fid_tv, '  </div> <!-- end PhylumDropdown -->\n');
    fprintf(fid_tv, '</div> <!-- end phylum -->\n\n');
  end
    
  fclose(fid_tv);
   
  end 
