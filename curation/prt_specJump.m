%% prt_specJump
% writes add_my_pet/sys/specJump.js

%%
function prt_specJump
% created 2021/12/19 by Bas Kooijman; modified 2021/12/21

%% Syntax
% <prt_specJump *prt_specJump*>

%% Description
% writes add_my_pet/sys/specJump.js for use in entry-toolbars 
% to jump to the previous or following entry using current lists-of-lists.
%
% Meant to be called in run_collection_intro.

entries = select; n_entries = length(entries);
WD = cdCur; cd('../../deblab/add_my_pet/sys/');
fid = fopen('specJump.js', 'w+'); % open file for reading and writing and deletes old content

fprintf(fid, 'function specJump(entry,up) {\n');
fprintf(fid, '  var next;\n');
fprintf(fid, '  var last = %g;\n', n_entries);
fprintf(fid, '  const entries = [\n');
for i = 1:n_entries-1
  fprintf(fid, '    "%s",\n', entries{i});
end
fprintf(fid, '    "%s"\n', entries{n_entries});
fprintf(fid, '  ];\n\n');

fprintf(fid, '  var n = entries.length;\n');
fprintf(fid, '  for (i = 0; i < n; i++) {\n');
fprintf(fid, '    if (entry == entries [i]) {\n');
fprintf(fid, '      if (up == "1") {\n');
fprintf(fid, '        next = entries [Math.min(n-1,i+1)];\n');
fprintf(fid, '        break;\n');
fprintf(fid, '      } else {\n');
fprintf(fid, '        next = entries [Math.max(0,i-1)];\n');
fprintf(fid, '        break;\n');
fprintf(fid, '      }\n');
fprintf(fid, '    }\n');
fprintf(fid, '  }\n\n');

fprintf(fid, '  var current = window.location.href;\n');
fprintf(fid, '  if (current.includes("_res.html")) {\n');
fprintf(fid, '    window.location.href = "../" + next + "/" + next + "_res.html";\n');
fprintf(fid, '  } else if (current.includes("_par.html")) {\n');
fprintf(fid, '    window.location.href = "../" + next + "/" + next + "_par.html";\n');
fprintf(fid, '  } else if (current.includes("_stat.html")) {\n');
fprintf(fid, '    window.location.href = "../" + next + "/" + next + "_stat.html";\n');
fprintf(fid, '  } else {\n');
fprintf(fid, '    window.location.href = "../" + next + "/" + next + "_pop.html";\n');
fprintf(fid, '  }\n');
fprintf(fid, '}\n\n');

fclose(fid);
cd(WD);

end