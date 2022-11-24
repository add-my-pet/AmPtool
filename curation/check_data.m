%% check_data
% Checks data labels 

%%
function check_data(my_pet)
% created 2018/01/05 by Bas Kooijman

%% Syntax
% <../check_data.m *check_data*>(my_pet)

%% Description
% Checks typified data labels for existence and prints data labels for checking. 
% Also prints COMPLETE and EXPECTED complet.
%
% Input:
%
% * my_pet: character string with name of entry 

%% Remarks
% * run get_data_types to copy DEBwiki info to labels for typified data. 
% * If check_data is run for the first time, waiting time can be several minutes, due to Lisbon's DEBwiki server being slow.
% * If typified data labels are not recognized, change the labels, or add labels to the Zero-variate/Univariate data pages at DEBwiki.
% * If get_COMPLETE returns NaN, add the data-combination and the COMPLETE value to this function.

%% Example of use
% check_data('Turdus_merula')

global data_types_0 data_types_1

if isempty(data_types_0) || isempty(data_types_1)
  get_data_types
end

%WD = pwd;
%cd(['../../entries/',my_pet]) % goto entry my_pet

% check data_0 and data_1
[data, auxData, metaData, txtData] = feval(['mydata_', my_pet]);
dataFields = fields(data);
if sum(strcmp(dataFields, 'psd'))
  dataFields = dataFields(~strcmp(dataFields, 'psd'));
end

dataFields0 = {};
dataFields1 = {};
for i = 1:length(dataFields)
  if length(data.(dataFields{i})) == 1
    dataFields0{end + 1} = dataFields{i};
  else
    dataFields1{end + 1} = dataFields{i};
  end
end

% the printing style prepares for copy-paste to get_COMPLETE
fprintf('data_0: ');
if isempty(metaData.data_1)
  fprintf('''%s''; ', metaData.data_0{1:end-1}); fprintf('''%s'' \n', metaData.data_0{end});
else
  fprintf('''%s''; ', metaData.data_0{1:end}); fprintf(' \n');
end
% check for correctness of data types
diff = setdiff(metaData.data_0, data_types_0);
if ~isempty(diff)
  fprintf('warning from check_data: the following data_types are not recognized\n');
  diff
end

fprintf('zero-variate data: \n');
for i = 1:length(dataFields0)
  txt = txtData.bibkey.(dataFields0{i});
  if iscell(txt)
    n = length(txt); bibkey = [];
    for j = 1:n
      bibkey = [bibkey, '; ', txt{j}];
    end   
    bibkey(1:2) = [];
  else
    bibkey = txt;
  end
  fprintf([dataFields0{i}, ', ', txtData.label.(dataFields0{i}), ' (',  bibkey, ')\n']);
end

% the printing style prepares for copy-paste to get_COMPLETE
fprintf('\ndata_1: ');
if isfield(metaData, 'data_1') && ~isempty(metaData.data_1)
  if length(metaData.data_1)>1
    fprintf('''%s''; ', metaData.data_1{1:end-1}); fprintf('''%s'' \n', metaData.data_1{end});
  else
    fprintf('''%s'' \n', metaData.data_1{end});
  end
else
  fprintf('There is no data_1 vector with univariate data information.\n');
end
% check for correctness of data types
diff = setdiff(metaData.data_1, data_types_1);
if ~isempty(diff)
  fprintf('warning from check_data: the following data_types are not recognized\n');
  diff
end

fprintf('univariate data: \n');
for i = 1:length(dataFields1)
  txt = txtData.bibkey.(dataFields1{i});
  if iscell(txt)
    n = length(txt); bibkey = [];
    for j = 1:n
      bibkey = [bibkey, '; ', txt{j}];
    end   
    bibkey(1:2) = [];
  else
    bibkey = txt;
  end

  fprintf([dataFields1{i}, ', ', txtData.units.(dataFields1{i}){1},  ';', txtData.units.(dataFields1{i}){2},  ',   ', txtData.label.(dataFields1{i}){1},  ';', txtData.label.(dataFields1{i}){2}, '  (',  bibkey, ')\n']);
end

% if expected COMPLETE is NaN, the data combination is not in get_COMPLETE
data = [metaData.data_0(:); metaData.data_1(:)]; COMPLETE = get_COMPLETE(data);
fprintf(['\nCOMPLETE = ', num2str(metaData.COMPLETE), '; expected COMPLETE = ', num2str(COMPLETE),'\n\n'])

if isnan(COMPLETE)
  fprintf('Add the new data combination to AmPtool routine COMPLETE_data \n\n')
end
%cd(WD)                   % goto original path

