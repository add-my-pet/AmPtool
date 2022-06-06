%% prt_pie_SGGJR_tex
% presents pies for allocation at birth, puberty, ultimate & cum investment at birth

%%
function  prt_pie_SGGJR_tex(path_in, path_out)
% created 2017/05/11 by Bas Kooijman

%% Syntax
% pSGGJR = <../prt_pie_SGGJR_tex.m *prt_pie_SGGJR_tex*> (path_in, path_out)

%% Description
% Writes 4 tex-documents that present the pies of output of <../pie_SGGJR.m *pie_SGGJR*> for all entries in parent dir of entrie_admin
%
% Input:
%
% * path_in: optional character string path to input png-files (default 'http://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/')
% * path_out: optional character string path for output tex-files (default '../entries_pie'
%
% Output: 
% 
% * writes files pie_pSGJRb.tex, pie_pSGJRp.tex, pie_pSGJRi.tex, pie_SGJRb.tex
% * copies png files for all pies to path_out/img

%% Remarks
% Function prt_pie_SGGJR_tex is 
%
% * assumed to be ran in entries_admin, 
% * using <../select.m *select*> to identify entry names.

%% Example of use
% prt_pie_SGGJR_tex

  if ~exist('path_in', 'var') || isempty('path_in')
    path_in = 'http://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/';
  end
  if ~exist('path_out', 'var') || isempty('path_out')
    path_out = '../../entries_pie/';
  end

  pie = {'pie_pSGJRb', 'pie_pSGJRp', 'pie_pSGJRi', 'pie_SGJRb'}; n_pie = length(pie);
  entries = select; n_entries = length(entries);
    
  for i = 1:n_pie
    fid_out = fopen([path_out, pie{i}, '.tex'], 'w+'); % open file for writing, delete existing content

    % write header
    fprintf(fid_out, '\\documentclass[12pt]{article}\n\n');
    fprintf(fid_out, '\\pdfoutput=1\n');
    fprintf(fid_out, '\\usepackage{fullpage,graphicx}\n\n');
    fprintf(fid_out, '\\begin{document}\n\n');
    fprintf(fid_out, '\\pagestyle{myheadings}\n');
    header = [datestr(date,26), ' ', strrep(pie{i},'_',' ')];
    fprintf(fid_out,['\\markboth{', header, '}{', header, '}\n']);
    fprintf(fid_out, '\\setlength{\\unitlength}{1cm}\n\n');
 
    % write pictures
    for j = 1:n_entries
      % copy png from web to local
      imwrite(imread([path_in, entries{j}, '_', pie{i}, '.png']), [path_out, '/img/', entries{j}, '_', pie{i}, '.png']);
      
      % set offset for 3 png's per row
      if mod(j,3) == 1
        x_png = num2str(-0.5); x_txt = num2str(1.5);
      elseif mod(j,3) == 2;
        x_png = num2str(0); x_txt = num2str(2);
      else
        x_png = num2str(0.5); x_txt = num2str(2.5);
      end
      
      % write to tex file
      fprintf(fid_out, '\\begin{picture}(5.3,7)\n');
      fprintf(fid_out,['  \\put(', x_png,',0){\\scalebox{.23}{\\includegraphics{img/', entries{j}, '_', pie{i}, '.png}}}\n']);
      fprintf(fid_out,['  \\put(', x_txt,',0){\\emph{', strrep(entries{j},'_',' '),'}}\n']);
      fprintf(fid_out, '\\end{picture}\n');
      if mod(j,3) == 0
        fprintf(fid_out, '\n\n');  
      end
    end

    % write tail
    fprintf(fid_out, '\\end{document}\n\n');
    fclose(fid_out);

  end

end

