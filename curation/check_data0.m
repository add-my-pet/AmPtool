%% check_data0
% checks the units of data0 and consistency of data0 with data for that data point

%%
function [nm nm_data0] = check_data0(data0,units)
% created 2025/05/21 by Bas Kooijman

%% Syntax
% [nm nm_data0] = <../check_data0.m *check_data0*> (data0,units)

%% Description
% selects entries that have data0 with units other than units and
% entries that have data0, but not in data_0, or in data, but not in data_0
%
% Input
%
% * data0: string with name of zero-variate data (e.g. GSI, Wwb, ... )
% * units: string with units (e.g. g/g, g, ...)
%
% Output
%
% * nm: cell string of entries for match failed
% * nm_data0: where data do not match data_0 for data0

%% remarks
% Proceed with cdEntr(nm,1) to load failing entries in the Matlab editor

%% Example of use
% [nm nm_data0] = check_data0('Wwb','g')

WD = pwd;

taxa = select; n = length(taxa); sel = zeros(n,1); sel_data0 = zeros(n,1); % initiate selection
for i = 1:n % scan taxa
  cdEntr(taxa{i});
  [data, ~, metaData, txtData] = feval(['mydata_',taxa{i}]); 
  if isfield(data,data0) || ismember(data0, metaData.data_0)
    if isfield(data,data0) && ~ismember(data0, metaData.data_0) || ~isfield(data,data0) && ismember(data0, metaData.data_0)
      sel_data0(i) = 1;
    end
    if isfield(data,data0)
      sel(i) = ~strcmp(txtData.units.(data0),units);
    end
  end
end
nm = taxa(sel==1); nm_data0 = taxa(sel_data0==1);

cd(WD);
