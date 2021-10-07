%% get_id_molluscabase
% gets id of species name in molluscabase

%%
function id = get_id_molluscabase(my_pet, open)
% created 2021/08/02 by Bas Kooijman

%% Syntax
% id = <../get_id_molluscabase.m *get_id_molluscabase*>(my_pet, open)

%% Description
% Gets identifier for the accepted species name in molluscabase
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id accepted name in molluscabase

%% Remarks
% Outputs empty strings if identification was not successful.
% The search is actually first in CoL, then in WoRMS, which uses the same id's as molluscabase.
% Might require R and package taxize and then writes and deletes local files WoRMS.r and WoRMS.txt

%% Example of use
% id = get_id_molluscabase('Stagnicola_palustris',1)

address = 'https://www.molluscabase.org/aphia.php?p=taxdetails&id=';
if ~exist('open','var')
  open = 0;
end

my_pet = strrep(my_pet,' ','_');

% first try via webserver of CoL, then via R-code in WoRMS
url = urlread(['http://webservice.catalogueoflife.org/col/webservice?name=', strrep(my_pet, '_', '+')]);
i_0 = strfind(url,'molluscabase.org/aphia.php?p=taxdetails&amp;id=');
if ~isempty(i_0)
  i_0 = i_0 + 47; i_1 = strfind(url(i_0:end),'</online') - 2 + i_0;
  id = url(i_0:i_1(1));
else
  WoRMS.r = [ ... % compose and write r-script
    'library(taxize)', char([13 10]), ...
    'Out <- file("WoRMS.txt")', char([13 10]), ...
    ['writeLines(get_wormsid(''', my_pet, ''',marine_only=FALSE,rows=1), Out)'], char([13 10]), ...
    'close(Out)'
  ];
  fid = fopen('WoRMS.r', 'w+'); fprintf(fid, WoRMS.r); fclose(fid);

  % run r-script
  if ismac || isunix
    system('Rscript WoRMS.r');
  else
    system('powershell Rscript WoRMS.r');
  end

  % read result and delete r-script and output text
  if exist('WoRMS.txt','file')
    id = fileread('WoRMS.txt'); delete('WoRMS.r','WoRMS.txt'); 
    id(end)=''; id(end)=''; % delete CR and EoL characters
  else
    id = ''; delete('WoRMS.r'); 
  end
 end

if open
  web([address, id],'-browser');
end

