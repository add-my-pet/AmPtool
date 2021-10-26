%% get_date_DEB
% gets yr of publication of papers in DEB library

%%
function dates = get_date_DEB(sourcefile)
%% created 2018/02/28 by Bas Kooijman

%% Syntax
% dates = <../get_date_DEB.m *get_date_DEB*>(sourcefile)

%% Description
% Gets yr of publication of papers in DEB library. First export bibtex file from Zotero as debtool/DEB Library.bib. 
%
% Output:
% 
% * dates: n-vector with yrs of publication

%% Remarks
% about_add_my_pet makes a plot of this
%
%% Example of use
% yrs = get_date_DEB('../../DEB Library.bib')


bib = fileread(sourcefile);
bib = strrep(bib, 'urldate', 'url'); % avoid confusion between urldate and date
index = 7 + strfind(bib, 'year = {');
n = length(index'); 
dates = zeros(n,1);
for  i = 1:n
   date_i = bib;
   date_i(1:index(i)) = []; 
   date_i = date_i(1: (strfind(date_i, '}') - 1)); 
   j = strfind(date_i, '-');
   if isempty(j) 
     dates(i) = str2double(date_i);
   else
     dates(i) = str2double(date_i(1:(j(1)-1)));
   end
end

