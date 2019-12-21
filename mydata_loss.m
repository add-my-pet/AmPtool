%% mydata_loss: new loss function
% G = \sum_ij w_ij G_ij; G_ij = F_ij/ (1 - F_ij); 
% H = \sum_ij w_ij H_ij; H_ij = G_ij^(1/2)
% For n_i = 1: F_i1 = (d_i1 - p_i1)^2/ (d_i1^2 + p_i1^2)
% suppose a = d_i1/ p_i1; F_i1 = (a - 1)^2/ (a^2 + 1)

la = linspace(-.1,.1,500); a = 10.^la;
F = (a - 1).^2 ./ (a.^2 + 1); G = F ./ (1-F);
close all

Hfig1 = figure(1);
set(gca, 'FontSize', 15, 'Box', 'on')
plot(la, F, 'r', 'LineWidth', 2)
xlabel('_{10}log p_{i1}/d_{i1}')
ylabel('F_{i1}')
%saveas(Hfig1, 'pd_F.png')

Hfig2 = figure(2);
set(gca, 'FontSize', 15, 'Box', 'on')
plot(la, G, 'b', 'LineWidth', 2)
xlabel('_{10}log p_{i1}/d_{i1}')
ylabel('G_{i1}')
%saveas(Hfig2, 'pd_G.png')

Hfig3 = figure(3);
set(gca, 'FontSize', 15, 'Box', 'on')
plot(la, G.^(1/2), 'g', 'LineWidth', 2)
xlabel('_{10}log p_{i1}/d_{i1}')
ylabel('G_{i1}^{1/2}')
%saveas(Hfig3, 'pd_H.png')
