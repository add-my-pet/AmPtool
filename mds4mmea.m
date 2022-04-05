%% mds4mmea
% classical multidimensional scaling applied to solutions of the mmea method

%%
function [y, e, parNm, dist] = mds4mmea(results)
  %  created at 2022/03/30 by Bas Kooijman
  
  %% Syntax
  % [y, e, parNms, dist] = <../mds4mmea.m *mds4mmea*> (results)
  
  %% Description
  % classical multidimensional scaling applied to n solutions of the mmea
  % method for DEB parameter estimates using the sb loss function as estimation criterion.
  % It computes the first 3 eigen-vectors and values of classical dimensional scaling
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
  % [y, e, parNms] = mds4mmea('results_Dipodomys_deserti_mmea');
  
  global lossfuction
  
  lossfunction = 'sb';
  
  load(results)
  sol = result.solutionsParameters; % (n,k) matrix with (solutions,parameters) 
  [n_sol, n_par] = size(sol);
  parNm = result.parameterNames; % cell-string with names of free parameters
  if length(parNm) ~= n_par
    fprintf('Warning from mds4mmea: parameter names are not consistent with solution set\n');
    return
  end
  
  % compose legend: lowest loss function value with a light-red square, highest in black
  val = result.lossFunctionValues; % loss function values
  val_max = max(val); [val_min, i_min] = min(val);
  valColor = color_lava(.95*(val_max - val)/ (val_max - val_min)); % rgb colors for sol points
  legend = cell(n_sol,2); 
  for i=1:n_sol
    legend{i,1} = {'o', 6, 3, valColor(i,:), valColor(i,:)}; 
    legend{i,2} = num2str(i); 
  end
  legend{i_min,1}{1} = 's'; % replace circle by square
          
  % distance matrix & mds
  dist = zeros(n_sol, n_sol); % initiate distance matrix
  for i = 1:n_sol
    for j = i+1:n_sol
      dist(i,j) = sum((sol(i,:) - sol(j,:)).^2 ./ (sol(i,:).^2 + sol(j,:).^2));
    end
  end
  dist = dist + dist'; % make distance matix symmetric
  [y, e] = cmdscale(dist); % configuration matrix, eigenvalues

  % plot eigen vectors
  [Hfig, Hleg] = plot3i(y(:,1:3), legend, ['classical mds for ', strrep(results, '_' , ' ')]);
  figure(Hfig)
  xlabel('1st eigenvector')
  ylabel('2nd eigenvector')
  zlabel('3rd eigenvector')
  box on

  % print correlations between parameters and first 3 eigenvectors 
  prt_tab({parNm,corr(sol,y(:,1:3))},{'par', 'axis 1', 'axis 2', 'axis 3'}, 'classical mds');

  figure % plot eigenvalues
  plot(1:n_par, e(1:n_par), '*b', n_par+1:n_sol, e(n_par+1:n_sol), '*r')
  xlabel('rank');
  ylabel('eigenvalue');
  title([num2str(n_par), ' parameters estimated'])

