%% select
% gets list of species that belongs to a taxon

%%
function species = select(taxon)
% created 2015/09/18 by Bernd Brandt
% modified 2015/10/07 by Dina Lika; 2016/11/08 by Bas Kooijman

%% Syntax
% species = <../select.m *select*> (taxon) 

%% Description
% gets all species in the add_my_pet collection that belong to a particular taxon.
%
% Input:
%
% * taxon: optional character string with name of taxon (default: 'Animalia')
%
% Output:
% 
% * cell string with all species in the add_my_pet collection that belong to that taxon

%% Remarks
% The root is Animalia. 
% If chosen as taxon, an ordered list of all species in the collection results.
% The classification follows that of Wikipedia.
% See also <select_01.html *select_01*>

%% Example of use
% species  = select('Animalia'); % get list of all species in the collection, taxonomically ordered
% fish = setdiff(select('Craniata'), select('Tetrapoda')) % select all 5 fish classes, alphabetically ordered
% reptile = setdiff(select('Sauropsida'), select('Maniraptora')) % select all classic reptilia, alphabetically ordered

  if ~exist('taxon', 'var')
    taxon = 'Animalia';
  end
  
  WD = pwd;                % store current path
  taxa = which('select.pl');  % locate AmPtool_M/taxa/
  taxa = taxa(1:end - 9);  % path to AmPtool_M/taxa/
  cd(taxa)                 % goto taxa
  
  if ~isempty(strfind(taxon, '_'))
    taxa = textscan(perl('select.pl', 'Animalia'), '%s');
    if ismember(taxon, taxa{:})
      species = {taxon};
    else
      species = {};
      disp(['Warning from select: Name ', taxon, ' is not recognized as taxon'])
    end
    cd(WD);
    return
  end
  
  try
    species = textscan(perl('select.pl', taxon), '%s'); 
    species = species{1};
  catch
    species = {};
    disp(['Warning from select: Name ', taxon, ' is not recognized as taxon'])
  end
  
  cd(WD)                   % goto original path
  
  wrong = species(cellfun(@isempty, strfind(species,'_')));
  if ~isempty(wrong)
    fprintf('Warning from select: not all cells are entry names\n')
    wrong
  end
end

