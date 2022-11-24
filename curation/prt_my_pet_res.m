%% prt_my_pet_res
% read and write my_pet_res.html

%%
function prt_my_pet_res(data, prdData, auxData, metaData, txtData, metaPar, destinationFolder)
% created 2015/04/11 by Starrlight & Goncalo Marques; modified 2015/08/23 Starrlight augustine; 
% modified 2016/03/09 Bas Kooijman; 2016/09/21 Starrlight Augustine;
% 2016/11/05, 2017/01/04, 2017/08/21, 2017/09/29, 2017/10/13, 2017/10/26, 2018/02/06, 2018/04/28, 2018/05/05, 
% 2018/06/21, 2021/12/, 2021/02/06, 2022/04/06 Bas Kooijman

%% Syntax
% <../prt_my_pet_res.m *prt_my_pet_res*> (data, prdData, auxData, metaData, txtData, metaPar, destinationFolder)

%% Description
% Prints my_pet_res.html file which compares metapar.model predictions with data
%
% Input:
%
% * data: structure (output of mydata_my_pet-file)
% * prdData: structure (output of predict_my_pet-file)
% * auxData: structure  (output of mydata_my_pet-file)
% * metaData: structure (output of mydata_my_pet-file)
% * txtData:  structure (output of mydata_my_pet-file)
% * metaPar: structure (output of pars_init_my_pet-file)
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

global dataSet_nFig % dataSet_nFig is filled in results_pets 
if isempty(dataSet_nFig) % make sure that dataSet_nFig is filled properly
  get_dataSet_nFig(data, auxData, metaData)
end
  
path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries/'; % path to figs

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
  destinationFolder = '';
  fileName = [metaData.species, '_res.html'];    
end
oid = fopen(fileName, 'w+'); % open file for reading and writing, delete existing content

fprintf(oid, '<!DOCTYPE html>\n');
fprintf(oid, '<html>\n');
fprintf(oid, '<head>\n');
fprintf(oid, '  <title>%s</title>\n', metaData.species);
fprintf(oid, '  <link rel="stylesheet" type="text/css" href="../../sys/style.css">\n\n');

fprintf(oid, '  <script src="../../sys/jscripts.js"></script>\n');
fprintf(oid, '  <script src="../../sys/ftiens4.js"></script>\n');
fprintf(oid, '  <script src="../../sys/specJump.js"></script>\n');
fprintf(oid, '  <script src="../../sys/species_tree_Animalia.js"></script>\n\n');

fprintf(oid, '  <style>\n');
fprintf(oid, '    ul.ref{\n');
fprintf(oid, '      list-style-type: square;\n');
fprintf(oid, '    }\n\n');

fprintf(oid, '  </style>\n');
fprintf(oid, '</head>\n\n');

fprintf(oid, '<body>\n\n');

fprintf(oid, '<div w3-include-html="../../sys/wallpaper_entry.html"></div>\n');
fprintf(oid, '<div w3-include-html="../../sys/toolbar_entry.html"></div>\n');
fprintf(oid, '<div id="top2" w3-include-html="%s_toolbar.html"></div>\n', metaData.species);

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

%  table for zero-variate data sets:
fprintf(oid, '      <p>\n');
fprintf(oid, '      <h2><a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/Zero-variate_data.html">Zero-variate data</a></h2>\n');
fprintf(oid, '      <table id="t01">\n');
fprintf(oid,['        <tr class="head"><th>Data</th> <th>Observed</th> <th>Predicted</th> ' ...
    '<th><a href="https://add-my-pet.github.io/DEBportal/docs/AmPestimation.html" target="_blank">(RE)</a></th> '...
    '<th>Unit</th> <th>Description</th> <th>Reference</th></tr>\n']);
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
    re    = metaPar.RE(j,1); 
    unit  = txtData.units.(nm{j});
    if isfield(txtData, 'comment') && isfield(txtData.comment, nm{j})
      des   = ['<a href="" title="', txtData.comment.(nm{j}), '">', txtData.label.(nm{j}), '</a>'];
    else
      des   = txtData.label.(nm{j});
    end        
    ref = txtData.bibkey.(nm{j}); REF = ref;
    if iscell(ref) % if there are several references
      n = length(ref); REF = ref{1}; % number of references    
      for i = 2:n; REF = [REF,', ',ref{i}]; end
    end
    fprintf(oid, '        <tr><td>%s</td> <td>%3.4g</td> <td>%3.4g</td> <td>(%3.4g)</td> <td>%s</td> <td>%s</td> <td>%s</td></tr>\n',...
      name, dta, prdta, re, unit, des, REF);
  end
 end
fprintf(oid, '      </table>\n\n');  

