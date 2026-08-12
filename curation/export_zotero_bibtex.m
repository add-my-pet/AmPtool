function total = export_zotero_bibtex(outFile, apiKey)
% EXPORT_ZOTERO_BIBTEX  Pull the Zotero DEB group library (500643) as BibTeX. Modified from AI Claude
%   export_zotero_bibtex()                      -> writes DEB Library.bib (public access)
%   export_zotero_bibtex('mylib.bib')           -> custom output file; .bib is appended automatically if missing
%   export_zotero_bibtex('mylib.bib', 'KEY')    -> use an API key (private group)

    WD = cdCur; 

    if nargin < 1 || isempty(outFile), outFile = '../../DEB Library.bib'; end
    if ~contains(outFile,'.bib'); outFile = [outFile, '.bib']; end
    if nargin < 2, apiKey = ''; end

    groupID = '500643';
    base    = sprintf('https://api.zotero.org/groups/%s/items/top', groupID);  % /top = bibliographic refs only (no attachments/notes)
    limit   = 100;          % API max per request, but API is not required for public libraries
    start   = 0;

    headers = {'Zotero-API-Version','3'};
    if ~isempty(apiKey)
      headers = [headers; {'Authorization', ['Bearer ' apiKey]}];
    end
    opts = weboptions('HeaderFields', headers, 'ContentType','text', 'Timeout',30);

    fid = fopen(outFile, 'w');
    if fid == -1, error('Cannot open %s for writing.', outFile); end
    cleanup = onCleanup(@() fclose(fid));

    %fprintf('Exporting Zotero group %s to %s ...\n', groupID, outFile);
    total = 0;
    while true
        chunk = webread(base, 'format','bibtex', 'limit',limit, 'start',start, opts);
        if isempty(strtrim(chunk))
            break;                              % start is past the end -> done
        end
        fwrite(fid, chunk);
        fprintf(fid, '\n');

        total = total + numel(regexp(chunk, '^@', 'lineanchors', 'start'));
        %fprintf('  fetched items %d–%d\n', start+1, start+limit);

        start = start + limit;                  % always advance by the page size
    end

    %fprintf('Done. Wrote %d entries to %s\n', total, outFile);
    
    cd(WD);
end