%% check_eco
% Checks eco labels 

%%
function info = check_eco(varargin)
% created 2018/04/12 by Bas Kooijman, modified 2019/12/28, 2021/04/10

%% Syntax
% info = <../check_eco.m *check_eco*>(varargin)

%% Description
% Checks eco labels as specified in get_eco for existence in global eco_types. 
%
% Input:
%
% * varargin: optional character or cell string with name(s) of entry (default: select('Animalia')) 
%
% Output
%
% * info: boolean for all codes exist (1), or not (0)

%% Remarks
% ecotypes for the entries are read from metaData outputted from mydata-files. If not present, the mydata files are copied from the AmP site
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

n = length(varargin); info = 1;

stage = { ...
    '0i','0e','0p','0j','0x','0b', ...
    'bi','be','bp','bj','bx', ...
    'xi','xe','xp','xj', ...
    'ji','je','jp', ...
    'pi','pe', ...
    'ei'};

for i = 1:n % scan entries
  % get metaData
  fnm = ['mydata_', varargin{i}]; 
  if exist([fnm, '.m'],'file')
    [~, ~, metaData] = feval(fnm); % run the mydata file
  else
    path = [set_path2server, 'add_my_pet/entries/', varargin{i}, '/'];
    if ismac || isunix
      info = system(['wget -O mydata_', varargin{i}, '.m ', path, 'mydata_', varargin{i}, '.m']);
    else
      info = system(['powershell wget -O mydata_', varargin{i}, '.m ', path, 'mydata_', varargin{i}, '.m']);
    end
    if info == 0
      [~, ~, metaData] = feval(fnm); % run the mydata file
      delete([fnm,'.m']);
    else
      return
    end
  end
  reprod = ''; vars_pull(metaData.ecoCode); % assign [climate, ecozone, habitat, embryo, migrate, food, gender, reprod]
 
  n_C = length(climate);
  for j = 1:n_C 
    if ~ismember(climate{j},C)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the climate-code ', climate{j}, ' is not recognized\n']);
    end
  end

  n_E = length(ecozone);
  for j = 1:n_E 
    if ~ismember(ecozone{j},E)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the ecozone-code ', ecozone{j}, ' is not recognized\n']);
      info = 0;
    end
  end

  n_H = length(habitat);
  for j = 1:n_H 
    code = habitat{j}; code_stage = code(1:2); code_H = code(3:end);
    if ~ismember(code_H,H) || ~ismember(code_stage,stage)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the habitat-code ', code, ' is not recognized\n']);
      info = 0;
    end
  end

  n_B = length(embryo);
  for j = 1:n_B 
    if ~ismember(embryo{j},B)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the embryo-code ', embryo{j}, ' is not recognized\n']);
      info = 0;
    end
  end

  n_M = length(migrate);
  for j = 1:n_M 
    if ~ismember(migrate{j},M)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the migrate-code ', migrate{j}, ' is not recognized\n']);
      info = 0;
    end
  end

  n_F = length(food);
  for j = 1:n_F 
    code = food{j}; code_stage = code(1:2); code_F = code(3:end);
    if ~ismember(code_F,F) || ~ismember(code_stage,stage) || ~isempty(strfind(code_stage,'0'))
      fprintf(['Warning from check_eco for ', varargin{i}, ': the food-code ', code, ' is not recognized\n']);
      info = 0;
    end
  end

  n_G = length(gender);
  for j = 1:n_G 
    if ~ismember(gender{j},G)
      fprintf(['Warning from check_eco for ', varargin{i}, ': the gender-code ', ecoCode.gender{j}, ' is not recognized\n']);
      info = 0;
    end
  end

  n_R = length(reprod);
  for j = 1:n_R 
   if ~ismember(reprod{j},R)
     fprintf(['Warning from check_eco for ', varargin{i}, ': the reprod-code ', ecoCode.reprod{j}, ' is not recognized\n']);
     info = 0;
   end
  end

end
