%% edit_links
% changes one or more links in mydata_my_pet.m results_my_pet.mat  my_pet.zip and my_pet_toolbar.html

%%
function edit_links(my_pet, id)
% created 2019/12/25 Bas Kooijman

%% Syntax
% <../edit_links.m *edit_links*> (my_pet, id)

%% Description
% changes one or more links in mydata_my_pet.m, results_my_pet.mat,  my_pet.zip and my_pet_toolbar.html
%
% Input:
%
% * my_pet: character string with name of entry
% * id: (n,2)-cell array with id's and values, as in metaData.links of mydata

%% Remarks
% if elements in id(:,2) are empty, the corresponding link is removed
% if elements in id(:,1) are not present in metaData.links of mydata_my_pet.m, they are added to 
% sync files with server after running this function 

%% Example of use
% edit_links('Daphnia_magna', {'id_CoL', '7dfdadd589496528f28cbaa331d6ccf3'; 'id_EoL', ''}) 

  eol = char([13 10]); % end-of-line in .m files
  nm = {
   'id_CoL', 'Cat of Life';  
   'id_EoL', 'Ency of Life';
   'id_Wiki', 'Wikipedia';
   'id_ADW', 'ADW';
   'id_Taxo', 'Taxonomicon';
   'id_WoRMS', 'WoRMS';
   'id_molluscabase', 'MolluscaBase';
   'id_fishbase', 'fishbase';
   'id_amphweb', 'Amphibiaweb';
   'id_ReptileDB', 'ReptileDB';
   'id_avibase', 'Avibase';
   'id_birdlife', 'Birdlife';
   'id_MSW3', 'Mammal Spec World';
   'id_AnAge', 'AnAge'};

  [~, id_current] = get_links(my_pet);
  n = size(id,1); 
  id_current = [fieldnames(id_current), struct2cell(id_current)]; % convert structure to (n,2) cell array
  WD = pwd; % store current path
  cd(['../../add_my_pet/entries/', my_pet]); % goto dir entries
  mydata = fileread(['mydata_', my_pet, '.m']);

  % write mydata_my_pet.m
  for i = 1:n
    if ismember(id(i,1), id_current(:,1))
      if isempty(id(i,2)) || length(id{i,2}) == 0 % remove current id
        in0 = strfind(mydata, id(i,1)) - 15; % start of id, given metaData.links. is in front
        in1 = 2 + in0 + strfind(mydata(in0:end), eol);
        mydata = [mydata(1:in0-1), mydata(in1-1:end)];
        id_current(strcmp(id(i,2), id_current(:,1)),:) = []; % remove from id_current, to properly locate end of links for adding
      else % change current id
        in0 = strfind(mydata, id(i,1));% start of id
        in1 = 2 + in0 + strfind(mydata(in0:end), eol);
        mydata = [mydata(1:in0-1), id{i,1}, ' = ''', id{i,2}, '''; % ', nm{strcmp(id(i,1), nm(:,1)),2}, eol, mydata(in1-1:end)];
      end
    else % add to currend id if not empty
      if ~isempty(id(i,2)) && ~length(id{i,2}) == 0
        in0 = strfind(mydata, id_current(end,1)); % start of last id
        in1 = in0 + strfind(mydata(in0:end), eol); % end of links
        mydata = [mydata(1:in1), 'metaData.links.', id{i,1}, ' = ''', id{i,2}, '''; % ', nm{strcmp(id(i,1), nm(:,1)),2}, eol, mydata(in1:end)];
      end
    end
  end
  oid = fopen(['mydata_', my_pet, '.m'], 'w+'); 
  fprintf(oid, '%s', mydata);
  fclose(oid);
  
  % write results_my_pet.mat
  load(['results_', my_pet]);
  eval(['[~, ~, metaData, ~, ~] = mydata_', my_pet,';']);
  save(['results_', my_pet, '.mat'], 'par', 'txtPar', 'metaPar', 'metaData');
  
  % write my_pet_yyyymmdd.zip
  cd('../../entries_zip');
  nms = cellstr(ls);
  nm = nms(~cellfun(@isempty,strfind(nms, my_pet)));
  unzip(nm{1}); % creates folder that will be removed
  cd(my_pet)
  oid = fopen(['mydata_', my_pet, '.m'], 'w+'); 
  fprintf(oid, '%s', mydata);
  fclose(oid);
  cd ../; % go to entries_zip
  zip(nm{1}, my_pet); 
  rmdir(my_pet,'s');
  
  % write my_pet_toolbar.html
  cd(WD);
  prt_my_pet_toolbar(my_pet, ['../../add_my_pet/entries_web/', my_pet, '/']) 

  
