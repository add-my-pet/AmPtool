%% prt_my_pet_res
% read and write my_pet_res.html

%%
function prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar, destinationFolder)
% created 2015/04/11 by Starrlight & Goncalo Marques; modified 2015/08/23 Starrlight augustine; 
% modified 2016/03/09 Bas Kooijman; 2016/09/21 Starrlight Augustine;
% 2016/11/05, 2017/01/04, 2017/08/21, 2017/09/29, 2017/10/13, 2017/10/26, 2018/02/06, 2018/04/28, 2018/05/05, 2018/06/21 Bas Kooijman

%% Syntax
% <../prt_my_pet_res.m *prt_my_pet_res*> (data, prdData, auxData, metaData, txtData, metaPar, destinationFolder)

%% Description
% Prints my_pet_res.html file which compares metapar.model predictions with data
%
% Input:
%
% * data: structure (output of <http://www.debtheory.org/wiki/index.php?title=Mydata_file *mydata_my_pet_par*> file)
% * prdData: structure (output of <http://www.debtheory.org/wiki/index.php?title=Predict_file *predict_my_pet_par*> file)
% * auxData: structure  (output of <http://www.debtheory.org/wiki/index.php?title=Mydata_file *mydata_my_pet_par*> file)
% * metaData: structure (output of <http://www.debtheory.org/wiki/index.php?title=Mydata_file *mydata_my_pet_par*> file)
% * txtData:  structure (output of <http://www.debtheory.org/wiki/index.php?title=Mydata_file *mydata_my_pet_par*> file)
% * metaPar: structure (output of <http://www.debtheory.org/wiki/index.php?title=Pars_init_file *pars_init_my_pet_par*> file)
% * destinationFolder : optional string with destination folder the files
% are printed to (default: current folder)


%% Example of use
% [data, auxData, metaData, txtData] = feval(['mydata_',metaData.species]); 
%
% prdData = feval(['predict_',metaData.species], par, data, auxData);
%
% prdData = predict_pseudodata(par, data, prdData); 
%
% load(['results_',entries{i},'.mat']) % load results_my_pet.mat
%
% prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar, destinationFolder)

% Remove underscore and capitalize first letter of english :
speciesprintnm = [strrep(metaData.species, '_', ' '), ' '];
speciesprintnm_en = strrep(metaData.species_en, '_', ' ');
if speciesprintnm_en(1)>='a' && speciesprintnm_en(1)<='z'
  speciesprintnm_en(1)=char(speciesprintnm_en(1)-32);
end

% get output file name
if exist('destinationFolder','var')
  fileName = [destinationFolder, metaData.species, '_res.html'];
else
  fileName = [metaData.species, '_res.html'];    
end
oid = fopen(fileName, 'w+'); % open file for reading and writing, delete existing content

fprintf(oid, '<!DOCTYPE html>\n');
fprintf(oid, '<HTML>\n');
fprintf(oid, '<HEAD>\n');
fprintf(oid,['  <TITLE>',metaData.species,'</TITLE>\n']);
fprintf(oid, '  <link rel="stylesheet" type="text/css" href="../../sys/style.css">\n\n');

fprintf(oid, '  <script src="../../sys/dropdown.js"></script>\n');
fprintf(oid, '  <script src="../../sys/openattaxon.js"></script>\n');
fprintf(oid, '  <script src="../../sys/w3data.js"></script>\n');
fprintf(oid, '  <script src="../../sys/ftiens4.js"></script>\n');
fprintf(oid, '  <script src="../../sys/species_tree_Animalia.js"></script>\n\n');

fprintf(oid, '  <style>\n');
fprintf(oid, '    ul.ref{\n');
fprintf(oid, '      list-style-type: square;\n');
fprintf(oid, '    }\n');
fprintf(oid, '  </style>\n');
fprintf(oid, '</HEAD>\n\n');

fprintf(oid, '<BODY>\n\n');

fprintf(oid, '<div w3-include-html="../../sys/wallpaper_entry.html"></div>\n');
fprintf(oid, '<div w3-include-html="../../sys/toolbar_entry.html"></div>\n');
fprintf(oid,['<div id="top2" w3-include-html="', metaData.species, '_toolbar.html"></div>\n']);
fprintf(oid, '<script>w3IncludeHTML();</script>\n\n');

fprintf(oid, '<!--------------------------------------------------------------->\n');
fprintf(oid, '<!--   PART main                                               -->\n');
fprintf(oid, '<!--   Where all of the text is placed                         -->\n');
fprintf(oid, '<!--   use "contentFull" for 1 column                          -->\n');
fprintf(oid, '<!--   use "content" if you want two columns"                  -->\n');
fprintf(oid, '<!--------------------------------------------------------------->\n\n');	

fprintf(oid, '<div id = "main">\n');
fprintf(oid, '  <div id = "main-wrapper">\n');
fprintf(oid, '    <div id="contentFull">\n');
fprintf(oid, '      <H1 id = "portaltop">Predictions & Data for this entry</H1>\n\n');	

fclose(oid);

% table with model, COMPLETE, MRE, SMSE, eco-codes, classification
prt_my_pet_eco(metaData, metaPar, destinationFolder);
fopen(fileName, 'a'); % further append to my_pet_res.html

% make structure for 'real' and predicted pseudodata:
pseudo = data.psd;
prdPseudo = prdData.psd;
psTxtData.units = txtData.units.psd;
psTxtData.label = txtData.label.psd;

% remove pseudodata:
data       = rmfield_wtxt(data, 'psd');
prdData    = rmfield_wtxt(prdData, 'psd');
txtData    = rmfield_wtxt(txtData, 'psd');


%  make table for zero-variate data set:
fprintf(oid, '      <p>\n');
fprintf(oid, '      <TABLE id="t01">\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH colspan="7"><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Zero-variate_data" >Zero-variate</a> data</TH></TR>\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TD><b>Data</b></TD><TD><b>Observed</b></TD><TD><b>Predicted</b></TD><TD><b>(RE)</b></TD><TD><b>Unit</b></TD><TD><b>Description</b></TD><TD><b>Reference</b></TD></TR>\n');
[nm, nst] = fieldnmnst_st(data); % cell array of string with fieldnames of data

for j = 1:nst
  [~, k] = size(data.(nm{j})); % number of data points per set
  if k == 1   
    if isfield(auxData.temp, nm{j})
        temp = auxData.temp.(nm{j});
        if strcmp(txtData.units.temp.(nm{j}), 'K')
          temp = K2C(temp);
        end
        name = ['<a href="" title="Temperature: ', num2str(temp), ' C">', nm{j}, '</a>'];
    else
        name = nm{j};
    end
    dta   = data.(nm{j}); 
    prdta = prdData.(nm{j});
    re    = metaPar.RE(j); 
    unit  = txtData.units.(nm{j});
    if isfield(txtData, 'comment') && isfield(txtData.comment, nm{j})
      des   = ['<a href="" title="', txtData.comment.(nm{j}), '">', txtData.label.(nm{j}), '</a>'];
    else
      des   = txtData.label.(nm{j});
    end        
    n = iscell(txtData.bibkey.(nm{j}));  % if 1 then there are several references for this data
    if n % if there are several references
      n = length(txtData.bibkey.(nm{j})); % number of references
      REF = [];
      for i = 1:n
        ref = txtData.bibkey.(nm{j}){i};
        if i == 1
          REF = [REF,' ',ref];
        else
          REF = [REF,', ',ref];
        end
      end
    else
      REF = txtData.bibkey.(nm{j});      
    end
    fprintf(oid, '        <TR > <TD>%s</TD><TD>%3.4g</TD> <TD>%3.4g</TD> <TD>(%3.4g)</TD><TD>%s</TD><TD>%s</TD><TD>%s</TD></TR>\n',...
      name, dta, prdta, re, unit, des, REF);
  end
 end
fprintf(oid, '        <TR><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TF></TR>\n');
fprintf(oid, '      </TABLE>\n\n');  

% print table with uni-variate data :
if isempty(metaData.data_1) == 0
  fprintf(oid, '      <TABLE id="t01">\n');
  fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH colspan="6"><a class="link" target = "_blank" href="http://www.debtheory.org/wiki/index.php?title=Univariate_data" >Uni-variate</a> data </TH></TR>\n');
  fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TD><b>Dataset</b></TD><TD><b>Figure</b></TD><TD><b>(RE)</b></TD><TD><b>Independent variable</b></TD><TD><b>Dependent variable</b></TD><TD><b>Reference</b></TD></TR>\n');  
 
  % select the positions of univariate data 
  uniData = [];
  for j = 1:nst
    eval(['[aux, k] = size(data.', nm{j}, ');']) % number of data points per set 
    if k >1 
      uniData = [uniData;j]; 
    end
  end
  n_uniData = length(uniData);  
  % number of each figure in the absense of grouped plots
  % in this case there is the same amount of figures as grouped plots
  ID = (1:n_uniData)';   % fig number = index of uniData 
   
  if isfield(metaData,'grp')   
    n_GrpPlots = length(metaData.grp.sets);  % number of grouped plots
    uniDataNames = cell(0);  % initiate cell array with names of all uni variate data sets:
    for i = 1:n_uniData
      uniDataNames{i} = nm{uniData(i)};
    end 
    % fill selection-matrix to identify grp plot members
    % it assumes that all univariate datasets occur in exactly 1 figure
    % sequence of data-sets in grp plots doesn't need to match sequence in uniData 
    sel = zeros(n_uniData,n_GrpPlots);          % initiate selection grp plot members
    for j = 1:n_GrpPlots                        % scan grouped plots
      set_j =  metaData.grp.sets{j}';           % cell-string with names of datasets in grp j  
      for i = 1: length(set_j)                  % scan datasets in grp j
        sel(:,j) = sel(:,j) + strcmp(uniDataNames,set_j{i})'; % add tot grp plot members 
      end
    end
    sel_tot = sum(sel,2) == 1;                  % booleans with grp plot members in uniData in any grp plot
    sel = sel == 1;                             % booleans with grp plot members in uniData in grp 1,2,..
  
    j_grp = (1:n_GrpPlots)';                    % compose grp id's
    ID = zeros(n_uniData,1);                    % initiate fig id
  
    if sel_tot(1)                               % first unidata set is member of grp plots
      ID(sel(:,j_grp(sel(1,:)))) = 1;           % set all members of that grp
    else                                        % first unidataset not a member of any grp plot
      ID(1) = 1;                                % 
    end
  
    for i = 2:n_uniData                         % scan other uniData sets
      if sel_tot(i) && ID(i) == 0               % new member of grp data
        ID(sel(:,j_grp(sel(i,:)))) = ID(i - 1) + 1; % set all members of that grp
      elseif ID(i) == 0                        % not a member of any grp data
        ID(i) = ID(i - 1) + 1;                  % increase fig id counter
      end
    end
               
  end
 
  % print out columns in the univariate data set table:
  for j = 1: n_uniData % for each univariate data set
    if isfield(auxData.temp, nm{uniData(j)}) % label = nm
      temp = auxData.temp.(nm{uniData(j)});
      if length(temp) == 1
        if strcmp(txtData.units.temp.(nm{uniData(j)}), 'K')
          temp = K2C(temp);
        end
        label = ['<a href="" title="Temperature: ', num2str(temp), ' C">', nm{uniData(j)}, '</a>'];
      else
        label = ['<a href="" title="Temperature varies">', nm{uniData(j)}, '</a>'];
      end
    else
      label  = nm{uniData(j)}; % "Data set"
    end
    re     = metaPar.RE(uniData(j)); % "relative error"
    ivar   = txtData.label.(nm{uniData(j)}){1}; % independent variable
    % dependent variable
    if isfield(txtData, 'comment') && isfield(txtData.comment, nm{uniData(j)})
      dvar   = ['<a href="" title="', txtData.comment.(nm{uniData(j)}), '">', txtData.label.(nm{uniData(j)}){2}, '</a>'];
    else
      dvar   = txtData.label.(nm{uniData(j)}){2};
    end        


    if ID(j) < 10
      fig   = ['see <A href = "../../entries/',metaData.species,'/results_',metaData.species,'_0',num2str(ID(j)),'.png"> Fig. ',num2str(ID(j)),'</A>'];
    else
      fig   = ['see <A href = "../../entries/',metaData.species,'/results_',metaData.species,'_',num2str(ID(j)),'.png"> Fig. ',num2str(ID(j)),'</A>'];
    end        
    n = iscell(txtData.bibkey.(nm{uniData(j)}));
    if n
      n = length(txtData.bibkey.(nm{uniData(j)}));
      REF = [];
      for i = 1:n
        ref = txtData.bibkey.(nm{uniData(j)}){i};
        if i == 1
          REF = [REF,' ',ref];
        else
          REF = [REF,', ',ref];
        end
      end
    else
      REF = txtData.bibkey.(nm{uniData(j)});    
    end
    fprintf(oid, '        <TR > <TD>%s</TD> <TD>%s</TD> <TD>(%3.4g)</TD><TD>%s</TD><TD>%s</TD><TD>%s</TD></TR>\n',...
      label, fig, re, ivar, dvar, REF);        
  end
  fprintf(oid, '        <TR><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n');
  fprintf(oid, '      </TABLE>\n\n'); 
end

% Print table with pseudo-data:
[nm, nst] = fieldnmnst_st(pseudo);
fprintf(oid, '      <TABLE id="t01">\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH colspan="5"> Pseudo-data at T<sub>ref</sub></TH></TR>\n');
fprintf(oid,['        <TR BGCOLOR = "#FFE7C6"><TD><B>Data</B></TD><TD><B>Generalised animal</B></TD><TD><B>',strrep(metaData.species, '_', ' '),'</B></TD><TD><B>Unit</B></TD><TD><B>Description</B></TD></TR>\n']);
  for j = 1:nst
       name = nm{j};
       dta   = pseudo.(nm{j});
       prdta = prdPseudo.(nm{j});
       unit  = psTxtData.units.(nm{j});
       des   = psTxtData.label.(nm{j});
       fprintf(oid, '        <TR ><TD>%s</TD> <TD>%3.4g</TD> <TD>%3.4g</TD><TD>%s</TD><TD>%s</TD></TR>\n',...
       name, dta, prdta, unit, des);       
  end
 fprintf(oid, '      </TABLE>\n\n'); 
 
% Facts:
if isfield(metaData, 'facts') 
  fprintf(oid, '      <H3 style="clear:both" class="pet">Facts</H3>\n');
  fprintf(oid, '      <ul> \n');     % open the unordered list
  [nm, nst] = fieldnmnst_st(metaData.facts);
  for i = 1:nst
    fprintf(oid, '        <li>\n'); % open bullet point
    str1 = metaData.facts.(nm{i});
    if isfield(metaData.bibkey,(nm{i}))
      bib = metaData.bibkey.(nm{i}); 
      if ~iscell(bib)
        str2 = bib;
      else
        n_bib = length(bib);
        str2 = bib{1};
        for j = 2:n_bib
          str2 = [str2, ', ', bib{j}];
        end            
      end
      fprintf(oid, ['          ', str1,' (ref: ',str2, ')\n']);
    else
      fprintf(oid, ['          ', str1, '\n']);  
    end
    fprintf(oid, '        </li>\n' ); % close bullet point
  end
  fprintf(oid,'      </ul>\n');       % close the unordered list    
end

% Discussion
if isfield(metaData, 'discussion') == 1
  fprintf(oid, '      <H3 style="clear:both" class="pet">Discussion</H3>\n');
  fprintf(oid, '      <ul> \n');     % open the unordered list
  [nm, nst] = fieldnmnst_st(metaData.discussion);
  for i = 1:nst
    fprintf(oid, '        <li>\n'); % open bullet point
    str = metaData.discussion.(nm{i});
    if isfield(txtData.bibkey,nm{i})
      str2 = metaData.bibkey.(nm{i});
      fprintf(oid, ['          ', str,' (',str2,') \n']);
    else
      fprintf(oid, ['          ', str, '\n']);
    end
    fprintf(oid, '        </li>\n' ); % close bullet point
  end
  fprintf(oid,'      </ul>\n\n');     % open the unordered list      
end

% Acknowledgment:
if isfield(metaData, 'acknowledgment') == 1
  fprintf(oid, '      <H3 style="clear:both" class="pet">Acknowledgment</H3>\n');
  fprintf(oid, '        <ul> \n');     % open the unordered list
    
  fprintf(oid, '          <li>\n');    % open bullet point
  str = metaData.acknowledgment;
  fprintf(oid, ['          ', str, '\n']);
  fprintf(oid, '          </li>\n' );  % close bullet point
   
  fprintf(oid,'         </ul>\n\n\n'); % close the unordered list      
end

% Bibliography:
fprintf(oid,['      <H3 style="clear:both" class="pet"><a class="link" href = "',metaData.species,'_bib.bib" target = "_blank">Bibliography</a></H3>\n']);
fprintf(oid,['      <div w3-include-html="', metaData.species, '_bib.html"></div>\n']);
fprintf(oid, '      <script>w3IncludeHTML();</script>\n\n');
  
% Citation:
fprintf(oid,['      <H3 style="clear:both" class="pet">Citation</H3>\n']);
fprintf(oid,['      <div w3-include-html="', metaData.species, '_cit.html"></div>\n']);
fprintf(oid, '      <script>w3IncludeHTML();</script>\n\n');

% ----------------------------------------------------------

fprintf(oid, '    </div> <!-- end of content -->\n\n');

fprintf(oid, '    <div w3-include-html="../../sys/footer_amp.html"></div>\n');
fprintf(oid, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(oid, '  </div> <!-- main wrapper -->\n');
fprintf(oid, '</div> <!-- main -->\n');
fprintf(oid, '</BODY>\n');
fprintf(oid, '</HTML>\n');
fclose(oid);


