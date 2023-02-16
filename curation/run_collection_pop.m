%% run_collection_pop
% generates files for AmP website 

%%
function run_collection_pop(varargin)
% created 2016/11/13 Bas Kooijman and Starrlight Augustine; modified 2017/04/26, 2018/02/13, 2018/03/28, 2018/04/13, 2019/07/21 Bas Kooijman

%% Syntax
% <../run_collection_pop.m *run_collection_pop*> (varargin)

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
% make sure that get_eco gives non-empty values for all species in varargin.
% run_collection_intro to generate about and access files for the collection

%% Example of use
% run_collection_pop or 
% run_collection_pop('Mola_mola') or
% run_collection_pop('Mola_mola', 'Molva_molva') or
% run_collection_pop({'Mola_mola', 'Molva_molva'}) or 
% run_collection_pop('Clitellata');

if isempty(varargin)
  varargin = select('Animalia');
elseif ~iscell(varargin{1}) && isempty(strfind(varargin{1},'_'))
  varargin = select(varargin{1});
elseif iscell(varargin{1})    
  varargin = varargin{:}; % unpack cell string  
end

nargin = length(varargin); % number of entries to scan    
WD = cdCur; % store current path and goto AmPtool/curation
cur2ewmp = '../../deblab/add_my_pet/entries_web/'; % path from AmPtool/curation to entries_web/my_pet
cur2emp = '../../deblab/add_my_pet/entries/'; % path from AmPtool/curation to entries/my_pet

for i = 1:nargin 
  destinationFolder = [cur2ewmp, varargin{i},'/']; % target for html and png files
  fprintf(' %g : %s \n', i, varargin{i}) % report progress to screen 
  
  cd([cur2emp, varargin{i}]) % goto entry i in dir entries
  load(['results_', varargin{i}, '.mat']) % load results_my_pet.mat 
  %[data, auxData, metaData, txtData] = feval(['mydata_',metaData.species]); % run mydata_* to create data files
  %prdData = feval(['predict_',metaData.species], par, data, auxData); % run predict_* to compute predictions
  %prdData = predict_pseudodata(par, data, prdData); % appends new field to prdData with predictions for the pseudo data:  
  %delete('*.cache', '*.wn', '*.asv', '*.bib', '*.bbl', '*.html') % delete unwanted and bib files
  cd(WD) % goto orginal path, but print to destinationFolder

  %cd('../../entries_zip');
  %filenm = zip_my_pet(varargin{i}, '../entries'); % zip the entry en save
  % !Rscript zip2DataOne.r
  %doi = 'xxxxxx';
  %cd(WD)  % goto original path    

  % get reprodCode, which is used in prt_my_pet_pop
  reprodCode = metaData.ecoCode.reprod;
  
  %mkdir(destinationFolder); 2022/12/14 repair Y_VX
  
  % print files
  %prt_my_pet_toolbar(metaData.species,metaData.species_en,metaData.date_acc, destinationFolder) % my_pet_toolbar.html
  %prt_my_pet_bib(metaData.species, metaData.biblist, destinationFolder)                         % my_pet_bib.bib 
  %bib2html([metaData.species, '_bib'], destinationFolder)                                       % my_pet_bib.html 
  %prt_my_pet_cit(metaData, doi, destinationFolder)                                              % citation.html
  %prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar, destinationFolder)         % my_pet_res.html
  %prt_my_pet_par(metaData, metaPar, par, txtPar, destinationFolder)                             % my_pet_par.html
  %prt_my_pet_stat(metaData, metaPar, par, destinationFolder)                                    % my_pet_stat.html, including pie-png's
  
  if any(ismember({'z_m','E_Hbm','E_Hsm','E_Hxm','E_Hjm','E_Hpm'},fieldnames(par)))
    prt_my_pet_pop({metaData, metaPar, par, reprodCode{1}}, [], [], [], destinationFolder, 1);    % my_pet_pop.html, including fig's
  else
    prt_my_pet_pop({metaData, metaPar, par, reprodCode{1}}, [], '0.5', [], destinationFolder, 1); % my_pet_pop.html, including fig's
  end

  end
    
close all
