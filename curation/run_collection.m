%% run_collection
% generates files for AmP website 

%%
function run_collection(varargin)
% created 2016/11/13 Bas Kooijman and Starrlight Augustine
% modified 2017/04/26, 2018/02/13, 2018/03/28, 2018/04/13, 2019/07/21, 2019/12/30, 2020/05/17 Bas Kooijman

%% Syntax
% <../run_collection.m *run_collection*> (varargin)

%% Description
% Writes html and bib pages and popStat.mat in entries_web and zip file in entries_zip.
% Deletes .cache, .wn, .asv, .bib,  .bbl', .html files from entries.
% Calls function bib2html, which writes and deletes the .aux file as source for Bibtex, runs Bibtex, which writes a bbl-file, which is also deleted.
% Writes my_pet_toolbar.html, which is included by my_pet_res.html, my_pet_par.html, my_pet_stat.html and my_pet_pop.html.
%
% Input:
%
% * varargin: optional cell array with entry names, or character string with entry or node names (default 'Animalia')
%
% Output:
%
% * 1 bib-file, 4 html-files and 4 png-files per entry are written in ../entries_web 
% * 1 zip-file is written in ../entries_zip

%% Remarks
% run_collection_intro to generate about and access files for the collection

%% Example of use
% * run_collection or 
% * run_collection('Mola_mola') or
% * run_collection('Mola_mola', 'Molva_molva') or
% * run_collection({'Mola_mola', 'Molva_molva'}) or 
% * run_collection('Clitellata');

if isempty(varargin)
  varargin = select('Animalia');
elseif ~iscell(varargin{1}) && isempty(strfind(varargin{1},'_'))
  varargin = select(varargin{1});
elseif iscell(varargin{1})    
  varargin = varargin{:}; % unpack cell string  
end

%check_results(varargin); % warn if parameters in results do not match those in pars_init

% path setting for curators 
cur2ew = '../../deblab/add_my_pet/entries_web/'; % path from AmPtool/curation to entries_web
cur2e = '../../deblab/add_my_pet/entries/'; % path from AmPtool/curation to entries

nargin = length(varargin); % number of entries to scan    
WD = cdCur;

for i = 1:nargin 
  cur2ewmp = [cur2ew, varargin{i},'/']; % path from AmPtool/curation to entries_web/my_pet
  cur2emp = [cur2e, varargin{i},'/']; % path from AmPtool/curation to entries/my_pet
  mkdir(cur2ewmp);
  cd(cur2emp); % goto entry i in dir entries
  fprintf(' %g : %s \n', i, varargin{i}); % report progress to screen 
  
  feval(['run_', varargin{i}]); close all;
  load(['results_', varargin{i}, '.mat']); % load results_my_pet.mat 
  [data, auxData, metaData, txtData] = feval(['mydata_',metaData.species]); % run mydata_* to create data files
  prdData = feval(['predict_',metaData.species], par, data, auxData); % run predict_* to compute predictions
  prdData = predict_pseudodata(par, data, prdData); % appends new field to prdData with predictions for the pseudo data:  
  delete('*.cache', '*.wn', '*.asv', '*.bib', '*.bbl', '*.html') % delete unwanted and bib files

  cd('../../entries_zip'); % goto add_my_pet/entries_zip from  add_my_pet/entries/my_pet
  filenm = zip_my_pet(varargin{i}, '../entries'); % zip the entry and save
  % !Rscript zip2DataOne.r
  doi = 'xxxxxx';
  
  % print files
  cdCur;
  prt_my_pet_toolbar(varargin{i}, cur2ewmp);                                      % my_pet_toolbar.html
  prt_my_pet_bib(metaData.species, metaData.biblist, cur2ewmp);                   % my_pet_bib.bib 
  bib2html([metaData.species, '_bib'], cur2ewmp);                                 % my_pet_bib.html 
  prt_my_pet_cit(metaData, doi, cur2ewmp);                                        % citation.html
  prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar, cur2ewmp);   % my_pet_res.html
  prt_my_pet_par(metaData, metaPar, par, txtPar, cur2ewmp);                       % my_pet_par.html
  prt_my_pet_stat(metaData, metaPar, par, cur2ewmp);                              % my_pet_stat.html, including pie-png's
   
  % get reprodCode, which is used in prt_my_pet_pop
  close all
  if any(ismember({'z_m','E_Hbm','E_Hxm','E_Hjm','E_Hpm'},fieldnames(par)))
    prt_my_pet_pop({metaData, metaPar, par}, [], [], [], cur2ewmp, 1);    % my_pet_pop.html, including fig's
  else
    prt_my_pet_pop({metaData, metaPar, par}, [], '0.5', [], cur2ewmp, 1); % my_pet_pop.html, including fig's
  end
  close all
  fclose all;
end

cd(WD);
