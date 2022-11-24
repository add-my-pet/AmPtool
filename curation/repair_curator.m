%% repair_curator
% loads a mydata-file in the Matlab editor and saves files 

%%
function repair_curator(my_pets, strOld, strNew)
% created 2022/10/06 by Bas Kooijman

%% Syntax
% <repair_curator *repair_curator*>(my_pets)

%% Description
% loads mydata_my_pet-files, replaces strOld by strNew, saves result, and my_pet_date.zip
%
% Input:
%
% * my_pets: cell-string with names of existing entry
% * strOld: char string with text that will be replaced
% * strNew: char string with new text



%% Example
% repair_curator(nm, 'Starrrlight', 'Starrlight')


  WD = cdCur; n_pets = length(my_pets);
  for i=1:n_pets
    fileNm = ['mydata_', my_pets{i}, '.m'];

    cdEntr(my_pets{i});     
    file = fileread(fileNm);
    file = strrep(file, strOld, strNew);
    fid = fopen(fileNm, 'w+'); fprintf(fid, '%s', file); fclose(fid);
        
    % write zip file
    cd('../../entries_zip'); % goto add_my_pet/entries_zip from  add_my_pet/entries/my_pet
    zip_my_pet(my_pets{i}, '../entries'); % zip the entry and save
         
  end        
  cd(WD);

end
