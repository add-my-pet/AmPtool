%% get_id_bow
% gets id of name in birds of the world

%%
function id_bow = get_id_bow (id, open)
% created 2022/10/14 by Bas Kooijman

%% Syntax
% id_bow = <../get_id_bow.m *get_id_bow*> (id)

%% Description
% Gets identifiers for birds-of-the-world. 
% If input id is specified but not a species name, the page is opened, but output is empty;
% If input id is a species name, the character string id_bow is returned.
%
% Input:
%
% * id: optional character string with id for page to open or species name to find id
% % open: boolean for opening the website if id is a species name
%
% Output:
%
% * character string with code if id was species name, species name if is was code or, but if no input: 
% * id_bow: (n,5) cell array with all id's, species-names, version, date, sel in bow;
%   sel: boolean for presence of subdir /cur/breeding

%% Remarks
%
% * bow has 11073 id's, of which 10824 are species; 
% * Subdir /cur/breeding of an entry can have detailed info on growth of nestlings. 
% * bow is not used as standard AmP website for birds, because it requires subscription.
% * This function takes some running time.

%% Example of use
% id_bow = get_id_bow;

address = 'https://birdsoftheworld.org/bow/species/';
robot = java.awt.Robot();
rect = java.awt.Rectangle(800,500,50,50); % [left top width height

if exist('id','var')
  load id_bow.mat id_bow
  if isempty(strfind(id,' ')) && isempty(strfind(id,'_')) % id is a bow id
    try 
      web([address, id,'/cur/breeding'],'-browser');
    catch
      web([address, id],'-browser');
    end
    id_bow = id_bow{ismember(id_bow(:,1), id),2};  return
  else % id is a species name
    id_bow = id_bow{ismember(id_bow(:,2), strrep(id, ' ', '_')),1};  
    if exist('open', 'var') && open
      web([address, id_bow],'-browser');
    end
    return
  end
end

% open and read specieslist
url = urlread('https://birdsoftheworld.org/bow/specieslist');

% extract all id's
i_0 = 19+strfind(url,'href="/bow/species/'); % start index
i_1 = -1+strfind(url,'/cur/introduction');   % stop index
n = length(i_0); % number of id's
id_bow = cell(n,5);  % initiate cell-string with id's
for i=1:n
  id_bow{i,1} = url(i_0(i):i_1(i)); % fill id's
end

for i=1:n % scan all id's
  % identify entries with subdir /cur/breeding
  web([address, id_bow{i,1},'/cur/breeding'], '-new'); pause(4);
  cap = robot.createScreenCapture(rect); % Take screen capture
  rgb_b = typecast(cap.getRGB(0,0,cap.getWidth,cap.getHeight,[],0,cap.getWidth),'uint8');
  if sum(rgb_b==255)==10000 % all pixels are white
    id_bow{i,5} = '1'; % breeding page exists
  else
    id_bow{i,5} = '0'; % breeding page does not exist
  end
  % close tab in Firefox, wmctrl and  xdotool  and key are unix equivalents
%   if ismac || isunix
%     system('wmctrl -a firefox; xdotool key Command+w');
%   else
%     system('powershell wmctrl -a firefox; xdotool key Ctrl+w');
%     system('powershell FFWID=$(xdotool search --name "Mozilla Firefox" | head -1); xdotool windowactivate --sync $FFWID; xdotool key --clearmodifiers ctrl+q');
%   end
 
  % get date
  url = urlread([address, id_bow{i,1}, '/cur/breeding']);
  id_bow{i,4} = url(31+i_0(1):40+i_0(1)); % date of type 2020/03/04
  
  % get species name
  i_0 = 27+strfind(url,'<title class="notranslate">'); % start index	 
  i_1 = -1+strfind(url,'</title>');   % stop index
  url_nm = url(i_0(1):i_1(1));
  i_01 = strfind(url_nm,' - ');
  id_bow{i,2} = strrep(url_nm(3+i_01(end-1):i_01(end)-1), ' ', '_');
  
  % get version
  i_0 = 23+strfind(url,'citation_doi" content="'); % start index
  if isempty(i_0)
    id_bow{i,3} = '';
  else
    i_1 = strfind(url(i_0:end),'"'); i_1 = i_0(1)-2+i_1(1); % stop index	
    url_ver = url(i_0:i_1);
    i_0 = 1+strfind(url_ver,'.'); i_0 = i_0(end); % start index
    id_bow{i,3} = url_ver(i_0:end);
  end
  
  if 0 == mod(i,100) % monitor progress & save 
    fprintf([num2str(i), ': ', id_bow{i,1},  ' ', id_bow{i,2}, ' ', id_bow{i,3}, ' ', id_bow{i,4}, ' ', id_bow{i,5}, '\n'])
    save('id_bow.mat','id_bow');  
  end

end

% save to AmPtool/curation/id_bow.mat and id_bow.html
WD=cdCur; save('id_bow.mat','id_bow');  
prt_tab({(1:n)', id_bow}, {'#','id_bow','species','version','date','breed'}, 'birdsoftheworld', 1);
cd(WD);

