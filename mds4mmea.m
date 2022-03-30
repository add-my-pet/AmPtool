%% mds4mmea
% classic multidimensional scaling applied to solutions of the mmea method

%%
function [y, e, parNm, dist] = mds4mmea(results)
  %  created at 2022/03/30 by Bas Kooijman
  
  %% Syntax
  % [y, e, parNms, dist] = <../mds4mmea.m *mds4mmea*> (results)
  
  %% Description
  % classic multidimensional scaling applied to n solutions of the mmea
  % method for DEB parameter estimates using the sb loss function as estimation criterion.
  % It computes the first 3 eigen-vectors and values of classic dimensional scaling
  % 
  % Input
  %
  % * results: char string with name of .mat file with solution set
  %
  % Output
  %
  % * y: (n,3) matrix with eigen vectors
  % * e: k-vector with eigen values
  % * parNms: cell string with parameter names
  % * dist: (n,n) distance matrix
  
  %% Example of use
  % [y, e, parNms] = mds4mmea('results_Dipodomys');
  
  global lossfuction
  
  close all

  lossfunction = 'sb';
  
  load(results)
  data = result.solutionsParameters; % (n,k) matrix with (solutions,parameters) 
  [n_data n_par] = size(data);
  parNm = result.parameterNames; % cell-string with names of free parameters
  val = result.lossFunctionValues; % loss function values
  val_max = max(val); val_min = min(val);
  valColor = color_lava(.9*(val_max - val)/ (val_max - val_min)); % rgb colors for data points
  legend = cell(n_data,2); 
  for i=1:n_data
    legend{i,1} = {'o', 6, 3, valColor(i,:), valColor(i,:)}; 
    legend{i,2} = num2str(i); 
  end
  legend{1,1}{1} = 's';

  if length(parNm) ~= n_par
    fprintf('Warning from mds4mmea: parameter names are not consistent with solution set\n');
    return
  end
          
  dist = zeros(n_data, n_data); % initiate distance matrix
  for i = 1:n_data
    for j = i+1:n_data
      dist(i,j) = sum((data(i,:) - data(j,:)).^2 ./ (data(i,:).^2 + data(j,:).^2));
    end
  end
  dist = dist + dist'; % make distance matix symmetric
  [y, e] = cmdscale(dist); % configuration matrix, eigenvalues

  % plot eigen vectors
  Hfig = figure;
  %plot3(y(:,1), y(:,2), y(:,3), 'or');
  %plot(y(:,1), y(:,2), 'or');
  plot2i(y(:,1:2), legend, ['classic mds for ', strrep(results, '_' , ' ')]);
  %title(['classic mds for ', strrep(results, '_' , ' ')])
  xlabel('1st eigenvector')
  ylabel('2nd eigenvector')
  %zlabel('3rd eigenvector')
  box on
  %h = datacursormode(Hfig); 
  %h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, dataNm, y(:,1:3));
  %h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, dataNm, y(:,1:2));
  %datacursormode on % mouse click on plot markers to show dataNm

  % print correlations between parameters and first 3 eigenvectors 
  prt_tab({parNm,corr(data,y(:,1:3))},{'par', 'axis 1', 'axis 2', 'axis 3'}, 'classic mds');

  figure % plot eigenvalues
  plot(1:n_par, e(1:n_par), '*b', n_par+1:n_data, e(n_par+1:n_data), '*r')
  xlabel('rank');
  ylabel('eigenvalue');
  title([num2str(n_par), ' parameters estimated'])

