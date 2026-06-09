%% amp_data_dir
% returns the directory containing allStat.mat
function p = amp_data_dir()
% created 2025/06 by AmPtool contributors
%
% Checks AMPDATA_DIR environment variable first (CI / testing),
% then falls back to cdAmPdata() for standard local installations.
  p = getenv('AMPDATA_DIR');
  if isempty(p)
    p = cdAmPdata;
  end
end
