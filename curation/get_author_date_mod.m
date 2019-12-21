%% get_author_date_mod
% get author names and dates of modification

%%
function author_date_mod = get_author_date_mod(metaData)
% created 2018/01/18 by Bas Kooijman

%% Syntax
% author_date_mod = <../get_author_date_mod.m *get_author_date_mod*>(metaData)

%% Description
% gets (n,2)-cell array with authors and dates of modifications
%
% Input:
% 
% * metaData: structure as stored in results_my_pet.mat
%
% Output: 
% 
% * entries: (n,2)- nested cell array with authors and dates of modifications

%% Example of use
% load results_my_pet; get_author_date_mod(metaData)

  author_date_mod = cell(0,2); % initiate (n,2) array with modication author(s), date(s)
  [nm nr] = fieldnmnst_st(metaData); 
  n = strfind(nm, 'author_mod');
  for i = 1:nr
    if ~isempty(n{i})
      author = metaData.(nm{i});
      date = {metaData.(strrep(nm{i}, 'author', 'date'))};
      author_date_mod = [author_date_mod; {author(:)', date}];
    end
  end
end
