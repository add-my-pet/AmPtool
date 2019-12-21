%% get_allStat
% obtain a structure with all pars and stats for all entries

%%
function allStat = get_allStat(T, f)
% created 2016/04/22 by Bas Kooijman, modified 2018/01/23

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
% * allStat: structure with all parameters and statistics values, including their units and labels

%% Remarks
% Statistics are given at T_typical or T. 
% Meant to be used in combination with <write_allStat.html *write_allStat*> and <../../html/read_allStat.html *read_allStat*>.
% Since running this function takes some time, progress is written to screen.

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
  cd(['../../entries/',entries{1}]) % goto entries

  try
    for i = 1:ne
      cd (['../', entries{i}])
      fprintf([entries{i}, '\n']); % show progress on screen (takes some time)
      load(['results_', entries{i}])
      
      % metaData
      allStat.(entries{i}).species = metaData.species; allStat.(entries{i}).units.species = '-'; allStat.(entries{i}).label.species = 'taxon';
      allStat.(entries{i}).species_en = metaData.species_en; allStat.(entries{i}).units.species_en = '-'; allStat.(entries{i}).label.species_en = 'common name';
      allStat.(entries{i}).family  = metaData.family;  allStat.(entries{i}).units.family = '-';  allStat.(entries{i}).label.family = 'taxon';
      allStat.(entries{i}).order   = metaData.order;   allStat.(entries{i}).units.order = '-';   allStat.(entries{i}).label.order = 'taxon';
      allStat.(entries{i}).class   = metaData.class;   allStat.(entries{i}).units.class = '-';   allStat.(entries{i}).label.class = 'taxon';
      allStat.(entries{i}).phylum  = metaData.phylum;  allStat.(entries{i}).units.phylum = '-';  allStat.(entries{i}).label.phylum = 'taxon';
      % data/model
      allStat.(entries{i}).model = metaPar.model; allStat.(entries{i}).units.model = '-'; allStat.(entries{i}).label.model = 'DEB model';
      allStat.(entries{i}).MRE = metaPar.MRE; allStat.(entries{i}).units.MRE = '-'; allStat.(entries{i}).label.MRE = 'Mean Relative Error';
      allStat.(entries{i}).SMSE = metaPar.SMSE; allStat.(entries{i}).units.SMSE = '-'; allStat.(entries{i}).label.SMSE = 'Symmetric Mean Squared Error';
      allStat.(entries{i}).COMPLETE = metaData.COMPLETE; allStat.(entries{i}).units.COMPLETE = '-'; allStat.(entries{i}).label.COMPLETE = 'completeness';
      allStat.(entries{i}).data = [metaData.data_0(:); metaData.data_1(:)]; allStat.(entries{i}).units.data = '-'; allStat.(entries{i}).label.data = 'data types';
      % submission
      allStat.(entries{i}).author = metaData.author(:)'; allStat.(entries{i}).units.author = '-'; allStat.(entries{i}).label.author = 'submitting author';
      allStat.(entries{i}).date_subm = metaData.date_subm; allStat.(entries{i}).units.date_subm = '-'; allStat.(entries{i}).label.date_subm = 'submitting date';
      % modification
      author_date_mod = get_author_date_mod(metaData);
      allStat.(entries{i}).author_mod = author_date_mod(:,1); allStat.(entries{i}).units.author_mod = '-'; allStat.(entries{i}).label.author_mod = 'modification author';
      allStat.(entries{i}).date_mod = author_date_mod(:,2); allStat.(entries{i}).units.date_mod = '-'; allStat.(entries{i}).label.date_mod = 'modification date';
      % acceptance
      allStat.(entries{i}).date_acc = metaData.date_acc; allStat.(entries{i}).units.date_acc = '-'; allStat.(entries{i}).label.date_acc = 'acceptance date';
      % typical body temp
      allStat.(entries{i}).T_typical = metaData.T_typical;  allStat.(entries{i}).units.T_typical = 'K';
        allStat.(entries{i}).label.T_typical = 'typical body temperature';

      % parameters
      par = rmfield_wtxt(par, 'free');   % remove substructure free from par
      [nm nst] = fieldnmnst_st(par);     % get number of parameter fields
      for j = 1:nst % add all parameters at T_ref
        allStat.(entries{i}).(nm{j}) = par.(nm{j});
        allStat.(entries{i}).units.(nm{j}) = txtPar.units.(nm{j});
        allStat.(entries{i}).label.(nm{j}) = txtPar.label.(nm{j});
      end
      
      % statistics
      allStat.(entries{i}).f = f; % overwrite scaled function response
      if set_T == 0
        [stat, txtStat] = statistics_st(metaPar.model, par, metaData.T_typical, f);
      else
        [stat, txtStat] = statistics_st(metaPar.model, par, T, f);
      end
      [nm nst] = fieldnmnst_st(stat);    % get number of parameter fields
      for j = 1:nst % add all statistis at T or T_typical
        allStat.(entries{i}).(nm{j}) = stat.(nm{j});
        allStat.(entries{i}).units.(nm{j}) = txtStat.units.(nm{j});
        allStat.(entries{i}).label.(nm{j}) = txtStat.label.(nm{j});
      end
    end
   
  catch 
    disp(['Statistics of entry ', entries{i},' could not be extracted'])
  end
   
  cd(WD)                   % goto original path
end

