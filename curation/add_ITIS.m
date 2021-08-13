%% add_ITIS
% add files id_ITIS to metaData.links

%%
function add_ITIS(pets)
% created 2021/08/13 by Bas Kooijman


  WD = cdCur;
  n=length(pets);
     

   for i = 1:n
     fprintf(' %g : %s \n', i, pets{i}); % report progress to screen 
   
     cdEntr(pets{i})
     id_ITIS = get_id_ITIS(pets{i});   
     % write mydata_my_pet.m file
     links_txt = ['metaData.links.id_ITIS = ''', id_ITIS, '''; % ITIS', char([13 10])];
     % paste new link in existing mydata file
     mydata = fileread(['mydata_', pets{i},'.m']);
     i_0 = strfind(mydata, 'metaData.links.id_EoL')-1; 
     mydata = [mydata(1:i_0), links_txt, mydata(i_0+1:end)];
     fid = fopen(['mydata_', pets{i},'.m'],'w+');
     fprintf(fid, '%s', mydata); fclose(fid);
         
     run_repair(pets{i}); % write results_my_pet.mat file
         
     % write zip file
     cd('../../entries_zip'); % goto add_my_pet/entries_zip from  add_my_pet/entries/my_pet
     zip_my_pet(pets{i}, '../entries'); % zip the entry and save
         
     % write toolbar
     cdCur; prt_my_pet_toolbar(pets{i}, ['../../deblab/add_my_pet/entries_web/', pets{i},'/']);                                  
 
   end
       
   cd(WD);

end

function run_repair(my_pet)
% use estim_pars for writing results_my_pet.mat file
global pets 

pets = {my_pet}; 

estim_options('default'); 
estim_options('pars_init_method', 2); 
estim_options('results_output', 0); 
estim_options('method', 'no'); 

estim_pars; 
end
