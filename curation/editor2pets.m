%% editor2pets
% get pet names from files open in Matlab editor

function pets = editor2pets(type)
% created 2025/11/19 by Bas Kooijman

%% Syntax
% pets = <../editor2pets.m *editor2pets*> (type)

%% Description
% get pet names from files open in Matlab editor of type mydata, pars_init, predict or run
%
% Input
% 
% * type: optional type number 1,.,4 (default 1)
%
% Output
%
% * cell string with names of pets 

%% Remarks
% See <../cdEntr.m *cdEntr*>  for loading pets in Matlab editor
% Close all files open in Matlab editor: closeNoPrompt(matlab.desktop.editor.getAll);

%% Example of use
% nm = editor2pets;

if ~exist('type','var'); type = 1; end
switch type
    case 1 
        type = 'mydata_';
    case 2
        type = 'pars_init_';
    case 3 
        type = 'predict_';
    case 4
        type = 'run_';
    otherwise
        type = 'all';
end

openFiles = matlab.desktop.editor.getAll;
nm = {openFiles.Filename}'; n = length(nm); 
pets = cell(n,1); sel = false(n,1); % initiate
for i=1:n
  txt = nm{i};
  if strcmp(type,'all')
    n_i = [strfind(txt,'mydata_'),strfind(txt,'pars_init_'),strfind(txt,'predict_'),strfind(txt,'run_')];
  else
    n_i = strfind (txt,type);
  end
  if ~isempty(n_i)
    sel(i) = true;
    n_j = strfind (txt,'\');
    pets{i} = txt(n_j(end-1)+1:n_j(end)-1);
  end
end
pets = pets(sel); % remove empty names
