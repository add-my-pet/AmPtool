%% prt_my_pet_par
% Creates my_pet_par.html 

%%
function prt_my_pet_par(metaData, metaPar, par, txtPar, destinationFolder)
% created 2015/04/11 by Starrlight Augustine
% modified 2015/07/27 Starrlight Augustin; 2015/08/06 Dina Lika; 2016/03/30 Starrlight Augustine;
% 2016/11/05; 2017/09/29; 2017/10/13, 2018/04/28 Bas Kooijman


%% Syntax
% <../prt_my_pet_par.m *prt_my_pet_par*> (metaData, metaPar, par, txtPar, destinationFolder) 

%% Description
% Read and writes my_pet_par.html to current folder(default) or else to
% destinationFolder. This pages contains a list of all of the parameter
% values of my_pet.
%
% Input:
%
% * metaData: structure (output of mydata_my_pet-file)
% * metaPar: structure (output of pars_init_my_pet-file)
% * par: structure (output of pars_init_my_pet-file)
% * txtPar: structure (output of pars_init_my_pet-file)
% * destinationFolder : optional string with destination folder the files
% are printed to (default: current folder)


%% Example of use
% load('results_my_pet.mat');
% prt_my_pet_par(metaData, metaPar, par, txtPar, destinationFolder)

vars_pull(metaData); 

% Removes underscores and makes first letter of english name be in capital:
speciesprintnm = [strrep(metaData.species, '_', ' '), ' '];
speciesprintnm_en = strrep(metaData.species_en, '_', ' ');
if speciesprintnm_en(1)>='a' && speciesprintnm_en(1)<='z'
  speciesprintnm_en(1)=char(speciesprintnm_en(1)-32);
end

% field names for all parameters:
par = rmfield_wtxt(par, 'free'); % remove the structure free
parFields = fields(par); % returns cell array with name of each field
% default parameters for model:
[coreParFields] = get_parfields(metaPar.model); % returns cell array with names of parameters of the typified model
% temperature parameters
% might be that one day we should  make this more robust by letting the
% code check if other temperature parameters are used such as T_AH at the
% moment those will apear in the table  'parameters specific for this
% entry' - 
tempParFields = {'T_A', 'T_ref'}; 

% get chemical parameters fields (standard ones)
par_auto = addchem([], [], [], [], metaData.phylum, metaData.class);
chemParFields = fields(par_auto);
% separate out the 'other parameters'
parFields = setdiff(parFields, coreParFields);
otherParFields = setdiff(parFields, chemParFields);
otherParFields = setdiff(otherParFields, tempParFields);

% start printing the html file

if exist('destinationFolder','var')
fileName = [destinationFolder, metaData.species, '_par.html'];
else
fileName = [metaData.species, '_par.html'];    
end
oid = fopen(fileName, 'w+'); % % open file for writing, delete existing content
fprintf(oid, '<!DOCTYPE html>\n');
fprintf(oid, '<HTML>\n');
fprintf(oid, '<HEAD>\n');
fprintf(oid, '  <TITLE>%s</TITLE>\n', metaData.species);
fprintf(oid, '  <link rel="stylesheet" type="text/css" href="../../sys/style.css">\n\n');

fprintf(oid, '  <script src="../../sys/jscripts.js"></script>\n');
fprintf(oid, '  <script src="../../sys/ftiens4.js"></script>\n');
fprintf(oid, '  <script src="../../sys/specJump.js"></script>\n');
fprintf(oid, '  <script src="../../sys/species_tree_Animalia.js"></script>\n\n');

fprintf(oid, '</HEAD>\n\n');
fprintf(oid, '<BODY>\n\n');

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
fprintf(oid, '      <H1 id = "portaltop">Parameter values for this entry</H1>\n');	
			
fprintf(oid, '      <!--------------------------------------------------------------->\n');

