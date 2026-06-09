classdef TestTaxonomy < matlab.unittest.TestCase
  % Tests for the Perl-free taxonomy cache functions.
  % Requires only taxa/*.txt files — no allStat needed.

  methods (Test)

    %% select
    function testSelectReturnsColumn(tc)
      sp = select('Aves');
      tc.verifyGreaterThan(numel(sp), 0);
      tc.verifyEqual(size(sp, 2), 1);
    end
    function testSelectAllHaveUnderscore(tc)
      sp = select('Aves');
      tc.verifyTrue(all(~cellfun(@isempty, strfind(sp, '_'))));
    end
    function testSelectSpeciesNameReturnsSelf(tc)
      sp = select('Homo_sapiens');
      tc.verifyEqual(sp, {'Homo_sapiens'});
    end
    function testSelectCellUnion(tc)
      a    = select('Aves');
      m    = select('Mammalia');
      both = select({'Aves', 'Mammalia'});
      tc.verifyEqual(numel(both), numel(a) + numel(m));
    end
    function testSelectUnknownReturnsEmpty(tc)
      sp = select('NotARealTaxon_xyz');
      tc.verifyEmpty(sp);
    end

    %% lineage
    function testLineageIsColumn(tc)
      lin = lineage('Homo_sapiens');
      tc.verifyGreaterThan(numel(lin), 0);
      tc.verifyEqual(size(lin, 2), 1);
    end
    function testLineageStartsWithAnimalia(tc)
      lin = lineage('Homo_sapiens');
      tc.verifyEqual(lin{1}, 'Animalia');
    end
    function testLineageEndsWithInput(tc)
      lin = lineage('Homo_sapiens');
      tc.verifyEqual(lin{end}, 'Homo_sapiens');
    end
    function testLineageOfRoot(tc)
      lin = lineage('Animalia');
      tc.verifyEqual(lin, {'Animalia'});
    end
    function testLineageTaxon(tc)
      lin = lineage('Aves');
      tc.verifyEqual(lin{1}, 'Animalia');
      tc.verifyEqual(lin{end}, 'Aves');
    end

    %% list_taxa
    function testListTaxaLevel0HasBothTypes(tc)
      ol = list_taxa('Aves', 0);
      hasUnderscore = any(~cellfun(@isempty, strfind(ol, '_')));
      noUnderscore  = any( cellfun(@isempty, strfind(ol, '_')));
      tc.verifyTrue(hasUnderscore && noUnderscore);
    end
    function testListTaxaLevel1NoSpecies(tc)
      ol = list_taxa('Aves', 1);
      tc.verifyTrue(all(cellfun(@isempty, strfind(ol, '_'))));
    end
    function testListTaxaLevel2OnlySpecies(tc)
      ol = list_taxa('Aves', 2);
      tc.verifyTrue(all(~cellfun(@isempty, strfind(ol, '_'))));
    end
    function testListTaxaLevel2ConsistentWithSelect(tc)
      ol = list_taxa('Aves', 2);
      sp = select('Aves');
      tc.verifyEqual(numel(ol), numel(sp));
    end
    function testListTaxaIsSorted(tc)
      ol = list_taxa('Aves', 0);
      tc.verifyEqual(ol, sort(ol));
    end

    %% pedigree
    function testPedigreeIsChar(tc)
      tree = pedigree('Aves');
      tc.verifyClass(tree, 'char');
    end
    function testPedigreeContainsRoot(tc)
      tree = pedigree('Aves');
      tc.verifyTrue(~isempty(strfind(tree, 'Aves')));
    end
    function testPedigreeContainsTabs(tc)
      tree = pedigree('Aves');
      tc.verifyTrue(~isempty(strfind(tree, char(9))));
    end
    function testPedigreeContainsASpecies(tc)
      sp   = select('Aves');
      tree = pedigree('Aves');
      tc.verifyTrue(~isempty(strfind(tree, sp{1})));
    end

    %% select_01
    function testSelect01LengthMatchesSource(tc)
      sel = select_01('Aves', {'Galliformes'});
      tc.verifyEqual(numel(sel), numel(select('Aves')));
    end
    function testSelect01IsLogical(tc)
      sel = select_01('Aves', {'Galliformes'});
      tc.verifyClass(sel, 'logical');
    end
    function testSelect01SubsetCountMatchesSelect(tc)
      sel = select_01('Aves', {'Galliformes'});
      tc.verifyEqual(sum(sel), numel(select('Galliformes')));
    end

  end
end
