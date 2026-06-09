%% color_cividis
% Maps scalar values to RGB colours using the cividis colormap.

%%
function color = color_cividis(f)
% created 2025/06/08

%% Syntax
% color = <../color_cividis.m *color_cividis*>(f)

%% Description
% Perceptually uniform sequential colormap optimised for color vision deficiency (dark navy to yellow).
% Derived from Nunez et al. 2018 (CC0 public domain).
%
% Input
% * f: (n,1) vector of values in [0,1]
%
% Output
% * color: (n,3) RGB matrix

  lut = [
    0.0000  0.1353  0.3045
    0.0830  0.1864  0.3955
    0.1290  0.2290  0.4165
    0.1697  0.2686  0.4348
    0.2079  0.3065  0.4498
    0.2443  0.3440  0.4607
    0.2806  0.3811  0.4671
    0.3167  0.4181  0.4700
    0.3533  0.4549  0.4686
    0.3908  0.4916  0.4622
    0.4295  0.5282  0.4504
    0.5126  0.5843  0.4097
    0.6064  0.6397  0.3461
    0.7088  0.6967  0.3215
    0.8293  0.7868  0.3452
    0.9940  0.9063  0.3916];

  t = linspace(0, 1, size(lut, 1))';
  color = interp1(t, lut, min(max(f(:), 0), 1), 'linear');
end
