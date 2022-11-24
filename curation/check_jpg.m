%% check_jpg
% Checks jpg's for nodes in the tree
%%
function check_jpg(info)
% created 2017/04/07 by Bas Kooijman

%% Syntax
% <../check_jpg.m *check_jpg*>(info)

%% Description
% checks presence jpg's for nodes in the tree 
%
% Input:
%
% * info: optional scalar (default 0) with 
%
%     - 0 check tree against local
%     - 1 check local against server
%     - 2 check tree against local and local against server
%
% Output:
% 
% * prints warnings on screen

%% Remarks
% * The root of the tree is Animalia
% * Assumes that this function is ran in dir AmPtool/curation and that entries is a sister directory of AmPtool
% * Assumes that jpg's and txt's are in sister directory img/tree of AmPtool
% * Reads the path to jpg's on server from set_path2server + add_my_pet/img/tree
% * All files in img/tree must have extension '.jpg' or '.jpg.txt' 

%% Example of use
% check_jpg

if ~exist('info','var')
  info = 0;
end

if ~(info == 1)
  tree = list_taxa('', 1); n_tree = length(tree); % cell string with node names of tree, excluding entries
end

local = cellstr(ls('../../deblab/add_my_pet/img/tree')); local([1 2]) = [];  % cell string with local node names 
i = cellfun('isempty',strfind(local, '.txt')); local_txt = local(i); local_jpg = local(~i); % split local in jpg and txt
% reduce jpg and txt names to that of nodes 
n_jpg = length(local_jpg);
for i = 1:n_jpg
  txt = local_jpg{i}; txt = strsplit(txt,'.'); 
  if ~length(txt) == 2 || ~strcmp(txt{2},'jpg')
    fprintf(['warning from check_jpg: present in local: ', local_jpg{i}, '\n']);
  end
  local_jpg{i} = txt{1};
end
n_txt = length(local_txt);
for i = 1:n_txt
  txt = local_txt{i}; txt = strsplit(txt,'.'); 
  if ~length(txt) == 3 || ~strcmp(txt{2},'jpg')
    fprintf(['warning from check_jpg: present in local: ', local_txt{i}, '\n']);
  end
  local_txt{i} = txt{1};
end

% check presence of txt file for each jpg in local
diff = setdiff(local_txt, local_jpg);
if ~isempty(diff)
  fprintf('warning from check_jpg: present in local_txt, but not in local_jpg\n');
  diff
end

diff = setdiff(local_jpg, local_txt);
if ~isempty(diff)
  fprintf('warning from check_jpg: present in local_jpg, but not in local_txt\n');
  diff
end

if info > 0
  % cell string with server nodes stored in server
  path = [set_path2server, 'add_my_pet/img/tree/'];
  eval(['!Powershell wget ', path, ' -o txt.html']); txt = fileread('txt.html'); delete('txt.html');
  head = strfind(txt,'[IMG]'); txt(1:head(1)) = []; 
  n_server = length(strfind(txt,'href="')); server = cell(n_server,1);
  for i = 1:n_server
    kill = strfind(txt,'href="'); txt(1:kill(1) + 5)= [];
    server{i} = txt(1:strfind(txt,'"') - 1);
  end

  i = cellfun('isempty',strfind(server, '.txt')); server_txt = server(i); server_jpg = server(~i); % split server in jpg and txt
  % reduce jpg and txt names to that of nodes 
  n_jpg = length(server_jpg);
  for i = 1:n_jpg
    txt = server_jpg{i}; txt = txt(1:strfind(txt, '.')-1); server_jpg{i} = txt;
  end
  n_txt = length(server_txt);
  for i = 1:n_txt
    txt = server_txt{i}; txt = txt(1:strfind(txt,'.')-1); server_txt{i} = txt;
  end

  % check presence of txt file for each jpg in server
  diff = setdiff(server_txt, server_jpg);
  if ~isempty(diff)
    fprintf('warning from check_jpg: present in server_txt, but not in server_jpg\n');
    diff
  end
  
  % check presence of txt file for each jpg in server
  diff = setdiff(server_jpg, server_txt);
  if ~isempty(diff)
    fprintf('warning from check_jpg: present in server_jpg, but not in server_txt\n');
    diff
  end
end

if ~(info == 1)
  diff = setdiff(local_jpg, tree);
  if ~isempty(diff)
    fprintf('warning from check_jpg: present in local_jpg, but not in tree\n');
    diff
  end

  % check tree against local
  diff = setdiff(tree, local_jpg);
  if ~isempty(diff)
    fprintf('warning from check_entries: present in tree, but not in local_jpg\n');
    diff
  end
end

if info > 0
  % check local against server
  diff = setdiff(server_jpg, local_jpg);
  if ~isempty(diff)
    fprintf('warning from check_entries: present in server_jpg, but not in local_jpg\n');
    diff
  end

  diff = setdiff(local_jpg, server_jpg);
  if ~isempty(diff)
    fprintf('warning from check_entries: present in local_jpg, but not in server_jpg\n');
    diff
  end
end
