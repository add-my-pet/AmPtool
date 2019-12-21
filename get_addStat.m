%% get_addStat
% adds all pars and stats to allStat.mat for specified entries

%%
function allStat = get_addStat(taxa, T, f)
% created 2016/04/22 by Bas Kooijman

%% Syntax
% allStat = <get_addStat *get_addStat*> (taxa, T, f)

%% Description
% gets model, MRE, SMSE, CLOMPLETE, author, date_subm, date_acc, all parameters and statistics of specified entries.
% Parameters are always expressed at T_ref, i.e. C2K(20), irrespective of input T.
%
% Input:
%
% * taxa: cell string with taxa to be added
% * T: optional scalar with body temperature in Kelvin for ststistics (default T_typical, which is entry-specific)
% * f: optional scalar with scaled functional response (default 1)
%
% Output:
% 
% * allStat: structure with all parameters and statistics values, including their units and labels

%% Remarks
% Statistics are given at T_typical or T. 
% Meant to be used in combination with <write_addStat.html *write_addStat*>, which checks presence in sister-directory entries.
% See <get_addStat.html *get_addStat*> for all entries of select.

%% Example of use
% see write_addStat

  if ~exist('T', 'var') || isempty(T)
    set_T = 0; % identyfier for temperature setting
  else 
    set_T = 1;
  end
 
  if ~exist('f', 'var') || isempty(f) 
    f = 1;
  end

  load allStat.mat
  
  ne = length(taxa);
  WD = pwd;                % store current path
  cd(['../entries/',taxa{1}]) % goto entries

  try
    for i = 1:ne
      cd (['../', taxa{i}])
      fprintf([taxa{i}, '\n']); % show progress on screen (takes some time)
      load (['results_', taxa{i}])
      
      % metaData
      allStat.(taxa{i}).species = metaData.species; allStat.(taxa{i}).units.species = '-'; allStat.(taxa{i}).label.species = 'scientific name';
      allStat.(taxa{i}).species_en = metaData.species_en; allStat.(taxa{i}).units.species_en = '-'; allStat.(taxa{i}).label.species_en = 'common name';
      allStat.(taxa{i}).model = metaPar.model; allStat.(taxa{i}).units.model = '-'; allStat.(taxa{i}).label.model = 'DEB model';
      allStat.(taxa{i}).MRE = metaPar.MRE; allStat.(taxa{i}).units.MRE = '-'; allStat.(taxa{i}).label.MRE = 'Mean Relative Error';
      allStat.(taxa{i}).SMSE = metaPar.SMSE; allStat.(taxa{i}).units.SMSE = '-'; allStat.(taxa{i}).label.SMSE = 'Symmetric Mean Squared Error';
      allStat.(taxa{i}).COMPLETE = metaData.COMPLETE; allStat.(taxa{i}).units.COMPLETE = '-'; allStat.(taxa{i}).label.COMPLETE = 'completeness';
      allStat.(taxa{i}).author = metaData.author(:)'; allStat.(taxa{i}).units.author = '-'; allStat.(taxa{i}).label.author = 'submitting author';
      author_mod = get_author_mod(metaData);
      allStat.(taxa{i}).author_mod = author_mod; allStat.(taxa{i}).units.author_mod = '-'; allStat.(taxa{i}).label.author_mod = 'modification author';
      allStat.(taxa{i}).date_subm = metaData.date_subm; allStat.(taxa{i}).units.date_subm = '-'; allStat.(taxa{i}).label.date_subm = 'submitting date';
      allStat.(taxa{i}).date_acc = metaData.date_acc; allStat.(taxa{i}).units.date_acc = '-'; allStat.(taxa{i}).label.date_acc = 'acceptance date';
      allStat.(taxa{i}).T_typical = metaData.T_typical;
            
      % parameters
      par = rmfield_wtxt(par, 'free');   % remove substructure free from par
      [nm nst] = fieldnmnst_st(par);     % get number of parameter fields
      for j = 1:nst % add all parameters at T_ref
        allStat.(taxa{i}).(nm{j}) = par.(nm{j});
        allStat.(taxa{i}).units.(nm{j}) = txtPar.units.(nm{j});
        allStat.(taxa{i}).label.(nm{j}) = txtPar.label.(nm{j});
      end
      
      % statistics
      allStat.(taxa{i}).f = f; % overwrite scaled function response
      if set_T == 0
        [stat, txtStat] = statistics_st(metaPar.model, par, metaData.T_typical, f);
      else
        [stat, txtStat] = statistics_st(metaPar.model, par, T, f);
      end
      [nm nst] = fieldnmnst_st(stat);    % get number of parameter fields
      for j = 1:nst % add all statistis at T or T_typical
        allStat.(taxa{i}).(nm{j}) = stat.(nm{j});
        allStat.(taxa{i}).units.(nm{j}) = txtStat.units.(nm{j});
        allStat.(taxa{i}).label.(nm{j}) = txtStat.label.(nm{j});
      end
    end
   
  catch 
    disp(['Statistics of entry ', taxa{i},' could not be extracted'])
  end
   
  cd(WD)                   % goto original path
end

function author_mod = get_author_mod(metaData)
  author_mod = cell(0);
  [nm nr] = fieldnmnst_st(metaData); 
  n = strfind(nm, 'author_'); 
  for i = 1:nr
    if ~isempty(n{i})
      authors = metaData.(nm{i});
      author_mod = [author_mod, authors(:)'];
    end
  end
end
