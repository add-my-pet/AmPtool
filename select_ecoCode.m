%% select_ecoCode
% selects one or more eco-codes from list

%%
function [code, s, v] = select_ecoCode(s)
%% created 2018/05/31 by Bas Kooijman

%% Syntax
% [code, s, v] = <../select_ecoCode.m *select_ecoCode*>

%% Description
% Select eco-codes from a list of all possibilities. 
% First select a type, then one or more codes.
% Press the Ctrl-key to add code selections in the list of codes or the Shift-key to select a whole group of codes.
% The type of codes in the output is coded as
%
%    C climate 
%    E ecozone
%    H habitat 
%    E embryo environment
%    M migration/torpor 
%    F food
%    G gender
%    R reproduction
%
% Input:
% 
% * s: optional vector of indices of codes in the list for pre-selection. The first element refers to the type index, the others to codes within the type
%
% Output: 
% 
% * code: cell-string with names of codes; the type of code is prepended before "."
% * s: vector of indices of codes in the list. The first element refers to the type index, the others to codes within the type
% * v: 0 when no selection is made, or 1 when a selection is made

%% Remarks
% uses global eco_types for codes and labels; assign eco_types with <get_eco_types.html *get_eco_types*>.
% Outputs code and s are empty, and v = 0, if cancel has been selected in list of types.
% If cancel is selected in the list of codes for a type, selection from the list of types is presented again.

%% Example of use
% select_ecoCode 

global eco_types

% make labels for types
if isempty(eco_types)
   try
     get_eco_types('../../') % local path, assuming AmPtool/curation 
   catch
     get_eco_types % via web
   end
end

types = fieldnames(eco_types); 
typeCode = {'C','E','H','E','M','F','G','R'};
typeLabels = types; n_types = length(types);
for i = 1:n_types
  typeLabels{i} = [typeCode{i},':  ',types{i}];
end

code = {};  % initiate output if type is not selected
v_code = 0; % make sure that selection starts

while v_code == 0 % select type if code is not selected (via cancel)
  if ~exist('s','var')
    s = []; % initiate output
    [i_type, v] = listdlg('PromptString', 'Select a type', 'ListString', typeLabels, 'Selectionmode', 'single', 'ListSize', [90 110]);
  else
    [i_type, v] = listdlg('PromptString', 'Select a type', 'ListString', typeLabels, 'Selectionmode', 'single', 'InitialValue', s(1), 'ListSize', [90 110]);
  end

  if isempty(i_type)
    return
  end
  type = types{i_type};

  % make labels for codes
  codes = fieldnames(eco_types.(type));
  codeLabels = codes; n_codes = length(codes);
  for i = 1:n_codes
    codeLabels{i} = [typeCode{i_type},'.',codes{i}, ':  ', eco_types.(type).(codes{i})];
  end

  if isempty(s) || length(s) == 1
    [i_code, v_code] = listdlg('PromptString', ['Select ', type, ' codes'], 'ListString', codeLabels, 'ListSize', [350 400]);
  else
    [i_code, v_code] = listdlg('PromptString', ['Select ', type, ' codes'], 'ListString', codeLabels, 'InitialValue', s(2:end), 'ListSize', [350 400]);
  end
  code = codes(i_code); n_code = length(i_code); v = v * v_code; s = [i_type i_code];
end

% prepare output
for i=1:n_code
  code{i} = [typeCode{i_type},'.',code{i}];
end
