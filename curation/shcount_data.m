%% shcount_data
% plots counts of number of pseudodata sets, zero-variate data sets and univariate data sets

%%
function n = shcount_data
% created 2018/04/24 by Bas Kooijman

%% Syntax
% n = <../shcount_data.m *shcount_data*> 

%% Description
% plots survivor functions of number of pseudodata sets, zero-variate data sets and univariate data sets for all entries
%
% Output
%
% * n: 3-vector with meadian numbers of pseudo, zero- and uni-variate data sets

%% Example of use
% n = shcount_data

close all

N = cumsum(count_data,2);
median_psd = median(N(:,1)); median_0 = median(N(:,2)); median_1 = median(N(:,3));
n = [median_psd, median_0, median_1];
surv_psd = surv(N(:,1),0); surv_0 = surv(N(:,2),0); surv_1 = surv(N(:,3),0);

plot([0; median_psd; median_psd], [0.5;0.5;0], 'b', surv_psd(:,1), surv_psd(:,2), 'b', 'Linewidth', 2)
hold on
plot([0; median_0; median_0], [0.5;0.5;0], 'm', surv_0(:,1), surv_0(:,2), 'm', 'Linewidth', 2)
plot([0; median_1; median_1], [0.5;0.5;0], 'r', surv_1(:,1), surv_1(:,2), 'r', 'Linewidth', 2)
set(gca, 'FontSize', 15, 'Box', 'on')
xlabel('# of data sets: pseudo, zero-variate, total'); ylabel('survivor function')
title(datestr(date,26))
saveas (gca,'../../img/about/count_data.png')

