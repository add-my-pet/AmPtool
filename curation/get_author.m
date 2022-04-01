%% get_author
% read results_my_pet.mat to get all authors

%%
function author = get_author(metaData)
% created 2022/02/17 by Bas Kooijman

%% Syntax
% author =  <../get_author.m *get_author*> (metaData) 

%% Description
% Gets all authors of all modifications from metaData
%
% Input:
%
% * metaData:  structure with fields species, author, author_mod* and date_acc
%
% Output
%
% * author: cell string with authors

%% Remarks
% metaData is found from loading results_my_pet.mat

%% Example of use
% load('results_my_pet.mat');
% get_author(metaData) 


author = metaData.author(:);  % initiate author list
% modifications
if isfield(metaData,'author_mod')
  author = [author; metaData.author_mod(:)];
end
for i = 1:100 % identify latest modification
  mod = ['author_mod_', num2str(i)];
  if isfield(metaData, mod)
    authormod = metaData.(mod);
    author = [author; authormod(:)];
  else
    break
  end
end
author = unique(author, 'stable'); 
