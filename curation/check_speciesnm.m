%% check_speciesnm
% Checks species name and lineage 

%%
function flag = check_speciesnm(my_pet)
% created 2018/01/23 by Bas Kooijman, modified 2021/04/10

%% Syntax
% <../check_speciesnm.m *check_speciesnm*>(my_pet)

%% Description
% Checks common and species name and lineage: family, order, class, phylum by using metaData as assigned by mydata_my_pet.m.
% If this file is not present locally, it will be copied form the AmP site.
% Checking gives priority to AmP classification, but mentions deviation for CoL classification.
%
% Input:
%
% * my_pet: character sring with name of entry 
%
% Output
%
% * flag: 
%
%   0 absent in AmP and in CoL or lineage not complete 
%   1 present in AmP and family, order, class, phylum are all correct
%   2 present in AmP, but family, order, class, phylum are not all correct
%   3 absent in AmP but accepted in CoL and family, order, class, phylum are all correct
%   4 absent in AmP but accepted in CoL, but family, order, class, phylum are not all correct
%   5 absent in AmP but not accepeted in CoL

%% Remarks
% Checks with Catalog of Life 

%% Example of use
% check_speciesnm('Turdus_merula')

% get metaData
fnm = ['mydata_', my_pet]; 
if exist([fnm, '.m'],'file')
  [~, ~, metaData] = feval(fnm); % run the mydata file
else
  path = [set_path2server, 'add_my_pet/entries/', my_pet, '/'];
  if ismac || isunix
    info = system(['wget -O mydata_', my_pet, '.m ', path, 'mydata_', my_pet, '.m']);
  else
    info = system(['powershell wget -O mydata_', my_pet, '.m ', path, 'mydata_', my_pet, '.m']);
  end
  if info == 0
    [~, ~, metaData] = feval(fnm); % run the mydata file
    delete([fnm,'.m']);
  else
    flag = 0; return
  end
end

% check if lineage is complete
if ~isfield(metaData,'phylum') || isempty(metaData.phylum)
  fprintf('invalid phylum specification\n');
  flag = 0; return
end
if ~isfield(metaData,'class') || isempty(metaData.class)
  fprintf('invalid class specification\n'); 
  flag = 0; return
end
if ~isfield(metaData,'order') || isempty(metaData.order)
  fprintf('invalid order specification\n'); 
  flag = 0; return
end
if ~isfield(metaData,'family') || isempty(metaData.family)
  fprintf('invalid family specification\n'); 
  flag = 0; return
end

load allStat; entries = fieldnames(allStat); nodes = list_taxa;

if ~strcmp(my_pet, metaData.species)
  fprintf('Name of mydata-file differs from field metaData.species\n');
  if ~isempty(strfind(metaData.species, ' '))
    fprintf('The species name in input should not have spaces.\n');
    fprintf('The standard species name follows the form ''Genus_species''.\n');
  end
  flag = 0;
elseif ismember(my_pet, entries)
  fprintf([my_pet, ' is already in AmP\n'])
  flag = 1;
  if ~strcmp(allStat.(my_pet).family, metaData.family)
    fprintf(['Family name should be: ', allStat.(my_pet).family, '\n']);
    flag = 2;
  end
  if ~strcmp(allStat.(my_pet).order, metaData.order)
    fprintf(['Order name should be: ', allStat.(my_pet).order, '\n']);
    flag = 2;
  end
  if ~strcmp(allStat.(my_pet).class, metaData.class)
    fprintf(['Class name should be: ', allStat.(my_pet).class, '\n']);
    flag = 2;
  end
  if ~strcmp(allStat.(my_pet).phylum, metaData.phylum)
    fprintf(['Phylum name should be: ', allStat.(my_pet).phylum, '\n']);
    flag = 2;
  end
