%% prt_review
% prints a tabular in Latex with species, data, refs

%%
function  prt_review(taxa, filenm)
% created 2021/09/27 by Bas Kooijman

%% Syntax
% <prt_review *prt_review*>(taxa, filenm)

%% Description
% prints tabular in Latex with species, data, refs and and bib-file in local directory.
% Output files have extensions .tex and .bib, respectively.
%
% Input:
%
% * taxa: string or cell array with name(s) of taxa
% * filenm: optional string with name of output files without extension; default: 'table'
% 
% Output
%
% * No explicit output, but files filenm.tex, filenm.bib and codes.tex are written

%% Remarks
% Species names are sorted alphabetically.
% In Latex document: \include{tabular} ... \include{codes} ... \bibliography{...,tabular}

%% Example
% prt_review('Cephalopoda')

  if ischar(taxa)
    species = sort(select(taxa));
  else
    n = length(taxa); species = select(taxa{1});
    for i = 2:n
      species = [species; select(taxa{i})];
    end
    species = sort(species);
  end
  n_spec = length(species);
  
  if ~exist('filenm','var')
    filenm = 'tabular';
  end
  
  fid_tex = fopen([filenm, '.tex'], 'w+');
  fid_bib = fopen([filenm, '.bib'], 'w+');
  
  fprintf(fid_tex, '\\begin{tabular}{lll} \\hline\n');
  fprintf(fid_tex, 'species & data & references \\\\ \\hline\n');
  data_0 = cell(0,1); data_1 = cell(0,1);
  
  WD = cdCur;
  for i=1:n_spec
    cdEntr(species{i});
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
    bibkey([1 2]) = ''; % remove first ,
    fprintf(fid_tex, '%s &  %s & \\citet{%s} \\\\\n', strrep(species{i}, '_', ' '), prtCell(data), bibkey);
    
    cd(['../../entries_web/', species{i}])
    fprintf(fid_bib, '%s', fileread([species{i}, '_bib.bib']));
  end
  
  fprintf(fid_tex, '\\hline\n');
  fprintf(fid_tex, '\\end{tabular}\n');
  fclose all;
  
  cd(WD);
  
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
  fprintf(codes_tex, '\\begin{tabular}{ll|ll} \\hline\n');
  fprintf(codes_tex, 'code & description & code & description\\\\ \\hline\n');
  for i = 1 : max(n_0,n_1)
    fprintf(codes_tex, '%s & %s & %s & %s\\\\ \n', strrep(data_0{i,1},'_','\_'), data_0{i,2}, strrep(data_1{i,1},'_','\_'), data_1{i,2});
  end
  fprintf(codes_tex, '\\hline\n');
  fprintf(codes_tex, '\\end{tabular}\n');
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
