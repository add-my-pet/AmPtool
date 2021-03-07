%% list_taxa
% gets ordered list of all taxa

%%
function ol = list_taxa (taxon, level)
% created 2016/02/25 by Bas Kooijman, modified 2018/06/14

%% Syntax
% ol = <../list_taxa.m *list_taxa*> (taxon, level) 

%% Description
% gets an alphabetically ordered list of all taxa that belong to taxon in the add_my_pet collection 
%
% Input:
% 
% * taxon: optional characterstring with name of taxon (default 'Animalia')
% * level: optional integer for the level (default: 0)
%
%    0 all taxa, including leaves
%    1 all taxa, excluding leaves
%    2 leaves (names with "_")
%    3 genera only (names before first "_")
%    4 families only (names ending on "idae")
%    5 orders only (match with allStat.mat)
%    6 classes only (match with allStat.mat, but does not work for Reptilia)
%    7 phyla only (match with allStat.mat)
%
% Output:
% 
% * cell string with alphabetically ordered list

%% Remarks
% The classification follows that of Wikipedia

%% Example of use
% * ol = list_taxa
% * ol = list_taxa('Deuterostomata',4)
% * ol = list_taxa({},7)
% * ol = list_taxa('Arthropoda')

  if ~exist('taxon', 'var') || isempty(taxon)
    taxon = 'Animalia';
  end
  
  if ~exist('level', 'var')
    level = 0;
  end

  WD = pwd;                  % store current path
  taxa = which('list_taxa.pl'); % locate DEBtool_M/taxa/
  taxa = taxa(1:end - 12);   % path to DEBtool_M/taxa/
  cd(taxa)                   % goto taxa

  try
    ol = perl('list_taxa.pl', taxon); ol(end) = [];
    ol = eval(['{''', strrep(ol, char(10), ''';''') , '''}']);
    switch level
      case 0
        % all nodes and leaves
        
      case 1 % exclude leaves
        ol = ol(cellfun(@isempty, strfind(ol,'_'))); % eliminate leaves
        
      case 2 % leaves only
        ol = ol(~cellfun(@isempty, strfind(ol,'_'))); % leaves only
        
      case 3 % genus only
        ol = ol(~cellfun(@isempty, strfind(ol,'_'))); % leaves only
        n = length(ol);
        for i = 1:n
          genus = strsplit(ol{i},'_'); genus = genus{1}; ol{i} = genus;
        end
        ol = unique(ol);
        
      case 4 % family only
         ol = ol(~cellfun(@isempty, strfind(ol,'idae'))); 
         
      case 5 % order only
         ol = ol(ismember(ol, unique(read_allStat('order'))));

      case 6 % class only; does not work for Reptilia
         ol = ol(ismember(ol, unique(read_allStat('class'))));

      case 7 % phylum only
         ol = ol(ismember(ol, unique(read_allStat('phylum'))));

    end
    
  catch
    disp('taxon not recognized')
  end
  
  cd(WD)                    % goto original path

end

