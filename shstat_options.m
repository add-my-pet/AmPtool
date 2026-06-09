%% shstat_options
% Sets options for function shstat one by one.

%%
function shstat_options(key, val)
% created 2016/04/28 by Bas Kooijman; modified 2025/06/08

%% Syntax
% <../shstat_options.m *shstat_options*> (key, val)

%% Description
% Sets or prints options for <shstat.html *shstat*>.
% Options are stored per-session in the root graphics object (no globals).
%
% Input
% * no input: print all current option values to screen
% * 'default': reset all options to defaults
% * key, val: set one option (see list below)
%
% Available options (key — allowed values):
%   x_transform   — 'log10' | 'none'
%   y_transform   — 'log10' | 'none'
%   z_transform   — 'log10' | 'none'
%   x_label       — 'on' | 'off'
%   y_label       — 'on' | 'off'
%   z_label       — 'on' | 'off'
%   font_size     — positive number (default 15)
%   marker_alpha  — 0 to 1 (default 0.6; 1 = opaque)
%   grid          — 'on' | 'off'
%   color_scheme  — 'lava' | 'viridis' | 'plasma' | 'cividis'

%% Example of use
% shstat_options('default')
% shstat_options('font_size', 12)
% shstat_options('color_scheme', 'viridis')

  if nargin == 0
    opts = get_opts();
    fields = fieldnames(opts);
    for i = 1:numel(fields)
      v = opts.(fields{i});
      if ischar(v)
        fprintf('%s = %s\n', fields{i}, v);
      else
        fprintf('%s = %g\n', fields{i}, v);
      end
    end
    return
  end

  if strcmp(key, 'default')
    setappdata(0, 'shstat_opts', shstat_defaults());
    return
  end

  opts = get_opts();
  if ~isfield(opts, key)
    fprintf('Warning from shstat_options: unknown option "%s"\n', key);
    return
  end

  if nargin == 1
    v = opts.(key);
    if ischar(v)
      fprintf('%s = %s\n', key, v);
    else
      fprintf('%s = %g\n', key, v);
    end
  else
    opts.(key) = val;
    setappdata(0, 'shstat_opts', opts);
  end
end

function opts = get_opts()
  opts = merge_with_defaults(getappdata(0, 'shstat_opts'));
end

function opts = merge_with_defaults(stored)
  opts = shstat_defaults();
  if isempty(stored), return; end
  f = fieldnames(stored);
  for k = 1:numel(f)
    if isfield(opts, f{k}), opts.(f{k}) = stored.(f{k}); end
  end
end
