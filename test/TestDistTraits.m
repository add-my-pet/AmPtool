classdef TestDistTraits < matlab.unittest.TestCase
  % Tests for dist_traits.m.
  % Requires allStat.mat — set AMPDATA_DIR env var to the directory containing it.

  properties (Constant)
    Species = {'Homo_sapiens', 'Mus_musculus', 'Gallus_gallus', 'Danio_rerio'}
    Traits  = {'kap'; 'v'}
  end

  methods (Test)

    function testSymmetry(tc)
      D = dist_traits(tc.Species, tc.Traits);
      tc.verifyEqual(D, D', 'AbsTol', 1e-12);
    end

    function testZeroDiagonal(tc)
      D = dist_traits(tc.Species, tc.Traits);
      tc.verifyEqual(diag(D), zeros(numel(tc.Species), 1), 'AbsTol', 1e-12);
    end

    function testNonNegative(tc)
      D = dist_traits(tc.Species, tc.Traits);
      tc.verifyGreaterThanOrEqual(D(:), 0);
    end

    function testSingleSpeciesReturnsZero(tc)
      D = dist_traits({'Homo_sapiens'}, tc.Traits);
      tc.verifyEqual(D, 0);
    end

    function testOutputSize(tc)
      n = numel(tc.Species);
      D = dist_traits(tc.Species, tc.Traits);
      tc.verifySize(D, [n n]);
    end

  end
end
