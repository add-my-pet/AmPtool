%% get_date_acc
% gets acception dates of entries

%%
function [dates taxa_new dates_new] = get_date_acc(n_new)
%% created 2022/02/21 by Bas Kooijman

%% Syntax
% [dates taxa_new dates_new] = <../get_date_subm.m *get_date_acc*>(n_new)

%% Description
% Gets the acception dates of entries in add_my_pet collection
%
% Input:
%
% * n_new: optional scalar with number of latest entries (default 5)
%
% Output:
% 
% * dates: n-vector with acception dates of add_my_pet entries
% * taxa_new: n_new-vector with names of n_new latest taxa
% * date_new: n_new-vector with date-strings when latest taxa were accepted

%% Remarks
% about_add_my_pet makes a plot of this
%
%% Example of use
% get_date_acc

  if ~exist('n_new', 'var')
    n_new = 5;
  end

  [dates entries] = read_allStat('date_acc'); 
  dates = datenum(dates); 
  
  [sdates I] = sort(dates,1,'descend'); 
  taxa_new = entries(I(1:n_new)); 
  dates_new = datestr(dates(I(1:n_new)), 26);
    
  dates = 2006 + (dates - datenum([2006 01 01]))/ 365;
    
