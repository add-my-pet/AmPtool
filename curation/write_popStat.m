%% write_popStat
% writes a structure with all population stats for all entries

%%
function popStat = write_popStat(varargin)
% created 2019/08/02 by Bas Kooijman

%% Syntax
% popStat = <write_popStat *write_popStat*> (varargin)

%% Description
% collects all popStat.mat files from all add_my_pet/entries_web subdirectories of the AmP site into a single structure.
% Apart from a direct output, file popStat.mat is written in the parent directory of the current one.
% Meant to be run from AmPtool/curation 
%
% Input:
%
% * varargin: optional cell array with entry names, or character string with entry or node names (default 'Animalia')
%
% Ouput:
%
% * popStatLoc: stucture with all population statistics of all entries

%% Remarks
% This function uses wget under Windows powershell, to copy .mat files from the web to local.

%% Example of use
% popStat = write_popStat;

  clear global
  
  if isempty(varargin)
    varargin = select('Animalia');
  elseif ~iscell(varargin{1}) && isempty(strfind(varargin{1},'_'))
    varargin = select(varargin{1});
  elseif iscell(varargin{1})    
    varargin = varargin{:}; % unpack cell string  
  end

  path = [set_path2server, 'add_my_pet/entries_web/'];
  n_spec = length(varargin); 
  for i = 1:n_spec
    if ismac || isunix
      eval(['system(wget ', [path, varargin{i}, '/', varargin{i}, ], '_pop.mat -O popStat.mat)'])
    else
      eval(['!powershell wget ', [path, varargin{i}, '/', varargin{i}, ], '_pop.mat -O popStat.mat'])
    end
    load popStat
    spec = fieldnames(popStat); spec = spec{1};
    
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
    
    % remove labels (is already in allLabel)
    popStat.(spec) = rmfield(popStat.(spec), 'label');

    popStatLoc.(spec) = popStat.(spec);
    fprintf('%g: %s\n', i, spec);
  end
  popStat = popStatLoc;
  WD = cdAmPdata; save('popStat.mat','popStat'); cd(WD); % run from /AmPtool/curation

