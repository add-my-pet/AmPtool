%% repair_bib
% runs prt_my_pet and bbl2html for list of species

%%
function repair_bib(nm)
% created 2020/05/21 by Bas Kooijman

%% Syntax
% <repair_bib *repair_bib*>(nm)

%% Description
% Runs prt_my_pet and bbl2html for a list of species
%
% Input:
%
% * nm: character string with taxon or entry, or cell string with entry  names

%% Example
% repair_bib('Schiffornis_turdina')

if ~iscell(nm)
  if isempty(findstr(nm,'_'))
    nm = {nm};
  else
    nm = select(nm);
  end
end
n = length(nm);

WD = cdCur;
cd(['../../add_my_pet/entries/', nm{1}])

for i=1:n
    cd(['../../entries/', nm{i}]);
    eval(['[~, ~, metaData, ~] = mydata_', nm{i}, ';']);
    cd(['../../entries_web/', nm{i}])
    prt_my_pet_bib(metaData.species, metaData.biblist); 
    bib2html([metaData.species, '_bib']);
end

cd(WD)
