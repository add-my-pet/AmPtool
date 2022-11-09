%% repair_id_bow
% gets presence of cur/breeding directory in entries of birds-of-the world
%
% load id_bow; 
% sel_b = false(11073,1); for i=1:11073; sel_b(i) = (id_bow{i,5} == '1'); end
% sel_AmP = ismember(id_bow(:,2),select);
% sel_fam = false(11073,1); for i=1:11073; sel_fam(i) = isempty(strfind(id_bow{i,2},'_')); end;
% id=id_bow(sel_b & ~sel_AmP & ~sel_fam, 1); size(id)
% 
% get_id_bow(id{i},1), i>344 Sturnella_neglecta
% cdEntr(nm,0)

%%
function id_bow = repair_id_bow 
% created 2022/10/23 by Bas Kooijman

WD = cdCur;
address = 'https://birdsoftheworld.org/bow/species/';
robot = java.awt.Robot();
rect = java.awt.Rectangle(800,500,50,50); % [left top width height

load id_bow id_bow

n = size(id_bow,1);
for i=1:3000 % scan all id's songbirds start at 4463
  
  %web([address, id_bow{i,1},'/cur/breeding'],'-browser'); pause(2);
  web([address, id_bow{i,1},'/cur/breeding'], '-new'); pause(4);

  % Take screen capture
  cap = robot.createScreenCapture(rect);
  rgb_b = typecast(cap.getRGB(0,0,cap.getWidth,cap.getHeight,[],0,cap.getWidth),'uint8');
 
%   % Convert to an RGB image
%   imgData_b = zeros(cap.getHeight,cap.getWidth,3,'uint8');
%   imgData_b(:,:,1) = reshape(rgb_b(3:4:end),cap.getWidth,[])';
%   imgData_b(:,:,2) = reshape(rgb_b(2:4:end),cap.getWidth,[])';
%   imgData_b(:,:,3) = reshape(rgb_b(1:4:end),cap.getWidth,[])';
%   
%   % Show or save to file
%   imshow(imgData_b)

  if sum(rgb_b==255)==10000
    id_bow{i,5} = '1';
  else
    id_bow{i,5} = '0';
  end
  
  % close tab in Firefox, wmctrl and  xdotool  and key are unix equivalents
%   if ismac || isunix
%     system('wmctrl -a firefox; xdotool key Command+w');
%   else
%     system('powershell wmctrl -a firefox; xdotool key Ctrl+w');
%   end
  
  if 0 == mod(i,100) % monitor progress
    fprintf([num2str(i), ': ', id_bow{i,1},  ' ', id_bow{i,2}, ' ', id_bow{i,3}, ' ', id_bow{i,4}, ' ', id_bow{i,5}, '\n'])
    save('id_bow.mat','id_bow');  
  end

end  
% save to AmPtool/curation/id_bow.mat and id_bow.html
save('id_bow.mat','id_bow');  
prt_tab({(1:n)', id_bow}, {'#','id_bow','species','version','date','breed'}, 'birdsoftheworld', 1);
cd(WD);

