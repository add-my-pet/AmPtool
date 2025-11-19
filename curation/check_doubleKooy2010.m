%% check_eco
% Checks eco labels 

%%
function nm = check_doubleKooy2010(taxon)
% created 2025/11/07 by Bas Kooijman

%% Syntax
% nm = <../check_doubleKooy2010.m *check_doubleKooy2010*>(taxon)

%% Description
% Checks bouble bib keys Kooy2010. 
%
% Input:
%
% * taxon: character string with name of taxon 
%
% Output
%
% * nm: cell string with entry names that have double Kooy2010

%% Remarks

%% Example of use
% nm = check_doubleKooy2010('Aves'); 

nm = select(taxon); n = length(nm); sel = false(n,1);
for i=1:n
  cdEntr(nm{i}); 
  mydata = fileread(['mydata_',nm{i},'.m']); 
  if length(strfind(mydata, 'bibkey = ''Kooy2010'''))>1
      sel(i) = true;
  end
end

nm=nm(sel);
    
