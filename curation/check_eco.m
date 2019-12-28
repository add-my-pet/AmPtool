%% check_eco
% Checks eco labels 

%%
function check_eco(varargin)
% created 2018/04/12 by Bas Kooijman, modified 2019/12/28

%% Syntax
% <../check_eco.m *check_eco*>(varargin)

%% Description
% Checks eco labels as specified in get_eco for existence in global eco_types. 
%
% Input:
%
% * varargin: optional character or cell string with name(s) of entry (default: select('Animalia')) 

%% Remarks
% run get_eco_types to copy AmPeco info to labels for eco-codes. 
% If eco codes are not recognized, change the codes in get_eco, or add codes to AmPeco.html.

%% Example of use
% check_eco(select('Actinopterygii')) or check_eco('Daphnia_magna')

global eco_types

if length(eco_types) == 0 
  get_eco_types;
end

if isempty(varargin)
  varargin = select('Animalia');
elseif ~iscell(varargin{1}) && isempty(strfind(varargin{1},'_'))
  varargin = select(varargin{1});
elseif iscell(varargin{1})    
  varargin = varargin{:}; % unpack cell string  
end
    
C = fields(eco_types.climate); 
E = fields(eco_types.ecozone); 
H = fields(eco_types.habitat); 
B = fields(eco_types.embryo); 
M = fields(eco_types.migrate); 
F = fields(eco_types.food);
G = fields(eco_types.gender);
R = fields(eco_types.reprod);

n = length(varargin);

stage = { ...
    '0i','0e','0p','0j','0x','0b', ...
    'bi','be','bp','bj','bx', ...
    'xi','xe','xp','xj', ...
    'ji','je','jp', ...
    'pi','pe', ...
    'ei'};

for i = 1:n % scan entries
  load(['../../add_my_pet/entries/', varargin{i}, '/results_', varargin{i}])
  ecoCode = metaData.ecoCode; % keep structure since ecoCode.reprod conflicts with function reprod
 
  n_C = length(ecoCode.climate);
  for j = 1:n_C 
    if ~ismember(ecoCode.climate{j},C)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the climate-code ', ecoCode.climate{j}, ' is not recognized\n']);
    end
  end

  n_E = length(ecoCode.ecozone);
  for j = 1:n_E 
    if ~ismember(ecoCode.ecozone{j},E)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the ecozone-code ', ecoCode.ecozone{j}, ' is not recognized\n']);
    end
  end

  n_H = length(ecoCode.habitat);
  for j = 1:n_H 
    code = ecoCode.habitat{j}; code_stage = code(1:2); code_H = code(3:end);
    if ~ismember(code_H,H) || ~ismember(code_stage,stage)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the habitat-code ', code, ' is not recognized\n']);
    end
  end

  n_B = length(ecoCode.embryo);
  for j = 1:n_B 
    if ~ismember(ecoCode.embryo{j},B)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the embryo-code ', ecoCode.embryo{j}, ' is not recognized\n']);
    end
  end

  n_M = length(ecoCode.migrate);
  for j = 1:n_M 
    if ~ismember(ecoCode.migrate{j},M)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the migrate-code ', ecoCode.migrate{j}, ' is not recognized\n']);
    end
  end

  n_F = length(ecoCode.food);
  for j = 1:n_F 
    code = ecoCode.food{j}; code_stage = code(1:2); code_F = code(3:end);
    if ~ismember(code_F,F) || ~ismember(code_stage,stage) || ~isempty(strfind(code_stage,'0'))
      fprintf(['Warning from check_eco for ', varargin{i}, ': the food-code ', code, ' is not recognized\n']);
    end
  end

  n_G = length(ecoCode.gender);
  for j = 1:n_G 
    if ~ismember(ecoCode.gender{j},G)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the gender-code ', ecoCode.gender{j}, ' is not recognized\n']);
    end
  end

  n_R = length(ecoCode.reprod);
  for j = 1:n_R 
   if ~ismember(ecoCode.reprod{j},R)
     fprintf(['Warning from check_eco for ', varargin{i}, ': the reprod-code ', ecoCode.reprod{j}, ' is not recognized\n']);
   end
  end

end
