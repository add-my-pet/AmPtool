%% get_id_GBIFdataset
% gets the publisher taxonID of a taxon within a specific GBIF checklist dataset

%%
function taxonID = get_id_GBIFdataset(my_pet, datasetKey)
% created 2026/06/11 by Bas Kooijman

%% Syntax
% taxonID = <../get_id_GBIFdataset.m *get_id_GBIFdataset*>(my_pet, datasetKey)

%% Description
% Looks a taxon up inside a single GBIF-hosted checklist dataset and returns the publisher-supplied taxonID
%   (i.e. the native identifier of the source catalogue), as a character string.
% This replaces the former trick of harvesting external-database links from the (now retired) CoL web service.
%
% Input:
%
% * my_pet: character string with the name of a taxon
% * datasetKey: character string with the GBIF dataset UUID to search in
%
% Output:
%
% * taxonID: character string with the publisher taxonID, or '' if not found

%% Remarks
% You must be connected. An exact canonicalName match is preferred; otherwise the first hit with a taxonID is used.

%% Example of use
% taxonID = get_id_GBIFdataset('Acyrthosiphon_pisum', '214c3109-d37a-40f8-9c24-5b6e59915394')

  taxonID = '';
  name = strrep(strrep(my_pet, '_', ' '), '+', ' ');

  opts = weboptions('Timeout', 15, 'ContentType', 'json');
  try
    r = webread('https://api.gbif.org/v1/species/search', ...
                'datasetKey', datasetKey, 'q', name, 'limit', 20, opts);
  catch
    return % not connected, or no response
  end

  if ~isfield(r, 'results') || isempty(r.results)
    return
  end
  res = r.results; N = numel(res);

  hit = [];
  for pass = 1:2 % pass 1: exact canonicalName match; pass 2: first with a taxonID
    for i = 1:N
      if iscell(res), item = res{i}; else, item = res(i); end
      if ~isfield(item, 'taxonID') || isempty(item.taxonID)
        continue
      end
      if pass == 1
        if isfield(item, 'canonicalName') && strcmpi(name, item.canonicalName)
          hit = item.taxonID; break
        end
      else
        hit = item.taxonID; break
      end
    end
    if ~isempty(hit), break, end
  end

  if isempty(hit)
    return
  elseif ischar(hit)
    taxonID = hit;
  else
    taxonID = num2str(hit);
  end

end
