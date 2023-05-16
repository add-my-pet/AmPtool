load nm_m % nm_m err_old err = read_stat(nm_m,{'MRE','SMSE'})

mre = [err_old(:,1), err(:,1)];
Hfig = figure;
plot([0;.4],[0;.4],'k', mre(:,1),mre(:,2),'.b','linewidth',3,'markersize',8)
xlabel('MRE for female and male state vars different')
ylabel('MRE for female and male state vars equal')
h = datacursormode(Hfig); entries_txt = nm_m; n=length(nm_m);
for i=1:n; entries_txt{i} = strrep(entries_txt{i}, '_' , ' '); end
h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries_txt, mre);
datacursormode on % mouse click on plot

smse = [err_old(:,2), err(:,2)];
Hfig1 = figure;
plot([0;.17],[0;.17],'k', smse(:,1),smse(:,2),'.b','linewidth',3,'markersize',8)
xlabel('SMSE for f & m state vars different')
ylabel('SMSE for f & m state vars equal')
h = datacursormode(Hfig1); entries_txt = nm_m; n=length(nm_m);
for i=1:n; entries_txt{i} = strrep(entries_txt{i}, '_' , ' '); end
h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries_txt, smse);
datacursormode on % mouse click on plot