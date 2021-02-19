%% repair_zip
% runs zip_my_pet for list of species

%%
function repair_zip(nm)
% created 2020/05/21 by Bas Kooijman

%% Syntax
% <repair_zip *repair_zip*>(nm)

%% Description
% Runs zip_my_pet for a list of species
%
% Input:
%
% * nm: character string with taxon or entry, or cell string with entry  names

%% Example
% repair_zip(select)

if ~iscell(nm)
  if isempty(findstr(nm,'_'))
    nm = {nm};
  else
    nm = select(nm);
  end
end
n = length(nm);

WD = cdCur;
cd('../../add_my_pet/entries_zip');

for i=1:n
  zip_my_pet(nm{i}, '../entries'); % zip the entry and save
end

cd(WD)
