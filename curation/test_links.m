%% test_links
% tests links to web-pages for AmP entries

%%
function [info, id] = test_links(my_pet)
% created 2019/12/29 by Bas Kooijman

%% Syntax
% [info, id] = <../test_links.m *test_links*>(my_pet)

%% Description
% gets cell strings with links and descriptions for an entry
%
% Input:
%
% * my_pet: character  with name of an entry
%
% Output:
%
% * info: (n,1)-array with booleans for true or false
% * id: (n,1)-cell array with short names of website

%% Remarks
% Uses <get_links.html *get_links*> to get links
% Warning: EoL and Wiki return false, since these sites do not allow urlread

%% Example of use
% test_link('Daphnia_magna')

[links, id] = get_links(my_pet); n = size(links,1);
id = fieldnames(id); info = false(n,1);
txt = strsplit(my_pet, '_'); txt = txt(2); 

for i=1:n
    try 
      url = urlread(links{i,1});
      in = strfind(url, txt);
      info(i) = in(1) > 0;
    catch
      info(i) = false;
    end      
end

