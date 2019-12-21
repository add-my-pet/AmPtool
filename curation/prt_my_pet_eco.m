%% prt_my_pet_eco
% writes html table with model, COMPLETE, MRE, SMRE  and eco-codes

%%
function prt_my_pet_eco(metaData, metaPar, destinationFolder)
% created 2018/05/05 by Bas Kooijman, modified 2018/06/21, 2018/12/05

%% Syntax
% <prt_my_pet_eco *prt_my_pet_eco*>(metaData, metaPar, destinationFolder)

%% Description
% Writes html table with model, MRE, SMRE, COMPLETE, eco-codes, classification 
%
% Input:
%
% * metaData: structure as specified by results_my_pet.mat in directory entries
% * metaPar: structure as specified by results_my_pet.mat in directory entries
% * destinationFolder: specification of destination folder 

%% Remarks
% Intended use is writing a snippet for my_pet_res.html. Make sure that eco-labels are updated using get_eco_types.
% This latter function reads codes and labels in url AmPeco.html.
% Make sure that family, oder, class, phylum as specied in results_my_pet.mat occur in lists-of-lists.
% This function is also called by update_eco.

global eco_types

if length(eco_types) == 0 
  get_eco_types('../../add_my_pet_web/');
end

% unpack metaData and metaPar
species = metaData.species; family = metaData.family; order = metaData.order; class = metaData.class; phylum = metaData.phylum; 
COMPLETE = metaData.COMPLETE;
model = metaPar.model; MRE = metaPar.MRE; SMSE = metaPar.SMSE;

oid = fopen([destinationFolder, species, '_res.html'], 'a'); % open file for appending

[climate, ecozone, habitat, embryo, migrate, food, gender, reprod] = get_eco(species);

% write eco-labels in hover-text of eco-codes in html
% climate
n_C = length(climate); code_C = '';
for i = 1:n_C
  code_C = [code_C, '<a href="" title="', eco_types.climate.(climate{i}), '">', climate{i}, '</a>, '];
end
code_C(end - (0:1)) = [];
% ecozone
n_E = length(ecozone); code_E = '';
for i = 1:n_E
  code_E = [code_E, '<a href="" title="', eco_types.ecozone.(ecozone{i}), '">', ecozone{i}, '</a>, '];
end
code_E(end - (0:1)) = []; 
% habitat
n_H = length(habitat); code_H = '';
for i = 1:n_H
  code = habitat{i}; label = [eco_types.habitat.(code(3:end)), ' for stage ', code(1:2)];
  code_H = [code_H, '<a href="" title="', label, '">', code, '</a>, '];
end
code_H(end - (0:1)) = [];
% embryo environment
n_B = length(embryo); code_B = '';
for i = 1:n_B
  code_B = [code_B, '<a href="" title="', eco_types.embryo.(embryo{i}), '">', embryo{i}, '</a>, '];
end
code_B(end - (0:1)) = []; 
% migrate/torpor
n_M = length(migrate); code_M = '';
for i = 1:n_M
  code_M = [code_M, '<a href="" title="', eco_types.migrate.(migrate{i}), '">', migrate{i}, '</a>, '];
end
if n_M > 0
  code_M(end - (0:1)) = [];
end
% food
n_F = length(food); code_F = '';
for i = 1:n_F
  code = food{i}; label = [eco_types.food.(code(3:end)), ' for stage ', code(1:2)];
  code_F = [code_F, '<a href="" title="', label, '">', code, '</a>, '];
end
code_F(end - (0:1)) = [];
% gender
n_G = length(gender); code_G = '';
for i = 1:n_G
  code_G = [code_G, '<a href="" title="', eco_types.gender.(gender{i}), '">', gender{i}, '</a>, '];
end
code_G(end - (0:1)) = []; 
% reprod
n_R = length(reprod); code_R = '';
for i = 1:n_R
  code_R = [code_R, '<a href="" title="', eco_types.reprod.(reprod{i}), '">', reprod{i}, '</a>, '];
end
code_R(end - (0:1)) = []; 

% write (4,4)-table in html
fprintf(oid, '      <table>\n');    
fprintf(oid, '        <tr>\n');    
fprintf(oid,['          <td width=250><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Typified_models">Model: </a>', model,'</td>\n']);    
fprintf(oid,['          <td><a href="../../AmPeco.html#C" target="_blank">climate: </a></td> <td width=250>', code_C, '</td>\n']);
fprintf(oid,['          <td><a href="../../AmPeco.html#M" target="_blank">migrate: </a></td> <td width=250>', code_M, '</td>\n']);
fprintf(oid,['          <td>phylum: <button id="phylum" onclick="OpenTreeAtTaxon(''', phylum, ''')">', phylum, '</button></td>\n']);
fprintf(oid, '        </tr>\n');    
fprintf(oid, '        <tr>\n');    
fprintf(oid,['          <td><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Completeness" >COMPLETE</a>',' = %3.1f </td>\n'], COMPLETE);
fprintf(oid,['          <td><a href="../../AmPeco.html#E" target="_blank">ecozone: </a></td> <td>', code_E, '</td>\n']);
fprintf(oid,['          <td><a href="../../AmPeco.html#F" target="_blank">food:    </a></td> <td>', code_F, '</td>\n']);
if strcmp(class, 'Reptilia')
  switch order
    case {'Rhynchocephalia','Squamata'}
fprintf(oid, '          <td>class: <button id="class" onclick="OpenTreeAtTaxon(''Lepidosauria'')">Reptilia</button></td>\n');
    otherwise
fprintf(oid, '          <td>class: <button id="class" onclick="OpenTreeAtTaxon(''Archelosauria'')">Reptilia</button></td>\n');
  end
else
fprintf(oid,['          <td>class: <button id="class" onclick="OpenTreeAtTaxon(''', class, ''')">', class, '</button></td>\n']);
end
fprintf(oid, '        </tr>\n');    
fprintf(oid, '        <tr>\n');    
fprintf(oid,['          <td><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Mean_relative_error" >MRE</a>',' = %8.3f </td>\n'], MRE);   
fprintf(oid,['          <td><a href="../../AmPeco.html#H" target="_blank">habitat: </a></td> <td>', code_H, '</td>\n']);
fprintf(oid,['          <td><a href="../../AmPeco.html#G" target="_blank">gender:  </a></td> <td>', code_G, '</td>\n']);
fprintf(oid,['          <td>order: <button id="order" onclick="OpenTreeAtTaxon(''', order, ''')">', order, '</button></td>\n']);
fprintf(oid, '        </tr>\n');    
fprintf(oid, '        <tr>\n');    
fprintf(oid,['          <td><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Symmetric_mean_squared_error" >SMSE</a>',' = %8.3f </td>\n'], SMSE);   
fprintf(oid,['          <td><a href="../../AmPeco.html#B" target="_blank">embryo:  </a></td> <td>', code_B, '</td>\n']);
fprintf(oid,['          <td><a href="../../AmPeco.html#R" target="_blank">reprod:  </a></td> <td>', code_R, '</td>\n']);
fprintf(oid,['          <td>family: <button id="family" onclick="OpenTreeAtTaxon(''', family, ''')">', family, '</button></td>\n']);
fprintf(oid, '        </tr>\n');    
fprintf(oid, '      </table>\n\n');     

fclose(oid);
