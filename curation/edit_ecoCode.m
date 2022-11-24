%% edit_ecoCode
% changes one or more ecoCodes in mydata_my_pet.m, results_my_pet.mat, my_pet_yyyymmdd.zip and my_pet_res.html

%%
function edit_ecoCode(my_pet, code)
% created 2019/12/26 Bas Kooijman

%% Syntax
% <../edit_ecoCode.m *edit_ecoCode*> (my_pet, code)

%% Description
% changes one or more ecoCodes in mydata_my_pet.m, results_my_pet.mat, my_pet.zip and my_pet_toolbar.html
%
% Input:
%
% * my_pet: character string with name of entry
% * code: (n,2)-cell array with fields and values, as in metaData.ecoCode.field of mydata

%% Remarks
% * Fields and codes must occur in <www.bio.vu.nl/thb/deb/deblab/add_my_pet/AmPeco.html *AmPeco*> 
% * Run run_collection_intro to update allStat.mat and AmPdata.
% * Sync files with server after running this function 

%% Example of use
% edit_ecoCode('Abramis_brama', {'climate', {'Cfb', 'Dfb'}})

  eol = char([13 10]); % end-of-line in .m files
  n = size(code, 1);

  WD = pwd; % store current path
  cd(['../../add_my_pet/entries/', my_pet]); % goto dir entries

  % write mydata_my_pet.m
  mydata = fileread(['mydata_', my_pet, '.m']);
  for i = 1:n
    ecoCode = code{i,2}; ni = length(ecoCode); txt = '{';
    for j = 1:ni
      txt = [txt, '''', ecoCode{j},''','];
    end
    txt(end) = []; txt = [txt, '};'];
    in0 = strfind(mydata, ['metaData.ecoCode.', code{i,1}]);
    in = strfind(mydata(in0:end), ' = '); in0 = in0 + in(1);
    in1 = in0 + strfind(mydata(in0:end), eol); in1 = in1(1)-1;
    mydata = [mydata(1:in0+1), txt, mydata(in1:end)];
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
  
  % write my_pet_res.html
  % get head, table_old and tail
  cd(['../../entries_web/', my_pet]);
  % get head, tail and old table from my_pet_res.html
  my_pet_res = fileread([my_pet, '_res.html']);
  table_start = strfind(my_pet_res,'<table>'); head = my_pet_res(1:table_start - 7); % notice removal of leading spaces to get outline correct
  table_end = 8 + strfind(my_pet_res,'</table>'); tail = my_pet_res(table_end:end);
  table_old = my_pet_res(table_start:table_end); % text with old table only
  % 
  % get model, COMPLETE, MRE, and SMSE from old table; notice that pieces of text are deleted after reading
  % model 
  index = 10 + strfind(table_old,'Model: </a>');     table_old(1:index) = []; model = table_old(1: strfind(table_old, '</td>') - 1);
  % COMPLETE
  index = 14 + strfind(table_old,'COMPLETE</a> = '); table_old(1:index) = []; COMPLETE = str2num(table_old(1: strfind(table_old, '</td>') - 1));
  % MRE
  index = 10 + strfind(table_old,'MRE</a> = ');      table_old(1:index) = []; MRE = str2num(table_old(1: strfind(table_old, '</td>') - 1));
  % SMSE
  index = 11 + strfind(table_old,'SMSE</a> = ');     table_old(1:index) = []; SMSE = str2num(table_old(1: strfind(table_old, '</td>') - 1));
  %
  % write head, table_new and tail
  fileName = [my_pet, '_res.html'];   
  % head
  oid = fopen(fileName, 'w+');   % open file for reading and writing, delete existing content
  fprintf(oid, '%s', head);
  fclose(oid);
  % new table
  prt_my_pet_eco(metaData, metaPar, ''); % write new table
  % tail
  oid = fopen(fileName, 'a');    % open file for appending
  fprintf(oid, '%s', tail);
  fclose(oid);

  cd(WD)

  
