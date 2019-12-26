%% run_convert

function run_convert(varargin)
% inserts ecoCode and links in metaData of mydata
% writes .mat and zip

if isempty(varargin)
  varargin = select('Animalia');
elseif ~iscell(varargin{1}) && isempty(strfind(varargin{1},'_'))
  varargin = select(varargin{1});
elseif iscell(varargin{1})    
  varargin = varargin{:}; % unpack cell string  
end

nargin = length(varargin); % number of entries to scan    
WD = pwd; % store current path
cd(['../../add_my_pet/entries/', varargin{1}]); % goto entry i in dir entries

for i = 1:nargin 
  
  % write mydata_my_pet
  fprintf(' %g : %s \n', i, varargin{i}); % report progress to screen 
  cd(['../', varargin{i}]); WDi = pwd; % goto entry i 
  [mydata, info] = convert_mydata(varargin{i});
  if info == 0
    return
  end
  oid = fopen(['mydata_', varargin{i}, '.m'], 'w+'); 
  fprintf(oid, '%s', mydata);
  fclose(oid);
  
  % write results_my_pet.mat
  load(['results_', varargin{i}]);
  eval(['[~, ~, metaData, ~, ~] = mydata_', varargin{i},';']);
  save(['results_', varargin{i}, '.mat'], 'par', 'txtPar', 'metaPar', 'metaData');
  
  % write my_pet_yyyymmdd.zip
  cd('../../entries_zip');
  nms = cellstr(ls);
  nm = nms(~cellfun(@isempty,strfind(nms,varargin{i})));
  unzip(nm{1}); % creates folder that will be removed
  cd(varargin{i});
  oid = fopen(['mydata_', varargin{i}, '.m'], 'w+'); 
  fprintf(oid, '%s', mydata);
  fclose(oid);
  cd ../;
  zip(nm{1}, varargin{i}); 
  rmdir(varargin{i},'s');
  cd(WDi); % go back ti current entry

end
cd(WD);