else
  fprintf([my_pet, ' is not yet in AmP\n']);

  % check species/lineage info with CoL
  [lin, rank, id, status] = lineage_CoL(metaData.species); % print warning if species name is not accepted in Catalog of Life
  if length(lin) == 0
    flag = 0;
    return
  else
    % check common name
    species_en = get_common_CoL(id);
    if ~isfield(metaData,'species_en') || isempty(metaData.species_en)
      fprintf('No common name specified\n');
      fprintf('Common names in CoL:\n');
      species_en
      flag = 0; 
    else
      if ~ismember(metaData.species_en,species_en)
        fprintf('Common name does not match those in CoL, which is/are:\n');
        species_en
      end
    end
    
    % status of name
    if ~strcmp('accepted name', status)
      fprintf('name not accepted in CoL\n')
      flag = 5;
      return
    end
    
    % check lineage in CoL, but give priority of that in AmP
    flag = 3;
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
        flag = 4;
      end
      if ~strcmp(allStat.(species_AmP).order, metaData.order)
        fprintf(['Order name should be: ', allStat.(species_AmP).order, '\n']);
        flag = 4;
      end
      if ~strcmp(allStat.(species_AmP).class, metaData.class)
        fprintf(['Class name should be: ', allStat.(my_pet).class, '\n']);
      end
      if ~strcmp(allStat.(species_AmP).phylum, metaData.phylum)
        fprintf(['Phylum name should be: ', allStat.(species_AmP).phylum, '\n']);
        flag = 4;
      end
    elseif ismember(family, nodes)
      fprintf(['Family ', family, ' is already in AmP\n'])
      species_AmP = select(family); species_AmP = species_AmP{1};
      if ~strcmp(family, metaData.family)
        fprintf(['Family name in CoL: ', family, '\n'])
      end
      if ~strcmp(allStat.(species_AmP).order, metaData.order)
        fprintf(['Order name should be: ', allStat.(species_AmP).order, '\n']);
        flag = 4;
      end
      if ~strcmp(allStat.(species_AmP).class, metaData.class)
        fprintf(['Class name should be: ', allStat.(my_pet).class, '\n']);
        flag = 4;
      end
      if ~strcmp(allStat.(species_AmP).phylum, metaData.phylum)
        fprintf(['Phylum name should be: ', allStat.(species_AmP).phylum, '\n']);
        flag = 4;
      end
    elseif ismember(order, nodes)
      fprintf(['Order ', order, ' is already in AmP\n'])
      species_AmP = select(order); species_AmP = species_AmP{1};
      if ~strcmp(family, metaData.family)
        fprintf(['Family name in CoL: ', family, '\n'])
        flag = 4;
      end
      if ~strcmp(order, metaData.order)
        fprintf(['Order name in CoL: ', order, '\n'])
      end
      if ~strcmp(allStat.(species_AmP).class, metaData.class)
        fprintf(['Class name should be: ', allStat.(my_pet).class, '\n']);
        flag = 4;
     end
      if ~strcmp(allStat.(species_AmP).phylum, metaData.phylum)
        fprintf(['Phylum name should be: ', allStat.(species_AmP).phylum, '\n']);
        flag = 4;
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
        flag = 4;
      end
    elseif ismember(phylum, nodes)
      fprintf(['Phylum ', phylum, ' is already in AmP\n'])
      species_AmP = select(phylum); species_AmP = species_AmP{1};
      if ~strcmp(family, metaData.family)
        fprintf(['Family name in CoL: ', family, '\n'])
        flag = 4;
      end
      if ~strcmp(order, metaData.order)
        fprintf(['Order name in CoL: ', order, '\n'])
        flag = 4;
      end
      if ~strcmp(class, metaData.class)
        fprintf(['Class name in CoL: ', class, '\n'])
        flag = 4;
      end
      if ~strcmp(allStat.(species_AmP).phylum, metaData.phylum)
        fprintf(['Phylum name in CoL: ', phylum, '\n'])
        flag = 4;
      end
    end
  end
end



