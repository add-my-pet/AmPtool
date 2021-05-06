%% clade
% gets all species that are closest related to specified taxa

%%
function [members, taxon] = clade(taxa, level, site)
% created 2015/09/18 by Bas Kooijman; modified 2017/12/23, 2018/01/05,
% 2018/01/30, 2019/02/25, 2021/04/1, 2021/05/05

%% Syntax
% [members, taxon] = <../clade.m *clade*> (taxa, level, site) 

%% Description
% If taxa contains several members, clade gets all species in the add_my_pet collection that belong to the lowest common taxon of a group of taxa.
% To find this taxon, the lineages of all members of input taxa are obtained, 
%   then the taxon of lowest rank is found that is shared by all members of input taxa 
%   and all members of this taxon in the add_my_pet collection are selected.
% If a single taxon is specified, members are selected from a taxon that is a number of levels up in the classification, including the single taxon.
% If this single taxon is not present in AmP, it is searched in Catalog of Life and Taxonomicon, and the lowest taxon in these lineages that is present in AmP is selected as clade
%
% Input:
%
% * taxa: cell string with names of taxa or character string with a single name
% * level: optional integer with number of nodes up, in the case of a single taxon (default: such that more than 2 members result with smallest number)
% * site: 0 (default) Col only, 1 Taxonomicon only, 2 both CoL and Taxonomicon
%
% Output:
% 
% * cell string with all species in the add_my_pet collection that belong to that taxon
% * character string with the name of the lowest taxon to which all taxa belong

%% Remarks
% The root is Animalia; If this is the lowest common taxon, the output contains all species in the collection.
% If the species is not in AmP, but the genus is, the AmP members of that genus are in the resulting clade, 
%   but this does not imply that the species is recognized and accepeted.
% The second input (i.e. level) only works for species that are in AmP.
% Print properties of related taxa with e.g. prtStat(clade('Lemmus_trimucronatus'), 'p_M');.
% Include the tree as well with e.g. [~, taxon]= clade('Lemmus_trimucronatus'); pedigree(taxon, 'p_M') 

%% Example of use
% members  = clade({'Gorilla', 'Tupaia'})
% or
% clade('Daphnia_magna')
% or
% clade('Homarus_gammarus',4)
% or
% clade('Daphnia_galeata') % while 'Daphnia_galeata' was not present in AmP at 2018/01/05 


  if ~exist('site','var') || isempty(site)
    site = 0; % only CoL
  end
  
  if ~iscell(taxa)
    n = 1;
  else
    n = length(taxa);
    if n == 1
       taxa = taxa{1};
    end
  end
  
  if  n == 1
      
    list = lineage(taxa);
    
    if length(list) == 1
      fprintf([taxa, ' is not recognized in AmP\n'])

      genus = strsplit(taxa, '_'); taxon = genus{1};
      if ismember(taxon,list_taxa([],3)) % the genus is in AmP
        members = select(taxon); return
      end

      % proceed by finding lineage in Col and Taxo
      ol = list_taxa; % ordered list of all taxa
      list_CoL = []; list_Taxo = []; n_members_CoL = 0; n_members_Taxo = 0;
      
      if site == 0 || site == 2 % CoL
        list_CoL = lineage_CoL(taxa);
        n_CoL = length(list_CoL);
        if n_CoL > 0 % species found in CoL
          ol = list_taxa; % ordered list of all taxa
          for i = 1:n_CoL % find lowest rank that is present in AmP
            if ~isempty(list_CoL{n_CoL - i}) && ismember(list_CoL{n_CoL - i}, ol)
              taxon_CoL = list_CoL{n_CoL - i}; members_CoL = select(taxon_CoL); 
              n_members_CoL = length(members_CoL);
              break
            end
          end
        end
      elseif site == 1 || site == 2 % Taxo
        list_Taxo = lineage_Taxo(taxa);
        n_Taxo = length(list_Taxo);
        if n_Taxo > 0 % species found in Taxo
          for i = 1:n_Taxo % find lowest rank that is present in AmP
            if ~isempty(list_Taxo{n_Taxo - i}) && ismember(list_Taxo{n_Taxo - i}, ol)
              taxon_Taxo = list_Taxo{n_Taxo - i}; members_Taxo = select(taxon_Taxo); 
              n_members_Taxo = length(members_Taxo);
              break
            end
          end
       end
      end
      
      % choose between CoL or Taxo on the basis of smallest number of members
      if n_members_CoL == 0 && n_members_Taxo == 0
        members = []; taxon = [];
      elseif n_members_CoL == 0
        members = members_Taxo; taxon = taxon_Taxo;
      elseif n_members_Taxo == 0
        members = members_CoL; taxon = taxon_CoL;
      elseif n_members_Taxo < n_members_CoL 
        members = members_Taxo; taxon = taxon_Taxo;
        fprintf(['CoL gives ', num2str(n_members_CoL), ' members, Taxo gives ', num2str(n_members_Taxo), ' members\n'])
      else
        members = members_CoL; taxon = taxon_CoL;
        fprintf(['CoL gives ', num2str(n_members_CoL), ' members, Taxo gives ', num2str(n_members_Taxo), ' members\n'])
      end
      
    else
      if ~exist('level', 'var')
        n = 1; i = 1;
        while n < 3
          taxon = list{end - i}; 
          members = select(taxon);
          n = length(members);
          i = 1 + i;
        end
      else
        taxon = list{end - level};
        members = select(taxon);
      end
    end
  
    return
  end
  
  for i = 1:n % obtain lineages for all taxa called lin1, lin2, ..
    lin = lineage(taxa{i});
    if ~isequal('Animalia', lin{1})
      fprintf(['Warning from clade: ', taxa{i}, ' is not recognized \n']);
      members = []; taxon = []; return
    end
    eval(['lin', num2str(i), ' = lin;']);
  end
  
  true = 1; j = 0; % initiate selection process
  while true
    j = j + 1; % step down the lineage
    taxon = lin1{j};
    for i = 2 : n % step through taxa
      eval(['true = isequal(taxon, lin', num2str(i), '{j});']);
      if ~true
        break
      end
    end
  end
  taxon = lin1{j-1};
  
  members = select(taxon); 

end

