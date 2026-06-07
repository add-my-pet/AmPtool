%% shstat_defaults
% Returns the default options struct for shstat / shstat_options.

%%
function opts = shstat_defaults()
% created 2025/06/08

%% Syntax
% opts = <../shstat_defaults.m *shstat_defaults*>

%% Description
% Returns a struct with all shstat option defaults.
% Called automatically by shstat_options and shstat when no options have
% been set yet — so shstat works correctly without any prior call to
% shstat_options.

  opts.x_transform   = 'log10';
  opts.y_transform   = 'log10';
  opts.z_transform   = 'log10';
  opts.x_label       = 'on';
  opts.y_label       = 'on';
  opts.z_label       = 'on';
  opts.font_size     = 15;
  opts.marker_alpha      = 1.0;   % < 1 forces software renderer — slow with many markers
  opts.marker_size_scale = 1.0;
  opts.marker_edge_color = [];    % [] = use legend file MEC; 'none' removes edges (faster)
  opts.grid              = 'on';
  opts.color_scheme      = 'lava';
  opts.legend_location   = 'separate'; % 'separate' = shlegend figure; or MATLAB location e.g. 'best','northeast'
  opts.datacursor        = 'on';       % 'off' skips datacursormode setup (faster for publication)
end
