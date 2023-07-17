%% repair_Aves
% edit mydata_my_pet, write results_my_pet.mat, save zip
%%
function nm = repair_Aves(entries)
% created 2023/06/19 by Bas Kooijman

%% Syntax
% [WD, nm] = <repair_Aves  *repair_Aves*>(entries)

%% Description
% puberty at fledging; tR = time since puberty at first breeding
%
% Input:
%
% * entries: character or cell string with one or more entries

%% Remarks
% First create add_my_pet/Aves with a copy of existing bird entries
% Then creates add_my_pet/Aves_new to modifiy all birds entries
% Then copy Aver_new over entries, replacing unmodified entries; this leaves the option to undo the modifications
% Run run_collection(select('Aves')) after copying Aves_new to entries, then run_collection_intro(select('Aves'))
% Requires syncing with servers when done

%% Example
% [~, nm, s_L]=select_mydata(nm,'tL_m',1);
% [~, ~, s_W]=select_mydata(nm,'tW_m',1);
% [~, ~, s_Ww]=select_mydata(nm,'tWw_m',1);
% [~, ~, s_Wb]=select_mydata(nm,'Wwbm',1);
% [~, ~, s_Lb]=select_mydata(nm,'Lbm',1);
% nm_m = nm(s_L|s_Ww|s_W|s_Wb|s_Lb);
% repair_males(nm_m)

cur2ez = '../../entries_zip/'; % path from AmPtool/curation to entries_zip
cur2ea = '../../entries_archive/'; % path from AmPtool/curation to entries_archive

if 0 % this needs to be done only once
  Aves = select('Aves'); WD = cdEntr(Aves{1}); n = length(Aves);
  for i=1:n
    cdEntr(Aves{i}); 
    copyfile(['../',Aves{i}],['../../Aves/',Aves{i}]);
  end
  cd(WD);
end

WD = cdCur; cd '../../deblab/add_my_pet/Aves_new/Struthio_camelus'; % first bird
    
if ~exist('entries','var')
  entries = select('Aves');
elseif ~iscell(entries)
  entries = {entries};
end

n = length(entries);
for i=1:n % scan entries
  my_pet = entries{i}; 
  fprintf('%g: %s\n', i, my_pet);
  cd(['../',my_pet]);
  load(['results_',my_pet])
  edit(['mydata_',my_pet,'.m'])
  edit(['pars_init_',my_pet,'.m'])
  edit(['predict_',my_pet,'.m'])
  edit(['run_',my_pet,'.m'])
  
  % get name of existing zip-file
  list=cellstr(ls(cur2ez)); 
  zipFnm = [cur2ez, list{~cellfun(@isempty,strfind(list,my_pet))}];

  fprintf('type dbcont to proceed or dbquit \n'); 
  keyboard
  x = input('type 0 to skip move zip ');
  if ~(x==0)
    % metaData: add mod and date_acc
    % add comment for mod
    % edit: predit_my pet 
    % re-estimate: run_my_pet
  
    % move zip from entries_zip to entries_archive
    movefile(zipFnm,cur2ea)    
  end
  
  % close source files in editor
  editorTabs = matlab.desktop.editor.getAll;
  editorTabs(2:end).close;

end
cd(WD)
end

% err=read_stat(nm_m,{'MRE','SMSE'});
% val = [err_old(:,1), err(:,1)];
% Hfig = figure;
% plot([0;.4],[0;.4],'k', val(:,1),val(:,2),'.b','linewidth',3,'markersize',8)
% xlabel('MRE for female and male state vars different')
% ylabel('MRE for female and male state vars equal')
% h = datacursormode(Hfig); entries_txt = nm_m; n=length(nm_m);
% for i=1:n; entries_txt{i} = strrep(entries_txt{i}, '_' , ' '); end
% h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries_txt, val);
% datacursormode on % mouse click on plot
