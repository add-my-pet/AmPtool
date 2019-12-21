%% count_data
% counts number of pseudodata sets, zero-variate data sets and univariate data sets

%%
function n = count_data(varargin)
% created 2018/04/24 by Bas Kooijman

%% Syntax
% n = <../count_data.m *count_data*> (varargin)

%% Description
% counts number of pseudodata sets, zero-variate data sets and univariate data sets for entries
%
% Input
%
% * varargin: optional character or cell string with name(s) of taxa (default 'Animalia')
%
% Output
%
% * n: (n,3)-matrix with pseudo, zero- and uni-variate data sets

%% Example of use
% n = count_data('Daphnia_magna')

if isempty(varargin)
  taxa = select;
elseif isempty(strfind(varargin{1}, '_'))
  taxa = select(varargin{1});
else
  taxa = varargin(1);
end

WD = pwd;

n = zeros(length(taxa),3); % initiate counting
for i = 1:size(n,1) % scan taxa
  cd(['../../entries/', taxa{i}])
  eval(['data = mydata_', taxa{i},';']);
  n(i,1) = length(fieldnmnst_st(data.psd)); % get number of pseudo data sets
  data = rmfield_wtxt(data, 'psd'); % remove psd from structure data
  nms = fieldnmnst_st(data); n_nms = length(nms);
  for j = 1:n_nms % scan zero- and uni-variate data 
    k = 1 + min(2, size(data.(nms{j}),2));
    n(i,k) = n(i,k) + 1;
  end
end

cd(WD);