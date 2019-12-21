%% mydata_sM: explanation for deviations of ep_min values from max ep_min

    % get data
    kapssse = read_allStat('kap','s_s','s_M','sM_min', 'ep_min'); 
    kap = kapssse(:,1); s_s = kapssse(:,2); s_M = kapssse(:,3); sM_min = kapssse(:,4); ep_min = kapssse(:,5);
    ep_minmax = (s_s ./ (kap.^2 .* (1 - kap))) .^(1/3); 
    %
    del_ep = ep_minmax ./ ep_min;
    del_sM = sM_min ./ s_M ; 
    entries = select;
    
    % plot
    close all
    Hfig = figure;
    plot(del_ep, del_sM, '.k');
    set(gca, 'FontSize', 15, 'Box', 'on')
    xlabel('max e_p^{min}/ e_p^{min}')      
    ylabel('s_M at f=e_p^{min}/ s_M at f=1')
    %
    h = datacursormode(Hfig);
    h.UpdateFcn = @(obj, event_obj)xylabels(obj, event_obj, entries, [del_ep, del_sM]);
    datacursormode on % mouse click on plot
