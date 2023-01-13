%% bbl2html
% translates .bbl to .html

%%
function bbl2html(my_pet_bib, filenm)
% created 2018/02/02 by Bas Kooijman, modified 2018/10/22

%% Syntax
% <bbl2html *bbl2hmtl*>(my_pet_bib, filenm)

%% Description
% Translates a bbl-file into a html-file
%
% Input:
%
% * bbl: character strin with name of bbl.file without extension
% * destinationFolder: optional specification of destination folder (default: local)
% * filnm: optional file name to append (default: my_pet_bib.html)

%% Remarks
% The intended use is 
% 
% * convert biblist in results_my_pet.mat to bib via prt_my_pet_bib
% * convert bib to bbl by bib2bbl
% * convert bbl to html by bbl2html
% * insert html-snippet in results_my_pet.html
%
% This code does not handle nested {} in \emph{...} or \textit{...}, but is does in {\em ...}
% Uppercase project handles single character only, so: {P}{S}dfre, not {PS}dfre


if ~exist('filenm', 'var')
   fid = fopen([my_pet_bib, '.html'], 'w+'); % open file for reading and writing and deletes old content
else
   fid = fopen([filenm, '.html'], 'a'); % open file for appending
end
bbl = fileread('my_bib.bbl'); 

% general edits for whole bbl
bbl = strrep(bbl, '\begin{thebibliography}{1}', ''); 
bbl = strrep(bbl, '\end{thebibliography}', '');
i = strfind(bbl, '\bibitem'); bbl(1:i-1) = []; % remove heading stuff
bbl = strrep(bbl, char(13), '');               % remove unnecessary new lines
bbl = strrep(bbl, '~', ' '); bbl = strrep(bbl, '\newblock', ' ');

% number of bibitems
i_bib = strfind(bbl, '\bibitem'); n_bib = length(i_bib); i_bib = [i_bib, length(bbl)]; % # of bibitems

fprintf(fid, '      <ul class="ref">\n'); % open unordered list

