%% get_id_molluscabase
% gets id of accepted species name in molluscabase

%%
function [id, nm] = get_id_molluscabase(my_pet, open)
% created 2021/08/02 by Bas Kooijman

%% Syntax
% [id, nm] = <../get_id_molluscabase.m *get_id_molluscabase*>(my_pet, open)

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
% The search is actually in WoRMS, which uses the same id's as molluscabase.
% It requires R and package taxize and writes and deletes local files WoRMS.r and WoRMS.txt

%% Example of use
% id = get_id_molluscabase('Stagnicola_palustris')

address = 'https://www.molluscabase.org/aphia.php?p=taxdetails&id=';
if ~exist('open','var')
  open = 0;
end

my_pet = strrep(my_pet,' ','_');

WoRMS.r = [ ... % compose and write and r-script
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
id = fileread('WoRMS.txt'); delete('WoRMS.r','WoRMS.txt'); 
id(end)=[];id(end)=[]; % delete CR and EoL characters

if open
  web([address, id],'-browser');
end

