%% connect_subclade
% connects data oints for all pairs of subclde members
%
function connect_subclade(Hfig, data, clade, subclade, lineSpecs)
% created at 2021/05/14 by Bas Kooijman

  %% Syntax
  % <connect_subclade.m *connect_subclade*>(Hfig, data, clade, subclade, lineSpecs)

  %% Description
  % connects data oints for all pairs of subclade members. The number of rows in data shouls match the number of members of clade.
  %
  % Input
  %
  % Hfig: figure handle (output from shstat)
  % data: (N,2 or 3) matrix with data values
  % clade: string with name of clade
  % subclade: string with name of clade, whose members belong to clade
  % lineSpecs: optional cell string with line specifications type, linewidth, color; Default {':', 1, [0 0 0]} 
  %
  % Output
  %
  % * legend: (3,2) cell matrix with (line, taxon)-pairs
  %
  %% Example of use
  % See mydata_mds_Carnivora
  
  if ~exist('lineSpecs','var') || isempty(lineSpecs)
      lineSpecs = {':', 1, [0 0 0]};
  end
  T = lineSpecs{1}; LW = lineSpecs{2}; LC = lineSpecs{3};   
 
  dim = size(data, 2);
  nm_clade = select(clade); n_clade = length(nm_clade); 
  if n_clade ~= size(data,1)
      return
  end
  nm_subclade = select(subclade); n_subclade = length(nm_subclade); 
  [in_0, in] = ismember(nm_subclade, nm_clade); in = in(in_0);

  figure(Hfig)
  hold on
  for i = 1:n_subclade-1
    for j = i:n_subclade
      xyz = data(in([i;j]),:);
      if dim == 2
        plot(xyz(:,1), xyz(:,2), T, 'LineWidth', LW, 'Color', LC); 
      elseif dim == 3
        plot3(xyz(:,1), xyz(:,2), xyz(:,3), T, 'LineWidth', LW, 'Color', LC); 
      end
    end
  end
end