% table with uni- and bi-variate data sets:
n_fig = size(dataSet_nFig, 1);
if n_fig > 0
  zlab = 0; % initiate boolean for presence of zlabel
  for i=1:n_fig
    if 3==length(txtData.label.(dataSet_nFig{i,1})) && isfield(auxData,'treat') && isfield(auxData.treat, dataSet_nFig{i,1}) && auxData.treat.(dataSet_nFig{i,1}){1}>1; zlab=1; end
  end
  if ~zlab
    labels = '<th>Independent variable</th> <th>Dependent variable</th> '; 
  else
    labels = '<th>1st independent variable</th> <th>2nd independent variable</th>  <th>Dependent variable</th> ';
  end
  fprintf(oid, '      <h2><a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/Uni-variate_data.html">Uni-</a> and <a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/Bi-variate_data.html">bivariate data</a></h2>\n');
  fprintf(oid, '      <table id="t01">\n');
  fprintf(oid,['        <tr class="head"><th>Data</th> <th>Figure</th> %s', ...
      '<th><a href="https://add-my-pet.github.io/DEBportal/docs/AmPestimation.html" target="_blank">(RE)</a></th> <th>Reference</th></tr>\n'], labels);  
  %
  for i=1:n_fig
    % name of dataset
    if isfield(auxData.temp, dataSet_nFig{i,1}) && 1 == length(auxData.temp.(dataSet_nFig{i,1}))
      temp = auxData.temp.(dataSet_nFig{i,1});
      if strcmp(txtData.units.temp.(dataSet_nFig{i,1}), 'K')
        temp = K2C(temp);
      end
      name = ['<a href="" title="Temperature: ', num2str(temp), ' C">', dataSet_nFig{i,1}, '</a>'];
    else
      name = dataSet_nFig{i,1};
    end
    % labels for x,y and, possibly, z axes
    labels = ['<td>',txtData.label.(dataSet_nFig{i,1}){1},'</td> ']; % independent var
    if 3==k && 3==length(txtData.label.(dataSet_nFig{i,1})) && 3==length(txtData.units.(dataSet_nFig{i,1})) % 2 dependent vars
      labely = [txtData.label.(dataSet_nFig{i,1}){2},'<br>', txtData.label.(dataSet_nFig{i,1}){3}];
    else % 1 dependent var
      labely = txtData.label.(dataSet_nFig{i,1}){2};
    end
    if isfield(txtData, 'comment') && isfield(txtData.comment, dataSet_nFig{i,1}) % add possible coment as hover text to y-label
      labely   = ['<a href="" title="', txtData.comment.(dataSet_nFig{i,1}), '">', labely, '</a>'];
    end        
    labels = [labels, '<td>', labely, '</td>'];
    if zlab % table has at least one bi-variate data figure in 3D
      if 3==txtData.label.(dataSet_nFig{i,1}) && isfield(auxData,'treat') && auxData.treat.(dataSet_nFig{i,1}){1}>1
        labels = [labels, ' <td>',txtData.label.(dataSet_nFig{i,1}){3},'</td> '];
      else
        labels = [labels, ' <td></td> ']; % this fig is in 2D
      end
    end
    % fig
    dataSet = dataSet_nFig{i,1}; nFig = dataSet_nFig{i,2};  txt=''; 
    if isfield(metaData,'grp') % is dataSet a member of any grp set?
      sets = metaData.grp; n_sets = length(sets);
      for j=1:n_sets
        if ismember(dataSet,metaData.grp.sets{j})
          txt = metaData.grp.subtitle{str2double(nFig{j})};
        end
      end
    end
    if isempty(txt) && isfield(txtData,'subtitle') && isfield(txtData.subtitle, dataSet); txt = txtData.subtitle.(dataSet); end
    if iscell(txt); txt = txt{1}; end
    if ~iscell(nFig)    
      fig = ['<img class="myImg" src="', path, metaData.species, '/results_', metaData.species, '_', nFig, '.png" alt="', txt,'">'];
    else
      fig = ['<img class="myImg" src="', path, metaData.species, '/results_', metaData.species, '_', nFig{1}, '.png" alt="', txt, '"> ', ...
             '<img class="myImg" src="', path, metaData.species, '/results_', metaData.species, '_', nFig{2}, '.png" alt="">'];
    end   
    % re
    ii = 1:nst; ii=ii(strcmp(nm,dataSet_nFig{i,1}));
    re = metaPar.RE(ii,1); % "relative error"
    % REF
    ref = txtData.bibkey.(dataSet_nFig{i,1}); REF = ref;
    if iscell(ref) % if there are several references
      n = length(ref); REF = ref{1}; % number of references    
      for j = 2:n; REF = [REF,', ',ref{j}]; end
    end
    %
    fprintf(oid, '        <tr><td>%s</td> <td>%s</td> %s <td>(%3.4g)</td> <td>%s</td></tr>\n', name, fig, labels, re, REF);        
  end
  fprintf(oid, '      </table>\n\n'); 
  
  fprintf(oid, '      <div id="myModal" class="modal">\n'); 
  fprintf(oid, '        <img class="modal-content" id="img01">\n'); 
  fprintf(oid, '        <div id="caption"></div>\n'); 
  fprintf(oid, '      </div>\n\n'); 

  fprintf(oid, '      <script>modal()</script>\n\n'); 
