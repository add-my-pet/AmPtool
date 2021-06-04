%% get_zip
% gets zip names from archive

%%
function zip = get_zip(my_pet)
% created 2017/10/25 by Bas Kooijman, modified 2019/12/25

%% Syntax
% zip = <get_zip *get_zip*>(my_pet)

%% Description
% Gets acceptance dates (= version numbers) of zips in ../entries_archive
%
% Input:
%
% * my_pet: character string with name of an entry
%
% Output:
%
% * zip: (n,2)-cell array  with zip-names and acceptance dates of type yyyymmdd

%% Example of use
% zip = get_zip('Bufo_bufo')

zip = cellstr(ls('../../deblab/add_my_pet/entries_archive/')); % get ls of all files in subdir
% append _2 to name of mypet to avoid selection of subspecies/races
zip = zip(~cellfun('isempty',strfind(zip, [my_pet, '_2']))); % all my_pet_yyyymmdd.zip 's
date = zip; n = length(zip); ntxt = 1 + length(my_pet);
for i = 1:n
  txt = zip{i}; 
  txt(1:ntxt) = ''; txt(end - (0:3)) = ''; % remove "my_pet_" and ".zip"
  date(i) = {txt};
end
zip = [zip, date];

