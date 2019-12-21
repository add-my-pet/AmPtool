%% test_link
% tests links to web-pages for AmP entries

%%
function false = test_link(varargin)
% created 2017/06/17 by Bas Kooijman

%% Syntax
% false = <test_link *test_link*>(varargin)

%% Description
% gets cell strings with links and descriptions for an entry
%
% Input:
%
% * varargin: character or cell string with names of entries
%
% Output:
%
% * false: (n,1)-array with binaries for true or false

%% Remarks
% 

%% Example of use
% false = test_link('Daphnia_magna')

if isempty(varargin)
  varargin = select('Animalia');
elseif iscell(varargin{1})    
  varargin = varargin{:}; % unpack cell string  
end
nargin = length(varargin);
false = cell(nargin,1);

nargin = length(varargin); % number of entries to scan    
for i=1:nargin
    links = get_link(varargin{i});
    try 
      false{i} = 0;
      url = links{strcmp('AnAge',links(:,2)),1};
      txt = urlread(url);
      fprintf([varargin{i}, ' ', num2str(i), ': ', num2str(size(txt,2)),'\n']);
    catch
      false{i} = 1;
      fprintf([varargin{i}, ' ', num2str(i), ': ', url,'\n']);
    end      
end

end