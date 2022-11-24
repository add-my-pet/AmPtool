%% prt_my_pet_eco
% writes html table with model, COMPLETE, MRE, SMRE  and eco-codes

%%
function prt_my_pet_eco(metaData, metaPar, destinationFolder)
% created 2018/05/05 by Bas Kooijman, modified 2018/06/21, 2018/12/05, 2019/12/28, 2022/04/06

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
% * Intended use is writing a snippet for my_pet_res.html. Make sure that eco-labels are updated using get_eco_types.
% * This latter function reads codes and labels in url AmPeco.html.
% * Make sure that family, order, class, phylum as specified in results_my_pet.mat occur in lists-of-lists.

global eco_types

if isempty(eco_types)
  WD = cdCur; get_eco_types('../../deblab/add_my_pet/'); cd(WD);
end

% unpack metaData and metaPar
species = metaData.species; family = metaData.family; order = metaData.order; class = metaData.class; phylum = metaData.phylum; 
COMPLETE = metaData.COMPLETE;
model = metaPar.model; MRE = metaPar.MRE; SMSE = metaPar.SMSE;
reprod = ''; vars_pull(metaData.ecoCode); % assign [climate, ecozone, habitat, embryo, migrate, food, gender, reprod] 

oid = fopen([destinationFolder, species, '_res.html'], 'a'); % open file for appending

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

modelTxT = ['<a href="https://add-my-pet.github.io/AmPtool/docs/models/', model, '.pdf">',model,'</a>'];

% write (4,4)-table in html
fprintf(oid, '      <table id="ecoCodes">\n');    
fprintf(oid, '        <tr>\n');    
fprintf(oid, '          <td><a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/Typified_models.html">Model</a>: %s</td>\n', modelTxT);    
fprintf(oid, '          <td><a href="../../AmPeco.html#C" target="_blank">climate: </a> %s</td>\n',code_C);
fprintf(oid, '          <td><a href="../../AmPeco.html#M" target="_blank">migrate: </a> %s</td>\n',code_M);
fprintf(oid, '          <td>phylum: <button id="phylum" onclick="OpenTreeAtTaxon(''%s'')">%s</button></td>\n',phylum,phylum);
fprintf(oid, '        </tr>\n');    
fprintf(oid, '        <tr>\n');    
fprintf(oid, '          <td><a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/Completeness.html">COMPLETE</a> = %3.1f </td>\n', COMPLETE);
fprintf(oid, '          <td><a href="../../AmPeco.html#E" target="_blank">ecozone: </a>%s</td>\n',code_E);
fprintf(oid, '          <td><a href="../../AmPeco.html#F" target="_blank">food:    </a>%s</td>\n',code_F);
if strcmp(class, 'Reptilia')
  switch order
    case {'Rhynchocephalia','Squamata'}
fprintf(oid, '          <td>class: <button id="class" onclick="OpenTreeAtTaxon(''Lepidosauria'')">Reptilia</button></td>\n');
    otherwise
fprintf(oid, '          <td>class: <button id="class" onclick="OpenTreeAtTaxon(''Archelosauria'')">Reptilia</button></td>\n');
  end
else
fprintf(oid, '          <td>class: <button id="class" onclick="OpenTreeAtTaxon(''%s'')">%s</button></td>\n',class,class);
end
fprintf(oid, '        </tr>\n');    
fprintf(oid, '        <tr>\n');    
fprintf(oid, '          <td><a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/AmPestimation.html">MRE</a> = %8.3f </td>\n', MRE);   
fprintf(oid, '          <td><a href="../../AmPeco.html#H" target="_blank">habitat: </a>%s</td>\n',code_H);
fprintf(oid, '          <td><a href="../../AmPeco.html#G" target="_blank">gender:  </a>%s</td>\n',code_G);
fprintf(oid, '          <td>order: <button id="order" onclick="OpenTreeAtTaxon(''%s'')">%s</button></td>\n',order,order);
fprintf(oid, '        </tr>\n');    
fprintf(oid, '        <tr>\n');    
fprintf(oid, '          <td><a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/AmPestimation.html">SMSE</a> = %8.3f </td>\n', SMSE);   
fprintf(oid, '          <td><a href="../../AmPeco.html#B" target="_blank">embryo:  </a>%s</td>\n',code_B);
fprintf(oid, '          <td><a href="../../AmPeco.html#R" target="_blank">reprod:  </a>%s</td>\n',code_R);
fprintf(oid, '          <td>family: <button id="family" onclick="OpenTreeAtTaxon(''%s'')">%s</button></td>\n',family,family);
fprintf(oid, '        </tr>\n');    
fprintf(oid, '      </table>\n\n');     

fclose(oid);