% Print out text before the tables:
% fprintf(oid, '<H2>Parameter values for this entry</H2>');
fprintf(oid,['      <H2>Model: <a class="link" target = "_blank" href="https://add-my-pet.github.io/DEBportal/docs/Typified_models.html" >&nbsp;', metaPar.model,' &nbsp;</a></H2>\n\n']);
% ----------------------------------------  

% Print table with primary parameters:
fprintf(oid, '      <TABLE id = "t01">\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH colspan="4">Primary parameters at reference temperature (%g deg. C)</TH></TR>\n', par.T_ref - 273.15);
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH>symbol</TH><TH> value</TH><TH> units</TH><TH> description</TH></TR>\n');

for i = 1:length(coreParFields)
  if strcmp(coreParFields{i},'z')
    fprintf(oid, '        <TR BGCOLOR = "%s"> <TD>%s</TD> <TD>%g</TD> <TD>%s</TD><TD>%s</TD></TR>\n',...
      '#FFFFFF', 'p_Am', par.z * par.p_M/ par.kap, ...
      'J/d.cm^2', '{p_Am}, spec assimilation flux');
  else
    fprintf(oid, '        <TR BGCOLOR = "%s"> <TD>%s</TD> <TD>%g</TD> <TD>%s</TD><TD>%s</TD></TR>\n',...
      '#FFFFFF', coreParFields{i}, par.(coreParFields{i}), ...
      txtPar.units.(coreParFields{i}), txtPar.label.(coreParFields{i}));
  end
end

fprintf(oid, '      </TABLE>\n\n');
% ----------------------------------------

% Print table with parameters which are specific for the entry:
fprintf(oid, '      <TABLE id = "t01">\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH colspan="4">Parameters specific for this entry at reference temperature (%g deg. C)</TH></TR>\n', par.T_ref - 273.15);
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH>symbol</TH><TH> value</TH><TH> units</TH><TH> description</TH></TR>\n');

for i = 1:length(otherParFields)
  fprintf(oid, '        <TR BGCOLOR = "%s"> <TD>%s</TD> <TD>%g</TD> <TD>%s</TD><TD>%s</TD></TR>\n',...
    '#FFFFFF', otherParFields{i}, par.(otherParFields{i}), ...
    txtPar.units.(otherParFields{i}), txtPar.label.(otherParFields{i}));
end

fprintf(oid, '      </TABLE>\n\n');
% ----------------------------------------

% print table with parameters which relate to temperature correction:
% please keep in mind that these are only T_A and T_ref, other parameters
% related to temperature correction will appear in the 'other parameters'
% table unless code further up is changed.

fprintf(oid, '      <TABLE id = "t01">\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH colspan="4">Temperature parameters</TH></TR>\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH>symbol</TH><TH> value</TH><TH> units</TH><TH> description</TH></TR>\n');
for i = 1:length(tempParFields)
  fprintf(oid, '        <TR BGCOLOR = "%s"> <TD>%s</TD> <TD>%g</TD> <TD>%s</TD><TD>%s</TD></TR>\n',...
    '#FFFFFF', tempParFields{i}, par.(tempParFields{i}), ...
    txtPar.units.(tempParFields{i}), txtPar.label.(tempParFields{i}));
end

fprintf(oid, '      </TABLE>\n\n');
% ----------------------------------------

% print table with chemical potentials and specific densities:
fprintf(oid, '      <TABLE id = "t01">\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH colspan="5">Chemical parameters</TH></TR>\n');
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH></TH><TH>Food</TH><TH> Structure</TH><TH> Reserve</TH><TH> Faeces</TH></TR>\n');
fprintf(oid, '        <TR BGCOLOR = "%s"> <TD>%s</TD> <TD>%g</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD></TR>\n',...
  '#FFFFFF',  'Chemical potentials (J/C-mol)', par.mu_X, par.mu_V, par.mu_E, par.mu_P);
