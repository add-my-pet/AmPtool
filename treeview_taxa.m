%% treeview_taxa
% shows pedigree in interactive html

%%
function treeview_taxa (taxon, var, info)
% created 2016/03/06 by Bas Kooijman, modified 2017/08/06, 2017/10/08, 2018/06/26, 2018/07/12

%% Syntax
% <../treeview_taxa.m *treeview_taxa*> (taxon, var, info) 

%% Description
% First produces pedigree with function <pedigree.html *pedigree*> and 
% uses the result to create files /treeview/treeview_taxa.js and treeview_taxa_search.html and /treeview/treeview_taxa.css.
% Then opens AmPtool/taxa/treeview/treeview_taxa.html in the system browser.
%
% Input:
%
% * taxon: optional character string with a taxon (default 'Animalia')
% * var: optional character string with name of variable, or vector with values of variable
% * info: optional boolean for background-color-gradients on all nodes (1), or background-colors on leaves only (0, default);

%% Remarks
% Taxon must be a node in the taxonomic tree, see <list_taxa.m *list_taxa*>
% Name of variable must be in allStat.mat.
% If the numerical value is used, the length should equal length(select(taxon)).
% Construction time for large trees with specified second input may take a while.

%% Example of use
%  treeview_taxa('Cladocera');
%  treeview_taxa(select_taxon('Crustacea',1)); % choose from shown list of all nodes of Crustacea
%  treeview_taxa(select_taxon('',1));          % choose from shown list of all nodes of Animalia
%  treeview_taxa('Mammalia', 'kap');           % show distribution of kap (or any other variable in allStat) among mammals
%  % show distribution of start of development as fraction of age at birth among birds
%  var = read_stat(select('Aves'), 't_0', 'a_b'); treeview_taxa('Aves', var(:,1)./var(:,2)); 

  if ~exist('taxon','var') || isempty(taxon)
    taxon = 'Animalia';
  end
  
  WD = pwd;                          % store current path
  pathTaxa = which('treeview_taxa'); % locate taxa
  pathTaxa = pathTaxa(1:end - 15);   % path to taxa
  cd(pathTaxa)                       % goto taxa

  try
    pedigree_taxon = pedigree(taxon);
    fid_tv = fopen('./taxa/treeview/treeview_taxa.js', 'w+'); % open file for writing, delete existing content

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
    fprintf(fid_tv, 'STARTALLOPEN = 1\n'); % 0: Expand only the root node. Do not open other folders; 1: Expand all folders, showing every node in the tree. 
    fprintf(fid_tv, 'USEFRAMES = 0\n');    % 0: Use TreeView in a frame-less layout; 1: Use TreeView in a frame-based layout where the tree is in its own frame
    fprintf(fid_tv, 'USEICONS = 0\n');     % 0: Do not display the icons; 1: Display the icons
    fprintf(fid_tv, 'WRAPTEXT = 1\n');     % 0: The text portion of a node will appear on one line only; 1: The text portion of a node will wrap to always be visible 
    fprintf(fid_tv, 'PRESERVESTATE = 1\n');% 0: Do not store the state of the tree across page loads; 1: Store the state of the tree in cookies, and use that state on next visit
    fprintf(fid_tv, 'HIGHLIGHT = 1\n\n');  % 0: Do not highlight the selected node; 1: Highlight the selected node
    
    fprintf(fid_tv, 'var AmPpath = ''https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/'';\n\n');  % set path to my_pet_res.html
  
    % build tree
    nl = strfind(pedigree_taxon, char(10)); root = pedigree_taxon(1:nl-1); pedigree_taxon(1:nl) = []; i = 0; % initiate leaf counter
    fprintf(fid_tv, ['foldersTree = gFld("<b>', root, '</b>", "treeview_taxa.html")\n']);
    fprintf(fid_tv, ['foldersTree.xID = "', root, '"\n']);

    while length(pedigree_taxon) > 3
      nl = strfind(pedigree_taxon, char(10)); node = pedigree_taxon(1:nl-1); pedigree_taxon(1:nl) = [];
      level = max(strfind(node, char(9))); node(1:level) = []; L = ['L', num2str(level)]; Lnew = ['L', num2str(1 + level)];
      if level == 1
        fprintf(fid_tv, ['L2 = insFld(foldersTree, gFld("<p id=''', node, '''>', node, '</p>", "treeview_taxa.html?pic=', '%%22', node, '%%2Ejpg', '%%22"))\n']);
        fprintf(fid_tv, ['L2.xID = "', node, '"\n']);
      elseif isempty(strfind(node, '_')) && isempty(strfind(node, ' ')) 
        fprintf(fid_tv, [Lnew, ' = insFld(', L, ', gFld("<p id=''', node, '''>', node, '</p>", "treeview_taxa.html?pic=', '%%22', node, '%%2Ejpg', '%%22"))\n']);
        fprintf(fid_tv, [Lnew, '.xID = "', node, '"\n']);
      else
        i = i + 1; nm = ['lv', num2str(i)]; % name for leaf
        fprintf(fid_tv, [nm, ' = insDoc(', L, ', gLnk("S", "<p id=''', node, '''>', node, '</p>", AmPpath + "', node, '/', node, '_res.html"))\n']); 
        fprintf(fid_tv, [nm, '.xID = "', node, '"\n']);
      end
    end
 
    fprintf(fid_tv, ['foldersTree.treeID = "', root, '"\n']);
    fclose(fid_tv);
    
    % write treeview_taxa_search.html
    fid_tv = fopen('./taxa/treeview/treeview_taxa_search.html', 'w+'); % open file for writing, delete existing content

    fprintf(fid_tv, '<div class="TreeSearch"> <!-- taxon -->\n');
    fprintf(fid_tv, '  <input id="TaxonDropdownInput" class="TreeSearch_dropbtn" onclick="showDropdown(''TaxonDropdown'')" onkeyup="InputTreeSearch(''TaxonDropdown'')" \n');
    fprintf(fid_tv, '    placeholder="Search for taxon.." type="text" title="Type part of name and click on list"></input>\n');
    fprintf(fid_tv, '  <div id="TaxonDropdown" class="TreeSearch-content">\n');
    fprintf(fid_tv, '    <ul id="TaxonDropdownSearchlist" class="TreeSearch">\n');
 
    list = list_taxa(taxon, 1); % ordered list of all nodes, exclusind leave
    n = length(list);
    for i = 1:n
    fprintf(fid_tv,['      <li><a onclick="TreeSearch(''', list{i}, ''')">', list{i}, '</a></li>\n']);
    end
    
    fprintf(fid_tv, '    </ul> <!-- end of TaxonDownSearchlist -->\n');
    fprintf(fid_tv, '  </div> <!-- end of TaxonDropdown -->\n');
    fprintf(fid_tv, '</div> <!-- end of taxon -->\n');
    fclose(fid_tv);

    % write treeview_taxa.css    
    fid_tv = fopen('./taxa/treeview/treeview_taxa.css', 'w+'); % open file for writing, delete existing content
    fprintf(fid_tv, 'p {margin: 0px;}\n\n');

    if exist('var', 'var') % only construct background color gradients if second input exists
      taxa = select(taxon);
      if ~isnumeric(var)
        var = read_stat(taxa, {var}); 
      else
        if ~length(var)==length(taxa)
          fprintf('Number of data does not match number of species\n');
          fclose all; return;
        end
      end
      var_min = min(var); var_max = max(var); var = (var - var_min)/ (1e-5 + var_max - var_min);
      shcolor_lava([var_min; var_max], taxon); % show figure with lava colour-scheme and range of values

      if ~exist('info', 'var') || info == false % background colors on leaves only
        n_leaves = length(var);
        color_node = max(0,(round(1e3 * color_lava(var)) - 1));
        for i = 1:n_leaves
          fprintf(fid_tv, ['#', taxa{i}, '{color: #BFBFBF; background: rgb(', num2str(color_node(i,1)), ',' num2str(color_node(i,2)), ',' num2str(color_node(i,3)), ')}\n']);
        end
      else % background color gradients on all nodes
        pedigree_taxon = pedigree(taxon);
        while length(pedigree_taxon) > 3
          nl = strfind(pedigree_taxon, char(10)); node = pedigree_taxon(1:nl-1); pedigree_taxon(1:nl) = [];
          level = max(strfind(node, char(9))); node(1:level) = [];
          fprintf(fid_tv, ['#', node, '{\n']);    
          var_node = sort(var(select_01(taxon, node))); n_var_node = size(var_node,1);
          color_node = max(0,(round(1e3 * color_lava(var_node)) - 1)); pos_node = round(100*(1:n_var_node)/n_var_node); 
          if n_var_node == 1
            fprintf(fid_tv, ['color: #BFBFBF; background: rgb(', num2str(color_node(1,1)), ',' num2str(color_node(1,2)), ',' num2str(color_node(1,3)), ')}\n']);
          else
            if n_var_node == 2
              color_node = color_node([1;1;2;2],:); pos_node = [0;50;51;100]; n_var_node = 4;
            elseif n_var_node == 3
              color_node = color_node([1;1;2;2;3;3],:); pos_node = [0;33;34;66;67;100]; n_var_node = 6;
            elseif n_var_node == 4
              color_node = color_node([1;1;2;2;3;3;4;4],:); pos_node = [0;25;26;50;51;75;76;100]; n_var_node = 8;
            elseif n_var_node > 10 % find pos_node nearest to 10%,.,.90%
              index = ones(11,1); index(11) = n_var_node; % initiate index
              for i = 1:9
                [s in] = sort((pos_node - i*10).^2); index(1+i) = in(1);
              end
              color_node = color_node(index,:); pos_node = pos_node(index); n_var_node = 11; % select in color_node and pos_node
            end
            txt = ''; % initiate txt for color gradient
            for i = 1:n_var_node
              txt = [txt, ' rgb(', num2str(color_node(i,1)), ',' num2str(color_node(i,2)), ',' num2str(color_node(i,3)), ') ', num2str(pos_node(i)), '%%,'];
            end
            txt(end) = []; % remove last ,
            fprintf(fid_tv, ['  color: #BFBFBF; background: linear-gradient(to right,', txt, ');\n']);
            fprintf(fid_tv, '}\n');
          end
        end
      end
    end
    fclose(fid_tv);

  catch
    disp('An error occured during writing files')
    fclose all;
  end
  
  web('/treeview/treeview_taxa.html','-browser')
  
  cd(WD)                    % goto original path
