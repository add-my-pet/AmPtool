classdef TestShstat < matlab.unittest.TestCase
  % Tests for shstat.m in numerical-matrix mode (pre-computed data, no allStat needed).

  methods (TestMethodTeardown)
    function closeFigs(~)
      close all;
    end
  end

  methods (Test)

    function test1D(tc)
      vals = rand(50, 1);
      [Hfig, ~, val] = shstat(vals, {{'ko'}, 'test'});
      tc.verifyClass(Hfig, 'matlab.ui.Figure');
      tc.verifyEqual(size(val, 2), 1);
    end

    function test2D(tc)
      vals = rand(50, 2);
      [Hfig, ~, val] = shstat(vals, {{'ko'}, 'test'});
      tc.verifyClass(Hfig, 'matlab.ui.Figure');
      tc.verifyEqual(size(val, 2), 2);
    end

    function test3D(tc)
      vals = rand(50, 3);
      [Hfig, ~, val] = shstat(vals, {{'ko'}, 'test'});
      tc.verifyClass(Hfig, 'matlab.ui.Figure');
      tc.verifyEqual(size(val, 2), 3);
    end

  end
end