fprintf(oid, '        <TR BGCOLOR = "%s"> <TD>%s</TD> <TD>%g</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD></TR>\n',...
  '#FFFFFF',  'Specific density for dry weight (g/cm^3)', par.d_X, par.d_V, par.d_E, par.d_P);
fprintf(oid, '      </TABLE>\n\n');
% ----------------------------------------

% Print table with chemical indices
fprintf(oid, '      <TABLE id = "t01">\n');
% --------------- organic chemical indices --------------------------------
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH></TH><TH></TH><TH>Food</TH><TH> Structure</TH><TH> Reserve</TH><TH> Faeces</TH></TR>\n');
fprintf(oid, '        <TR BGCOLOR = "%s"> <TD rowspan="4">%s</TD><TD BGCOLOR = "#FFE7C6">%s</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD><TD>%g</TD></TR>\n',...
  '#FFFFFF','Chemical indices for organics', 'Carbon', par.n_CX, par.n_CV, par.n_CE, par.n_CP);
fprintf(oid, '        <TR BGCOLOR = "%s"><TD BGCOLOR = "#FFE7C6">%s</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD><TD>%g</TD></TR>\n',...
  '#FFFFFF','Hydrogen', par.n_HX, par.n_HV, par.n_HE, par.n_HP);
fprintf(oid, '        <TR BGCOLOR = "%s"><TD BGCOLOR = "#FFE7C6">%s</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD><TD>%g</TD></TR>\n',...
  '#FFFFFF','Oxygen', par.n_OX, par.n_OV, par.n_OE, par.n_OP);
fprintf(oid, '        <TR BGCOLOR = "%s"><TD BGCOLOR = "#FFE7C6">%s</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD><TD>%g</TD></TR>\n\n',...
  '#FFFFFF','Nitrogen', par.n_NX, par.n_NV, par.n_NE, par.n_NP);
% --------------- mineral chemical indices --------------------------------
fprintf(oid, '        <TR BGCOLOR = "#FFE7C6"><TH></TH><TH></TH><TH>CO<sub>2</sub></TH><TH> H<sub>2</sub>O</TH><TH>O<sub>2</sub></TH><TH> N-waste</TH></TR>\n');
fprintf(oid, '        <TR BGCOLOR = "%s"> <TD rowspan="4">%s</TD><TD BGCOLOR = "#FFE7C6">%s</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD><TD>%g</TD></TR>\n',...
  '#FFFFFF','Chemical indices for minerals', 'Carbon', par.n_CC, par.n_CH, par.n_CO, par.n_CN);
fprintf(oid, '        <TR BGCOLOR = "%s"><TD BGCOLOR = "#FFE7C6">%s</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD><TD>%g</TD></TR>\n',...
  '#FFFFFF','Hydrogen', par.n_HC, par.n_HH, par.n_HO, par.n_HN);
fprintf(oid, '        <TR BGCOLOR = "%s"><TD BGCOLOR = "#FFE7C6">%s</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD><TD>%g</TD></TR>\n',...
  '#FFFFFF','Oxygen', par.n_OC, par.n_OH, par.n_OO, par.n_ON);
fprintf(oid, '        <TR BGCOLOR = "%s"><TD BGCOLOR = "#FFE7C6">%s</TD> <TD>%g</TD> <TD>%g</TD><TD>%g</TD><TD>%g</TD></TR>\n',...
  '#FFFFFF','Nitrogen', par.n_NC, par.n_NH, par.n_NO, par.n_NN);
fprintf(oid, '      </TABLE>\n\n');
% ----------------------------------------

fprintf(oid, '    </div> <!-- end of content -->\n\n');

fprintf(oid, '    <div w3-include-html="../../sys/footer_amp.html"></div>\n');
fprintf(oid, '    <script>w3IncludeHTML();</script>\n\n');

fprintf(oid, '  </div> <!-- end of main wrapper -->\n');
fprintf(oid, '</div> <!-- end of main -->\n');

fprintf(oid, '</BODY>\n');
fprintf(oid, '</HTML>\n');
fclose(oid);



