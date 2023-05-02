%% repair_males
% edit mydata_my_pet, write results_my_pet.mat, save zip, writes entries_web/my_pet/my_pet_res.html

%%
function nm = repair_males(entries)
% created 2023/03/23 by Bas Kooijman

%% Syntax
% [WD, nm] = <repair_males  *repair_males*>(entries)

%% Description
% Males equal to females upto b
%
% Input:
%
% * entries: character or cell string with one or more entries
%
% Ouput:
%
% * nm: cell string with modified field names

%% Remarks
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

WD = cdCur; nm = cell(0,1);
    
if ~exist('entries','var')
  entries = select;
elseif ~iscell(entries)
  entries = {entries};
end
n=length(entries); 

for i=1:n % scan entries
  my_pet = entries{i}; 
  fprintf('%g: %s\n', i, my_pet);
  cdEntr(my_pet,0); % cd to add_my_pet/entries/my_pet and load source files
  
  % get name of existing zip-file
  list=cellstr(ls('../../entries_zip')); 
  zipFnm = [cur2ez, list{~cellfun(@isempty,strfind(list,my_pet))}];

  fprintf('type dbcont to proceed or dbquit \n'); 
  keyboard
  x = input('type 0 to skip move zip and run_collection ');
  if ~(x==0)
    % metaData: add mod and date_acc
    % add comment for mod
    % edit: predit_my pet 
    % re-estimate: run_my_pet
  
    % move zip from entries_zip to entries_archive
    movefile(zipFnm,cur2ea)
    run_collection(my_pet)
    
    nm = [nm; my_pet]; % append modified entry name
  end
  
  % close source file in editor
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
