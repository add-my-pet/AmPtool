%% clade
% gets all species that are closest related to specified taxa

%%
function [members, taxon] = clade(taxa, level, site)
% created 2015/09/18 by Bas Kooijman; modified 2017/12/23, 2018/01/05,
% 2018/01/30, 2019/02/25, 2021/04/1, 2021/05/05, 2026/06/11

%% Syntax
% [members, taxon] = <../clade.m *clade*> (taxa, level, site)

%% Description
% If taxa contains several members, clade gets all species in the add_my_pet collection that belong to the lowest common taxon of a group of taxa.
% To find this taxon, the lineages of all members of input taxa are obtained,
%   then the taxon of lowest rank is found that is shared by all members of input taxa
%   and all members of this taxon in the add_my_pet collection are selected.
% If a single taxon is specified, members are selected from a taxon that is a number of levels up in the classification, including the single taxon.
% If this single taxon is not present in AmP, it is searched in Catalog of Life and/or Taxonomicon, and the lowest taxon in these lineages that is present in AmP is selected as clade
%
% Input:
%
% * taxa: cell string with names of taxa or character string with a single name
% * level: optional integer with number of nodes up, in the case of a single taxon (default: such that more than 2 members result with smallest number)
% * site: 0 CoL only, 1 (default) Taxonomicon only, 2 both CoL and Taxonomicon (smallest non-empty clade is used)
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
% Include the tree as well with e.g. [~, taxon]= clade('Lemmus_trimucronatus'); pedigree(taxon, 'p_M').
% The classic CoL web service was retired; lineage_CoL now uses the GBIF backbone (CoL-derived), so site 0 and 2 work again.

%% Example of use
% members  = clade({'Gorilla', 'Tupaia'})
% or
% clade('Daphnia_magna')
% or
% clade('Homarus_gammarus',4)
% or
% clade('Daphnia_galeata') % while 'Daphnia_galeata' was not present in AmP at 2018/01/05

  members = []; taxon = []; % defaults, so the outputs are always assigned

  if ~exist('site','var') || isempty(site)
    site = 1; % default: Taxonomicon only
  end

  % normalise to a single char string when only one taxon is given
  if iscell(taxa)
    n = length(taxa);
    if n == 1
      taxa = taxa{1};
    end
  else
    n = 1;
  end

  if n == 1

    % only call lineage for names AmP knows; an unknown name would make
    % lineage print a misleading "not recognized" warning, although clade
    % handles that case below via the genus / CoL fallback
    TC = get_taxonomy_cache;
    if isKey(TC.taxon_set, taxa) || isKey(TC.species_set, taxa)
      list = lineage(taxa);
    else
      list = {};
    end

    if isempty(list)
      % not in AmP: fall back to the genus, then CoL / Taxonomicon
      genus = strsplit(taxa, '_'); taxon = genus{1};
      if ismember(taxon, list_taxa([], 3)) % the genus is in AmP
        members = select(taxon); return
      end

      % species and genus unknown to AmP: take the lowest-rank taxon in the
      % CoL and/or Taxonomicon lineage that is present in AmP
      ol = list_taxa; % ordered list of all AmP taxa
      taxon_CoL  = []; members_CoL  = []; n_members_CoL  = 0;
      taxon_Taxo = []; members_Taxo = []; n_members_Taxo = 0;

      if site == 0 || site == 2 % Catalogue of Life (via GBIF backbone)
        [taxon_CoL,  members_CoL]  = lowest_in_AmP(lineage_CoL(taxa),  ol);
        n_members_CoL  = numel(members_CoL);
      end
      if site == 1 || site == 2 % Taxonomicon
        [taxon_Taxo, members_Taxo] = lowest_in_AmP(lineage_Taxo(taxa), ol);
        n_members_Taxo = numel(members_Taxo);
      end

      % pick the source with the smaller, non-empty clade
      if n_members_CoL == 0 && n_members_Taxo == 0
        members = []; taxon = [];
      elseif n_members_CoL == 0
        members = members_Taxo; taxon = taxon_Taxo;
      elseif n_members_Taxo == 0
        members = members_CoL;  taxon = taxon_CoL;
      else
        if site == 2
          fprintf(['CoL gives ', num2str(n_members_CoL), ' members, Taxo gives ', num2str(n_members_Taxo), ' members\n'])
        end
        if n_members_Taxo < n_members_CoL
          members = members_Taxo; taxon = taxon_Taxo;
        else
          members = members_CoL;  taxon = taxon_CoL;
        end
      end

    elseif ~exist('level', 'var') || isempty(level)
      % step up the lineage until the clade has at least 3 members
      i = 1;
      while numel(members) < 3 && i < length(list)
        taxon = list{end - i};
        members = select(taxon);
        i = i + 1;
      end
    else
      taxon = list{end - level};
      members = select(taxon);
    end

    return
  end

  lins = cell(n, 1); % obtain lineages for all taxa
  for i = 1:n
    lins{i} = lineage(taxa{i});
    if isempty(lins{i}) || ~isequal('Animalia', lins{i}{1})
      fprintf(['Warning from clade: ', taxa{i}, ' is not recognized \n']);
      members = []; taxon = []; return
    end
  end

  all_agree = true; j = 0; % initiate selection process
  while all_agree && j < length(lins{1})
    j = j + 1; % step down the lineage
    taxon = lins{1}{j};
    for i = 2:n % step through taxa
      if j > length(lins{i}) || ~isequal(taxon, lins{i}{j})
        all_agree = false; break
      end
    end
  end
  if all_agree
    taxon = lins{1}{j};     % all lineages identical to the end
  else
    taxon = lins{1}{j - 1}; % last shared level
  end

  members = select(taxon);

end

%% local functions

function [taxon, members] = lowest_in_AmP(lin, ol)
  % lowest-rank taxon in lineage lin (ordered root -> species) that is present in AmP list ol
  taxon = []; members = [];
  for i = numel(lin):-1:1
    if ~isempty(lin{i}) && ismember(lin{i}, ol)
      taxon = lin{i}; members = select(taxon); return
    end
  end
end
