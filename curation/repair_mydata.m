%% repair_mydata
% runs prt_my_pet and bbl2html for list of species

%%
function repair_mydata(nm)
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
% repair_mydata('Schiffornis_turdina')

n = length(nm);

WD = cdCur;
cd(['../../add_my_pet/entries/', nm{1}])

for i=1:n
    cd(['../../entries/', nm{i}]);
    fnm = fileread(['mydata_', nm{i}, '.m']);
    fnm = strrep(fnm, 'Starrrlight', 'Starrlight');
    fnm = strrep(fnm, '\', '\\');
    fid = fopen(['mydata_', nm{i}, '.m']);
    fprintf(fid, fnm);
    fclose(fid);
end

cd(WD)
