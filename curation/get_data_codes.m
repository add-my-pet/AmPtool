%% get_data_codes
% get codes and descriptions for zero- and uni-variate data

%%
function [data_code_0, data_code_1] = get_data_codes
% created 2021/09/30 by Bas Kooijman

%% Syntax
% [data_code_0, data_code_1] = <get_data_codes *get_data_codes*>
%% Description
% reads codes and descriptions for zero- and uni-variate data from AmP web site
%
% Input:
%
% * taxa: string or cell array with name(s) of taxa
% * filenm: optional string with name of output files without extension; default: 'table'
% 
% Output
%
% * data_code_0: (n,2) cell array with codes and descriptions for zero-variate data
% * data_code_1: (n,2) cell array with codes and descriptions for uni-variate data

%% Remarks
% similar to <get_data_types *get_data_types*>, but assigns to explicit output with descriptions

%% Example of use
% [data_code_0, data_code_0] = get_data_codes

% zerovariate data types
url = 'http://www.debtheory.org/wiki/index.php?title=Zero-variate_data';
if ismac || isunix
  system(['wget ', url, ' -O txt.html']);
else
  system(['powershell wget ', url, ' -O txt.html']);
end
url = fileread('txt.html'); delete('txt.html');
i_1 = strfind(url, '</table>') + 8; url(1:i_1(end-1)) = []; % remove txt till after first table
i_0 = 25 + strfind(url, '<table class="wikitable">'); i_1 = strfind(url, '</table>') - 1;
url = url(i_0:i_1); % substring between <table>...</table>

i_0 = 4 + strfind(url,'<tr>'); i_1 = strfind(url,'</tr>') - 1; 
n = length(i_0); data_types_0 = cell(n-1,1); data_descr_0 = cell(n-1,1);

for i = 2:n % scan rows
  row_i = url(i_0(i):i_1(i)); % substring between <tr>...</tr>

  j_0 = 6 + strfind(row_i,'<code>'); j_1 = strfind(row_i,'</code>') - 1; 
  data_types_0(i-1) = {row_i(j_0:j_1)}; % substring between <code>...</code> 
  j_0 = j_0 + 3 + strfind(row_i(j_0:end),'<td>'); j_1 = strfind(row_i(j_0:end),'</td>') - 3 + j_0;
  data_descr_0(i-1) = {row_i(j_0:j_1)}; % substring between <td>...</td> after code
end

% univariate data types
url = 'http://www.debtheory.org/wiki/index.php?title=Univariate_data';
if ismac || isunix
  system(['wget ', url, ' -O txt.html']);
else
  system(['powershell wget ', url, ' -O txt.html']);
end
url = fileread('txt.html'); delete('txt.html');
i_0 = 25 + strfind(url, '<table class="wikitable">'); i_1 = strfind(url, '</table>') - 1 + j_0;
url = url(i_0:i_1(end)); % substring between <table>...</table>

i_0 = 4 + strfind(url,'<tr>'); i_1 = strfind(url,'</tr>') - 1; 
n = length(i_0); data_types_1 = cell(n-1,1); data_descr_1 = cell(n-1,1);

for i = 2:n % scan rows
  row_i = url(i_0(i):i_1(i)); % substring between <tr>...</tr>

  j_0 = 6 + strfind(row_i,'<code>'); j_1 = strfind(row_i,'</code>') - 1; 
  data_types_1(i-1) = {row_i(j_0(1):j_1(1))}; % substring between <code>...</code>   
  j_0 = j_0 + 3 + strfind(row_i(j_0:end),'<td>'); j_1 = strfind(row_i(j_0:end),'</td>') - 3 + j_0;
  data_descr_1(i-1) = {row_i(j_0:j_1)}; % substring between <td>...</td> after code
end

data_code_0 = [data_types_0, data_descr_0];
data_code_1 = [data_types_1, data_descr_1];
