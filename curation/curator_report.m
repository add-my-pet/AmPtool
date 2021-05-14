%% curator_report
% Produces a report to help curators review an entry that has been submitted to the AmP collection 

%%
function curator_report(my_pet, steps)
  % created 2015/08/01 by Goncalo Marques
  % modified 2015/08/06 Dina Lika, 2018/01/23 by Bas Kooijman, 2018/04/15
  % Starrlight, 2018/08/20, Bas Kooiijman 2021/04/10, 2021/05/11
  
  %% Syntax 
  % <../curator_report.m *curator_report*> (my_pet, steps)

  %% Description
  % Produces step by step instuctions and information to help curators analyse a submission.
  %
  % Input
  %
  % * my_pet: string with species name
  % * steps: optional scalar or vector with step numbers for which the report should execute (default all steps) 
  %
  %   - 1: Check species name and lineage
  %   - 2: Check ecocodes
  %   - 3: Run check_data for data_0, data_1 and COMPLETE
  %   - 4: Check links
  %   - 5: Check bibliography and url's
  %   - 6: Check absence of escaped characters in comment, discussion, facts
  %   - 7: Checking extra parameters   
  %   - 8: Check which parameters were estimated
  %   - 9: Check if results_my_pet.mat matches pars_init_my_pet.m
  %   - 10: Check implied properties 
  %   - 11: Make sure figures are saved (this only prints if the full report is executed)
  %   - 12: Check weights
  %  
  % Output is printed to screen

  %% Remarks
  % This function is supposed to be run in the directory of the source, which has the required files: mydata_my_pet.m, pars_init_my_pet.mat 
  
  %% Examples of use
  %
  % * curator_report('my_pet') % execute all steps 
  % * curator_report('my_pet', 2) % only execute step 2  

if  ~exist('steps', 'var') || isempty(steps)
  steps = 1:12;
end
  
[~, ~, metaData, ~, weights] = feval(['mydata_', my_pet]);
[par, metaPar, txtPar] = feval(['pars_init_', my_pet], metaData);

