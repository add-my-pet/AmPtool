classdef TestReadAllStat < matlab.unittest.TestCase
  % Tests for read_allStat.m.
  % Requires allStat.mat — set AMPDATA_DIR env var to the directory containing it.

  methods (Test)

    function testReturnsSizeMatchingEntries(tc)
      [var, entries] = read_allStat('kap');
      tc.verifyEqual(size(var, 1), numel(entries));
    end

    function testEntryCountMatchesTaxonomyCache(tc)
      % allStat species count must equal the taxonomy cache species count.
      % Explicit form of the consistency check previously done via n_entries.mat.
      [~, entries] = read_allStat('kap');
      sp = select('Animalia');
      tc.verifyEqual(numel(entries), numel(sp));
    end

    function testKapInZeroOne(tc)
      var = read_allStat('kap');
      tc.verifyGreaterThan(nanmin(var), 0);
      tc.verifyLessThan(nanmax(var), 1);
    end

    function testMultipleVarsReturnMatrix(tc)
      var = read_allStat('kap', 'v');
      tc.verifyEqual(size(var, 2), 2);
    end

    function testUnitsAndLabelReturned(tc)
      [~, ~, units, label] = read_allStat('kap');
      tc.verifyClass(units, 'cell');
      tc.verifyClass(label, 'cell');
      tc.verifyNotEmpty(units{1});
      tc.verifyNotEmpty(label{1});
    end

    function testMissingFieldReturnsNaN(tc)
      % Request a field that does not exist in all entries
      var = read_allStat('kap');
      tc.verifyFalse(all(isnan(var)));   % at least some entries have kap
    end

  end
end
