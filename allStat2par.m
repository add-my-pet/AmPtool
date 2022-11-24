%% allStat2par
% obtain a structure with all core pars for an entry with context

%%
function [par, metaPar, txtPar, metaData, info] = allStat2par(my_pet)
% created 2019/02/20 by Bas Kooijman, modified 2019/12/31

%% Syntax
% [par, metaPar, txtPar, metaData, info] = <allStat2par *allStat2par*> (my_pet)

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
% * metaData: structure with taxonomy, ecoCode, T_typical, COMPLETE
% * info: boolean with failure (0) or success (1)

%% Remarks
% used in prt_report_my_pet, prt_my_pet_pop, cpm. 
% links (except to CoL) and biblist is not in allStat, so not in output metaData

%% Example of use
% [par, txtPar, metaPar, metaData] = allStat2par('Daphnia_magna');

  persistent allStat allUnits allLabel

  if ~exist('allStat','var') || isempty(allStat)
    load allStat        % get all parameters and statistics in structure allStat
  end
  if ~exist('allUnits','var') || isempty(allUnits)
    load allUnits
  end
  if ~exist('allLabel','var') || isempty(allLabel)
    load allLabel
  end

  info = 1;
  
  try
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
      txtPar.units.(parFields{i}) = allUnits.(parFields{i});
      txtPar.label.(parFields{i}) = allLabel.(parFields{i});
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
    metaData.ecoCode = allStat.(my_pet).ecoCode;
    metaData.T_typical = allStat.(my_pet).T_typical;
    metaData.COMPLETE = allStat.(my_pet).COMPLETE;
    metaData.id_CoL = allStat.(my_pet).id_CoL;
  
  catch
    fprintf('Warning from allStat2par: species name is not recognized\n');
    par=[]; metaPar=[]; txtPar=[]; metaData=[]; info = 0; return
  end
   

