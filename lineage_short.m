%% lineage_short
% gets list of taxa to which a taxon belongs

%%
function [classification_short, info, my_pet] = lineage_short(taxon, curator)
% created 2023/06/01 by Bas Kooijman

%% Syntax
% [classification_short, info, my_pet] = <../lineage_short.m *lineage_short*> (taxon) 

%% Description
% gets genus, family, order, class, kingdom to which a particular taxon belongs
%
% Input:
%
% * character string with name of taxon
% * optional boolean, false (take source from internet, default), true
% (take sorce locally in add_my_pet/entries
%
% Output:
% 
% * cell string of length 6 with kingdom, phylum, class, order, family, genus
% * info: output flag
%
%   - 0, taxon not recognized
%   - 1, species is in AmP
%   - 2, genus is in AmP
%   - 3, genus is not in AmP, but species or genus is in CoL
% * my_pet: string with AmP entry of which the lineaage is copied

%% Remarks
% The root is Animalia. 
% Function clade is used to detect related taxa,  also if not in AmP
% If taxon is at level higher than genus, a random AmP genus is selected.
% This also applies to even higher levels.

%% Example of use
% lin  = lineage_short('Gorilla_gorilla')

  if ~exist('curator','var') || isempty(curator)
    curator = false;
  end

  genus = strsplit(taxon, '_'); genus = select(genus{1});
  if contains(taxon, '_') && ~isempty(select(taxon))
    info = 1;
    my_pet = genus{1};
  elseif ~isempty(genus) % genus is in AmP
    info = 2;
    my_pet = genus{1};
  else
    [id_CoL, name_status, accepted_name] = get_id_CoL(taxon);
    if contains(taxon, '_') && ~isempty(id_CoL); info = 1; end
    if isempty(genus); info = 3; end
    clade_my_pet = clade(taxon,1); 
    if isempty(clade_my_pet)
      info = 0; classification_short = []; my_pet = []; return
    end
    my_pet = clade_my_pet{end};
  end
  path = [set_path2server, 'add_my_pet/entries/', my_pet, '/'];
  file = ['results_', my_pet, '.mat']; 

  if curator
    WD = cdEntr(my_pet);
    load (file, 'metaData');
    cd(WD);
  else
    if ismac || isunix
      system(['wget -O ', file, ' ', path, file]);
    else
      system(['powershell wget -O ', file, ' ', path, file]);
    end
    load (file, 'metaData'); delete(file);
  end
  genus = strsplit(my_pet, '_'); genus = genus{1};
  classification_short = {'Animalia'; metaData.phylum; metaData.class; metaData.order; metaData.family; genus};  
end

