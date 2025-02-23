%% get_del_M
% gets parameter del_M from mydata_my_pet.m

%%
function [del_M, pets] = get_del_M(pets)
% created 2025/02/23 by Bas Kooijman

%% Syntax
% [del_M, pets]  = <get_del_M *get_data*>(pets)

%% Description
% Gets parameter del_M for a selection of entries, if available
%
% Input:
%
% * pets: cell-string with names of entry, or character string with taxon
%
% Output:
%
% * del_M: vector with del_M 
% * pets: cell-string with names of entries

%% Remarks
% This function first tries to find mydata_my_pet in local directory entries (typically only for curators); 
% in failure, it downloads it from the web via powershell function wget.
% Make sure the your current directory does not have mydata_my_pet.m or pars_init_my_pet.m, since this file will be overwritten and deleted.

%% Example of use
% [del_M, nm] = get_del_M('Lacertidae'); prt_tab({nm, del_M});

 if ischar(pets); pets = select(pets); end
 n = length(pets); del_M = NaN(n,1);
 path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries/';
 WD = cdCur;
   
  for i=1:n
    fnm= 'results_my_pet.mat'; my_pet = pets{i};
    try % locally present in dir entries (mostly for curators)
      copyfile(['../../add_my_pet/entries/', my_pet, '/results_', my_pet, '.mat'], fnm)
    catch % get results_my_pet.mat from web
      if ismac || isunix
        system(['wget ', path, my_pet, '/results_', my_pet, '.mat -O ', fnm]);
      else
        system(['powershell wget ', path, my_pet, '/results_', my_pet, '.mat -O ', fnm]);
      end
    end
    load('results_my_pet','par')
    if isfield(par,'del_M'); del_M(i) = par.del_M; end
  end
  delete('results_my_pet.mat');
  cd(WD);

end
