%% bib2author
% extracts  bib to list of authors from bib-file

%%
function [author, authKey] = bib2author(my_pet_bib)
% created 2026/05/06 by Bas Kooijman

%% Syntax
% [author, authKey] = <bib2author *bib2author*>(my_pet_bib)

%% Description
% Extracts authors from a bib-file, as exported by Zotero
%
% Input:
%
% * my_pet_bib: character string with bib-file name without extension
%
% Output:
%
% * author: (k,1)-cell array with author last names
% * authKey: (n,2)-cell array with author name, bibkey

%% Remarks
% 
% * the last names are made unique, but different authora might have the same last name
% * some items might have many authors; only the first three are included

if ~exist('my_pet_bib','var')
  WD = cdCur; cd ../../; my_pet_bib = 'DEB Library';
else
  WD = pwd;
  if contains(my_pet_bib,'.bib')
    my_pet_bib = my_pet_bib(1:end-4);
  end
end    
my_bib = [fileread([my_pet_bib, '.bib']),'@'];
item = strfind(my_bib,'@'); n = length(item)-1; authKey = cell(n,2); author = strings(10*n,1); k=1;
for i=1:n
  bib = my_bib(item(i):item(i+1)); 
  i_0 = 10+strfind(bib,'author = {'); i_1 = strfind(bib,'},'); i_1 = i_1(i_1>i_0); i_1 = i_1(1)-2;
  authi = bib(i_0:i_1); authi = strsplit(authi,' and '); m = length(authi);
  i_0 = 8+strfind(bib,'year = {'); i_1 = strfind(bib,'},'); i_1 = i_1(i_1>i_0); i_1 = i_1(1)-1;
  year = bib(i_0:i_1); 
  for j = 1:m
    authij = authi{j};
    if contains(authij,',')
      try 
        authij = strsplit(authij,', '); authij_fam = authij{1}; authij_first = authij{2};
      catch
        bib
        keyboard
      end
    else
      try
        authij = strsplit(authij,' '); authij_fam = authij{end}; authij_first = authij{1:end-1};
      catch
        bib
        keyboard
      end
    end
    if length(authij_fam) == 1
      bib
      keyboard; 
    end
    authi{j} = authij; author(k) =  authij_fam; k = k+1; 
    if j == 1; bibkey = authij_fam(1:min(4,length(authij_fam))); end
    if j == 2; bibkey = [bibkey, authij_fam(1:min(4,length(authij_fam)))]; end
  end
  bibkey = [bibkey, year];
  authKey{i,1} = {authi{:}}; auth{i,2} = bibkey;
end
  author = unique(author);

cd(WD);