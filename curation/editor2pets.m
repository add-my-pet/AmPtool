%% editor2pets
% get pet names from files open in Matlab editor

function pets = editor2pets(i)
% created 2025/11/19 by Bas Kooijman

%% Syntax
% pets = <../editor2pets.m *editor2pets*> (i)

%% Description
% get pet names from files open in Matlab editor of type mydata, pars_init, predict or run
%
% Input
% 
% * i: optional type number 1,.,4 (default 1)
%
% Output
%
% * cell string with names of pets 

%% Example of use
% nm = editor2pets;

if ~exist('i','var'); i = 1; end
switch i
    case 1 
        type = 'mydata_';
    case 2
        type = 'pars_init_';
    case 3 
        type = 'predict_';
    otherwise
        type = 'run_';
end

openFiles = matlab.desktop.editor.getAll;
fileNames = {openFiles.Filename}'; n = length(fileNames); 
pets = cell(n,1); sel = false(n,1);
for i=1:n
  n_i = strfind (fileNames{i},type);
  if ~isempty(n_i)
    sel(i) = true;
    txt = fileNames{i};
    n_j = strfind (txt,'\');
    pets{i} = txt(n_j(end-1)+1:n_j(end)-1);
  end
end
pets = pets(sel); % remove empty names