end

% table with pseudo-data:
fprintf(oid, '      <p>\n');
fprintf(oid, '      <h2><a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/Pseudo_data.html">Pseudo-data at T<sub>ref</sub> = 20&deg;C</a> </h2>\n');
[nm, nst] = fieldnmnst_st(pseudo);
fprintf(oid, '      <table id="t01">\n');
fprintf(oid, '        <tr class="head"><th>Data</th> <th>Generalised animal</th> <th>%s</th> <th>Unit</th> <th>Description</th></tr>\n', strrep(metaData.species, '_', ' '));
for j = 1:nst
  name = nm{j};
  dta   = pseudo.(nm{j});
  prdta = prdPseudo.(nm{j});
  unit  = psTxtData.units.(nm{j});
  des   = psTxtData.label.(nm{j});
  fprintf(oid, '        <tr><td>%s</td> <td>%3.4g</td> <td>%3.4g</td> <td>%s</td> <td>%s</td></tr>\n', name, dta, prdta, unit, des);       
end
fprintf(oid, '      </table>\n\n'); 
 
% discussion
if isfield(metaData, 'discussion') == 1
  fprintf(oid, '      <p>\n');
  fprintf(oid, '      <h3 style="clear:both" class="pet">Discussion</h3>\n');
  fprintf(oid, '      <ul> \n');     % open the unordered list
  [nm, nst] = fieldnmnst_st(metaData.discussion);
  for i = 1:nst
    fprintf(oid, '        <li>\n'); % open bullet point
    if isfield(txtData.bibkey,nm{i})
      fprintf(oid, '          %s(Ref: %s) \n', metaData.discussion.(nm{i}), metaData.bibkey.(nm{i}));
    else
      fprintf(oid, '          %s\n', metaData.discussion.(nm{i}));
    end
    fprintf(oid, '        </li>\n' ); % close bullet point
  end
  fprintf(oid,'      </ul>\n\n');     % open the unordered list      
end

% facts:
if isfield(metaData, 'facts') 
  fprintf(oid, '      <p>\n');
  fprintf(oid, '      <h3 style="clear:both" class="pet">Facts</h3>\n');
  fprintf(oid, '      <ul> \n');     % open the unordered list
  [nm, nst] = fieldnmnst_st(metaData.facts);
  for i = 1:nst
    fprintf(oid, '        <li>\n'); % open bullet point
    if isfield(metaData.bibkey,(nm{i}))
      bib = metaData.bibkey.(nm{i}); 
      if ~iscell(bib)
        str = bib;
      else
        n_bib = length(bib);
        str = bib{1};
        for j = 2:n_bib
          str = [str, ', ', bib{j}];
        end            
      end
      fprintf(oid, '          %s (Ref: %s)\n', metaData.facts.(nm{i}), str);
    else
      fprintf(oid, '          %s\n', metaData.facts.(nm{i}));  
    end
    fprintf(oid, '        </li>\n' ); % close bullet point
  end
  fprintf(oid,'      </ul>\n\n');       % close the unordered list    
end

% acknowledgment:
if isfield(metaData, 'acknowledgment') == 1
  fprintf(oid, '      <p>\n');
  fprintf(oid, '      <h3 style="clear:both" class="pet">Acknowledgment</h3>\n');
  fprintf(oid, '        <ul> \n');     % open the unordered list
    
  fprintf(oid, '          <li>\n');    % open bullet point
  fprintf(oid, '            %s\n', metaData.acknowledgment);
  fprintf(oid, '          </li>\n' );  % close bullet point
   
  fprintf(oid,'         </ul>\n\n\n'); % close the unordered list      
end

% bibliography:
fprintf(oid, '      <p>\n');
fprintf(oid, '      <h3 style="clear:both" class="pet"><a class="link" href = "%s_bib.bib" target = "_blank">Bibliography</a></h3>\n', metaData.species);
fprintf(oid, '      <div w3-include-html="%s_bib.html"></div>\n', metaData.species);
  
% Citation:
fprintf(oid, '      <p>\n');
fprintf(oid, '      <h3 style="clear:both" class="pet">Citation</h3>\n');
fprintf(oid, '      <div w3-include-html="%s_cit.html"></div>\n', metaData.species);

% ----------------------------------------------------------

fprintf(oid, '    </div> <!-- end of content -->\n\n');

fprintf(oid, '    <div w3-include-html="../../sys/footer_amp.html"></div>\n');
fprintf(oid, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(oid, '  </div> <!-- main wrapper -->\n');
fprintf(oid, '</div> <!-- main -->\n\n');

fprintf(oid, '</body>\n');
fprintf(oid, '</html>\n');
fclose(oid);


