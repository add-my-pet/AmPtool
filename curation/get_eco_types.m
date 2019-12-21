%% get_eco_types
% copies ecotypes from AmPeco.html to global eco_types
%%
function get_eco_types(localPath)
% created 2018/04/12 by Bas Kooijman, modified 2018/06/02

%% Syntax
% <../get_eco_types.m *get_eco_types*>(localPath)

%% Description
% sets global eco_types by reading from AmPeco.html.
% eco_type is a matlab structure with labels.
% The first-level fields are: climate, ecozone, habitat, embryo, migrate, food, gender, reprod; the second-level fields are the codes
%
% Input
%
% * localPath: optional path to local AmPeco.html for local file read (for off-line use, e.g. '../../')

%% Remarks
% Re-check this function after edits of AmPeco.html for eco-types
%
% * https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/AmPeco.html

%% Example of use
% get_eco_types

global eco_types

if exist('localPath','var')
  url = fileread([localPath, 'AmPeco.html']);
else
  url = urlread('https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/AmPeco.html');
end

% climate
txt = url(strfind(url,'id="C.'): strfind(url,'id="E"')); j = 6 + strfind(txt, 'id="C.'); n = length(j);
for i = 1:n
  rtxt = txt(j(i):end);
  code = rtxt(1:strfind(rtxt,'"') - 1);
  rtxt(1:4 + strfind(rtxt,'</b> ')) = [];
  label = rtxt(1:strfind(rtxt,'</li>') - 1);
  if ~isempty(strfind(label,'<ul>'))
    label = splitlines(label); label = label{1};
  end
  eco_types.climate.(code) = label;
end

% ecozone
txt = url(strfind(url,'id="E.'): strfind(url,'id="H"')); j = 6 + strfind(txt, 'id="E.'); n = length(j);
for i = 1:n
  rtxt = txt(j(i):end);
  code = rtxt(1:strfind(rtxt,'"') - 1);
  rtxt(1:4 + strfind(rtxt,'</b> ')) = [];
  label = rtxt(1:strfind(rtxt,'</li>') - 1);
  if ~isempty(strfind(label,'<ul>'))
    label = splitlines(label); label = label{1};
  end
  eco_types.ecozone.(code) = label;
end

% habitat
txt = url(strfind(url,'id="H.'): strfind(url,'id="B"')); j = 6 + strfind(txt, 'id="H.'); n = length(j);
for i = 1:n
  rtxt = txt(j(i):end);
  code = rtxt(1:strfind(rtxt,'"') - 1);
  rtxt(1:4 + strfind(rtxt,'</b> ')) = [];
  label = rtxt(1:strfind(rtxt,'</li>') - 1);
  if ~isempty(strfind(label,'<ul>'))
    label = splitlines(label); label = label{1};
  end
  eco_types.habitat.(code) = label;
end

% embryo
txt = url(strfind(url,'id="B.'): strfind(url,'id="M"')); j = 6 + strfind(txt, 'id="B.'); n = length(j);
for i = 1:n
  rtxt = txt(j(i):end);
  code = rtxt(1:strfind(rtxt,'"') - 1);
  rtxt(1:4 + strfind(rtxt,'</b> ')) = [];
  label = rtxt(1:strfind(rtxt,'</li>') - 1);
  if ~isempty(strfind(label,'<ul>'))
    label = splitlines(label); label = label{1};
  end
  eco_types.embryo.(code) = label;
end

% migrate
txt = url(strfind(url,'id="M.'): strfind(url,'id="F"')); j = 6 + strfind(txt, 'id="M.'); n = length(j);
for i = 1:n
  rtxt = txt(j(i):end);
  code = rtxt(1:strfind(rtxt,'"') - 1);
  rtxt(1:4 + strfind(rtxt,'</b> ')) = [];
  label = rtxt(1:strfind(rtxt,'</li>') - 1);
  if ~isempty(strfind(label,'<ul>'))
    label = splitlines(label); label = label{1};
  end
  eco_types.migrate.(code) = label;
end

% food
txt = url(strfind(url,'id="F.'): strfind(url,'id="G"')); j = 6 + strfind(txt, 'id="F.'); n = length(j);
for i = 1:n
  rtxt = txt(j(i):end);
  code = rtxt(1:strfind(rtxt,'"') - 1);
  rtxt(1:4 + strfind(rtxt,'</b> ')) = [];
  label = rtxt(1:strfind(rtxt,'</li>') - 1);
  if ~isempty(strfind(label,'<ul>'))
    label = splitlines(label); label = label{1};
  end
  eco_types.food.(code) = label;
end
  
% gender
txt = url(strfind(url,'id="G.'): strfind(url,'id="R"')); j = 6 + strfind(txt, 'id="G.'); n = length(j);
for i = 1:n
  rtxt = txt(j(i):end);
  code = rtxt(1:strfind(rtxt,'"') - 1);
  rtxt(1:4 + strfind(rtxt,'</b> ')) = [];
  label = rtxt(1:strfind(rtxt,'</li>') - 1);
  if ~isempty(strfind(label,'<ul>'))
    label = splitlines(label); label = label{1};
  end
  eco_types.gender.(code) = label;
end

% reprod
txt = url(strfind(url,'id="R.'): end); j = 6 + strfind(txt, 'id="R.'); n = length(j);
for i = 1:n
  rtxt = txt(j(i):end);
  code = rtxt(1:strfind(rtxt,'"') - 1);
  rtxt(1:4 + strfind(rtxt,'</b> ')) = [];
  label = rtxt(1:strfind(rtxt,'</li>') - 1);
  if ~isempty(strfind(label,'<ul>'))
    label = splitlines(label); label = label{1};
  end
  eco_types.reprod.(code) = label;
end


