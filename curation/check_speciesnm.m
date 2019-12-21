%% check_speciesnm
% Checks species name and lineage 

%%
function check_speciesnm(my_pet)
% created 2018/01/23 by Bas Kooijman

%% Syntax
% <../check_speciesnm.m *check_speciesnm*>(my_pet)

%% Description
% Checks species name and lineage: family, order, class, phylum. 
% Checking gives priority to AmP classification, but mentions deviation for CoL classification.
%
% Input:
%
% * my_pet: character sring with name of entry 

%% Remarks
% Checks with Catalog of Life 

%% Example of use
% check_speciesnm('Turdus_merula')

% run the mydata file
[data, auxData, metaData] = feval(['mydata_', my_pet]);
load allStat; entries = fieldnames(allStat); nodes = list_taxa;

if ~strcmp(my_pet, metaData.species)
  fprintf('Name of mydata-file differs from field metaData.species\n');
  if ~isempty(strfind(metaData.species, ' '))
    fprintf('The species name in input should not have spaces.\n');
    fprintf('The standard species name follow the form ''Genus_species''.\n');
  end
elseif ismember(my_pet, entries)
  fprintf([my_pet, ' is already in AmP\n'])
  if ~strcmp(allStat.(my_pet).family, metaData.family)
    fprintf(['Family name should be: ', allStat.(my_pet).family, '\n']);
  end
  if ~strcmp(allStat.(my_pet).order, metaData.order)
    fprintf(['Order name should be: ', allStat.(my_pet).order, '\n']);
  end
  if ~strcmp(allStat.(my_pet).class, metaData.class)
    fprintf(['Class name should be: ', allStat.(my_pet).class, '\n']);
  end
  if ~strcmp(allStat.(my_pet).phylum, metaData.phylum)
    fprintf(['Phylum name should be: ', allStat.(my_pet).phylum, '\n']);
  end
else
  fprintf([my_pet, ' is not yet in AmP\n']);

  % check species/lineage info with CoL
  [lin rank] = lineage_CoL(metaData.species); % print warning if species name is not accepted in Catalog of Life
  if length(lin) == 0
    return
  else
    if ~strcmp(lin{end}, metaData.species)
      fprintf(['Accepted name in CoL: ', lin{end}, '\n'])
    end
    genus = lin{strcmp('Genus', rank)};
    family = lin{strcmp('Family', rank)};
    order = lin{strcmp('Order', rank)};
    class = lin{strcmp('Class', rank)};
    phylum = lin{strcmp('Phylum', rank)};
    if ismember(genus, nodes)
      fprintf(['Genus ', genus, ' is already in AmP\n'])
      species_AmP = select(genus); species_AmP = species_AmP{1};
      if ~strcmp(allStat.(species_AmP).family, metaData.family)
        fprintf(['Family name should be: ', allStat.(species_AmP).family, '\n']);
      end
      if ~strcmp(allStat.(species_AmP).order, metaData.order)
        fprintf(['Order name should be: ', allStat.(species_AmP).order, '\n']);
      end
      if ~strcmp(allStat.(species_AmP).class, metaData.class)
        fprintf(['Class name should be: ', allStat.(my_pet).class, '\n']);
      end
      if ~strcmp(allStat.(species_AmP).phylum, metaData.phylum)
        fprintf(['Phylum name should be: ', allStat.(species_AmP).phylum, '\n']);
      end
    elseif ismember(family, nodes)
      fprintf(['Family ', family, ' is already in AmP\n'])
      species_AmP = select(family); species_AmP = species_AmP{1};
      if ~strcmp(family, metaData.family)
        fprintf(['Family name in CoL: ', family, '\n'])
      end
      if ~strcmp(allStat.(species_AmP).order, metaData.order)
        fprintf(['Order name should be: ', allStat.(species_AmP).order, '\n']);
      end
      if ~strcmp(allStat.(species_AmP).class, metaData.class)
        fprintf(['Class name should be: ', allStat.(my_pet).class, '\n']);
      end
      if ~strcmp(allStat.(species_AmP).phylum, metaData.phylum)
        fprintf(['Phylum name should be: ', allStat.(species_AmP).phylum, '\n']);
      end
    elseif ismember(order, nodes)
      fprintf(['Order ', order, ' is already in AmP\n'])
      species_AmP = select(order); species_AmP = species_AmP{1};
      if ~strcmp(family, metaData.family)
        fprintf(['Family name in CoL: ', family, '\n'])
      end
      if ~strcmp(order, metaData.order)
        fprintf(['Order name in CoL: ', order, '\n'])
      end
      if ~strcmp(allStat.(species_AmP).class, metaData.class)
        fprintf(['Class name should be: ', allStat.(my_pet).class, '\n']);
      end
      if ~strcmp(allStat.(species_AmP).phylum, metaData.phylum)
        fprintf(['Phylum name should be: ', allStat.(species_AmP).phylum, '\n']);
      end
    elseif ismember(class, nodes)
      fprintf(['Class ', class, ' is already in AmP\n'])
      species_AmP = select(class); species_AmP = species_AmP{1};
      if ~strcmp(family, metaData.family)
        fprintf(['Family name in CoL: ', family, '\n'])
      end
      if ~strcmp(order, metaData.order)
        fprintf(['Order name in CoL: ', order, '\n'])
      end
      if ~strcmp(class, metaData.class)
        fprintf(['Class name in CoL: ', class, '\n'])
      end
      if ~strcmp(allStat.(species_AmP).phylum, metaData.phylum)
        fprintf(['Phylum name should be: ', allStat.(species_AmP).phylum, '\n']);
      end
    elseif ismember(phylum, nodes)
      fprintf(['Phylum ', phylum, ' is already in AmP\n'])
      species_AmP = select(phylum); species_AmP = species_AmP{1};
      if ~strcmp(family, metaData.family)
        fprintf(['Family name in CoL: ', family, '\n'])
      end
      if ~strcmp(order, metaData.order)
        fprintf(['Order name in CoL: ', order, '\n'])
      end
      if ~strcmp(class, metaData.class)
        fprintf(['Class name in CoL: ', class, '\n'])
      end
      if ~strcmp(allStat.(species_AmP).phylum, metaData.phylum)
        fprintf(['Phylum name in CoL: ', phylum, '\n'])
      end
    end
  end
end



