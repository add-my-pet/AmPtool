%% export_DEBlib
% pulls the Zotero DEB group library (500643) as DEB Library.bib

%%
function total = export_DEBlib
%% created 2026/08/12 by AI Claude, modified by Bas Kooijman

%% Syntax
% total = <../export_DEBlib *export_DEBlib*>

%% Description
% Pulls the Zotero DEB group library (500643) as DEB Library.bib
%
% Output: 
%
% * total: # of bib items
% * file written in dir deb, starting from AmPtool/curation: ../../DEB Library.bib

%% Example of use
% export_DEBlib

    WD = cdCur; 

    outFile = '../../DEB Library.bib'; 
    groupID = '500643';
    base    = sprintf('https://api.zotero.org/groups/%s/items/top', groupID);  % /top = bibliographic refs only (no attachments/notes)
    limit   = 100;          % API max per request, but APIkey is not required for public libraries
    start   = 0;
    opts = weboptions('ContentType','text', 'Timeout',30);

    fid = fopen(outFile, 'w');
    if fid == -1, error('Cannot open %s for writing.', outFile); end
    cleanup = onCleanup(@() fclose(fid));

    total = 0;
    while true
        chunk = webread(base, 'format','bibtex', 'limit',limit, 'start',start, opts);
        if isempty(strtrim(chunk))
            break;                              % start is past the end -> done
        end
        fwrite(fid, chunk);
        fprintf(fid, '\n');

        total = total + numel(regexp(chunk, '^@', 'lineanchors', 'start'));

        start = start + limit;                  % always advance by the page size
    end
    
    cd(WD);
end