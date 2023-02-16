%% write_popStat_loc
% writes a structure with all population stats for all entries

%%
function popStat = write_popStat_loc(varargin)
% created 2019/08/02 by Bas Kooijman

%% Syntax
% popStat = <write_popStat_loc *write_popStat_loc*> (varargin)

%% Description
% collects all popStat.mat files from all ../entries_web subdirectories of the local AmP depository into a single structure.
% Apart from a direct output, file popStat.mat is written in the parent directory of the current one.
% Meant to be run from AmPtool/curation 
%
% Input:
%
% * varargin: optional cell array with entry names, or character string with entry or node names (default 'Animalia')
%
% Ouput:
%
% * popStat: stucture with all population statistics of all entries

%% Example of use
% popStat = write_popStat_loc;

  clear global
  
  if isempty(varargin)
    varargin = select('Animalia');
    popStat = [];
  elseif ~iscell(varargin{1}) && isempty(strfind(varargin{1},'_'))
    varargin = select(varargin{1});
    load popStat
  elseif iscell(varargin{1})    
    varargin = varargin{:}; % unpack cell string
    load popStat
  else
    load popStat
  end

  WD = cdCur; 
  locPopStat = popStat; % copy popStat in temporary variable locPopStat, since collection popStat will be overwritten by that of species 
  
  n_spec = length(varargin); 
  cd(['../../deblab/add_my_pet/entries_web/',varargin{1}])
  
  for i = 1:n_spec
    cd(['../',varargin{i}])
    load([varargin{i}, '_pop.mat']) % creates variable popStat
    spec = fields(popStat); spec = spec{1};
    
    % remove graphics
    if isfield(popStat.(spec).f0.thin1.f, 'tS')
        popStat.(spec).f0.thin1.f = rmfield(popStat.(spec).f0.thin1.f, 'tS');
    end
    if isfield(popStat.(spec).f0.thin1.f, 'tSs')
        popStat.(spec).f0.thin1.f = rmfield(popStat.(spec).f0.thin1.f, 'tSs');
    end
    if isfield(popStat.(spec), 'ff') && isfield(popStat.(spec).ff.thin1.f, 'tS')
        popStat.(spec).ff.thin1.f = rmfield(popStat.(spec).ff.thin1.f, 'tS');
    end
    if isfield(popStat.(spec), 'ff') && isfield(popStat.(spec).ff.thin1.f, 'tSs')
        popStat.(spec).ff.thin1.f = rmfield(popStat.(spec).ff.thin1.f, 'tSs');
    end
    if isfield(popStat.(spec).f1.thin1.f, 'tS')
        popStat.(spec).f1.thin1.f = rmfield(popStat.(spec).f1.thin1.f, 'tS');
    end
    if isfield(popStat.(spec).f1.thin1.f, 'tSs')
        popStat.(spec).f1.thin1.f = rmfield(popStat.(spec).f1.thin1.f, 'tSs');
    end

    if isfield(popStat.(spec).f0.thin0.f, 'tS')
        popStat.(spec).f0.thin0.f = rmfield(popStat.(spec).f0.thin0.f, 'tS');
    end
    if isfield(popStat.(spec).f0.thin0.f, 'tSs')
        popStat.(spec).f0.thin0.f = rmfield(popStat.(spec).f0.thin0.f, 'tSs');
    end
    if isfield(popStat.(spec), 'ff') && isfield(popStat.(spec).ff.thin0.f, 'tS')
        popStat.(spec).ff.thin0.f = rmfield(popStat.(spec).ff.thin0.f, 'tS');
    end
    if isfield(popStat.(spec), 'ff') && isfield(popStat.(spec).ff.thin0.f, 'tSs')
        popStat.(spec).ff.thin0.f = rmfield(popStat.(spec).ff.thin0.f, 'tSs');
    end
    if isfield(popStat.(spec).f1.thin0.f, 'tS')
        popStat.(spec).f1.thin0.f = rmfield(popStat.(spec).f1.thin0.f, 'tS');
    end
    if isfield(popStat.(spec).f1.thin0.f, 'tSs')
        popStat.(spec).f1.thin0.f = rmfield(popStat.(spec).f1.thin0.f, 'tSs');
    end
    locPopStat.(spec) = popStat.(spec); % add species to collection
  end
  
  % remove labels (is already in allLabel)
  if isfield(popStat.(spec),'label')
    popStat.(spec) = rmfield(popStat.(spec), 'label');
  end
  
  popStat = locPopStat; % copy collection popStat back in variable popStat
  % check if length of popStat corresponds with number of entries in lists-of-lists
  entries = select; n_entries = length(entries); n_popStat = length(fields(popStat));
  if ~(n_popStat == n_entries)
    fprintf(['Warning from write_popStat_loc:  popStat has ', num2str(n_popStat), ' fields, but lists-of-lists have ', num2str(n_entries), ' entries\n']);
  end
  popStat = orderfields(popStat, entries);
  cdAmPdata; save('popStat.mat','popStat'); cd(WD); % run from /AmPtool/curation

