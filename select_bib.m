%% select_bib
% gets list of species that belongs to a taxon and has a specified string in its bibliography

%%
function [species, nm, sel] = select_bib(varargin)
% created 2019/03/13 by  Bas Kooijman

%% Syntax
% [species, nm, sel]  = <../select_bibt.m *select_bib*> (varargin) 

%% Description
% gets all species in the add_my_pet collection with bib files that contain a character string.
%
% Input:
%
% * taxon: optional character string with name of taxon or cell string with names of species (default: 'Animalia')
% * str: character string
%
% Output:
% 
% * cell string with all species in the add_my_pet collection that belong to that taxon and have a bib-file that contains str
% * nm string with names of entries that were subjected to selection
% * sel vector of bouleans, which entries are selected or not

%% Remarks
% This function can take a few minutes if 'Animalia' is specified (so all entries are searched), since all predict-files are read from the web

%% Example of use
% nm = select_bib('%')

  if ismac
    PATH = getenv('PATH'); if isempty(strfind(PATH,':/usr/local/bin')); setenv('PATH', [PATH, ':/usr/local/bin']); end;
    status = system('which wget');
    if ~(status == 0)
      fprintf('Warning from select_predict: system-function wget is not found, please install wget first\nl');
      fprintf('See e.g.: https://www.fossmint.com/install-and-use-wget-on-mac/\nl');
      return
    end
  end

  if nargin == 1
    nm = select('Animalia');
    str = varargin{1};
  else
    if iscell(varargin{1})
      nm = (varargin{1});
    else
      nm = select(varargin{1});
    end
    str = varargin{2};
  end
  
  path = [set_path2server, 'add_my_pet/entries_web/'];
  n_spec = length(nm); sel = false(n_spec,1);
  for i = 1:n_spec
    if ismac || isunix
      eval(['system(wget -O my_bib.bib ', path, nm{i}, '/', nm{i}, '_bib.bib)']);
    else
      eval(['!powershell wget -o my_bib.bib ', path, nm{i}, '/', nm{i}, '_bib.bib']);
    end
    bib = fileread('my_bib.bib');
    if ~isempty(strfind(bib, str))
      sel(i) = true;
    end
  end
  species = nm(sel);
  delete('my_bib.bib');

  
