%% set_path2server
% set path for browser to server

function path = set_path2server(svr)
% created 2021/02/25 by Bas Kooijman, modified 2022/06/10

%% Syntax
% path = <../set_path2server.m *set_path2server*>(svr)

%% Description
% fill a global with the name of the path to the deblab folder on the server
%
% Input
%
% * svr: optional string with name of server (default 'VU')
%
% Output
%
% * path: haracter string with path to server

if ~exist('svr', 'var')
    svr = 'VU';
end

switch svr
  case 'VU'
    path = 'https://www.bio.vu.nl/thb/deb/deblab/';
  case 'IUEM'
    path = 'https://debtheory.fr/';
  otherwise
    path = '';
end  
