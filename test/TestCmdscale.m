classdef TestCmdscale < matlab.unittest.TestCase
  % Uses no toolboxes — pdist/squareform are Statistics Toolbox so replaced
  % with inline helpers at the bottom of this file.

  methods (Test)

    function testOutputSizeFullRank(tc)
      D = [0 1 2; 1 0 1; 2 1 0];
      Y = cmdscale(D);
      tc.verifyEqual(size(Y, 1), 3);
    end

    function testEuclideanReconstruction(tc)
      % Distances from 4 known 3D points must be exactly reconstructed
      X  = [0 0 0; 1 0 0; 0 1 0; 0 0 1];
      D  = eucdist(X);
      Y  = cmdscale(D);
      D2 = eucdist(Y);
      tc.verifyEqual(D2, D, 'AbsTol', 1e-10);
    end

    function testCollinearEmbeddingIsOneDimensional(tc)
      % 3 collinear points: MDS should need only 1 non-trivial dimension
      D      = [0 1 3; 1 0 2; 3 2 0];
      [~, e] = cmdscale(D);
      n_pos  = sum(e > max(abs(e)) * eps^(3/4));
      tc.verifyEqual(n_pos, 1);
    end

    function testEigenvaluesNonNegativeForEuclidean(tc)
      rng(42);
      X      = randn(10, 4);
      D      = eucdist(X);
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

function D = eucdist(X)
  % Pairwise Euclidean distance matrix — avoids Statistics Toolbox pdist.
  n = size(X, 1);
  D = zeros(n);
  for i = 1:n
    for j = i+1:n
      D(i,j) = norm(X(i,:) - X(j,:));
      D(j,i) = D(i,j);
    end
  end
end
