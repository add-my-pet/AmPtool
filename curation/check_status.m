%% check_status
% check name statuse in WoRMS versus CoL

%%
function nm = check_status(pets)
% created 2021/08/09 by Bas Kooijman

%% Syntax
% nm = <check_status *check_status*>(pets)

%% Description
% check the name status of names in WoRMS against those in CoL; names that do not occur in WoRMS are ignored
%
% Input:
%
% * pets: cell array with names 
%
% Output:
%
% * nm: cell array with names that have a different status

%% Eample of use
% check_status(select)

n=length(pets); nm=cell(0,1); sel = false(n,1); 
status_WoRMS = cell(n,1); status_CoL = cell(n,1); 
nm_WoRMS = cell(n,1); nm_CoL = cell(n,1); 

for i=1:n
  [id, status_WoRMS{i}, nm_WoRMS{i}] = get_id_WoRMS(pets{i});
  if strcmp(pets{i}, nm_WoRMS{i}) && ~ismember(status_WoRMS{i}, {'unaccepted', 'synonym'}); sel(1) = true; end
  if ~isempty(id)
    [id, status_CoL{i}, nm_CoL{i}] = get_id_CoL(pets{i});
    if strcmp(pets{i}, nm_CoL{i}) && ~ismember(status_CoL{i}, {'unaccepted','synonym'}); sel(1) = true; end
    
    if ismember(status_WoRMS{i}, {'unaccepted','synonym'}) & ismember(status_CoL{i}, 'accepted') & ~isempty(id)
      nm = [nm;pets{i}]; sel(i) = true;
    end
    if ismember(status_CoL{i}, {'unaccepted','synonym'}) & ismember(status_WoRMS{i}, 'accepted') & ~isempty(id)
      nm = [nm;pets{i}]; sel(i) = true;
    end
  end
end

pets = pets(sel);
status_WoRMS = status_WoRMS(sel); status_CoL = status_CoL(sel); 
nm_WoRMS = nm_WoRMS(sel); nm_CoL = nm_CoL(sel);
prt_tab({pets, status_WoRMS, nm_WoRMS, status_CoL, nm_CoL}, {'AmP name', 'status WoRMS', 'valid WoRMS', 'stat CoL', 'valid CoL'}, 'check status', 1);

