%% get_model_types
% reads model types from DEBwiki pages 

%%
function model_types = get_model_types
% created 2018/01/14 by Bas Kooijman

%% Syntax
% <../get_model_types.m *get_model_types*>

%% Description
% sets model_types

%% Remarks
% re-check this function after edits of DEBwiki pages for model types;
% function DEBtool_M/lib/pet/check_model sets model types directly

%% Example of use
% get_model_types

url = urlread('http://www.debtheory.org/wiki/index.php?title=Typified_models#Model_codes');

% select text with table of model codes
i = strfind(url, '<p>Available model codes'); url(1:i) = []; 
i = strfind(url, '<table class="wikitable">'); url(1:i + 25) = [];
i = strfind(url, '</table>') -1; url = url(1:i); % remove txt till </table>

% get all rows of the code table
i_0 = 4 + strfind(url,'<tr>'); i_1 = strfind(url,'</tr>') - 1; 
n = length(i_0); model_types = cell(n-1,1);

for i = 2:n % scan rows
  row_i = url(i_0(i):i_1(i)); % substring between <tr>...</tr>

  j_0 = 4 + strfind(row_i,'<td>'); j_1 = strfind(row_i,'</td>') - 2; % a trailing end-of-line exists
  model_types(i-1) = {row_i(j_0(1):j_1(1))}; % substring between first <td>...</td>   
end


