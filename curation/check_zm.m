%% check_zm
% Checks entries with discussion that says male differ, while they do not, and vice versa

%%
function [nm_differ, nm_not_differ]  = check_zm
% created 2025/02/12 by Bas Kooijman

%% Syntax
% [nm_differ, nm_not_differ] = <../check_zm.m *check_zm*>

%% Description
% checks entries with discussion that says male differ, while they do not, and vice versa
%
% Output:
% 
% * nm_differ: entries where the discussion says not differ, while they do
% * nm_not_differ: entries where the discussion says differ, while they do not

%% Example of use
% [nm_differ, nm_not_differ] = check_zm;

nm = select; n=length(nm); sel_1 = false(n,1); sel_2 = false(n,1);
for i=1:n
  cdEntr(nm{i}); [data,~,metaData] = feval(['mydata_',nm{i}]); eval(['par = pars_init_',nm{i},'(metaData);']);
  mydata = fileread(['mydata_',nm{i},'.m']); 
  male_disc = ~isempty(strfind(mydata, 'females by {p_Am}'));
  male_par = isfield(par,'z_m');
  if ~male_disc && male_par
    sel_1(i) = true;
  elseif male_disc && ~male_par
    sel_2(i) = true;  
  end
end
nm_differ = nm(sel_1);
nm_not_differ = nm(sel_2);
end

