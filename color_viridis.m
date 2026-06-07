%% color_viridis
% Maps scalar values to RGB colours using the viridis colormap.

%%
function color = color_viridis(f)
% created 2025/06/08

%% Syntax
% color = <../color_viridis.m *color_viridis*>(f)

%% Description
% Perceptually uniform, colorblind-safe sequential colormap (dark purple to yellow).
% Derived from the canonical viridis table by Smith & van der Walt (public domain).
%
% Input
% * f: (n,1) vector of values in [0,1]
%
% Output
% * color: (n,3) RGB matrix

  lut = [
    0.2670  0.0049  0.3294
    0.2803  0.0874  0.4099
    0.2634  0.1821  0.4790
    0.2211  0.2709  0.5301
    0.1697  0.3530  0.5571
    0.1197  0.4311  0.5545
    0.0929  0.5097  0.5243
    0.1166  0.5815  0.4724
    0.1819  0.6273  0.4147
    0.2782  0.6628  0.3490
    0.3962  0.6912  0.2784
    0.5321  0.7118  0.2062
    0.6799  0.7270  0.1347
    0.8234  0.7735  0.1015
    0.9305  0.8572  0.1143
    0.9932  0.9062  0.1439];

  t = linspace(0, 1, size(lut, 1))';
  color = interp1(t, lut, min(max(f(:), 0), 1), 'linear');
end
