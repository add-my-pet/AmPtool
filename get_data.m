%% get_data
% gets data from mydata_my_pet.m

%%
function [data, auxData, metaData, txtData, weights] = get_data(my_pet)
% created 2019/12/26 by Bas Kooijman

%% Syntax
% [data, auxData, metaData, txtData, weights]  = <get_data *get_data*>(my_pet)

%% Description
% Gets all data set by mydata for any entry
%
% Input:
%
% * my_pet: character string with name of entry
%
% Output:
%
% * data:     cell array with empirical data
% * auxdata:  cell array with auxiliary data
% * metaData: cell array with meta-data
% * txtData:  cell array with text labels for data
% * weights:  cell array with weight coefficient used for parameter estimation

%% Remarks
% This function first tries to find mydata_my_pet in local directory entries (typically only for curators); 
% in failure, it downloads it from the web via powershell function wget.
% Make sure the your current directory does not have mydata_my_pet.m, since this file will be overwritten and deleted.

 get_mydata_my_pet(my_pet); % write mydata_my_pet
 [data, auxData, metaData, txtData, weights] = mydata_my_pet;
 delete('mydata_my_pet.m') 
       
end

function get_mydata_my_pet(my_pet)
  fnm= 'mydata_my_pet.m';
  try % locally present in dir entries (mostly for curators)
    copyfile(['../../add_my_pet/entries/', my_pet, '/mydata_', my_pet, '.m'], fnm)
  catch % get results_my_pet.mat from web
    path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries/';
    if ismac || isunix
      eval(['system(wget ', path, my_pet, '/mydata_', my_pet, ' -O ', fnm, ')'])
    else
      eval(['!powershell wget ', path, my_pet, '/mydata_', my_pet, ' -O ', fnm])
    end
  end
end
