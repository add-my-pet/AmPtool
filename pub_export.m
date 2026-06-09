%% pub_export
% Export current figure at publication-quality size and resolution.

%%
function pub_export(filename, varargin)
% created 2025/06/08

%% Syntax
% <../pub_export.m *pub_export*>(filename)
% <../pub_export.m *pub_export*>(filename, preset)
% <../pub_export.m *pub_export*>(filename, w_mm, h_mm)
% <../pub_export.m *pub_export*>(filename, ..., dpi)

%% Description
% Resizes the current figure to a publication-standard width, exports it,
% then restores the original on-screen size.
%
% Presets (width x height in mm):
%   'single' —  89 x 67  (one journal column, default)
%   'double' — 183 x 100 (two journal columns)
%   'full'   — 183 x 183 (full-page square)
%
% Input
% * filename: file path; extension sets format:
%     .png .jpg .tif — raster at dpi (default 300)
%     .pdf .svg .eps — vector (dpi argument ignored)
% * preset: optional string 'single' | 'double' | 'full'
% * w_mm, h_mm: optional explicit width and height in mm (alternative to preset)
% * dpi: optional resolution for raster formats (default 300)
%
% Output
% * file written to disk at the specified path

%% Example of use
% shstat({'kap','v'}, legend_vert)
% pub_export('fig1.png')               % single column, 300 dpi
% pub_export('fig1.pdf', 'double')     % two-column vector PDF
% pub_export('fig1.png', 120, 90, 600) % custom size at 600 dpi

  % --- parse arguments ------------------------------------------------
  w_mm = 89; h_mm = 67; dpi = 300;

  i = 1;
  if i <= numel(varargin) && ischar(varargin{i})
    switch lower(varargin{i})
      case 'single', w_mm =  89; h_mm =  67;
      case 'double', w_mm = 183; h_mm = 100;
      case 'full',   w_mm = 183; h_mm = 183;
      otherwise
        warning('pub_export: unknown preset "%s", using single-column defaults.', varargin{i});
    end
    i = i + 1;
  elseif i + 1 <= numel(varargin) && isnumeric(varargin{i}) && isnumeric(varargin{i+1})
    w_mm = varargin{i}; h_mm = varargin{i+1};
    i = i + 2;
  end
  if i <= numel(varargin) && isnumeric(varargin{i}) && isscalar(varargin{i})
    dpi = varargin{i};
  end

  % --- format from extension ------------------------------------------
  [~, ~, ext] = fileparts(filename);
  is_vector   = any(strcmpi(ext, {'.pdf', '.svg', '.eps'}));

  % --- resize, export, restore ----------------------------------------
  fig       = gcf;
  old_units = fig.Units;
  old_pos   = fig.Position;

  fig.Units         = 'centimeters';
  fig.Position(3:4) = [w_mm / 10, h_mm / 10];

  try
    if is_vector
      exportgraphics(fig, filename, 'ContentType', 'vector');
    else
      exportgraphics(fig, filename, 'Resolution', dpi);
    end
  catch
    % fallback for MATLAB < R2020a
    switch lower(ext)
      case '.png',            print(fig, filename, '-dpng',  sprintf('-r%d', dpi));
      case {'.jpg', '.jpeg'}, print(fig, filename, '-djpeg', sprintf('-r%d', dpi));
      case {'.tif', '.tiff'}, print(fig, filename, '-dtiff', sprintf('-r%d', dpi));
      case '.pdf',            print(fig, filename, '-dpdf');
      case '.svg',            print(fig, filename, '-dsvg');
      case '.eps',            print(fig, filename, '-depsc');
      otherwise,              print(fig, filename, '-dpng',  sprintf('-r%d', dpi));
    end
  end

  fig.Units    = old_units;
  fig.Position = old_pos;
end
