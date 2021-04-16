%% get_eco_types
% copies ecotypes from AmPeco.html to global eco_types
%%
function get_eco_types(localPath)
% created 2018/04/12 by Bas Kooijman, modified 2018/06/02, 2019/12/29, 2020/08/26, 2020/08/31

%% Syntax
% <../get_eco_types.m *get_eco_types*>(localPath)

%% Description
% sets global eco_types by reading from AmPeco.html.
% eco_type is a matlab structure with labels.
% The first-level fields are: climate, ecozone, habitat, embryo, migrate, food, gender, reprod; the second-level fields are the codes
%
% Input
%
% * localPath: optional path to local AmPeco.html for local file read (for off-line use, e.g. '../../add_my_pet/')

%% Remarks
% Writes to global eco_types; type "global eco_types" to access the result.
% eco_types is a structure with the ecoCodes as first-level fields, and all codes with descriptions as next fields.
% Re-check this function after edits of AmPeco.html for eco-types
%
% * https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/AmPeco.html

%% Example of use
% get_eco_types

global eco_types

eco_types.climate = []; eco_types.ecozone = []; eco_types.habitat = []; eco_types.embryo = []; 
eco_types.migrate = []; eco_types.food = [];    eco_types.gender = [];  eco_types.reprod = []; 

if exist('localPath','var')
  url = fileread([localPath, 'AmPeco.html']);
else
  path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/';    
  if ismac || isunix
    PATH = getenv('PATH'); if isempty(strfind(PATH,':/usr/local/bin')); setenv('PATH', [PATH, ':/usr/local/bin']); end;
    status = system('which wget');
    if ~(status == 0)
      fprintf('Warning from get_eco_types: wget is not found, please install wget first\nl');
      fprintf('See e.g.: https://www.fossmint.com/install-and-use-wget-on-mac/\nl');
      return
    else
      system(['wget -O AmPeco_local.html ', path, 'AmPeco.html']);
    end
  else
    system(['powershell wget -O AmPeco_local.html ', path, 'AmPeco.html']);
  end
  url = fileread('AmPeco_local.html'); delete('AmPeco_local.html'); 
end

% climate
txt = url(strfind(url,'id="C.'): strfind(url,'id="E"')); j = 6 + strfind(txt, 'id="C.'); n = length(j);
for i = 1:n
  rtxt = txt(j(i):end);
  code = rtxt(1:strfind(rtxt,'"') - 1);
  rtxt(1:4 + strfind(rtxt,'</b> ')) = [];
  label = rtxt(1:strfind(rtxt,'</li>') - 1);
  if ~isempty(strfind(label,'<ul>'))
    %label = splitlines(label); label = label{1};
    label = strsplit(label,char(10)); label = label{1};
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
    %label = splitlines(label); label = label{1};
    label = strsplit(label,char(10)); label = label{1};
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
    %label = splitlines(label); label = label{1};
    label = strsplit(label,char(10)); label = label{1};
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
    %label = splitlines(label); label = label{1};
    label = strsplit(label,char(10)); label = label{1};
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
    %label = splitlines(label); label = label{1};
    label = strsplit(label,char(10)); label = label{1};
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
    %label = splitlines(label); label = label{1};
    label = strsplit(label,char(10)); label = label{1};
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
    %label = splitlines(label); label = label{1};
    label = strsplit(label,char(10)); label = label{1};
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
    %label = splitlines(label); label = label{1};
    label = strsplit(label,char(10)); label = label{1};
  end
  eco_types.reprod.(code) = label;
end


