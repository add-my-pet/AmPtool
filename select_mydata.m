%% select_mydata
% gets list of species that belongs to a taxon and has a specified string in its mydata-file

%%
function [species, nm, sel] = select_mydata(varargin)
% created 2019/03/14 by  Bas Kooijman, modofied 2020/09/03

%% Syntax
% [species, nm, sel]  = <../select_mydata.m *select_mydata*> (varargin) 

%% Description
% gets all species in the add_my_pet collection with mydata files that contain a character string.
%
% Input:
%
% * taxon: character string with name of taxon or cell string with names of species (default: 'Animalia')
% * str: character string 
% * info: optional boolean to search locally if true (only for curators)
%
% Output:
% 
% * species: cell string with all species in the add_my_pet collection that belong to that taxon and have a mydata-file that contains str
% * nm: string with names of entries that were subjected to selection
% * sel: vector of bouleans, which entries are selected or not

%% Remarks
% This function can take a few minutes if 'Animalia' is specified (so all entries are searched), since all mydata-files are read from the web

%% Example of use
% nm = select_mydata('Emig') or nm = select_mydata('Aves','Killpack')

  path2server = set_path2server;
  
  WD = pwd; info = false;
  if ismac
    PATH = getenv('PATH'); if isempty(strfind(PATH,':/usr/local/bin')); setenv('PATH', [PATH, ':/usr/local/bin']); end;
    status = system('which wget');
    if ~(status == 0)
      fprintf('Warning from select_mydata: system-function wget is not found, please install wget first\nl');
      fprintf('See e.g.: https://www.fossmint.com/install-and-use-wget-on-mac/\nl');
      return
    end
  end

  if nargin == 1
    nm = select('Animalia');
    str = varargin{1};
    path = [path2server, 'add_my_pet/entries/'];
  else
    if iscell(varargin{1})
      nm = (varargin{1});
    else
      nm = select(varargin{1});
    end
    str = varargin{2};
    path = [path2server, 'add_my_pet/entries/'];
    if length(varargin) == 3 && varargin{3} == true % for curators only
       WD = cdCur; info = true;
       path = '../../deblab/add_my_pet/entries/';
    end
  end
  
  n_spec = length(nm); sel = false(n_spec,1);
  for i = 1:n_spec
    fnm = [path, nm{i}, '/mydata_', nm{i}, '.m'];
    if ~info
      if ismac || isunix
        eval(['system(wget -O mydata_my_pet.txt ', fnm, ')']);
      else
        eval(['!powershell wget -O mydata_my_pet.txt ', fnm]);
      end
      mydata = fileread('mydata_my_pet.txt'); 
      delete('mydata_my_pet.txt'); 
    else
      mydata = fileread(fnm);
    end
    if ~isempty(strfind(mydata, str))
      sel(i) = true;
    end
  end

  species = nm(sel); 
  cd(WD);

  
