%% pie_Animalia
% counts number of entries in Animalia and presents a pie of it

%%
function [x taxa] = pie_Animalia (n)
% created 2016/02/21 by Bas Kooijman

%% Syntax
% [x taxa] = <../pie_Animalia.m *pie_Animalia*> (n)

%% Description
% The kingdom Animalia can be partitioned into various taxa. 
% The number of species in the add_my_pet collection are counted for these taxa and the result is presented in a pie
%
% Input:
%
% * n: optional scalar with number of pie-pieces (2 till 8). Default n = 7.
%
% Output (apart from figure):
% 
% * x: n-vector containing species counts in taxa
% * taxa: n-vector with names of taxa

%% Remarks
% sum(x) = total number of animal species in the add_my_pet collection

%% Example of use
% pie_Animalia; or [n taxa] = pie_Animalia(6);

  if ~exist('n', 'var')
      n = 7;
  end
  
  switch n
    case 2
      taxa = {'Animalia'; 'Vertebrata'};    
      n = length(taxa); x = zeros(n, 1);
      for i = 1:n
        x(i) = length(select(taxa{i}));
      end
      x(1) = x(1) - x(2); taxa{1} = 'evertebrates';     
    case 3
      taxa = {'Parazoa'; 'Radiata'; 'Xenacoelomorpha'; 'Protostomata'; 'Deuterostomata'};
      n = length(taxa); y = zeros(n, 1);
      for i = 1:n
        y(i) = length(select(taxa{i}));
      end
      x(1) = sum(y(1:2)); taxa{1} ='para + rad';
      x(2) = sum(y(3:4)); taxa{2} = 'Protostomata'; % include Xenacoelomorpha in Protostomata
      x(3) = y(5); taxa{3} = 'Deuterostomata';
   case 4
      taxa = {'Parazoa'; 'Radiata'; 'Xenacoelomorpha'; 'Spiralia'; 'Ecdysozoa'; 'Deuterostomata'};
      n = length(taxa); y = zeros(n, 1);
      for i = 1:n
        y(i) = length(select(taxa{i}));
      end
      x(1) = sum(y(1:3)); taxa{1} ='para + rad + acoel' ;
      x(2) = y(4); taxa{2} = 'Spiralia'; 
      x(3) = y(5); taxa{3} = 'Ecdysozoa';
      x(4) = y(6); taxa{4} = 'Deuterostomata';
    case 5
      taxa = {'Parazoa'; 'Radiata'; 'Xenacoelomorpha'; 'Protostomata'; 'Echinodermata'; 'Cephalochordata'; 'Tunicata'; 'Cyclostomata'; 'Chondrichthyes'; 'Actinopterygii'; 'Actinistia'; 'Dipnoi'; 'Amphibia'; 'Sauropsida'; 'Aves'; 'Mammalia'};    
      n = length(taxa); y = zeros(n, 1);
      for i = 1:n
        y(i) = length(select(taxa{i}));
      end
      x(1) = sum(y(1:7)); taxa{1} = 'acraniates';
      x(2) = sum(y(8:12)); taxa{2} = 'fish';
      x(3) = sum(y(13:14)) - y(15); taxa{3} = 'herps';
      x(4) = y(15); taxa{4} = 'birds';
      x(5) = y(16); taxa{5} = 'mammals';
    case 6
      taxa = {'Parazoa'; 'Radiata'; 'Xenacoelomorpha'; 'Protostomata'; 'Echinodermata'; 'Cephalochordata'; 'Tunicata'; 'Cyclostomata'; 'Chondrichthyes'; 'Actinopterygii'; 'Actinistia'; 'Dipnoi'; 'Amphibia'; 'Sauropsida'; 'Aves'; 'Mammalia'};    
      n = length(taxa); y = zeros(n, 1);
      for i = 1:n
        y(i) = length(select(taxa{i}));
      end
      x(1) = sum(y(1:4)); taxa{1} = ['parazoa + radiata + ', char(10), 'protostomata'];
      x(2) = sum(y(5:7));  taxa{2} = ['acraniate', char(10), 'deuterostomata'];
      x(3) = sum(y(8:12)); taxa{3} = 'fish';
      x(4) = sum(y(13:14)) - y(15); taxa{4} = 'herps';
      x(5) = y(15); taxa{5} = 'birds';
      x(6) = y(16); taxa{6} = 'mammals';
   case 7
      taxa = {'Parazoa'; 'Radiata'; 'Xenacoelomorpha'; 'Protostomata'; 'Echinodermata'; 'Cephalochordata'; 'Tunicata'; 'Cyclostomata'; 'Chondrichthyes'; 'Actinopterygii'; 'Actinistia'; 'Dipnoi'; 'Amphibia'; 'Sauropsida'; 'Aves'; 'Mammalia'};    
      n = length(taxa); y = zeros(n, 1);
      for i = 1:n
        y(i) = length(select(taxa{i}));
      end
      x(1) = sum(y(1:2));  taxa{1} = 'Parazoa + Radiata';
      x(2) = sum(y(3:4));  taxa{2} = 'Protostomata';
      x(3) = sum(y(5:7));  taxa{3} = ['acraniate', char(10), 'deuterost'];
      x(4) = sum(y(8:12)); taxa{4} = 'fish';
      x(5) = sum(y(13:14)) - y(15); taxa{5} = 'herps';
      x(6) = y(15); taxa{6} = 'birds';
      x(7) = y(16); taxa{7} = 'mammals';
    case 8
      taxa = {'Parazoa'; 'Radiata'; 'Xenacoelomorpha'; 'Spiralia'; 'Ecdysozoa'; 'Echinodermata'; 'Cephalochordata'; 'Tunicata'; 'Cyclostomata'; 'Chondrichthyes'; 'Actinopterygii'; 'Actinistia'; 'Dipnoi'; 'Amphibia'; 'Sauropsida'; 'Aves'; 'Mammalia'};    
      n = length(taxa); y = zeros(n, 1);
      for i = 1:n
        y(i) = length(select(taxa{i}));
      end
      x(1) = sum(y(1:2));  taxa{1} = 'para + rad';
      x(2) = sum(y(3:4));  taxa{2} = 'acoela + spiralia';
      x(3) = sum(y(5));    taxa{3} = 'ecdysozoa';
      x(4) = sum(y(6:8));  taxa{4} = 'acraniate deut';
      x(5) = sum(y(9:13)); taxa{5} = 'fish';
      x(6) = sum(y(14:15)) - y(16); taxa{6} = 'herps';
      x(7) = y(16); taxa{7} = 'birds';
      x(8) = y(17); taxa{8} = 'mammals';
    otherwise
      taxa = {'Parazoa'; 'Radiata'; 'Xenacoelomorpha'; 'Gnathifera'; 'Platytrochozoa'; 'Ecdysozoa'; 'Deuterostomata'};    
      n = length(taxa); x = zeros(n, 1);
      for i = 1:n
        x(i) = length(select(taxa{i}));
      end
  end
  
  %pie3s(x, 'Bevel', 'Elliptical', 'Labels', taxa);
  pie(x, taxa(1:length(x)));

  if ~(sum(x) == length(select('Animalia')))
     fprintf('Warning from pie_Animalia: taxa specification needs updating\n')
  end
end

