%% check_units
% checks if units of data in metaData match values

%%
function nm = check_units(varargin)
% created 2025/05/19 by Bas Kooijman

%% Syntax
% nm = <../check_units.m *check_units*> (varargin)

%% Description
% entries that do not have the specified data set are not selected
%
% Input
%
% * varargin: optional character or cell string with name(s) of taxa (default 'Animalia')
% * string with name of data set
% * (cell) string with required units
%
% Output
%
% * nm: cell string of entries for match failed

%% remarks
% Proceed with cdEntr(nm,1) to load failing entries in the Matlab editor

%% Example of use
% nm = check_units('Ri','#/d')

if length(varargin)<2
  fprintf('Warning from check_units: not enough inputs\n');
  return
elseif length(varargin)==3
  if length(varargin{1})>1 % cell string with entry names
     taxa = varargin{1};
  else % string with name of higher taxon
     taxa = select(varargin{1});
  end
  dataset = varargin{2}; units = varargin{3};
else
  taxa = select; dataset = varargin{1}; units = varargin{2};
end

WD = pwd;

n = length(taxa); sel = zeros(n,1); % initiate selection
for i = 1:n % scan taxa
  cdEntr(taxa{i});
  [~, ~, ~, txtData] = feval(['mydata_',taxa{i}]); 
  if isfield(txtData.units,dataset)
    try
      sel(i) = ~all(strcmp(txtData.units.(dataset),units));
    catch
      sel(i) = 1;
    end
  end
end
nm = taxa(sel==1);

cd(WD);
