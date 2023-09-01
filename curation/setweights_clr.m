%% setweights_clr
% clears all weights changes in a mydata-file

%%
function [factor_cur, flds] = setweights_clr(my_pet)
  % created 2023/09/01 by Bas Kooijman
  %% Syntax
  % <../setweights_clr.m *setweights_clr*> (my_pet)
  
  %% Description
  % Weight-coefficients can only be set in mydata files by specifying multiplication factors on default settings.
  % The function removes all weight changes in a mydata-file., except if the factors zero 
  %
  % Input
  %
  % * my_pet: string with entry-name for loading/writing mydata_my_pet
  %
  % Output
  %
  % * factor_cur: vector with current multipliers for weights of all data sets
  % * flds: cell string with fieldnames of all data sets
  
  %% Remarks
  % see setweights_all and setweights_tW for comparable functions
  
  %% Examples
  % setweights_clr('Martialia_hyadesi'); on the assumption that mydata_Martialia_hyadesi.m is in the current dir

  fnm = ['mydata_', my_pet];
  [data, ~, ~, ~, weights] = feval(fnm); % fill structure data and weights
  flds = fieldnames(data); flds(end) = []; % all data fields except psd
  wghts = setweights(data,[]); wghts = rmfield(wghts,'psd'); % weight settings except psd
  n = length(flds); factor_cur = ones(n,1);
  for i=1:n; factor_cur(i) = weights.(flds{i})(1)/wghts.(flds{i})(1); end   
    
  % read mydata
  fnm = [fnm, '.m'];
  mydata = fileread(fnm);
  
  % remove weight changes of real data
  ind_w = strfind(mydata, 'weights = setweights(data, []);'); 
  ind_w = ind_w + 0 + strfind(mydata(ind_w:end), char(10)); ind_w = ind_w(1);
  ind = strfind(mydata, '%% set pseudodata'); 
  mydata(ind_w:ind-2) = [];
  
  % remove weight changes of pseudo data
  n_psd  = strfind(mydata, 'weights.psd'); % weight changes in pseudo-data
  for i=1:n_psd % scan pseudo-data fields
    ind = strfind(mydata,'weights.psd');
    if ~isempty(ind) % remove current setting
      ind_1 = strfind(mydata(ind:end), char(10)); mydata(ind:ind-1+ind_1(1)) = [];
    end 
  end

  % restore zero settings of real data
  for i=1:n % scan fields
    if factor_cur(i) == 0
      txt = ['weights.',flds{i}];
      mydata = [mydata(1:ind_w-1), txt, ' = ', txt, ' * 0;', char(10), mydata(ind_w:end)];
    else
      factor_cur(i) = 1;
    end
  end

  % write mydata
  fid_mydata = fopen(fnm, 'w+'); fprintf(fid_mydata, '%s', mydata); fclose(fid_mydata);

