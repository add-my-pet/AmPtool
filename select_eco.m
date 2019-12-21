%% select_eco
% selects taxa with a particular codes for a variable

%%
function [taxa, sel] = select_eco (var, code)
% created 2018/05/10 by Bas Kooijman

%% Syntax
% taxa = <../select_eco.m *select_eco*> (var, code)

%% Description
% Selects taxa with a particular eco-code for a specified variable. Stage codes for the variables food and habitat are ignored.
% Daughter codes are included in the selection. E.g. TA for variable ecozone also selects entries with TAt and TAz for ecozone.
%
% Input:
% 
% * var: character string with name of variable: climate, ecozone, habitat, embryo, migrate, food, gender, reprod.
% * code: cell string codes
%
% Output: 
% 
% * taxa: cell string with names of selected entries
% * sel: vector of booleans that indicate selection in the whole collection of entries

%% Remarks
% 

%% Example of use
% [taxa, sel] = select_eco('ecozone', {'TA'})

if ~ismember(var, {'climate', 'ecozone', 'habitat', 'embryo', 'migrate', 'food', 'gender', 'reprod'})
  fprintf (['Error in select_eco: variable "', var, '" is not recognized\n']);
  taxa = []; sel = []; return
end

[codes, entries] = read_allEco(var); n_entries = length(entries); sel = false(n_entries,1);
if ~iscell(code) % if code is char string, convert to cell string
  code = {code};
end
n_code = length(code); N_code = zeros(n_code,1);
for k = 1:n_code
  N_code(k) = length(code{k});
end

for i = 1:n_entries   % scan entries
  codes_i = codes{i}; n_codes_i = length(codes_i);
  for j = 1:n_codes_i % scan codes for entries i
    for k = 1:n_code  % scan specified codes
      codes_ij = codes_i{j}; 
      if strcmp(var,'food') || strcmp(var,'habitat') % remove stage codes
        codes_ij(1:2) = [];
      end
      N = min(N_code(k),length(codes_ij));
      if strcmp(code{k}, codes_ij(1:N))
        sel(i) = true;
        break
      end
    end
  end
end

taxa = entries(sel); 
