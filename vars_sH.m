%% vars_sH
close all

legend = legend_actino;
  
vars = read_allStat('ep_min', 's_s', 's_M', 'E_Hb', 'E_Hp', 'kap', 'L_b', 'L_p', 'L_i', 'p_M', 'c_T'); 
ep_min = vars(:,1); s_s = vars(:,2); s_M = vars(:,3);  E_Hb = vars(:,4);  E_Hp = vars(:,5); 
kap = vars(:,6); L_b = vars(:,7); L_p = vars(:,8); L_i = vars(:,9); p_M = vars(:,10)./ vars(:,11);
S_H = E_Hp./E_Hb; s_H = S_H .* (L_b./L_p).^3; 

shstat_options('default');
shstat_options('y_transform', 'log10');

shstat_options('x_transform', 'none');

[Hfig1 Hleg1] = shstat([ep_min, S_H], legend); 
figure(Hfig1) 
xlabel('e_p^{min}, -')      
ylabel('_{10}log E_H^p/E_H^b, -')

[Hfig2 Hleg2] = shstat([ep_min, s_H], legend); 
figure(Hfig2) 
xlabel('e_p^{min}, -')      
ylabel('_{10}log [E_H^p]/[E_H^b], -')



[Hfig3 Hleg3] = shstat([kap, S_H], legend); 
figure(Hfig3) 
xlabel('\kappa, -')      
ylabel('_{10}log E_H^p/E_H^b, -')

[Hfig4 Hleg4] = shstat([kap, s_H], legend); 
figure(Hfig4) 
xlabel('\kappa, -')      
ylabel('_{10}log [E_H^p]/[E_H^b], -')

shstat_options('x_transform', 'log10');

[Hfig5 Hleg5] = shstat([L_i, S_H], legend); 
figure(Hfig5) 
xlabel('_{10}log L_\infty, cm')      
ylabel('_{10}log E_H^p/E_H^b, -')

[Hfig6 Hleg6] = shstat([L_i, s_H], legend); 
figure(Hfig6) 
xlabel('_{10}log L_\infty, cm')      
ylabel('_{10}log [E_H^p]/[E_H^b], -')

[Hfig7 Hleg7] = shstat([s_M, S_H], legend); 
figure(Hfig7) 
xlabel('s_M, -')      
ylabel('_{10}log E_H^p/E_H^b, -')

[Hfig8 Hleg8] = shstat([s_M, s_H], legend); 
figure(Hfig8) 
xlabel('s_M, -')      
ylabel('_{10}log [E_H^p]/[E_H^b], -')
