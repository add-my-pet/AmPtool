%% prt_review
% prints a tabular in Latex with species, data, refs

%%
function  prt_review(taxa, filenm)
% created 2021/09/27 by Bas Kooijman

%% Syntax
% <prt_review *prt_review*>(taxa, filenm)

%% Description
% prints tabular in Latex with species, data, refs and  bib-file and codes in local directory.
% Output files have extensions .tex and .bib and .tex, respectively.
%
% Input:
%
% * taxa: string or cell array with name(s) of taxa
% * filenm: optional string with name of output files without extension; default: 'species'
% 
% Output
%
% * No explicit output, but files filenm.tex, filenm.bib and codes.tex are written

%% Remarks
% * First tries to find entries locally, then gets them from internet using system (= Windows/Mac) function wget. 
% * Species names are sorted alphabetically.
% * Only bib-items with bibkeys of the type txt1**** or txt2**** are stored, and repeated bibkeys are skipped
% In header of Latex document:\usepackage{longtable} and \usepackage[sort&compress,comma,authoryear]{natbib}
% * In Latex document: \include{species} ... \include{codes} ... \bibliographystyle{apalike} and \bibliography{...,species}

%% Example
% prt_review('Cephalopoda')

  path_entries = [set_path2server, 'add_my_pet/entries/'];         % only used if entries are not local
  path_entries_web = [set_path2server, 'add_my_pet/entries_web/']; % only used if entries are not local
  
  if ischar(taxa)
    species = sort(select(taxa));
  elseif ~isempty(strfind(taxa{1},'_'))
    species = taxa;  
    taxa = 'selected species';
  else
    n = length(taxa); species = select(taxa{1});
    for i = 2:n
      species = [species; select(taxa{i})];
      taxa = strrep([taxa{1}, ' and ', taxa{2}],'_',' ');
    end
    species = sort(species);
  end
  n_spec = length(species);
  
  if ~exist('filenm','var')
    filenm = 'species';
  end
  
  fid_tex = fopen([filenm, '.tex'], 'w+');
  fid_bib = fopen([filenm, '.bib'], 'w+');
  
  % header species table
  fprintf(fid_tex, '{\\footnotesize');
  fprintf(fid_tex, '\\begin{longtable}[c]{p{3.5cm}p{5.5cm}p{5.5cm}} \n');
  fprintf(fid_tex, '\\caption{\\label{tab:%s}\\protect\\small\n', filenm);
  fprintf(fid_tex, '%s species that are included in the AmP collection at %s, the data types as extracted from the literature and selected references. ',taxa, datestr(datenum(date),'yyyy/mm/dd'));
  fprintf(fid_tex, 'Besides these references, websites for have used to get data, which are presented on the AmP website. ');
  fprintf(fid_tex, 'The codes of the data types are presented in Table~\\ref{tab:codes}}. \\\\ \n\n');
  
  fprintf(fid_tex, '\\hline\n');
  fprintf(fid_tex, '\\textbf{species} & \\textbf{data} & \\textbf{references} \\\\ \\hline\n');
  fprintf(fid_tex, '\\hline\n');
  fprintf(fid_tex, '\\endfirsthead\n\n');
  
  fprintf(fid_tex, '\\hline\n');
  fprintf(fid_tex, '\\multicolumn{3}{|c|}{Continuation of Table \\ref{tab:species}} \\\\ \n');
  fprintf(fid_tex, '\\hline\n');
  fprintf(fid_tex, '\\textbf{species} & \\textbf{data} & \\textbf{references} \\\\ \n');
  fprintf(fid_tex, '\\hline\n');
  fprintf(fid_tex, '\\endhead\n\n');

  data_0 = cell(0,1); data_1 = cell(0,1); bibCum = '';
  WDir = pwd;
  
  for i=1:n_spec
    fprintf('%s\n',species{i}); % monitor progress
    try     
     WD = cdEntr(species{i});
     local = 1; % get files local
    catch
      local = 0; % get files via internet
