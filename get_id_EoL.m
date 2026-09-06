%% get_id_EoL
% gets id in Encyclopedia of Life

%%
function id = get_id_EoL(my_pet, open)
% created 2021/08/01 by Bas Kooijman

%% Syntax
% id = <../get_id_EoL.m *get_id_EoL*>(my_pet, open)

%% Description
% Gets identifier for Encyclopedia of Life
%
% Input:
%
% * my_pet: character string with name of a species
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id accepted name in EoL

%% Remarks
% Outputs empty string if identification was not successful.

%% Example of use
% id = get_id_EoL('Squalus_acanthias',1)

address = 'https://eol.org/pages/';
if ~exist('open','var')
  open = 0;
end

if ~isempty(strfind(my_pet, '_'));
  nm = strsplit(my_pet,'_'); % genus, species
elseif ~isempty(strfind(my_pet, ' '));
  nm = strsplit(my_pet,' '); % genus, species
else
  nm = my_pet;
end
try
  if iscell(nm)
    url = urlread(['https://eol.org/api/search/1.0.json?q=',nm{1},'%2B',nm{2}], 'Timeout', 10);
    title = ['"', nm{1}, ' ', nm{2}, '"'];
  else
    url = urlread(['https://eol.org/api/search/1.0.json?q=',nm], 'Timeout', 10);
    title = ['"', nm, '"'];
  end
catch
  fprintf('warning from get_id_EoL: webread failed\n');
  id = ''; return
end
i_1 = strfind(url,['"title":',title]); 
if isempty(i_1)
  my_pet = get_synonym(get_id_CoL(my_pet)); 
  if isempty(my_pet)
    id = ''; return
  end
  nm = strsplit(my_pet,'_');
  try
    url = urlread(['https://eol.org/api/search/1.0.json?q=',nm{1},'%2B',nm{2}], 'Timeout', 10);
  catch
    fprintf('warning from get_id_EoL: webread failed\n');
    id = ''; return
  end
  title = ['"', nm{1}, ' ', nm{2}, '"'];
  i_1 = strfind(url,['"title":',title]); 
  if isempty(i_1)
    id = ''; return
  end
end
i_0 = 5 + strfind(url(1:i_1),'"id":'); i_1 = i_0(end)+strfind(url(i_0(end):end),',') - 2;
id = url(i_0(end):i_1(1));

% check that the page exists, but keep the id if the check cannot be completed
% (a network hiccup here must not discard an id already found by the search)
if ~isempty(id)
    try
      urlread(['https://eol.org/pages/',id], 'Timeout', 10);
    catch
      fprintf('warning from get_id_EoL: could not verify page, keeping id\n');
    end
end

if open && ~isempty(id)
  web([address, id],'-browser');
end

