%% get_date_subm
% gets dates of first submission of entries

%%
function dates = get_date_subm
%% created 2022/02/21 by Bas Kooijman

%% Syntax
% dates = <../get_date_subm.m *get_date_subm*>

%% Description
% Gets the dates of first submission of entries in add_my_pet collection
%
% Output:
% 
% * dates: n-vector with acception dates of add_my_pet entries

%% Remarks
% about_add_my_pet makes a plot of this
%
%% Example of use
% dates = get_date_subm


  dates = read_allStat('date_subm'); 
  dates = datenum(dates); 
    
  dates = 2006 + (dates - datenum([2006 01 01]))/ 365;
    