%       if ismac || isunix
%         system(['wget -O mydata_', species{i}, '.m ', path_entries, species{i}, '/mydata_', species{i}, '.m']);
%         system(['wget -O ', species{i}, '_bib.bib ', path_entries_web,  species{i}, '/', species{i}, '_bib.bib']);
%       else
%         system(['powershell wget -O mydata_', species{i}, '.m ', path_entries, species{i}, '/mydata_', species{i}, '.m']);
%         system(['powershell wget -O ', species{i}, '_bib.bib ', path_entries_web,  species{i}, '/', species{i}, '_bib.bib']);
%       end
      urlwrite([path_entries, species{i}, '/mydata_', species{i}, '.m'], ['mydata_', species{i}, '.m']);
      urlwrite([path_entries_web,  species{i}, '/', species{i}, '_bib.bib'], [species{i}, '_bib.bib']);
    end
    eval(['[~, ~, metaData, txtData] = mydata_', species{i}, ';']);
    data = [metaData.data_0(:); metaData.data_1(:)];
    data_0 = [data_0; metaData.data_0(:)]; data_1 = [data_1; metaData.data_1(:)]; 
    refs = fields(txtData.bibkey); n_refs = length(refs); bibkey = '*'; 
    for j = 1:n_refs
      ref = txtData.bibkey.(refs{j}); 
      if ischar(ref)
        if length(ref)>4 & isempty(strfind(bibkey,ref)) & (strcmp(ref(end-3),'1') | strcmp(ref(end-3),'2')) 
          bibkey = [bibkey, ',', ref];
        end    
      else
        n_ref = length(ref);
        for k = 1:n_ref
          refk = ref{k};
          if length(refk)>4 & isempty(strfind(bibkey,refk)) & (strcmp(refk(end-3),'1') | strcmp(refk(end-3),'2')) 
            bibkey = [bibkey, ',', refk];
          end
        end
      end
    end    
    if length(bibkey)>2; bibkey([1 2]) = ''; else bibkey = ''; end; % remove first ,
    fprintf(fid_tex, '\\emph{%s} &  %s & \\citet{%s} \\\\\n', strrep(species{i}, '_', ' '), prtCell(data), bibkey);
    
    % add bib, skipping refs to sites and Kooy2010
    if local
      cd(['../../entries_web/', species{i}])
    end
    bib = fileread([species{i}, '_bib.bib']);
    bibs = strsplit(bib,[char(10),'@']); n_bib = length(bibs); bib = ''; 
    for j = 1:n_bib
      if length(bibs{j}) > 4
        bibkey = bibs{j}; j_0 = strfind(bibkey,'{') + 1; j_1 = strfind(bibkey,',') - 1; bibkey = bibkey(j_0(1):j_1(1));
        if length(bibkey) > 4 & (strcmp(bibkey(end-3),'1') | strcmp(bibkey(end-3),'2')) & ~strcmp(bibkey,'Kooy2010') & isempty(strfind(bibCum,['{',bibkey]))
          bib = [bib, char(10), '@', bibs{j}];
        end
      end
    end
    fprintf(fid_bib, '%s', bib);
    bibCum = [bibCum, bib]; % store to avoid repeated bibkeys
    if ~local
      delete(['mydata_', species{i}, '.m']);
      delete([species{i}, '_bib.bib']);
    end
  end
  
  fprintf(fid_tex, '\\hline\n');
  fprintf(fid_tex, '\\end{longtable}}\n');
  fclose all;
  
  cd(WDir);
  
  % table with data codes
  data_0 = unique(data_0); data_1 = unique(data_1); % actual data types
  [Data_0, Data_1] = get_data_codes;
  sel_0 = ismember(Data_0(:,1),data_0); sel_1 = ismember(Data_1(:,1),data_1); 
  data_0 = Data_0(sel_0,:); data_1 = Data_1(sel_1,:); n_0 = size(data_0,1); n_1 = size(data_1,1); 
  n = abs(n_1 - n_0); fill = cell(n,2); for i = 1:n; fill(i,:) = {' ', ' '}; end
  if n_0 < n_1
    data_0 = [data_0; fill];
  else
    data_1 = [data_1; fill];
  end

  codes_tex = fopen('codes.tex', 'w+');
  fprintf(codes_tex, '\\begin{table}\\small\n');
  fprintf(codes_tex, '\\caption{\\label{tab:codes}\\protect\\small\n');
  fprintf(codes_tex, 'The codes of the data types as presented in Table \\ref{tab:%s}. \n', filenm);
  fprintf(codes_tex, 'Zero variate data left, uni-variate data right. \n');
  fprintf(codes_tex, 'Life history events: b birth, s settlement, j end of acceleration, p puberty, m death, i death. \n');
  fprintf(codes_tex, 'T stands for temperature. }\n');
  fprintf(codes_tex, '\\begin{tabular}{ll|ll} \\hline\n');
  fprintf(codes_tex, '\\textbf{code} & \\textbf{description} & \\textbf{code} & \\textbf{description}\\\\ \\hline\n');
  for i = 1 : max(n_0,n_1)
    d0 = strrep(data_0{i,2},'_2','$_2$'); d0 = strrep(d0,'_3','$_3$'); 
    d1 = strrep(data_1{i,2},'_2','$_2$'); d1 = strrep(d1,'_3','$_3$');
    fprintf(codes_tex, '%s & %s & %s & %s\\\\ \n', strrep(data_0{i,1},'_','\_'), d0, strrep(data_1{i,1},'_','\_'), d1);
  end
  fprintf(codes_tex, '\\hline\n');
  fprintf(codes_tex, '\\end{tabular}\n');
  fprintf(codes_tex, '\\end{table}\n');
  fclose all;
  
end

function txt = prtCell(array)
  n = length(array); txt = '';
  for i = 1:n
    txt = [txt, ', ', array{i}];
  end
  txt([1 2]) = '';
  txt = strrep(txt, '_', '\_');
end
