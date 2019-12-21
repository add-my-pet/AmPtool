%% check_bibkeynr
% Checks number of bibkey as specific by mydata and .bib

%%
function [nm nr] = check_bibkeynr(species)
% created 2019/03/05 by Bas Kooijman

%% Syntax
% nm = <../check_bibkeynr.m *checkbibkeynr*>(species)

%% Description
% Checks if the number of bibkey items in the mydata-file corresponds with the number of items in the bib-file 
%
% Input:
%
% * my_pet: character sring with name of entry, or cell string with entry-names
%
% Output:
%
% * nm: n-cell string with names where the number of bib items in .bib and mydata are note equal
% * nr: (n,2) array with corresponding numbers of bib items in mydata and .bib

%% Remarks
% Assumes to be run from AmPtool/curation and entries are in sister-directory entries for mydata-files.
% reads bib-files from the web. Assumes that bibkey = " only occurs in the references.

%% Example of use
% check_bibkeynr('Turdus_merula') or

path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/';

WD = pwd;

if exist('species', 'var') == 0
   species = select;
elseif ~iscell(species)
   if isempty(strfind(species, '_'))
     species = {species};
   else
     species = select(species);
   end
end
nm = species; n_spec = length(species); sel = false(n_spec,1); nr = zeros(n_spec, 2);
for i = 1: n_spec
  cd(['../../entries/', species{i}])
  mydata = fileread(['mydata_',species{i}, '.m']);
  nr(i,1) = length(strfind(mydata, 'bibkey = '''));
  txt = [path, species{i}, '/', species{i}, '_bib.bib'];
  bib = urlread([path, species{i}, '/', species{i}, '_bib.bib']);
  nr(i,2) = length(strfind(bib, '@'));
  if nr(i,1) ~= nr(i,2)
    sel(i) = true;
  end
  cd (WD);
end

nm = nm(sel); nr = nr(sel,:);

