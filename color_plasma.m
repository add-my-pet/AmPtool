%% color_plasma
% Maps scalar values to RGB colours using the plasma colormap.

%%
function color = color_plasma(f)
% created 2025/06/08

%% Syntax
% color = <../color_plasma.m *color_plasma*>(f)

%% Description
% Perceptually uniform, colorblind-safe sequential colormap (dark purple to yellow via pink).
% Derived from the canonical plasma table by Smith & van der Walt (public domain).
%
% Input
% * f: (n,1) vector of values in [0,1]
%
% Output
% * color: (n,3) RGB matrix

  lut = [
    0.0504  0.0298  0.5280
    0.2034  0.0173  0.5929
    0.3171  0.0068  0.6379
    0.4157  0.0170  0.6488
    0.5035  0.0514  0.6248
    0.5839  0.1153  0.5817
    0.6576  0.1835  0.5288
    0.7247  0.2516  0.4700
    0.7868  0.3212  0.4012
    0.8437  0.3959  0.3242
    0.8932  0.4809  0.2442
    0.9296  0.5728  0.1656
    0.9519  0.6670  0.0999
    0.9551  0.7596  0.0619
    0.9445  0.8512  0.1052
    0.9400  0.9752  0.1313];

  t = linspace(0, 1, size(lut, 1))';
  color = interp1(t, lut, min(max(f(:), 0), 1), 'linear');
end
