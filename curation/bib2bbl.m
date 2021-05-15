%% bib2bbl
% translates .bib to .bbl by running BibTex under Matlab

%%
function bib2bbl(my_pet_bib)
% created 2018/02/03 by Bas Kooijman

%% Syntax
% <bib2bbl *bib2bbl*>(my_pet_bib)

%% Description
% Translates a bib-file into a bbl-file
%
% Input:
%
% * my_pet_bib: character string with bib-file name without extension

%% Remarks
% assumes that Bibtex can be ran under dos and operations occurs in current directory
% The intended use is 
% 
% * convert biblist in results_my_pet.mat to bib by prt_my_pet_bib
% * convert bib to bbl by bib2bbl
% * convert bbl to html by bbl2html
% * insert html-snippet in results_my_pet.html by prt_my_pet_res
%
% Notice that 
%
% * {\em ...} can have an arbitrary number of nested {}, but \emph{} and \textit{} cannot handle nested {}
% * web-adress cannot contain spaces or %20; use ~ instead; this will be replaced by a space in function bbl2html

my_bib = fileread([my_pet_bib, '.bib']);
my_bib = strrep(my_bib, '\~{', '\={'); % replace \~{*} by \={*} because BibTex interpretes ~ as space
my_bib = strrep(my_bib, '\~{', '\={'); % replace \~{*} by \={*} because BibTex interpretes ~ as space
my_bib = strrep(my_bib, '\', '\\');    % replace \ by \\ else fprintf will protest
fid = fopen('my_bib.bib', 'w+'); % open file for reading and writing and deletes old content
fprintf(fid, my_bib);
fclose(fid);

% create aux file
fid = fopen('my_bib.aux', 'w+'); % open file for reading and writing and deletes old content

fprintf(fid,[ ...
   '\\relax\n' ...
   '\\citation{*}\n' ...
   '\\bibstyle{apalike}\n' ...
   '\\bibdata{my_bib}\n']);
fclose(fid); 

% run bibtex
if ismac || isunix
  system('bibtex my_bib');
else   
  dos('bibtex my_bib'); 
end
delete('my_bib.aux');

% search for doi's in my_pet_bib.bib to add in my_pet_bib.bbl
bib = fileread('my_bib.bib'); delete('my_bib.bib');
bib = strrep(bib, 'DOI', 'doi');
bib = strrep(bib, 'Doi', 'doi');
ind = strfind(bib, 'doi ');
if isempty(ind) % no doi's
  return
else % doi's present
  % construct (n,2)-table with bibkey's and doi's
  n = length(ind);  doi = cell(n,2);
  for i = 1:n
    str = bib(ind(i):end); ind0 = strfind(str, '{'); ind1 = strfind(str, '}');
    doi{i,2} = str(ind0(1)+1:ind1(1)-1);
    str = bib(1:ind(i)); ind0 = strfind(str, '@'); str = str(ind0(end):end); ind0 = strfind(str, '{'); ind1 = strfind(str, ',');
    doi{i,1} = str(ind0(1)+1:ind1(1)-1);
  end
end
% add doi's to my_bib.bbl
bbl = fileread('my_bib.bbl'); % read bbl-file
bbl = strrep(bbl,'\','\\'); % replace \ by \\ else fprintf will protest
for i = 1:n
  % find index ind of insertion of doi i
  ind0 = strfind(bbl, [doi{i,1},'}']); ind1 = strfind(bbl, '\bibitem'); 
  if ~isempty(ind0)
    ind1 = ind1(ind1 > ind0); ind0 = strfind(bbl, '.');
    if ~isempty(ind1) % not last \bibitem
      ind1 = ind1(1); ind0 = ind0(ind0 < ind1); 
    end
    ind = 1 + ind0(end);
    % insert
    bbl = [bbl(1:ind), '<a href="http://www.doi.org/', doi{i,2}, '"  target="_blanc"> doi:', doi{i,2}, '</a>.', bbl(ind+1:end)];
  end
end

% overwrite bbl file
fid = fopen('my_bib.bbl', 'w+');
fprintf(fid, bbl);
fclose(fid);