n_step = length(steps);
for i_step = 1:n_step
  step = steps(i_step);
  switch step
    case 1 % Check species name and lineage
      fprintf('\n Step %d: Checking if the species is already in AmP and correctness of lineage:\n\n', step);
      flag = check_speciesnm(my_pet);
      if ~(flag == 1 || flag == 3)
        fprintf('Warning: possible issues with species name and/or lineage\n');
      elseif ~ismember(metaData.phylum, list_taxa('Animalia',7))
        fprintf('Warning from curator_report: phylum not in AmP\n');
      end

    case 2 % Check ecocodes
      fprintf('\n Step %d: Checking ecoCodes for existence:\n\n', step);
      info = check_eco(my_pet);
      if info
        fprintf('All ecoCodes exist\n\n')
      end

    case 3 % Run check_data for data_0, data_1 and COMPLETE
      fprintf('\n Step %d: Checking Data types and COMPLETE:\n\n', step);
      check_data(my_pet);
      fprintf('\nCheck the consistency between metaData and data.\n');
      fprintf('Check that the labels for each data type are used and consistent with the contents.\n');
      fprintf('Contact the web administrator with any new labels that should be added to the table. \n');

    case 4 % Check links
      fprintf('\n Step %d: Checking links:\n\n', step);    
      get_links(my_pet, 1); % opens all links in your system-browser; in failure use edit_links
      
    case 5 % Check bibliography and url's
      fprintf( '\n Step %d. Check Bibliography', step);
      [~, ~, metaData] = feval(['mydata_', my_pet]); % get metaData.biblist
      prt_my_pet_bib(my_pet, metaData.biblist) % biblist2bib
      % bib2bbl([my_pet,'_bib']);                % runs Bibtex to convert bib to bbl
      bib2html([my_pet,'_bib']);               % converts bbl to html
      web([my_pet,'_bib.html'],'-browser');    % open html of bibliography in system browser
      fprintf('*****************************************************************  \n');
      fprintf('*********** Check the bibliography carefully ********************  \n');
      fprintf('*****************************************************************  \n');
      fprintf('Formatting problems that appear in the html come from formatting errors in the mydata files.\n');
      fprintf('Title field: \n');
      fprintf('Species (and genus) names are in italic and the first character of the genus name is in upper case.\n');
      fprintf('Species names in the title field are italisized using \\emph{}\n');
      fprintf('Other taxa (family, order, class etc) should not be in italics, but the first character in upper case.  \n');
      fprintf('Common names in lower case. \n');
      fprintf('First character of country and site names require upper cases. \n');
      fprintf('Do not use nested braces in \\emph or \\textit; \\em accepts nested braces \n')
      fprintf('Put braces around the letters than need to be upper case: e.g. {Y}ellow {S}tone {N}ational {P}ark  \n');
      fprintf('Authors field: Check that names appear correctly \n');
      fprintf('Howpublished field:  make sure url''s do not contain the character %% \n');
      fprintf('DOI field: this is obligatory when applicable (most articles) and must be implemented if absent \n');
      fprintf('ISBN field: this is obligatory when applicable (books) and must be implemented if absent  \n');
      fprintf('General things:\n');
      fprintf('Some bib''s might be used in pars_init; check_my_pet does not check this. Make sure those ref are in the mydata file. \n');
      fprintf('Use Latex-rules to construct special characters (such as accents), else html cannot show them.  \n');
      fprintf('Like in standard Bibtex, authors and journals should only have first characters in uppercase, the rest in lower case.     \n');
      fprintf('Check the standard entry types here: https://en.wikipedia.org/wiki/BibTeX#Bibliographic_information_file \n');
      fprintf('Check that the links to web pages in the references list actually work. \n');
      fprintf('*****************************************************************  \n');
      fprintf('*****************************************************************  \n\n');
      delete([my_pet,'_bib.bib'],[my_pet,'_bib.html']); % delete produced files
      
    case 6 % Check absence of escaped characters in comment, discussion, facts
      fprintf('\n Step %d: Check absence of escaped characters in comment, discussion, facts\n\n', step);
      info = 1;
      if isfield(metaData, 'comment')
        flds = fieldnames(metaData.comment); n_fld = length(flds);
        for i_fld = 1:n_fld
          if ~isempty(strfind('\',metaData.coment.(flds{i_fld})))
            fprintf(['illegal escaped character in comment.', fld(i_fld), '\n']);  
            info = 0;
          end
        end
      end
      if isfield(metaData, 'discussion')
        flds = fieldnames(metaData.discussion); n_fld = length(flds);
        for i_fld = 1:n_fld
          if ~isempty(strfind('\',metaData.discussion.(flds{i_fld})))
            fprintf(['illegal escaped character in discussion.', fld(i_fld), '\n']);        
            info = 0;
         end
        end
      end
      if isfield(metaData, 'facts')
        flds = fieldnames(metaData.facts); n_fld = length(flds);
        for i_fld = 1:n_fld
          if ~isempty(strfind('\',metaData.facts.(flds{i_fld})))
            fprintf(['illegal escaped character in facts.', fld(i_fld), '\n']);        
            info = 0;
          end
        end
      end
      if info
        fprintf('No illegal escaped charaters found\n\n')
      end
      
    case 7 % Checking extra parameters    
      fprintf('\n Step %d: Checking extra parameters:\n\n', step);
      standChem = addchem([], [], [], [], metaData.phylum, metaData.class);
      parFields = fields(par);        standChemFields = fields(standChem);
      parFields  = setdiff(parFields, {'free'});
      nonChemParFields = setdiff(parFields, standChemFields);
      EparFields = get_parfields(metaPar.model);
      extraParFields = setdiff(nonChemParFields, EparFields);
      extraParFields = setdiff(extraParFields, {'T_ref', 'T_A', 'f'});
      fprintf('Extra parameters\n');
      for i = 1:length(extraParFields)
        fprintf([extraParFields{i}, ', ', txtPar.label.(extraParFields{i}), '\n']);
      end
      fprintf('*****************************************************************  \n');
      fprintf('*****************************************************************  \n');
      fprintf('Check if these extra paramaters are indeed used in predict.\n');
      fprintf('If it isn''t delete it from the pars_init.\n');
      fprintf('Check if there should exist customized filters involving these parameters.\n');
      fprintf('Check that there is a discussion point (in mydata) relating to the use of these extra parameters.\n');
      fprintf('Make sure that the labels for the scaled functional response specify\n which datasets they were used for.\n Look at the predict file and then add the datasets in the label in pars_init. \n');
      fprintf('*****************************************************************  \n');
      fprintf('*****************************************************************  \n\n');

    case 8 % Check which parameters were estimated
      fprintf('\n Step %d: Checking choice of free parameters:\n\n', step);
      standChem = addchem([], [], [], [], metaData.phylum, metaData.class);
      parFields = fields(par);        standChemFields = fields(standChem);
      parFields  = setdiff(parFields, {'free'});
      freeFixedFields = fields(par.free);
      freeFields = freeFixedFields(structfun(@(s) s==1, par.free));
      fixedFields = setdiff(freeFixedFields, freeFields);
      fprintf('Fixed parameters (excluding standard chemical pars with standard values)\n');
      for i = 1:length(fixedFields)
        if ~ismember(fixedFields{i}, standChemFields) || par.(fixedFields{i}) ~= standChem.(fixedFields{i}) % print if is not standard chemical or if it standard but with non-standard value
          fprintf([fixedFields{i}, ' = ', num2str(par.(fixedFields{i})), ' ', txtPar.units.(fixedFields{i}), ', ' , txtPar.label.(fixedFields{i}), '\n'])
        end
      end
      fprintf('\nCheck if the values above are standard or have been substantiated.\n\n');
      fprintf('Free parameters\n');
      for i = 1:length(freeFields)
        fprintf([freeFields{i}, ' = ', num2str(par.(freeFields{i})), ' ', txtPar.units.(freeFields{i}), ', ' , txtPar.label.(freeFields{i}), '\n']);
      end
      fprintf('********************************************************************  \n');
      fprintf('********************************************************************  \n');
      fprintf('Check if the values above are reasonable and if there is enough data to estimate them.\n');
      fprintf('If kappa < 0.3, or energy cond. v > 0.5 cm/d other local minima might exist with more realistic parameters\n');
      fprintf('*****************************************************************  \n');
      fprintf('*****************************************************************  \n\n');

      
    case 9 % Check if results_my_pet.mat matches pars_init_my_pet.m
      [infoPar, infoMetaPar, infoTxtPar] = matisinit(my_pet);
      if ~infoPar
        fprintf('Warning from matisinit: parameters differ between pars_init_my_pet.m and results_my_pet.mat\n');
      end
      if ~infoMetaPar
        fprintf('Warning from matisinit: meta parameters differ between pars_init_my_pet.m and results_my_pet.mat\n');
      end
      if ~infoTxtPar
        fprintf('Warning from matisinit: text for parameters differ between pars_init_my_pet.m and results_my_pet.mat\n');
      end
      if any([~infoPar, ~infoMetaPar, ~infoTxtPar])
        fprintf('Please run mat2pars_init\n');
      end
        
    case 10 % Check implied properties 
      fprintf('\n Step %d: Check implied model properties and parameter values of my_pet. Creates my_pet.html.\n\n', step);
      prnt = input('Enter: 1 to compute statistics else 0 to continue: ');
      if prnt
        prt_report_my_pet({par, metaPar, txtPar, metaData}, [], metaData.T_typical, 1);
        web(['report_',my_pet,'.html'],'-browser');    % open html of bibliography in system browser
        delete(['report_',my_pet,'.html']); % delete produced file
      end

    case 11 % Make sure figures are saved (this only prints if the full report is executed)
      fprintf('\n Step %d: make sure figures are saved\n\n', step);
      fprintf('\n Please, after the curation process, execute the run file with estim_option(''results_output'',3) \n\n');
      
    case 12 % Check weights
      fprintf('\n Step %d: Check weights\n\n', step);
      info = 0;
      fld = fields(weights.psd); n_fld = length(fld); 
      for i_fld = 1:n_fld
        if weights.psd.(fld{i_fld}) > 50 | weights.psd.(fld{i_fld}) < 0
          info = 1;
        end
      end
      weights = rmfield(weights, 'psd');
      fld = fields(weights); n_fld = length(fld); 
      for i_fld = 1:n_fld
        if weights.(fld{i_fld}) > 50 | weights.(fld{i_fld}) < 0
          info = 1;
        end
      end
      if info
        fprintf('\n It is rarely a good idea to work with large weights\n\n');
      else
        fprintf('\n No serious issues with weights\n\n');
      end
      
    otherwise
  end
  if i_step < n_step
    fprintf('Hit a key to continue\n'); pause
  end
end