for i = 1:n_bib % scan bibitems
  bibitem_i = bbl(i_bib(i): (i_bib(i+1)-2));
  i_0 = 2 + strfind(bibitem_i, ']{'); i_1 = strfind(bibitem_i, '}') - 1; i_1 = i_1(i_1 > i_0);
  bibkey_i = bibitem_i(i_0:i_1);
  
  % edit bibitem_i
  j = strfind(bibitem_i, ['{', bibkey_i, '}']); bibitem_i(1:j(end) + 1 + length(bibkey_i)) = []; % remove header from content
  
  url = regexp(bibitem_i, '\url{\S.*}', 'match'); n = length(url);
  for j=1:n
    txt = url{j}; txt(1:4) = []; txt(end) = [];
    bibitem_i = strrep(bibitem_i, ['\url{', txt, '}'], ['<a href="', txt, '" target="_blank">', txt, '</a>']);
  end
  
  n = length(strfind(bibitem_i, '{\em')); 
  for j=1:n
    txt = bibitem_i; txt(1: (3 + strfind(txt, '{\em'))) = []; txt(strfind_close(txt): end) = [];
    bibitem_i = strrep(bibitem_i, ['{\em', txt, '}'], ['<i>', txt, '</i>']);
  end

  n = length(strfind(bibitem_i, '\emph'));
  for j=1:n
    txt = bibitem_i; txt(1: (5 + strfind(txt, '\emph{'))) = []; txt(strfind(txt, '}'): end) = [];
    bibitem_i = strrep(bibitem_i, ['\emph{', txt, '}'], ['<i>', txt, '</i>']);
  end

  n = length(strfind(bibitem_i, '\textit'));
  for j=1:n
    txt = bibitem_i; txt(1: (7 + strfind(txt, '\textit{'))) = []; txt(strfind(txt, '}'): end) = [];
    bibitem_i = strrep(bibitem_i, ['\textit{', txt, '}'], ['<i>', txt, '</i>']);
  end

  % special characters
  %
  % single characters: https://www.starr.net/is/type/htmlcodes.html
  bibitem_i = strrep(bibitem_i, '\&',    '&amp;');
  bibitem_i = strrep(bibitem_i, '{\o}',  '&oslash;');
  bibitem_i = strrep(bibitem_i, '{\O}',  '&Oslash;');
  bibitem_i = strrep(bibitem_i, '\.{u}', '&uring;');
  bibitem_i = strrep(bibitem_i, '{\ae}', '&aelig;');
  bibitem_i = strrep(bibitem_i, '{\ss}', '&szlig;');
  bibitem_i = strrep(bibitem_i, '\alpha','&alpha;');
  bibitem_i = strrep(bibitem_i, '\beta', '&beta;');
  bibitem_i = strrep(bibitem_i, '\gamma','&gamma;');
  bibitem_i = strrep(bibitem_i, '\Gamma','&Gamma;');
  bibitem_i = strrep(bibitem_i, '\delta','&delta;');
  bibitem_i = strrep(bibitem_i, '\Delta','&Delta;');
  bibitem_i = strrep(bibitem_i, '\={n}', '&#241;');
  bibitem_i = strrep(bibitem_i, '\={a}', '&#227;');
  bibitem_i = strrep(bibitem_i, '{\l}',  '&#322;');
  bibitem_i = strrep(bibitem_i, '{\L}',  '&#321;');
  bibitem_i = strrep(bibitem_i, '\c{c}', '&#231;');
  bibitem_i = strrep(bibitem_i, '\c{C}', '&#199;');
  bibitem_i = strrep(bibitem_i, '\c{s}', '&#351;');
  bibitem_i = strrep(bibitem_i, '\c{S}', '&#350;');
  bibitem_i = strrep(bibitem_i, '\u{g}', '&#287;');
  bibitem_i = strrep(bibitem_i, '\u{G}', '&#286;');
  bibitem_i = strrep(bibitem_i, '\v{c}', '&#269;');
  bibitem_i = strrep(bibitem_i, '\v{e}', '&#283;');
  bibitem_i = strrep(bibitem_i, '\v{E}', '&#282;');
  bibitem_i = strrep(bibitem_i, '\v{g}', '&#487;');
  bibitem_i = strrep(bibitem_i, '\v{G}', '&#486;');
  bibitem_i = strrep(bibitem_i, '\v{s}', '&#347;');
  bibitem_i = strrep(bibitem_i, '\v{S}', '&#346;');
  bibitem_i = strrep(bibitem_i, '\v{z}', '&#382;');
  bibitem_i = strrep(bibitem_i, '\v{Z}', '&#381;');
  bibitem_i = strrep(bibitem_i, '{\i}',  '&#305;');
  bibitem_i = strrep(bibitem_i, '\.{z}', '&#378;');
  bibitem_i = strrep(bibitem_i, '!',     '%');
  %
  % composite characters
  bibitem_i = strrep(bibitem_i, '\r', '&r'); % ring
  %r =  regexp(bibitem_i, '&r{\w*}', 'match'); n = length(r);
  r =  regexp(bibitem_i, '&r{.}', 'match'); n = length(r);
  for j=1:n
    txt = r{j}; txt(1:3) = []; txt(end) = [];
    bibitem_i = strrep(bibitem_i, ['&r{', txt, '}'], ['&', txt, 'ring;']);
  end
  %
  bibitem_i = strrep(bibitem_i, '\c', '&c'); % cedil
  c =  regexp(bibitem_i, '&c{\w*}', 'match'); n = length(c);
  for j=1:n
    txt = c{j}; txt(1:3) = []; txt(end) = [];
    bibitem_i = strrep(bibitem_i, ['&c{', txt, '}'], ['&', txt, 'cedil;']);
  end
  %
  bibitem_i = strrep(bibitem_i, '\"', '&"'); % uml
  x =  regexp(bibitem_i, '&"{\w*}', 'match'); n = length(x);
  for j=1:n
    txt = x{j}; txt(1:3) = []; txt(end) = [];
    bibitem_i = strrep(bibitem_i, ['&"{', txt, '}'], ['&', txt, 'uml;']);
  end
  %
  bibitem_i = strrep(bibitem_i, '\''', '&'''); % acute
  x =  regexp(bibitem_i, '&''{\w*}', 'match'); n = length(x);
  for j=1:n
    txt = x{j}; txt(1:3) = []; txt(end) = [];
    bibitem_i = strrep(bibitem_i, ['&''{', txt, '}'], ['&', txt, 'acute;']);
  end
  %
  bibitem_i = strrep(bibitem_i, '\`', '&`'); % grave
  x =  regexp(bibitem_i, '&`{\w*}', 'match'); n = length(x);
  for j=1:n
    txt = x{j}; txt(1:3) = []; txt(end) = [];
    bibitem_i = strrep(bibitem_i, ['&`{', txt, '}'], ['&', txt, 'grave;']);
  end
  %
  n = length(strfind(bibitem_i,'\^{')); % circ
  for j=1:n
    txt = bibitem_i; txt(1: (2 + strfind(txt, '\^{'))) = []; txt(strfind(txt, '}'): end) = [];
    bibitem_i = strrep(bibitem_i, ['\^{', txt, '}'], ['&', txt, 'circ;']);
  end
 
  
  %up =  regexp(bibitem_i, '{\w*}', 'match'); n = length(up); % uppercase protection
  up =  regexp(bibitem_i, '{.}', 'match'); n = length(up); % uppercase protection
  for j=1:n
    txt = up{j}; txt(1) = []; txt(end) = [];
    bibitem_i = strrep(bibitem_i, ['{', txt, '}'], txt);
  end

  bibitem_i = strrep(bibitem_i, '\', ''); % just avoid problems
  
  % write bibitem i
  fprintf(fid,['        <li>[<b><font color=Blue>', bibkey_i, '</font></b>] \n']);
  fprintf(fid,['          ', bibitem_i]); 
  fprintf(fid, '        </li>\n');

end

fprintf(fid, '      </ul>\n\n'); % close unordered list
fclose(fid);

% remove bbl file
delete('my_bib.bbl', 'my_bib.blg');
end


function ind = strfind_close(txt)
% find index of closing }, given the string already opened (so leading { is not included)
% e.g. txt = 'df{fg}rty}...' then  result is 10

i_open = strfind(txt, '{')';
i_close = strfind(txt, '}')';

if isempty(i_close)
  ind = [];
  fprintf('warning from srtfind_close: no closing } found\n')
  return
elseif isempty(i_open) || i_close(1) < i_open(1) % pattern {..}..{..}
  ind = i_close(1);
  return
end

n_open = length(i_open);   open = ones(n_open,1);
n_close = length(i_close); close = - ones(n_close,1);
i_oc = [i_open; i_close]; [x, i_oc] = sort(i_oc); 
count = [open; close]; count = cumsum(count(i_oc));
ind = x(count==-1); ind = ind(1);

end
