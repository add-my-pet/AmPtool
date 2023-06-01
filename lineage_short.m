%% lineage
% gets list of taxa to which a taxon belongs

%%
function classification_short = lineage_short(taxon)
% created 2023/06/01 by Bas Kooijman

%% Syntax
% classification_short = <../lineage_short.m *lineage_short*> (taxon) 

%% Description
% gets genus, family, order, class, kingdom to which a particular taxon belongs
%
% Input:
%
% * character string with name of taxon
%
% Output:
% 
% * cell string of length 6 with kingdom, phylum, class, order, family, genus

%% Remarks
% The root is Animalia. 
% Function clade is used to detect related taxa, if not in AmP
% If taxon is at level higher than genus, a random AmP genus is selected.
% This also applies to even higher levels.

%% Example of use
% classification  = lineage_short('Gorilla_gorilla')

  taxon = strsplit(taxon, '_'); genus = select(taxon{1});
  if ~isempty(genus) % genus is in AmP
    my_pet = genus{1};
  else
    clade_my_pet = clade(taxon,1); 
    my_pet = clade_my_pet{end};
  end
  path = [set_path2server, 'add_my_pet/entries/', my_pet, '/'];
  file = ['results_', my_pet, '.mat']; 

  if ismac || isunix
    system(['wget -O ', file, ' ', path, file]);
  else
    system(['powershell wget -O ', file, ' ', path, file]);
  end
  load (file, 'metaData'); delete(file);
  genus = strsplit(my_pet, '_'); genus = genus{1};
  classification_short = {'Animalia'; metaData.phylum; metaData.class; metaData.order; metaData.family; genus};  
end

