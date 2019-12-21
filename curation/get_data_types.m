%% get_data_types
% copies data types from DEBwiki pages to globals data_types_0 data_types_1

%%
function get_data_types
% created 2018/01/05 by Bas Kooijman

%% Syntax
% <../get_data_types.m *get_data_types*>

%% Description
% sets globals data_types_0 data_types_1 for use in check_data by reading from DEBwiki. 

%% Remarks
% Re-check this function after edits of DEBwiki pages for zero- and uni-variate data:
%
% * http://www.debtheory.org/wiki/index.php?title=Zero-variate_data
% * http://www.debtheory.org/wiki/index.php?title=Univariate_data
%
% Since the Lisbon server is slow, this function assigns to globals, rather than explicit output

%% Example of use
% get_data_types

global data_types_0 data_types_1

% zerovariate data types
url = urlread('http://www.debtheory.org/wiki/index.php?title=Zero-variate_data');
i_1 = strfind(url, '</table>') + 8; url(1:i_1(end-1)) = []; % remove txt till after first table
i_0 = 25 + strfind(url, '<table class="wikitable">'); i_1 = strfind(url, '</table>') - 1;
url = url(i_0:i_1); % substring between <table>...</table>

i_0 = 4 + strfind(url,'<tr>'); i_1 = strfind(url,'</tr>') - 1; 
n = length(i_0); data_types_0 = cell(n-1,1);

for i = 2:n % scan rows
  row_i = url(i_0(i):i_1(i)); % substring between <tr>...</tr>

  j_0 = 6 + strfind(row_i,'<code>'); j_1 = strfind(row_i,'</code>') - 1; 
  data_types_0(i-1) = {row_i(j_0:j_1)}; % substring between <code>...</code>   
end

% univariate data types
url = urlread('http://www.debtheory.org/wiki/index.php?title=Univariate_data');
i_0 = 25 + strfind(url, '<table class="wikitable">'); i_1 = strfind(url, '</table>') - 1;
url = url(i_0:i_1(end)); % substring between <table>...</table>

i_0 = 4 + strfind(url,'<tr>'); i_1 = strfind(url,'</tr>') - 1; 
n = length(i_0); data_types_1 = cell(n-1,1);

for i = 2:n % scan rows
  row_i = url(i_0(i):i_1(i)); % substring between <tr>...</tr>

  j_0 = 6 + strfind(row_i,'<code>'); j_1 = strfind(row_i,'</code>') - 1; 
  data_types_1(i-1) = {row_i(j_0(1):j_1(1))}; % substring between <code>...</code>   
end

