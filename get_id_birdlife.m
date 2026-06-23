%% get_id_birdlife
% gets id of name in birdlife

%%
function id = get_id_birdlife(my_pet, open)
% created 2021/08/02 by Bas Kooijman, modified 2026/06/22

%% Syntax
% id = <../get_id_birdlife.m *get_id_birdlife*>(my_pet, open)

%% Description
% Gets identifier for birdlife
%
% Input:
%
% * my_pet: character string with name of a taxon
% * open: optional boolean for opening in browser (default: 0)
%
% Output:
%
% * id: character string with id in birdlife

%% Remarks
% Outputs empty strings if identification was not successful.
% The BirdLife DataZone slug format is {common-name}-{genus}-{species},
% retrieved from the species sitemaps (sitemap-species-1.xml through 6).

%% Example of use
% get_id_birdlife('Passer_domesticus', 1)

  address = 'https://datazone.birdlife.org/species/factsheet/';

  if ~exist('open','var')
    open = 0;
  end

  % scientific name fragment at end of slug, e.g. Passer_domesticus -> passer-domesticus
  sci = lower(strrep(strrep(my_pet, '_', '-'), ' ', '-'));

  id = '';
  for k = 1:6
    try
      xml = webread(['https://datazone.birdlife.org/sitemap-species-', num2str(k), '.xml']);
    catch
      continue
    end
    % slug ends with the hyphenated scientific name, e.g. house-sparrow-passer-domesticus
    tok = regexp(xml, ['factsheet/([a-z0-9][a-z0-9-]*-', sci, ')'], 'tokens', 'once');
    if ~isempty(tok)
      id = tok{1};
      break
    end
  end

  if open && ~isempty(id)
    web([address, id], '-browser');
  elseif open
    web('https://datazone.birdlife.org', '-browser');
  end

end
