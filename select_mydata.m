%% select_mydata
% gets list of species that belongs to a taxon and has a specified string in its mydata-file

%%
function [species, nm, sel] = select_mydata(varargin)
% created 2019/03/14 by  Bas Kooijman

%% Syntax
% [species, nm, sel]  = <../select_mydata.m *select_mydata*> (varargin) 

%% Description
% gets all species in the add_my_pet collection with mydata files that contain a character string.
%
% Input:
%
% * taxon: optional character string with name of taxon or cell string with names of species (default: 'Animalia')
% * str: character string
%
% Output:
% 
% * cell string with all species in the add_my_pet collection that belong to that taxon and have a mydata-file that contains str
% * nm string with names of entries that were subjected to selection
% * sel vector of bouleans, which entries are selected or not

%% Remarks
% This function can take a few minutes if 'Animalia' is specified (so all entries are searched), since all mydata-files are read from the web

%% Example of use
% nm = select_mydata('Emig') or nm = select_mydata('Aves','Killpack')

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
  
  path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries/';
  n_spec = length(nm); sel = false(n_spec,1);
  for i = 1:n_spec
    mydata = urlread([path, nm{i}, '/mydata_', nm{i}, '.m']);
    if ~isempty(strfind(mydata, str))
      sel(i) = true;
    end
  end

  species = nm(sel);

  
