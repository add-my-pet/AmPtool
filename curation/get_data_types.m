%% get_data_types
% copies data types from DEBportaldocs/Zero-variate_data.html and Uni-variate_data.html to globals data_types_0 data_types_1

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

%% Example of use
% get_data_types

global data_types_0 data_types_1

% zerovariate data types
url = 'https://debportal.debtheory.org/docs/Zero-variate_data.html';
if ismac || isunix
  system(['wget ', url, ' -O txt.html']);
else
  system(['powershell wget ', url, ' -O txt.html']);
end
url = fileread('txt.html'); delete('txt.html');
i_0 = strfind(url, '<th>Data labels</th>'); i_0 = i_0 + 5 + strfind(url(i_0:end), '</tr>'); 
i_1 = i_0(1) + strfind(url(i_0:end), '</table>') - 2;
url = url(i_0:i_1(end)); % substring between <table>...</table>

i_0 = 4 + strfind(url,'<tr>'); i_1 = strfind(url,'</tr>') - 1; 
n = length(i_0); data_types_0 = cell(n,1);

for i = 1:n % scan rows
  row_i = url(i_0(i):i_1(i)); % substring between <tr>...</tr>

  j_0 = 4 + strfind(row_i,'<td>'); j_1 = strfind(row_i,'</td>') - 1; 
  data_types_0(i) = {row_i(j_0(1):j_1(1))}; % substring between first <td>...</td>   
end

% univariate data types
url = 'https://debportal.debtheory.org/docs/Uni-variate_data.html';
if ismac || isunix
  system(['wget ', url, ' -O txt.html']);
else
  system(['powershell wget ', url, ' -O txt.html']);
end
url = fileread('txt.html'); delete('txt.html');
i_0 = strfind(url, '<th>Data labels</th>'); i_0 = i_0 + 5 + strfind(url(i_0:end), '</tr>'); 
i_1 = i_0(1) + strfind(url(i_0:end), '</table>') - 2;
url = url(i_0:i_1(end)); % substring between <table>...</table>

i_0 = 4 + strfind(url,'<tr>'); i_1 = strfind(url,'</tr>') - 1; 
n = length(i_0); data_types_1 = cell(n,1);

for i = 1:n % scan rows
  row_i = url(i_0(i):i_1(i)); % substring between <tr>...</tr>

  j_0 = 4 + strfind(row_i,'<td>'); j_1 = strfind(row_i,'</td>') - 1; 
  data_types_1(i) = {row_i(j_0(1):j_1(1))}; % substring between first <td>...</td>   
end

