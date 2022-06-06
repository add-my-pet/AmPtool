%% run_citation
% generates citation files for AmP website 

%%
function run_citation
% created 2019/02/09 Bas Kooijman 

%% Syntax
% <../run_citatation.m *run_citation*> 

%% Description
% Writes citation.html
%
% Output:
%
% * 1 html-file is written in ../entries_web 


%% Example of use
% run_cit

varargin = select('Animalia');

nargin = length(varargin); % number of entries to scan    
WD = pwd; % store current path

for i = 1:nargin 
  destinationFolder = ['../../entries_web/', varargin{i},'/']; % target for html and png files
  mkdir(destinationFolder);
  fprintf(' %g : %s \n', i, varargin{i}) % report progress to screen 
  
  cd(['../../entries/', varargin{i}]) % goto entry i in dir entries
  %
  load(['results_', varargin{i}, '.mat']) % load results_my_pet.mat 
  [data, auxData, metaData, txtData] = feval(['mydata_',metaData.species]); % run mydata_* to create data files
  cd(WD) % goto orginal path, but print to destinationFolder

  % !Rscript zip2DataOne.r
  doi = 'xxxxxx';
  cd(WD)  % goto original path    

  % print files
  prt_my_pet_cit(metaData, doi, destinationFolder)                                              % citation.html
end
    
close all
