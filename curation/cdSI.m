%% cdSI
% cd to the deb/SI directory

function WD = cdSI(bibkey)
% created 2024/07/21 by Bas Kooijman

%% Syntax
% WD = <../cdSI.m *cdSI*>(bibkey)

%% Description
% cd to the deb/SI/bibkey directory and try to open deb/SI/bibkey/bibkey_SI.m in editor
%
% * bibkey: string with bibkey of paper
%
% Output
%
% * WD: current path 

%% Remarks
% Intended use: 
% * WD = cdSI('LikeKooy2024b'); ..code.. cd(WD)

if ~exist('bibkey','var'); bibkey = ''; end
nm = [bibkey, '_SI.m'];
WD = cdCur;
cd(['../../SI/',bibkey])
try
  edit(nm); 
catch
end 

end
