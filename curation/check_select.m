%% check_select
% Checks select for for double items
%%
function check_select
% created 2023/10/21 by Bas Kooijman

%% Syntax
% <../check_select.m *check_select*>

%% Description
% checks select for double items


WD=cdCur;
nm = select; n=length(nm);
for i=1:n
  if sum(ismember(nm, nm{i}))>1
      nm{i}
  end
end

cd(WD);
