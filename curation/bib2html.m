%% bib2html
% translates .bib to .html

%%
function bib2html(my_pet_bib, destinationFolder, filenm)
% created 2018/08/20 by Bas Kooijman

%% Syntax
% <bib2html *bib2html*>(my_pet_bib, destinationFolder)

%% Description
% Translates a bib-file into a html-file
%
% Input:
%
% * bib: bib.file without extension
% * destinationFolder: optional specification of destination folder (default: local)

%% Remarks
% Calls bib2bbl and bbl2html, which writes and deletes .uax and .bbl files

%% example
% * bib2html(my_pet_bib) for printing in local directory
% * bib2html(my_pet_bib, ../../myFolder) or for printing in myFolder

% write my_pet_bib.html from my_pet_bib.bib
WD = pwd;

if exist('destinationFolder','var')
  cd(destinationFolder)
end

bib2bbl(my_pet_bib);
bbl2html(my_pet_bib);

cd(WD);

