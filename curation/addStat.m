%% addStat
% adds all pars and stats to allStat.mat for a specified entry

%%
function my_pet_st = addStat(my_pet, T, f)
% created 2023/01/27 by Bas Kooijman

%% Syntax
% my_pet_st = <addStat *addStat*> (my_pet, T, f)

%% Description
% gets model, MRE, SMSE, CLOMPLETE, author, date_subm, date_acc, all parameters and statistics of a specified entry using results_my_pet.mat.
% Parameters are always expressed at T_ref, i.e. C2K(20), irrespective of input T.
%
% Input:
%
% * my_pet: string with name of entry to be added to allStat
% * T: optional scalar with body temperature in Kelvin for ststistics (default T_typical, which is entry-specific)
% * f: optional scalar with scaled functional response (default 1)
%
% Output:
% 
% * my_pet_st: structure with all parameters and statistics values for my_pet

%% Remarks
% * Statistics are given at T_typical or T. 
% * Meant to be used in combination with <write_addStat.html *write_addStat*>, which checks presence in sister-directory entries.
% * See <get_addStat.html *get_addStat*> for all entries of select.
% * The units and labels are given in AmPdata/allUnits and allLabel

%% Example of use
% see write_addStat
  
  if ~exist('T', 'var') || isempty(T)
    set_T = 0; % identifier for temperature setting
  else 
    set_T = 1;
  end
 
  if ~exist('f', 'var') || isempty(f) 
    f = 1;
  end

  load (['results_', my_pet])
      
  % metaData
  my_pet_st.species = metaData.species; 
  my_pet_st.species_en = metaData.species_en; 
  my_pet_st.family  = metaData.family;  
  my_pet_st.order   = metaData.order;   
  my_pet_st.class   = metaData.class;   
  my_pet_st.phylum  = metaData.phylum;  
  if isfield(metaData.links, 'id_CoL')
    my_pet_st.id_CoL  = metaData.links.id_CoL; 
  else
    my_pet_st.id_CoL  = ''; 
  end
  my_pet_st.ecoCode.climate = metaData.ecoCode.climate; 
  my_pet_st.ecoCode.ecozone = metaData.ecoCode.ecozone; 
  my_pet_st.ecoCode.habitat = metaData.ecoCode.habitat; 
  my_pet_st.ecoCode.embryo  = metaData.ecoCode.embryo;  
  my_pet_st.ecoCode.migrate = metaData.ecoCode.migrate; 
  my_pet_st.ecoCode.food    = metaData.ecoCode.food;    
  my_pet_st.ecoCode.gender  = metaData.ecoCode.gender;  
  my_pet_st.ecoCode.reprod  = metaData.ecoCode.reprod;

  % data/model
  my_pet_st.model = metaPar.model; 
  my_pet_st.MRE = metaPar.MRE; 
  my_pet_st.SMSE = metaPar.SMSE; 
  my_pet_st.COMPLETE = metaData.COMPLETE; 
  my_pet_st.data = [metaData.data_0(:); metaData.data_1(:)]; 
  my_pet_st.author = get_author(metaData); 
  my_pet_st.date_subm = metaData.date_subm; 
  my_pet_st.date_acc = metaData.date_acc; 
  my_pet_st.T_ref = par.T_ref;  
  my_pet_st.T_typical = metaData.T_typical;  
            
  % parameters
  coreParFields = get_parfields(metaPar.model, 1); % get coreParFileds, including chemical pars
  par = rmfield_wtxt(par, 'free');   % remove substructure free from par
  [nm, nst] = fieldnmnst_st(par);    % get number of parameter fields
  for j = 1:nst % add core parameters at T_ref
    if ismember(nm{j},coreParFields)
      my_pet_st.(nm{j}) = par.(nm{j});
    end
    if isfield(par,'T_L')
      my_pet_st.T_L = par.T_L; my_pet_st.T_AL = par.T_AL;
    end
    if isfield(par,'T_H') 
      my_pet_st.T_H = par.T_H; my_pet_st.T_AH = par.T_AH;
    end
  end
      
  % statistics
  my_pet_st.f = f; % overwrite scaled function response
  if set_T == 0
    [stat, txtStat] = statistics_st(metaPar.model, par, metaData.T_typical, f);
  else
    [stat, txtStat] = statistics_st(metaPar.model, par, T, f);
  end
  [nm, nst] = fieldnmnst_st(stat);    % get number of parameter fields
  for j = 1:nst % add all statistis at T or T_typical
    my_pet_st.(nm{j}) = stat.(nm{j});
  end
end
