%% allStat2par
% obtain a structure with all core pars for an entry with context

%%
function [par, metaPar, txtPar, metaData] = allStat2par(my_pet)
% created 2019/02/20 by Bas Kooijman

%% Syntax
% [par, metaPar, txtPar, metaData] = <allStat2par *allStat2par*> (my_pet)

%% Description
% Read par, metaPar and metaData from allStat for entry my_pet
% Parameters are always expressed at T_ref
%
% Input:
%
% * my_pet: string with name of entry
%
% Output:
% 
% * par: structure with all core parameters
% * metaPar: structure with model, MRE, SMSE
% * txtPar: structure with units and labels for all core parameters
% * metaData: structure with taxonomy, T_typical, COMPLETE


%% Remarks
% used in prt_report_my_pet

%% Example of use
% [par, txtPar, metaPar, metaData] = allStat2par('Daphnia_magna');

  persistent allStat

  if ~exist('allStat','var') || isempty(allStat)
    load(which('allStat.mat'))        % get all parameters and statistics in structure allStat
  end

  % par, txtPar
  parFields = ['T_ref'; get_parfields(allStat.(my_pet).model, 1)']; % include chemical parameters and T_ref
  % add male parameters, if present
  if isfield(allStat.(my_pet), 'z_m')
    parFields = [parFields;'z_m'];
  end
  if isfield(allStat.(my_pet), 'E_Hbm')
    parFields = [parFields;'E_Hbm'];
  end
  if isfield(allStat.(my_pet), 'E_Hjm')
    parFields = [parFields;'E_Hjm'];
  end
  if isfield(allStat.(my_pet), 'E_Hpm')
    parFields = [parFields;'E_Hpm'];
  end
  %
  n_parFields = length(parFields);
  for i = 1:n_parFields
    par.(parFields{i}) = allStat.(my_pet).(parFields{i});
    txtPar.units.(parFields{i}) = allStat.(my_pet).units.(parFields{i});
    txtPar.label.(parFields{i}) = allStat.(my_pet).label.(parFields{i});
  end

  % metaPar
  metaPar.model = allStat.(my_pet).model;
  metaPar.MRE = allStat.(my_pet).MRE;
  metaPar.SMSE = allStat.(my_pet).SMSE;

  % metaData
  metaData.phylum = allStat.(my_pet).phylum;
  metaData.class = allStat.(my_pet).class;
  metaData.order = allStat.(my_pet).order;
  metaData.family = allStat.(my_pet).family;
  metaData.species = allStat.(my_pet).species;
  metaData.species_en = allStat.(my_pet).species_en;
  metaData.T_typical = allStat.(my_pet).T_typical;
  metaData.COMPLETE = allStat.(my_pet).COMPLETE;

