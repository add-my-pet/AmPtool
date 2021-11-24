%% select
% gets list of species that belongs to a taxon

%%
function Species = select(taxon)
% created 2015/09/18 by Bernd Brandt
% modified 2015/10/07 by Dina Lika; 2016/11/08, 2021/11/24 by Bas Kooijman

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
    taxon = {'Animalia'}; n = 1;
  elseif ischar(taxon)
    taxon = {taxon}; n = 1;
  else
    n = length(taxon);
  end
  
  WD = pwd;                   % store current path
  taxa = which('select.pl');  % locate AmPtool_M/taxa/
  taxa = taxa(1:end - 9);     % path to AmPtool_M/taxa/
  cd(taxa)                    % goto taxa
  
  Species = {}; % initiate output
  for i=1:n
    if ~isempty(strfind(taxon{i}, '_')) % taxon{i} in an entry
      taxa = textscan(perl('select.pl', 'Animalia'), '%s');
      if ismember(taxon{i}, taxa{:})
        species = taxon(i);
      else        
        disp(['Warning from select: Name ', taxon{i}, ' is not recognized as taxon'])
        Species = {}; cd(WD); return
      end
      
    else % taxon{i} is not an entry
      try
        species = textscan(perl('select.pl', taxon{i}), '%s'); 
        species = species{1};
      catch        
        disp(['Warning from select: Name ', taxon{i}, ' is not recognized as taxon'])
        Species = {}; cd(WD); return
      end
    end
    Species = [Species; species];
  end
  
  cd(WD) % goto original path
  
  wrong = Species(cellfun(@isempty, strfind(Species,'_')));
  if ~isempty(wrong)
    fprintf('Warning from select: not all cells are entry names\n')
    wrong
  end
end

