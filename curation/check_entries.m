%% check_entries
% Checks entries for member inconsistencies

%%
function [tree local server] = check_entries
% created 2017/04/07 by Bas Kooijman, modified 2018/12/18

%% Syntax
% [tree local server] = <../check_entries.m *check_entries*>

%% Description
% checks tree leaves against subdirectories of entries, local and on server
%
% Output:
% 
% * tree, local, server: cell strings with names of entries
% * prints warnings on screen

%% Remarks
% The root of the tree is Animalia. The dates are not checked
% Assumes that this function is run in dir AmPtool/curation and that entries is a sister directory of AmPtool
% Assumes that path to entries on server is: http://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries/

%% Example of use
% check_entries

tree = select; n_tree = length(tree);                                             % cell string with entry names of tree
local = cellstr(ls('../../entries')); local([1 2]) = []; n_local = length(local); % cell string with local entry names 
stat = read_allStat('species');

% cell string with server entries stored on server
txt = urlread('https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries/');
head = strfind(txt,'folder.gif'); txt(1:head(1)) = []; 
n_server = length(strfind(txt,'href="')); server = cell(n_server,1);
for i = 1:n_server
  kill = strfind(txt,'href="'); txt(1:kill(1) + 5)= [];
  server{i} = txt(1:strfind(txt,'/"') - 1);
end

% cell string with server entries_web stored on server
txt = urlread('https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/');
head = strfind(txt,'folder.gif'); txt(1:head(1)) = []; 
n_server_web = length(strfind(txt,'href="')); server_web = cell(n_server_web,1);
for i = 1:n_server_web
  kill = strfind(txt,'href="'); txt(1:kill(1) + 5)= [];
  server_web{i} = txt(1:strfind(txt,'/"') - 1);
end

% cell string with server entries_zip stored on server
txt = urlread('https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_zip/');
n_zip = strfind(txt,'/icons/compressed.gif'); 
n_server_zip = length(n_zip); server_zip = cell(n_server_zip,1); n_zip = [n_zip, length(txt) - 1];
for i = 1:n_server_zip
  txt_i = txt(n_zip(i):n_zip(i+1));
  txt_0 = strfind(txt_i,'href="'); 
  txt_1 = strfind(txt_i,'_2');
  server_zip{i} = txt_i(txt_0+6:txt_1-1);
  if i > 1 && strcmp(server_zip{i},server_zip{i-1})
    fprintf(['warning from check_entries: double zip for ', server_zip{i}, '\n']);
  end
end
server_zip = unique(server_zip);

diff = setdiff(stat, local);
if ~isempty(diff)
  fprintf('warning from check_entries: present in allstat, but not in local\n');
  diff
end

diff = setdiff(local, stat);
if ~isempty(diff)
  fprintf('warning from check_entries: present in local, but not in allstat\n');
  diff
end

diff = setdiff(tree, local);
if ~isempty(diff)
  fprintf('warning from check_entries: present in tree, but not in local\n');
  diff
end

diff = setdiff(local, tree);
if ~isempty(diff)
  fprintf('warning from check_entries: present in local, but not in tree\n');
  diff
end

diff = setdiff(local, server);
if ~isempty(diff)
  fprintf('warning from check_entries: present in local, but not on server\n');
  diff
end

diff = setdiff(server, local);
if ~isempty(diff)
  fprintf('warning from check_entries: present in server, but not in local\n');
  diff
end

diff = setdiff(server, server_web);
if ~isempty(diff)
  fprintf('warning from check_entries: present in entries on server, but not in entries_web on server\n');
  diff
end

diff = setdiff(server_web, server);
if ~isempty(diff)
  fprintf('warning from check_entries: present in entries_web on server, but not in entries on server\n');
  diff
end

diff = setdiff(server_zip, server_web);
if ~isempty(diff)
  fprintf('warning from check_entries: present in entries_zip on server, but not in entries_web on server\n');
  diff
end

diff = setdiff(server_web, server_zip);
if ~isempty(diff)
  fprintf('warning from check_entries: present in entries_web on server, but not in entries_zip on server\n');
  diff
end