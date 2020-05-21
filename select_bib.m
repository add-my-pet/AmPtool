%% select_bib
% gets list of species that belongs to a taxon and has a specified string in its predict-file

%%
function = select_bib(nm)
% created 2019/03/13 by  Bas Kooijman

%% Syntax
% <../repair_bib.m *repair_bib*> (nms) 

%% Description
% runs 
% Input:
%
% * nm: character string or cell string with name of taxon 
%
% Output:
% 
% * no put, but my_pet_bib.bib and my_pet_bib.html are replaced in add_my_pet/entries_web
%% Remarks
% This function assumes to be run from AmPtool/curation

%% Example of use
% repair_bib('%')

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
  
  path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/';
  n_spec = length(nm); sel = false(n_spec,1);
  for i = 1:n_spec
    bib = [path, nm{i}, '/', nm{i}, '_bib.bib'];
    eval(['!Powershell wget ', bib, ' -o txt.html']); bib = fileread('txt.html'); delete('txt.html');
    if ~isempty(strfind(bib, str))
      sel(i) = true;
    end
  end

  species = nm(sel);

  
