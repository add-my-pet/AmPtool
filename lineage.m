%% lineage
% gets list of taxa to which a taxon belongs

%%
function classification = lineage(taxon)
% created 2015/09/18 by Bernd Brandt
% modified 2025/06/07 by mrke: replaced Perl backend with MATLAB taxonomy cache

%% Syntax
% classification = <../lineage.m *lineage*> (taxon)

%% Description
% gets all taxa in the add_my_pet collection to which a particular taxon belongs
%
% Input:
%
% * character string with name of taxon
%
% Output:
%
% * cell string of ordered taxa to which that taxon belongs, starting with Animalia

%% Remarks
% The root is Animalia.
% The classification follows that of Wikipedia.
% Output includes the input taxon itself as the last element.

%% Example of use
% classification  = lineage('Gorilla_gorilla')

  TC = get_taxonomy_cache;

  if ~isKey(TC.taxon_set, taxon) && ~isKey(TC.species_set, taxon)
    fprintf('Warning from lineage: Name %s is not recognized as taxon\n', taxon);
    classification = {};
    return
  end

  % Walk up the parent chain from taxon to root
  classification = {taxon};
  node = taxon;
  while isKey(TC.parent, node)
    node = TC.parent(node);
    classification{end+1} = node; %#ok<AGROW>
  end

  % Reverse so output runs from Animalia (root) down to taxon, as column to match original
  classification = fliplr(classification)';
end
