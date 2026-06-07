%% select
% gets list of species that belongs to a taxon

%%
function Species = select(taxon)
% created 2015/09/18 by Bernd Brandt
% modified 2015/10/07 by Dina Lika; 2016/11/08, 2021/11/24 by Bas Kooijman
% modified 2025/06/07 by mrke: replaced Perl backend with MATLAB taxonomy cache

%% Syntax
% Species = <../select.m *select*> (taxon)

%% Description
% gets all species in the add_my_pet collection that belong to a particular taxon or taxa.
%
% Input:
%
% * taxon: optional character string or cell string with name{s} of taxon (default: 'Animalia')
%
% Output:
%
% * cell string with all species in the add_my_pet collection that belong to that taxon/taxa

%% Remarks
% The root is Animalia.
% If chosen as taxon, an ordered list of all species in the collection results.
% The classification follows that of Wikipedia.
% See also <select_01.html *select_01*>

%% Example of use
% species  = select('Animalia'); % get list of all species in the collection, taxonomically ordered
% species = select({'Daphnia','Canis_lupus'}); % get all species of Daphnia and Canis_lupus.
% fish = setdiff(select('Vertebrata'), select('Tetrapoda')) % select all 5 fish classes, alphabetically ordered
% reptile = setdiff(select('Sauropsida'), select('Maniraptora')) % select all classic reptilia, alphabetically ordered

  if ~exist('taxon', 'var')
    taxon = {'Animalia'};
  elseif ischar(taxon)
    taxon = {taxon};
  end
  n = length(taxon);

  TC = get_taxonomy_cache;
  Species = {};

  for i = 1:n
    t = taxon{i};
    if ~isempty(strfind(t, '_'))  % name contains '_' -> treat as a species entry
      if isKey(TC.species_set, t)
        Species = [Species; {t}]; %#ok<AGROW>
      else
        fprintf('Warning from select: Name %s is not recognized as taxon\n', t);
        Species = {}; return
      end
    else  % treat as a taxon name
      if isKey(TC.species_list, t)
        Species = [Species; TC.species_list(t)]; %#ok<AGROW>
      else
        fprintf('Warning from select: Name %s is not recognized as taxon\n', t);
        Species = {}; return
      end
    end
  end

  wrong = Species(cellfun(@isempty, strfind(Species, '_')));
  if ~isempty(wrong)
    fprintf('Warning from select: not all cells are entry names\n')
    disp(wrong)
  end
end
