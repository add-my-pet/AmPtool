%% repair_data01
% edit mydata_my_pet, write results_my_pet.mat, save zip, writes entries_web/my_pet/my_pet_res.html

%%
function nm = repair_data01(entries)
% created 2023/03/17 by Bas Kooijman

%% Syntax
% [WD, nm] = <repair_data01 *repair_data01*>(entries)

%% Description
% Checks if fields data.Wi or Wp or Wb are presents
%
% Input:
%
% * entries: character or cell string with one or more entries
%
% Ouput:
%
% * WD: current path
% * nm: cell string with modified field names

%% Remarks
% Requires syncing with servers when done

%% Example
% repair_comment

cur2ew = '../../deblab/add_my_pet/entries_web/'; % path from AmPtool/curation to entries_web

WD = pwd; nm = cell(0,1);
nm = {
    'Sterechinus_neumayeri'
    'Chiloscyllium_plagiosum'
    'Acipenser_gueldenstaedtii'
    'Acipenser_persicus'
    'Acipenser_ruthenus'
    'Acipenser_stellatus'
    'Acipenser_sturio'
    'Anguilla_anguilla'
    'Hiodon_tergisus'
    'Osteoglossum_bicirrhosum'
    'Arapaima_gigas'
    'Clupea_harengus'
    'Alosa_alosa'
    'Alosa_sapidissima'
    'Sardina_pilchardus'
    'Ethmalosa_fimbriata'
    'Engraulis_encrasicolus'
    'Chirocentrus_dorab'
    'Chanos_chanos'
    'Enteromius_liberiensis'
    'Cyprinus_carpio'
    'Carassius_carassius'
    'Carassius_gibelio'
    'Barbus_barbus'
    'Luciobarbus_sclateri'
    'Danio_rerio'
    'Tinca_tinca'
    'Rhodeus_amarus'
    'Gobio_gobio'
    'Romanogobio_albipinnatus'
    'Alburnoides_bipunctatus'
    'Alburnoides_eichwaldii_Kaboudval'
    'Alburnoides_eichwaldii_ShirAbad'
    'Alburnoides_eichwaldii_Tajan'
    'Alburnoides_eichwaldii_ZarrinGol'
    'Abramis_brama'
    'Chondrostoma_nasus'
    'Rutilus_rutilus'
    'Squalius_cii'
    'Blicca_bjoerkna'
    'Pimephales_promelas'
    'Cobitis_taenia'
    'Cobitis_paludica'
    'Hydrocynus_vittatus'
    'Hoplias_malabaricus'
    'Colossoma_macropomum'
    'Piaractus_brachypomus'
    'Prochilodus_nigricans'
    'Semaprochilodus_taeniurus'
    'Semaprochilodus_insignis'
    'Leporinus_friderici'
    'Astyanax_mexicanus'
    'Hyphessobrycon_pulchripinnis'
    'Moenkhausia_dichroura'
    'Brycon_moorei'
    'Brycon_opalinus'
    'Brycon_amazonicus'
    'Salminus_brasiliensis'
    'Electrophorus_electricus'
    'Corydoras_aeneus'
    'Silurus_glanis'
    'Pangasianodon_hypophthalmus'
    'Coregonus_albula'
    'Coregonus_lavaretus'
    'Oncorhynchus_mykiss'
    'Oncorhynchus_tshawytscha'
    'Salvelinus_alpinus'
    'Esox_americanus'
    'Esox_lucius'
    'Esox_masquinongy'
    'Esox_niger'
    'Percopsis_omiscomaycus'
    'Amblyopsis_rosae'
    'Opsanus_tau'
    'Lophius_piscatorius'
    'Sander_lucioperca'
    'Gymnocephalus_cernuus'
    };
    
if ~exist('entries','var')
  entries = select;
elseif ~iscell(entries)
  entries = {entries};
end
n=length(entries); 

for i=1:n % scan entries
  my_pet = entries{i}; 
  fprintf('%g: %s\n', i, my_pet);
  cdEntr(my_pet); % cd to add_my_pet/entries/my_pet

  eval(['[data, auxData, metaData, txtData] = mydata_', my_pet, ';']); % run mydata_my_pet
  if any(isfield(data,{'W0','Wh','Wb','Wj','Wp','Wi'}))
    nm=[nm;my_pet];
    edit(['mydata_', my_pet, '.m']); % edit mydata_my_pet.m file
    edit(['predict_', my_pet, '.m']); % edit predict_my_pet.m file
    fprintf('type dbcont to proceed or dbquit \n'); keyboard
    run_collection(my_pet);
  end
end
cd(WD)
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
