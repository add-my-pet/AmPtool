classdef TestCmdscale < matlab.unittest.TestCase
  methods (Test)

    function testOutputSizeFullRank(tc)
      D = [0 1 2; 1 0 1; 2 1 0];
      Y = cmdscale(D);
      tc.verifyEqual(size(Y, 1), 3);
    end

    function testEuclideanReconstruction(tc)
      % Distances from 4 known 3D points must be exactly reconstructed
      X  = [0 0 0; 1 0 0; 0 1 0; 0 0 1];
      D  = squareform(pdist(X));
      Y  = cmdscale(D);
      D2 = squareform(pdist(Y));
      tc.verifyEqual(D2, D, 'AbsTol', 1e-10);
    end

    function testCollinearEmbeddingIsOneDimensional(tc)
      % 3 collinear points: 2D MDS should need only 1 non-trivial dimension
      D      = [0 1 3; 1 0 2; 3 2 0];
      [~, e] = cmdscale(D);
      n_pos  = sum(e > max(abs(e)) * eps^(3/4));
      tc.verifyEqual(n_pos, 1);
    end

    function testEigenvaluesNonNegativeForEuclidean(tc)
      X      = randn(10, 4);
      D      = squareform(pdist(X));
      [~, e] = cmdscale(D);
      tc.verifyGreaterThanOrEqual(min(e), -1e-10);
    end

    function testSimilarityMatrixInput(tc)
      % Similarity matrix (ones on diagonal, values < 1 elsewhere) should not error
      S = [1 0.5 0.1; 0.5 1 0.3; 0.1 0.3 1];
      Y = cmdscale(S);
      tc.verifyEqual(size(Y, 1), 3);
    end

  end
end
