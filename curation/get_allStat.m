%% get_allStat
% obtain a structure with all pars and stats for all entries

%%
function allStat = get_allStat(T, f)
% created 2016/04/22 by Bas Kooijman, modified 2018/01/23, 2019/12/25, 2022/02/21

%% Syntax
% allStat = <get_allStat *get_allStat*> (T, f)

%% Description
% Gets lineage, model, MRE, SMSE, CLOMPLETE, author, date_subm, date_acc, all parameters and statistics and biblist of all entries.
% It does so by directory-hopping using ../../entries, which must contain all entries, and visiting the results_my_pet.mat files.
% This assumes that the content of this .mat file is consistent with the mydata_my_pet and the pars_init_my_pet files.
% Parameters are always expressed at T_ref, i.e. C2K(20), irrespective of input T.
%
% Input:
%
% * T: optional scalar with body temperature in Kelvin for ststistics (default T_typical, which is entry-specific)
% * f: optional scalar with scaled functional response (default 1)
%
% Output:
% 
% * allStat: structure with all parameters and statistics values

%% Remarks
% * Statistics are given at T_typical or T. 
% * Meant to be used in combination with <write_allStat.html *write_allStat*> and <../../html/read_allStat.html *read_allStat*>.
% * Since running this function takes some time, progress is written to screen.
% * Units and labels are given in the static structures AmPdata/allUnits and allLabel

%% Example of use
% allStat = get_allStat; see mydata_shstat

  if ~exist('T', 'var') || isempty(T)
    set_T = 0; % identyfier for temperature setting
  else 
    set_T = 1;
  end
 
  if ~exist('f', 'var') || isempty(f) 
    f = 1;
  end

  entries = select('Animalia');
  ne = length(entries);
   
  WD = pwd;                % store current path
  cd(['../../deblab/add_my_pet/entries/',entries{1}]) % goto entries

  try
    for i = 1:ne
      cd (['../', entries{i}])
      fprintf('%g: %s\n', i,entries{i}); % show progress on screen (takes some time)
      load(['results_', entries{i}])
      
      % metaData
      allStat.(entries{i}).species = metaData.species; 
      allStat.(entries{i}).species_en = metaData.species_en; 
      allStat.(entries{i}).family  = metaData.family;  
      allStat.(entries{i}).order   = metaData.order;   
      allStat.(entries{i}).class   = metaData.class;   
      allStat.(entries{i}).phylum  = metaData.phylum;  
      if isfield(metaData.links, 'id_CoL')
        allStat.(entries{i}).id_CoL  = metaData.links.id_CoL; 
      else
        allStat.(entries{i}).id_CoL  = ''; 
      end
      allStat.(entries{i}).ecoCode.climate = metaData.ecoCode.climate; allStat.(entries{i}).units.ecoCode.climate = '-'; allStat.(entries{i}).label.ecoCode.climate = 'ecoCode climate';
      allStat.(entries{i}).ecoCode.ecozone = metaData.ecoCode.ecozone; allStat.(entries{i}).units.ecoCode.ecozone = '-'; allStat.(entries{i}).label.ecoCode.ecozone = 'ecoCode ecozone';
      allStat.(entries{i}).ecoCode.habitat = metaData.ecoCode.habitat; allStat.(entries{i}).units.ecoCode.habitat = '-'; allStat.(entries{i}).label.ecoCode.habitat = 'ecoCode habitat';
      allStat.(entries{i}).ecoCode.embryo  = metaData.ecoCode.embryo;  allStat.(entries{i}).units.ecoCode.embryo  = '-'; allStat.(entries{i}).label.ecoCode.embryo  = 'ecoCode embryo';
      allStat.(entries{i}).ecoCode.migrate = metaData.ecoCode.migrate; allStat.(entries{i}).units.ecoCode.migrate = '-'; allStat.(entries{i}).label.ecoCode.migrate = 'ecoCode migrate';
      allStat.(entries{i}).ecoCode.food    = metaData.ecoCode.food;    allStat.(entries{i}).units.ecoCode.food    = '-'; allStat.(entries{i}).label.ecoCode.food    = 'ecoCode food';
      allStat.(entries{i}).ecoCode.gender  = metaData.ecoCode.gender;  allStat.(entries{i}).units.ecoCode.gender  = '-'; allStat.(entries{i}).label.ecoCode.gender  = 'ecoCode gender';
      allStat.(entries{i}).ecoCode.reprod  = metaData.ecoCode.reprod;  allStat.(entries{i}).units.ecoCode.reprod  = '-'; allStat.(entries{i}).label.ecoCode.reprod  = 'ecoCode reprod';

      % data/model
      allStat.(entries{i}).model = metaPar.model; 
      allStat.(entries{i}).MRE = metaPar.MRE; 
      allStat.(entries{i}).SMSE = metaPar.SMSE; 
      allStat.(entries{i}).COMPLETE = metaData.COMPLETE; 
      allStat.(entries{i}).data = [metaData.data_0(:); metaData.data_1(:)]; 
      allStat.(entries{i}).author = get_author(metaData); 
      allStat.(entries{i}).date_subm = metaData.date_subm; 
      allStat.(entries{i}).date_acc = metaData.date_acc; 
      allStat.(entries{i}).T_ref = par.T_ref; 
      allStat.(entries{i}).T_typical = metaData.T_typical; 

      % parameters
      coreParFields = get_parfields(metaPar.model, 1); % get coreParFileds, including chemical pars
      par = rmfield_wtxt(par, 'free');   % remove substructure free from par
      [nm, nst] = fieldnmnst_st(par);    % get number of parameter fields
      for j = 1:nst % add core parameters at T_ref
        if ismember(nm{j},coreParFields)
          allStat.(entries{i}).(nm{j}) = par.(nm{j});
        end
        if isfield(par,'T_L') 
          allStat.(entries{i}).T_L = par.T_L; allStat.(entries{i}).T_AL = par.T_AL;
        end
        if isfield(par,'T_H')
          allStat.(entries{i}).T_H = par.T_H; allStat.(entries{i}).T_AH = par.T_AH;
        end
      end
      
      % statistics
      allStat.(entries{i}).f = f; % overwrite scaled function response
      if set_T == 0
        [stat, txtStat] = statistics_st(metaPar.model, par, metaData.T_typical, f);
      else
        [stat, txtStat] = statistics_st(metaPar.model, par, T, f);
      end
      [nm, nst] = fieldnmnst_st(stat);    % get number of parameter fields
      for j = 1:nst % add all statistis at T or T_typical
        allStat.(entries{i}).(nm{j}) = stat.(nm{j});
      end
    end
   
  catch 
    disp(['Statistics of entry ', entries{i},' could not be extracted'])
    keyboard
  end
   
  cd(WD)                   % goto original path
end

