%% check_GSI_Ri
% Checks entries for GSI and Ri in metadata.data_0 of mydata_my_pet

%%
function [nm_GSI, nm_Ri]  = check_GSI_Ri
% created 2025/02/07 by Bas Kooijman

%% Syntax
% [nm_GSI, nm_Ri] = <../check_GSI_Ri.m *check_GSI_Ri*>

%% Description
% checks that if metadata.data_0 has GSI (or Ri), that data.GSI (or data.Ri) exists
%
% Output:
% 
% * nm_GSI : entries with errors in GSI
% * nm_Ri : entries with errors in Ri

%% Example of use
% [nm_GSI, nm_Ri] = check_GSI_Ri;

nm = select; n=length(nm); sel_1 = false(n,1); sel_2 = false(n,1);
for i=1:n
  cdEntr(nm{i}); [data,~,metadata]=feval(['mydata_',nm{i}]);
  if isfield(data,'GSI')
    sel_1(i) = ~ismember('GSI',metadata.data_0);
  elseif ismember('GSI',metadata.data_0)
    sel_1(i) = ~isfield(data,'GSI');  
  end
  if isfield(data,'Ri')
    sel_2(i) = ~ismember('Ri',metadata.data_0);
  elseif ismember('Ri',metadata.data_0)
    sel_2(i) = ~isfield(data,'Ri');  
  end
  nm_GSI = nm(sel_1);
  nm_Ri = nm(sel_2);
end