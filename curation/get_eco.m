%% get_eco
% specifies ecology for AmP entries

%%
function [climate, ecozone, habitat, embryo, migrate, food, gender, reprod] = get_eco(taxon)
% created 2018/04/03 by Bas Kooijman

%% Syntax
% [climate, ecozone, habitat, embryo, migrate, food, gender, reprod] = <get_eco *get_eco*>(taxon)

%% Description
% Fills cell strings with ecological specifications of AmP species
%
% Input:
%
% * taxon: character string with name of an entry
%
% Output:
%
% * climate, ecozone, habitat, embryo, migrate, food, gender, reprod: cell arrays with codes

%% Remarks
% The codes are described in AmPeco.html.
% check the correctness of the codes with <check_eco *check_eco*>


%% Example of use
% [climate, ecozone, habitat, embryo, migrate, food, gender, reprod] = get_eco('Daphnia_magna');

  switch taxon
    case 'Haliclona_oculata'
      climate = {'MC'};
      ecozone = {'MAN','MAS'};
      habitat = {'0bMp','biMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'};
      reprod  = {'Ob'};

    case 'Ptilosarcus_gurneyi'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0iMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chironex_fleckeri'
      climate = {'MC'};
      ecozone = {'MAN','MAS'};
      habitat = {'0bMp','biMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCik','biCvf'};
      gender  = {'D'};
      reprod  = {'Aa'};

    case 'Hydra_viridissima'
      climate = {'Cfb','Dfb'};
      ecozone = {'TH'};
      habitat = {'0iFp','biFl'};
      embryo  = {'Fc'};
      migrate = {};
      food    = {'biP','biAa'};
      gender  = {'Hh'};
      reprod  = {'Ob'};

    case 'Pelagia_noctiluca'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cyanea_capillata'
      climate = {'MC','ME'};
      ecozone = {'MPN','MAN','MN'};
      habitat = {'0iMp','biMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'Aa'};

    case 'Rhizostoma_octopus'
      climate = {'MC'};
      ecozone = {'MPN','MAN'};
      habitat = {'0iMp','biMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'Aa'};

    case 'Mastigias_papua'
      climate = {'MA'};
      ecozone = {'MPSW','MI'};
      habitat = {'0iMp','biMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','jiAa'};
      gender  = {'D'};
      reprod  = {'Aa'};

    case 'Mnemiopsis_leidyi'
      climate = {'MC'};
      ecozone = {'MA'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Bolinopsis_mikado'
      climate = {'MC'};
      ecozone = {'MPW'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Callianira_antarctica'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Pleurobrachia_pileus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Pleurobrachia_bachei'
      climate = {'MC'};
      ecozone = {'MPNE'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Beroe_gracilis'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCin'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Beroe_ovata'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCin'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Symsagittifera_roscoffensis'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0iMb','0iMi'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biB','jiAa'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Moniliformis_dubius'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TA'};
      habitat = {'0iT'};
      embryo  = {'Ta'};
      migrate = {};
      food    = {'biTvm'};
      gender  = {'D'};
      reprod  = {'Ab'};

    case 'Asplanchna_girodi'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TA','TN','TP'};
      habitat = {'0iFl','0iFp','0iFm'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'biPz','biCir'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Brachionus_plicatilis'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TA','TN','TP'};
      habitat = {'0iFl','0iFp','0iFm'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Lepidochitona_cinerea'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','jiHa','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Panopea_abbreviata'
      climate = {'MB'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ensis_directus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cerastoderma_edule'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cerastoderma_glaucum'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Tridacna_gigas'
      climate = {'MA'};
      ecozone = {'MPSW','MI'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','jiAa'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Donax_trunculus'
      climate = {'MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Abra_segmentum'
      climate = {'MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Tagelus_plebeius'
      climate = {'MB'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Macoma_balthica'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thyasira_cf_gouldi'
      climate = {'MC','ME'};
      ecozone = {'MAN','MPE','MN'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Parathyasira_sp'
      climate = {'ME'};
      ecozone = {'MN'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mytilopsis_sallei'
      climate = {'A','B'};
      ecozone = {'TN','TPi','TA','TH'}; % orgininally in central and south Am
      habitat = {'0iFe'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'piPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mya_arenaria'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sphaerium_corneum'
      climate = {'C','D'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iFp'};
      embryo  = {'Fbb'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Arctica_islandica'
      climate = {'MC','ME'};
      ecozone = {'MAN','MN'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Spisula_subtruncata'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Spisula_solidissima'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Amarilladesma_mactroides'
      climate = {'MC'};
      ecozone = {'MASE'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ruditapes_philippinarum'
      climate = {'MB','MC'};
      ecozone = {'MANE','MPNW'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'Da'};
      reprod  = {'O'};

    case 'Ruditapes_decussatus'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'Da'};
      reprod  = {'O'};

    case 'Dosinia_exoleta'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mercenaria_mercenaria'
      climate = {'MA','MB','MC'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Callista_chione'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Echyridella_menziesii'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0jFp','jiFr','jiFl'};
      embryo  = {'Fbb'};
      migrate = {};
      food    = {'bjTvf','jiPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Anodonta_cygnea'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiFr','jiFl'};
      embryo  = {'Fbb'};
      migrate = {};
      food    = {'bjTvf','jiPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Actinonaias_ligamentina'
      climate = {'Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0jFp','jiFr','jiFl'};
      embryo  = {'Fbb'};
      migrate = {};
      food    = {'bjTvf','jiPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Westralunio_carteri'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0jFp','jiFr','jiFl'};
      embryo  = {'Fbb'};
      migrate = {};
      food    = {'bjTvf','jiPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Argopecten_purpuratus'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pecten_maximus'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Zygochlamys_patagonica'
      climate = {'MC'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Placopecten_magellanicus'
      climate = {'MC','ME'};
      ecozone = {'MANW'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chlamys_islandica'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Adamussium_colbecki'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Magallana_gigas'
      climate = {'MC'};
      ecozone = {'MPE','MPSE','MAN'}; % original in pacific east cost
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Crassostrea_virginica'
      climate = {'MB','MC'};
      ecozone = {'MAW'}; 
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ostrea_edulis'
      climate = {'MC'};
      ecozone = {'MANE'}; 
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Perna_viridis'
      climate = {'MA','MB'};
      ecozone = {'MPSE','MAW'}; % originally SE Pacific
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Perna_perna'
      climate = {'MA','MB'};
      ecozone = {'MA'}; 
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Perna_canaliculus'
      climate = {'MC'};
      ecozone = {'MPSW'}; 
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mytilus_edulis'
      climate = {'MC','ME'};
      ecozone = {'MAN','MPN','MN'}; 
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'Da'};
      reprod  = {'O'};

    case 'Mytilus_californianus'
      climate = {'MC'};
      ecozone = {'MPE'}; 
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mytilus_galloprovincialis'
      climate = {'MB'};
      ecozone = {'MAm','MPE'}; % native in the mediterranean 
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'Da'};
      reprod  = {'O'};

    case 'Mytilus_trossulus'
      climate = {'MC','ME'};
      ecozone = {'MAN','MPN','MN'}; 
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Brachidontes_pharaonis'
      climate = {'MA','MB'};
      ecozone = {'MI','MIr','MAm'}; % invading the mediterranean
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mytilaster_minimus'
      climate = {'MB'};
      ecozone = {'MAm'}; 
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Septifer_virgatus'
      climate = {'MB'};
      ecozone = {'MPW'}; 
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lithophaga_lithophaga'
      climate = {'MA','MB'};
      ecozone = {'MANE'}; 
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pinctada_margaritifera'
      climate = {'MA'};
      ecozone = {'MI'}; 
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Pinctada_imbricata'
      climate = {'MA'};
      ecozone = {'MIN','MPSW'}; 
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Pteria_sterna'
      climate = {'MA'};
      ecozone = {'MPE'}; 
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Pinna_nobilis'
      climate = {'MB'};
      ecozone = {'MAm'}; 
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Patella_vulgata'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Nacella_concinna'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Gibbula_umbilicalis'
      climate = {'MB','MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Phorcus_lineatus'
      climate = {'MB','MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Haliotis_rubra'
      climate = {'MC'};
      ecozone = {'MIS'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Haliotis_mariae'
      climate = {'MA'};
      ecozone = {'MIN'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Buccinum_undatum'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPz','jiCim'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Buccinanops_deformis'
      climate = {'MC'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPz','jiCim'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Urosalpinx_cinerea'
      climate = {'MB','MC'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPz','jiCim'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Adelomelon_brasiliana'
      climate = {'MC'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPz','jiCim'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lobatus_gigas'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Littorina_littorea'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Heleobia_australis'
      climate = {'MC'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMm'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Euspira_nitida'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'}; 
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Crepidula_fornicata'
      climate = {'MC'};
      ecozone = {'MAN'}; % native to MANE
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'biPp'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Potamopyrgus_antipodarum'
      climate = {'Cfb'};
      ecozone = {'TAz'}; 
      habitat = {'0jFl','jiFc'};
      embryo  = {'Fp'};      
      migrate = {};
      food    = {'biHa'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Aplysia_californica'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMb','jiMi'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPp','jiHa'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Clione_limacina'
      climate = {'MC','ME'};
      ecozone = {'MPN','MAN','MN'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'biCim'}; % only preys on Limacina
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Cuthona_nana'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPz','jiCih'}; % only prays on Hydractinia echinata
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Lymnaea_stagnalis'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFl','0iFp','0iFm'};
      embryo  = {'Fs'};      
      migrate = {};
      food    = {'biHa','biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Stagnicola_palustris'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFl','0iFp','0iFm'};
      embryo  = {'Fs'};      
      migrate = {};
      food    = {'biHa','biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Biomphalaria_glabrata'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iFl','0iFp','0iFm'};
      embryo  = {'Fs'};      
      migrate = {};
      food    = {'biHa','biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Planorbis_planorbis'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFl','0iFp','0iFm'};
      embryo  = {'Fs'};      
      migrate = {};
      food    = {'biHa','biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Achatina_achatina'
      climate = {'A'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tt'};      
      migrate = {};
      food    = {'biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Ambigolimax_valentianus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tt'};      
      migrate = {};
      food    = {'biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Cornu_aspersum'
      climate = {'BSk','Csa','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tt'};      
      migrate = {};
      food    = {'biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Helix_pomatia'
      climate = {'BSk','Csa','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tt'};      
      migrate = {};
      food    = {'biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Helix_lucorum'
      climate = {'BSk','BWk', 'Csa'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tt'};      
      migrate = {};
      food    = {'biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Cernuella_virgata'
      climate = {'BSk','Csa','Cfb'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tt'};      
      migrate = {};
      food    = {'biHl'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Nautilus_pompilius'
      climate = {'MA'};
      ecozone = {'MPE'};
      habitat = {'0iMp','0iMr'};
      embryo  = {'Ms'};      
      migrate = {};
      food    = {'biCik','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sepia_officinalis'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Ms'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sepiola_atlantica'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Ms'};      
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sepietta_obscura'
      climate = {'MB'};
      ecozone = {'MANE','MAm'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Ms'};      
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Euprymna_hyllebergi'
      climate = {'MA'};
      ecozone = {'MIE'};
      habitat = {'0iMc'};
      embryo  = {'Ms'};      
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rossia_macrosoma'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMc'};
      embryo  = {'Ms'};      
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Doryteuthis_pealeii'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Doryteuthis_gahi'
      climate = {'MC'};
      ecozone = {'MASW','MPSE'};
      habitat = {'0iMp'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dosidicus_gigas'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0iMp'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Illex_argentinus'
      climate = {'MC'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};      
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ommastrephes_bartramii'
      climate = {'MB'};
      ecozone = {'MC'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};      
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thysanoteuthis_rhombus'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Octopus_cyanea'
      climate = {'MA'};
      ecozone = {'MI','MPSW'};
      habitat = {'0jMc','jiMr'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Octopus_maya'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMc','jiMr'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Octopus_vulgaris'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Octopus_mimus'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Octopus_joubini'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Octopus_tetricus'
      climate = {'MA','MB'};
      ecozone = {'MISE','MPSW'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Octopus_tehuelchus'
      climate = {'MB'};
      ecozone = {'MASW'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mc'};      
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Aspidiophorus_polystictos'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TA','TN','TP'};
      habitat = {'0iFl','0iFp','0iFm'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'biPn'};
      gender  = {'D'};
      reprod  = {'Apo'};

    case 'Magellania_fragilis'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0iMb'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biP'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Phoronis_pallida'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'};
      reprod  = {'Ob'};

    case 'Phoronis_psammophila'
      climate = {'MB','MC'};
      ecozone = {'MC'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'};
      reprod  = {'Ob'};

    case 'Flustra_foliacea'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'}; % D as zooids, but Hh as colony
      reprod  = {'Ob'};

    case 'Myzostoma_cirriferum'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjD','jiPz'}; % commensales on rosy featherstar Antedon bifida 
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Ophryotrocha_labronica'
      climate = {'MB'};
      ecozone = {'MAm'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','jiHl'}; 
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hediste_diversicolor'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjP','jiCi'}; 
      gender  = {'D'};
      reprod  = {'O'}; 

    case 'Neanthes_arenaceodentata'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjP','jiCi'}; 
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Capitella_teleta'
      climate = {'MC'};
      ecozone = {'MAN','MPNE'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjP','jiCi'}; 
      gender  = {'Da'};
      reprod  = {'Apa'};

    case 'Arenicola_marina'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','bjD'}; 
      gender  = {'D'};
      reprod  = {'O'};

    case 'Urechis_caupo'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMc','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPp','bjD'}; 
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dendrobaena_octaedra'
      climate = {'C'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biD'}; 
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Lumbricus_terrestris'
      climate = {'B','C'};
      ecozone = {'TP','TA','TN','TH'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biD'}; 
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Octolasion_cyaneum'
      climate = {'C'};
      ecozone = {'THp','TAz'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biD'}; 
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Aporrectodea_longa'
      climate = {'C'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biD'}; 
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Eisenia_fetida'
      climate = {'C'};
      ecozone = {'TP','TN','TA','TH'}; % originally in Europe only
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biD'}; 
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Barbronia_weberi'
      climate = {'A','B'};
      ecozone = {'TPi','TA'}; 
      habitat = {'0iFm'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biTim','biCim'}; 
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Theromyzon_tessulatum'
      climate = {'Cfa'};
      ecozone = {'THp'}; 
      habitat = {'0iFm'};
      embryo  = {'Fb'};
      migrate = {};
      food    = {'biTvb'}; 
      gender  = {'Hsm'};
      reprod  = {'O'};
      
    case 'Schmidtea_polychroa'
      climate = {'C'};
      ecozone = {'THp'};
      habitat = {'0iFl','0iFp','0iFm'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biCiw','biCim'};
      gender  = {'Hh'};
      reprod  = {'Ob'};

    case 'Baikaiobia_guttata'
      climate = {'Dwc'};
      ecozone = {'THp'}; % Lake Baikal
      habitat = {'0iFl'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biD'};
      gender  = {'Hh'};
      reprod  = {'Ob'};

    case 'Branchotenthes_octohamatus'
      climate = {'MA'};
      ecozone = {'MPSW'}; % 
      habitat = {'0iMd'};
      embryo  = {'Mc'};
      migrate = {};
      food    = {'biTvf'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Lineus_viridis'
      climate = {'MC'};
      ecozone = {'MAE'}; % 
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ferosagitta_hispida'
      climate = {'MA','MB','MC'};
      ecozone = {'MA'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Caenorhabditis_elegans'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iT'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biB','biD'};
      gender  = {'Hsmm'};
      reprod  = {'O'};

    case 'Macrobiotus_hufelandii'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iT'};
      embryo  = {'Tns'}; % eggs are in previous moult
      migrate = {};
      food    = {'biHa','biCi','biB'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Hypsibius_convergens'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iT'};
      embryo  = {'Tns'}; % eggs are in previous moult
      migrate = {};
      food    = {'biHa','biCi','biB'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Ramazzottius_oberhaeuseri'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iT'};
      embryo  = {'Tns'}; % eggs are in previous moult
      migrate = {};
      food    = {'biHa','biCi','biB'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Milnesium_tardigradum'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iT'};
      embryo  = {'Tns'}; % eggs are in previous moult
      migrate = {};
      food    = {'biHa','biCi','biB'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Pycnogonum_litorale'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mbm'};
      migrate = {};
      food    = {'biCia'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Smeringurus_mesaensis'
      climate = {'BW'};
      ecozone = {'THn'};
      habitat = {'0jTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Grosphus_hirtus'
      climate = {'Aw'};
      ecozone = {'TPam'};
      habitat = {'0jTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhizoglyphus_robini'
      climate = {'C','D'};
      ecozone = {'TH'};
      habitat = {'0jTg','0jTh'};
      embryo  = {'Th'};
      migrate = {};
      food    = {'biH'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Alaskozetes_antarcticus'
      climate = {'EF'};
      ecozone = {'TS'};
      habitat = {'0jTd'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biH','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Aglaoctenus_lagotis'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0jTf','0jTg','0iTi'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Tetragnatha_versicolor'
      climate = {'Am','Cfa','Dfa','Dfb'};
      ecozone = {'THn','TN'};
      habitat = {'0jTf','0jTg','0iTi'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cyprideis_torosa'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TA','TN','TP'};
      habitat = {'0iFm','0iFp','0iSm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biD','biHa'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Pollicipes_polymerus'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Notobalanus_flosculus'
      climate = {'MC'};
      ecozone = {'MASW','MPSE'};
      habitat = {'0jMp','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Amphibalanus_amphitrite'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0jMp','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Austrominius_modestus'
      climate = {'MC'};
      ecozone = {'MA','MPSW'};
      habitat = {'0jMp','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Argulus_coregoni'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFl','0iFp'};
      embryo  = {'Fc'};
      migrate = {};
      food    = {'biTvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Nitokra_spinipes'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biP','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acanthocyclops_robustus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biP','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cyclops_vicinus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biP','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mesocyclops_leukarti'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biP','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Calanus_sinicus'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Eurytemora_affinis'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMpe'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Temora_longicornis'
      climate = {'MB','MC'};
      ecozone = {'MA'};
      habitat = {'0iMpe'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepeophtheirus_salmonis'
      climate = {'MC'};
      ecozone = {'MAN','MPN'};
      habitat = {'0iMp'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biTvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gastrosaccus_roscoffensis'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMpe','0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Leptomysis_lingvura'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'};
      habitat = {'0iMpe','0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Americamysis_bahia'
      climate = {'MA','MB'};
      ecozone = {'MAW'};
      habitat = {'0iMpe','0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hemimysis_speluncola'
      climate = {'MB'};
      ecozone = {'MAm'};
      habitat = {'0iMpe','0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mysis_mixta'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0iMpe','0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Neomysis_integer'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'};
      habitat = {'0iMpe','0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Praunus_flexuosus'
      climate = {'MC'};
      ecozone = {'MANE'}; % introduced in MANW
      habitat = {'0iMpe','0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Asellus_aquaticus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm','0iFc'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dynamene_bidentata'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0iMc'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biD'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Porcellio_scaber'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH','TA'}; % originally European
      habitat = {'0iTf','0iTg','0iTi'};
      embryo  = {'Tbf'};
      migrate = {};
      food    = {'biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Corophium_volutator'
      climate = {'MC'};
      ecozone = {'MAN'}; 
      habitat = {'0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Monocorophium_insidiosum'
      climate = {'MC'};
      ecozone = {'MANW'}; 
      habitat = {'0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp','biD','biHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Jassa_falcata'
      climate = {'MC'};
      ecozone = {'MANW'}; 
      habitat = {'0iMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biPp','biD','biHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gammarus_fossarum'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFl','0iFm','0iFc'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gammarus_pseudolimnaeus'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iFc'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gammarus_pulex'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFl','0iFm','0iFc'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gammarus_roeselii'
      climate = {'Csa','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFl','0iFm','0iFc'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dikerogammarus_villosus'
      climate = {'Csa','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFe','0iFp','0iFl','0iFm','0iFc'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biD','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Arcitalitrus_dorrieni'
      climate = {'Csa','Cfb','Dfb'};
      ecozone = {'TA','THp'};
      habitat = {'0iTf'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biD','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hyalella_azteca'
      climate = {'A','C','D'};
      ecozone = {'THn','TN'};
      habitat = {'0iFm','0iFl','0iFp'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biD','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hyperia_galba'
      climate = {'MC'};
      ecozone = {'MANW'};
      habitat = {'0iMp'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biCij'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hyperoche_medusarum'
      climate = {'MC','ME'};
      ecozone = {'MAN','MPN'};
      habitat = {'0iMp'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biCij'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Euphausia_superba'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0iMpe'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biP'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Meganyctiphanes_norvegica'
      climate = {'MC','ME'};
      ecozone = {'MAN','MN'};
      habitat = {'0iMpe'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biP'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Nyctiphanes_australis'
      climate = {'MC'};
      ecozone = {'MPSW'};
      habitat = {'0iMpe'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biP'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Aristeus_antennatus'
      climate = {'MB'};
      ecozone = {'MAm'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Xiphopenaeus_kroyeri'
      climate = {'MA','MB'};
      ecozone = {'MAW'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Litopenaeus_stylirostris'
      climate = {'MA'};
      ecozone = {'MPE'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Penaeus_semisulcatus'
      climate = {'MA','MB'};
      ecozone = {'MPE','MI','MAm'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Fenneropenaeus_chinensis'
      climate = {'MB','MC'};
      ecozone = {'MPE'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Haliporoides_sibogae'
      climate = {'MB'};
      ecozone = {'MPW'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chorismus_antarcticus'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pandalus_borealis'
      climate = {'MC','ME'};
      ecozone = {'MAN','MPN','MN'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'Hsff'};
      reprod  = {'O'};

    case 'Dichelopandalus_bonnieri'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Heterocarpus_reedi'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Palaemonetes_pugio'
      climate = {'MA','MB','MC'};
      ecozone = {'MAW'};
      habitat = {'0bMb','bjMpe','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Palaemonetes_varians'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'};
      habitat = {'0iMm','0iFm','jiMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Palaemon_elegans'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'}; % invasive in MAE
      habitat = {'0bMb','bjMp','jiMb','jiMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Macrobrachium_vollenhoveni'
      climate = {'MA'};
      ecozone = {'TPa'}; 
      habitat = {'0iFr'};
      embryo  = {'Fbf'};
      migrate = {'Mdc'};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Crangon_crangon'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'}; 
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','jiD','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Astacus_astacus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFl'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pacifastacus_leniusculus'
      climate = {'Cfa','Cfb','Dfa','Dfb'};
      ecozone = {'TH'}; % originall THn, not invasive in THp
      habitat = {'0iFr','0iFl'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Homarus_gammarus'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'}; 
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Homarus_americanus'
      climate = {'MC'};
      ecozone = {'MANW'}; 
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Panulirus_versicolor'
      climate = {'MA'};
      ecozone = {'MPW','MI'}; 
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {'Mo'};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Jasus_lalandii'
      climate = {'MB'};
      ecozone = {'MASE','MISW'}; 
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {'Mo'};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pleuroncodes_monodon'
      climate = {'MC'};
      ecozone = {'MPSE'}; 
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cervimunida_johni'
      climate = {'MC'};
      ecozone = {'MPSE'}; 
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Paralithodes_camtschaticus'
      climate = {'MC','ME'};
      ecozone = {'MPN','MN'}; % introduced in Murmansk Fjord, Barents Sea
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pagurus_bernhardus'
      climate = {'MC'};
      ecozone = {'MANE'}; 
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Birgus_latro'
      climate = {'A'};
      ecozone = {'TPi','MPE'}; 
      habitat = {'0bTf','bjMp','jiTf'};
      embryo  = {'Tbf'};
      migrate = {};
      food    = {'bjP','jiHs'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cancer_pagurus'
      climate = {'MC'};
      ecozone = {'MANE'}; % occursence in MAm is not sure
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Macrocheira_kaempferi'
      climate = {'MB','MC'};
      ecozone = {'MPW'};
      habitat = {'0bMb','bjMp','jiMb','jiMv'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hyas_coarctatus'
      climate = {'MC'};
      ecozone = {'MANW'};
      habitat = {'0bMcb','bjMp','jiMcb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chionoecetes_opilio'
      climate = {'MC','ME'};
      ecozone = {'MAN','MPN','MN'};
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carcinus_maenas'
      climate = {'MC'};
      ecozone = {'MANE','MANW','MPE','MIW'}; % original in MANE only 
      habitat = {'0bMcb','bjMp','jiMcb','jiMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Charybdis_bimaculata'
      climate = {'MB'};
      ecozone = {'MPSE','MIW'};
      habitat = {'0bMb','bjMp','jiMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Eriphia_verrucosa'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'};
      habitat = {'0bMb','bjMp','jiMb','jiMi'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dissodactylus_primitivus'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0bMr','bjMp','jiMr'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiCi','jiS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Neohelice_granulata'
      climate = {'MB'};
      ecozone = {'MASW'};
      habitat = {'0bMr','bjMp','jiMr'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'bjP','biD','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Triops_longicaudatus'
      climate = {'B'};
      ecozone = {'THn'};
      habitat = {'0iFpe'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biD','biHa'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Diaphanosoma_brachyurum'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Bosmina_longirostris'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Eubosmina_coregoni'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Chydorus_sphaericus'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Pleuroxus_aduncus'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH','TA'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Pleuroxus_striatus'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Ceriodaphnia_pulchella'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Ceriodaphnia_dubia'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Tbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Daphnia_cucullata'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Daphnia_longispina'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Daphnia_hyalina'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Daphnia_magna'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH','TPa'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Daphnia_pulex'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH','TA'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Scapholeberis_mucronata'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Tbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Simocephalus_serrulatus'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Moina_macrocopa'
      climate = {'Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Leptodora_kindtii'
      climate = {'Csa','Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFp','0iFl','0iFm'};
      embryo  = {'Fbf'};
      migrate = {};
      food    = {'biPp','biD'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Isotoma_viridis'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biD','biF'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Folsomia_candida'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biD','biF'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Tomocerus_minor'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biD','biF'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Entomobrya_nivalis'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TA','TP'};
      habitat = {'0iTf'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biD','biF'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Orchesella_cincta'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biD','biF'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepidocyrtus_cyaneus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biD','biF'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepisma_saccharina'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TA','TP'};
      habitat = {'0iTf'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ecdyonurus_dispar'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0eFr','0eFc','eiTg'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'beH','beD','beS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhithrogena_semicolorata'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0eFr','0eFc','eiTg'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'beH','beD','beS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Epeorus_assimilis'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0eFr','0eFc','eiTg'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'beH','beD','beS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Oligoneuriella_rhenana'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0eFl','0eFp','0eFm','eiTg'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'beH','beD','beS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Baetis_rhodani'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0eFl','0eFp','0eFm','eiTg'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'beH','beD','beS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cloeon_dipterum'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0eFl','0eFp','0eFm','eiTg'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'beH','beD','beS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Habrophlebia_lauta'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0eFl','0eFp','0eFm','eiTg'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'beH','beD','beS'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Locusta_migratoria'
      climate = {'B','Cs'};
      ecozone = {'TH','TA','TPa'};
      habitat = {'0iTg','0iTs','0iTa','0iTd'};
      embryo  = {'Th'};
      migrate = {'Ms'};
      food    = {'biH'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chortoicetes_terminifera'
      climate = {'BSh'};
      ecozone = {'TA'};
      habitat = {'0iTg','0iTs','0iTa','0iTd'};
      embryo  = {'Th'};
      migrate = {'Ms'};
      food    = {'biH'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Extatosoma_tiaratum'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnp'};
      migrate = {};
      food    = {'biH'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acyrthosiphon_pisum'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH','TPa'};
      habitat = {'0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biAb','biHe'};
      gender  = {'D'};
      reprod  = {'Apf'};

    case 'Notonecta_maculata'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFl','0iFp','0iFm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Aedes_aegypti'
      climate = {'A','B','C'};
      ecozone = {'TH','TN','TP','TA'}; % originally in Africa
      habitat = {'0eFm','eiTf','eiTi'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'bjD','bjCi','eiTv'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chironomus_riparius'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0eFl','0eFp','0eFm','eiTg'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'bjD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chaoborus_americanus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0eFl','0eFp','0eFm','eiTg'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chaoborus_crystallinus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0eFl','0eFp','0eFm','eiTg'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sericostoma_personatum'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iFm'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'bjH'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Plodia_interpunctella'
      climate = {'A','B'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iT'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'bjO'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Bombyx_mori'
      climate = {'Cwa','Cfa'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Th'};
      migrate = {};
      food    = {'bjHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Manduca_sexta'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Th'};
      migrate = {};
      food    = {'bjHl','eiHn'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Heteronympha_merope'
      climate = {'BWh', 'BSh', 'Csa'};
      ecozone = {'TA'};
      habitat = {'0iTd','0iTa','0iTh'};
      embryo  = {'Th'};
      migrate = {};
      food    = {'bjHl','eiHn'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Venturia_canescens'
      climate = {'BSk','Csa','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Th'};
      migrate = {};
      food    = {'bjTii','eiHn'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Onthophagus_taurus'
      climate = {'BSk','Csa','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tc'};
      migrate = {};
      food    = {'bjDc','eiDc'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Onthophagus_binodis'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tc'};
      migrate = {};
      food    = {'bjDc','eiDc'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ophiura_ophiura'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjP','biB','biD','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ophiura_albida'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjP','bjB','biD','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Amphiura_filiformis'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjB','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Asterias_rubens'
      climate = {'MC'};
      ecozone = {'MANE','MAW'};
      habitat = {'0jMcp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pisaster_ochraceus'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0jMcp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Astropecten_aranciacus'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCim'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Astropecten_irregularis'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCim'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Luidia_sarsii'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCie'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Archaster_typicus'
      climate = {'MA'};
      ecozone = {'MPE'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCi','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acanthaster_planci'
      climate = {'MA'};
      ecozone = {'MP','MI'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCia'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Protoreaster_nodosus'
      climate = {'MA'};
      ecozone = {'MP','MI'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCia','bjCis'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Crossaster_papposus'
      climate = {'MC'};
      ecozone = {'MPN','MAN'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCie','bjO'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Asterina_gibbosa'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'};
      habitat = {'0jMcp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Odontaster_validus'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz','bjO'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Echinus_esculentus'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gracilechinus_affinis'
      climate = {'MC','ME'};
      ecozone = {'MAN','MN'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sterechinus_neumayeri'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mesocentrotus_franciscanus'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0jMcp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Strongylocentrotus_purpuratus'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Strongylocentrotus_droebachiensis'
      climate = {'MC','ME'};
      ecozone = {'MPN','MAN','MN'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lytechinus_variegatus'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Paracentrotus_lividus'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Psammechinus_miliaris'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMcp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Loxechinus_albus'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0jMcp','jiMb','jiMi'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa','bjCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Echinocardium_cordatum'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Abatus_cordatus'
      climate = {'ME'};
      ecozone = {'MIS'};
      habitat = {'0iMb'};
      embryo  = {'Mbf'};
      migrate = {};
      food    = {'biP','bjD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Clypeaster_subdepressus'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Holothuria_scabra'
      climate = {'MA'};
      ecozone = {'MI','MP'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Stichopus_vastus'
      climate = {'MA'};
      ecozone = {'MI'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Aspostichopus_japonicus'
      climate = {'MA'};
      ecozone = {'MINE'};
      habitat = {'0jMcp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP','bjHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Branchiostoma_floridae'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Oikopleura_dioica'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPn'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Oikopleura_longicauda'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPn'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Thalia_democratica'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hsff'};
      reprod  = {'Aa'};

    case 'Ciona_intestinalis'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Polyclinum_aurantium'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Myxine_glutinosa'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biSvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Eptatretus_stoutii'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0iMd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biSvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lampetra_planeri'
      climate = {'Cf'};
      ecozone = {'THp'};
      habitat = {'0iFc'};
      embryo  = {'Ft'};
      migrate = {'Mp'};
      food    = {'biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Petromyzon_marinus'
      climate = {'Dfb','Dfc','ME','MC'};
      ecozone = {'THp'};
      habitat = {'0pFc','piMc'};
      embryo  = {'Ft'};
      migrate = {'Mda'};
      food    = {'bpD','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Callorhinchus_capensis'
      climate = {'MB'};
      ecozone = {'MASE','MISW'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Raja_brachyura'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Raja_clavata'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Raja_montagui'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Raja_rhina'
      climate = {'MC'};
      ecozone = {'MANW','MASW','MPNE','MPSE'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Beringraja_binoculata'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Leucoraja_erinacea'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Leucoraja_naevus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Okamejei_acutispina'
      climate = {'MB'};
      ecozone = {'MPW'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Zearaja_chilensis'
      climate = {'MC'};
      ecozone = {'MASW','MPSE'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Bathyraja_interrupta'
      climate = {'ME'};
      ecozone = {'MPN'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Glaucostegus_typus'
      climate = {'MA'};
      ecozone = {'MPSW','MI'};
      habitat = {'0iMcd','0iMm'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pristis_pectinata'
      climate = {'MA'};
      ecozone = {'MA'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {'Ma'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhynchobatus_laevis'
      climate = {'MB'};
      ecozone = {'MI','MPW'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhinobatos_productus'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhinobatos_rhinobatos'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Trygonoptera_personata'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Urolophus_halleri'
      climate = {'MB'};
      ecozone = {'MIE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Manta_birostris'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dasyatis_pastinaca'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMpe'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Torpedo_marmorata'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Tetronarce_californica'
      climate = {'MC'};
      ecozone = {'MPNE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Squatina_californica'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Squatina_dumeril'
      climate = {'MB'};
      ecozone = {'MAW'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pristiophorus_cirratus'
      climate = {'MB'};
      ecozone = {'MIE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Deania_calcea'
      climate = {'MB','MC'};
      ecozone = {'MAm','MAE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Squalus_acanthias'
      climate = {'MB','MC'};
      ecozone = {'MAN','MAm','MAS'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Squalus_blainville'
      climate = {'MB','MC'};
      ecozone = {'MAm','MAE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Somniosus_microcephalus'
      climate = {'ME'};
      ecozone = {'MN','MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf','biCvb','biCvm'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Etmopterus_perryi'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0iMpb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chlamydoselachus_anguineus'
      climate = {'MC'};
      ecozone = {'MIW','MPW','MPE','MAE'};
      habitat = {'0iMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Heptranchias_perlo'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Heterodontus_portusjacksoni'
      climate = {'MB'};
      ecozone = {'MIE'};
      habitat = {'0iMd'};
      embryo  = {'Ms'};
      migrate = {'Mo'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hemiscyllium_ocellatum'
      climate = {'MA'};
      ecozone = {'MPSW'};
      habitat = {'0iMr','0iMd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chiloscyllium_plagiosum'
      climate = {'MA'};
      ecozone = {'MIE','MPW'};
      habitat = {'0iMr','0iMd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhincodon_typus'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Orectolobus_ornatus'
      climate = {'MA','MB'};
      ecozone = {'MISE','MPSW'};
      habitat = {'0iMpb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Orectolobus_halei'
      climate = {'MA','MB'};
      ecozone = {'MISE'};
      habitat = {'0iMpb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Orectolobus_maculatus'
      climate = {'MA','MB'};
      ecozone = {'MISE'};
      habitat = {'0iMpb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sphyrna_lewini'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCic','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sphyrna_zygaena'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCic','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scyliorhinus_canicula'
      climate = {'MB','MC'};
      ecozone = {'MANE','MAm'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carcharhinus_leucas'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iFl','0iMc','0iMr'};
      embryo  = {'Mv'};
      migrate = {'Ma'};
      food    = {'biCi','biCvf','biCvr','biSvm'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carcharhinus_plumbeus'
      climate = {'MB'};
      ecozone = {'MC'};
      habitat = {'0iMcp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carcharhinus_falciformis'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMcp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carcharhinus_obscurus'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMcp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carcharhinus_acronotus'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0iMcp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carcharhinus_longimanus'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0iMcp'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Galeocerdo_cuvier'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMcp'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCi','biCvf','biCvr','biCva','biCvm'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhizoprionodon_acutus'
      climate = {'MA','MB'};
      ecozone = {'MAE','MI','MPW'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {'Ma'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhizoprionodon_terraenovae'
      climate = {'MA','MB'};
      ecozone = {'MAE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Prionace_glauca'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCi','biCvf','biSvm'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Galeorhinus_galeus'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCi','biCvf','biSvm'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carcharias_taurus'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMr'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lamna_nasus'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCic','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Isurus_oxyrinchus'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCic','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carcharodon_carcharias'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCic','biCvf','biCvb','biCvm'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pseudocarcharias_kamoharai'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCic','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Erpetoichthys_calabaricus'
      climate = {'Aw'};
      ecozone = {'TPa'};
      habitat = {'0iFe'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acipenser_ruthenus'
      climate = {'Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fg'};
      migrate = {'Mp'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acipenser_sturio'
      climate = {'MC'};
      ecozone = {'MAE','THp'};
      habitat = {'0iMcd','0iFr'};
      embryo  = {'Fg'};
      migrate = {'Ma','Mda'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acipenser_gueldenstaedtii'
      climate = {'MB'};
      ecozone = {'MAm'};
      habitat = {'0iMcd','0iFr'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acipenser_nudiventris'
      climate = {'MB'};
      ecozone = {'MAm'};
      habitat = {'0iMcd','0iFr'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acipenser_persicus'
      climate = {'MB'};
      ecozone = {'MAm'};
      habitat = {'0iMcd','0iFr'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acipenser_stellatus'
      climate = {'MB'};
      ecozone = {'MAm'};
      habitat = {'0iMcd','0iFr'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Huso_huso'
      climate = {'MB','BSk','BWk'};
      ecozone = {'MAm'};
      habitat = {'0iMcd','0iFr'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Huso_dauricus'
      climate = {'Dwc','Dwd','MC'};
      ecozone = {'THp'};
      habitat = {'0iMcd','0iFr','0iFl'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Amia_calva'
      climate = {'Dfa','Cfb'};
      ecozone = {'THn'};
      habitat = {'0iFm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Atractosteus_spatula'
      climate = {'MB','Cfb'};
      ecozone = {'THn'};
      habitat = {'0iFe','0iFm','0iMm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi','biCvr','biCvb','biCvm'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Megalops_atlanticus'
      climate = {'MA','MB'};
      ecozone = {'MAW'};
      habitat = {'0iMr','0iMcp'};
      embryo  = {'Fp','Mp'};
      migrate = {'Ma'};
      food    = {'bpCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Albula_vulpes'
      climate = {'MA','MB'};
      ecozone = {'MAW','MPE'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {'Ma'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Notacanthus_chemnitzii'
      climate = {'MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMpm','0iMpb'};
      embryo  = {'Mpm'};
      migrate = {};
      food    = {'biCia'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Anguilla_anguilla'
      climate = {'MB','MC','Cfb'};
      ecozone = {'MAN','THp'};
      habitat = {'0jMpe','jpFl','jpFp','jpFr','piMd'};
      embryo  = {'Mpe'};
      migrate = {'Mdc'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Anguilla_japonica'
      climate = {'MB','Cfb'};
      ecozone = {'MPW','THp'};
      habitat = {'0jMpe','jpFl','jpFp','jpFr','piMd'};
      embryo  = {'Mpe'};
      migrate = {'Mdc'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Conger_conger'
      climate = {'MB','MC'};
      ecozone = {'MAN', 'MAE', 'MAm'};
      habitat = {'0jMpe','piMd'};
      embryo  = {'Mpe'};
      migrate = {'Mdc'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hiodon_tergisus'
      climate = {'Dwa'};
      ecozone = {'THn'};
      habitat = {'0jFl','0jFr'};
      embryo  = {'Fpe'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Osteoglossum_bicirrhosum'
      climate = {'MA'};
      ecozone = {'TN'};
      habitat = {'0iFr','0iFm','0iFl'};
      embryo  = {'Fbm'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Notopterus_notopterus'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'0iFr'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chitala_chitala'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'0iFr'};
      embryo  = {'Fnm'};
      migrate = {'Mp'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Arapaima_gigas'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iFl','0iFr'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Clupea_harengus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Clupea_bentincki'
      climate = {'MC'};
      ecozone = {'MPSE'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Clupea_pallasii'
      climate = {'MC','ME'};
      ecozone = {'MPN','MN'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sprattus_sprattus'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Clupeonella_cultriventris'
      climate = {'MC'};
      ecozone = {'MAm'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Alosa_alosa'
      climate = {'MC'};
      ecozone = {'MAE','THp'};
      habitat = {'jiMpe','piFr','0jFr'};
      embryo  = {'Fg'};
      migrate = {'Ma'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Alosa_sapidissima'
      climate = {'MC'};
      ecozone = {'MAW'};
      habitat = {'0iMpe','piFr'};
      embryo  = {'Fg'};
      migrate = {'Ma'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Alosa_saposchnikowii'
      climate = {'MC'};
      ecozone = {'MAm'};
      habitat = {'0iMpe','piFr'};
      embryo  = {'Fg'};
      migrate = {'Mp'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sardina_pilchardus'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sardinops_sagax'
      climate = {'MB'};
      ecozone = {'MI','MP'};
      habitat = {'0iMpe','0iMr'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Limnothrissa_miodon'
      climate = {'Aw'};
      ecozone = {'TPa'};
      habitat = {'0iFl'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Stolothrissa_tanganicae'
      climate = {'Aw'};
      ecozone = {'TPa'};
      habitat = {'0iFl'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Tenualosa_ilisha'
      climate = {'MA'};
      ecozone = {'MIN'};
      habitat = {'0iMpe','piFr'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Amblygaster_sirm'
      climate = {'MA'};
      ecozone = {'MI','MPSW'};
      habitat = {'0iMpe','0iMr'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ethmalosa_fimbriata'
      climate = {'MA'};
      ecozone = {'MAE'};
      habitat = {'0iMpe','piFr'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Herklotsichthys_quadrimaculatus'
      climate = {'MA'};
      ecozone = {'MPW','MI'};
      habitat = {'0iMpe','piFr'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sardinella_aurita'
      climate = {'MB'};
      ecozone = {'MAW','MAE'};
      habitat = {'0iMpe','0iMr'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sardinella_albella'
      climate = {'MA'};
      ecozone = {'MI','MPSW'};
      habitat = {'0iMpe','0iMr'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sardinella_gibbosa'
      climate = {'MA'};
      ecozone = {'MI','MPSW'};
      habitat = {'0iMpe','0iMr'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sardinella_longiceps'
      climate = {'MA'};
      ecozone = {'MI','MPSW'};
      habitat = {'0iMpe','0iMr'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Opisthonema_oglinum'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0iMpe','0iMr'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Opisthonema_libertate'
      climate = {'MA'};
      ecozone = {'MPE'};
      habitat = {'0iMpe','0iMr'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hilsa_kelee'
      climate = {'MA'};
      ecozone = {'MIN','MPW'};
      habitat = {'0iMpe','0iFe'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Engraulis_encrasicolus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0iMcp'};
      embryo  = {'Fpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Engraulis_anchoita'
      climate = {'MC'};
      ecozone = {'MASW'};
      habitat = {'0iMcp'};
      embryo  = {'Fpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Engraulis_japonicus'
      climate = {'MB'};
      ecozone = {'MPW'};
      habitat = {'0iMcp'};
      embryo  = {'Fpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Spratelloides_delicatulus'
      climate = {'MA'};
      ecozone = {'MPW','MI'};
      habitat = {'0iMcp','0iMr'};
      embryo  = {'Fpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Spratelloides_gracilis'
      climate = {'MA'};
      ecozone = {'MPW','MI'};
      habitat = {'0iMcp','0iMr'};
      embryo  = {'Fpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Spratelloides_lewisi'
      climate = {'MA'};
      ecozone = {'MPW'};
      habitat = {'0iMcp'};
      embryo  = {'Fpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chirocentrus_dorab'
      climate = {'MA'};
      ecozone = {'MIE','MPW'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {'Ma'};
      food    = {'biPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Alepocephalus_bairdii'
      climate = {'ME'};
      ecozone = {'MAN','MN'};
      habitat = {'0iMdb'};
      embryo  = {'Mpb'};
      migrate = {};
      food    = {'biCij'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Bajacalifornia_burragei'
      climate = {'MA'};
      ecozone = {'MIW','MPW'};
      habitat = {'0iMdb'};
      embryo  = {'Mpb'};
      migrate = {};
      food    = {'biCij'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chanos_chanos'
      climate = {'MA'};
      ecozone = {'MIE','MPW','TPi'};
      habitat = {'0iMm','0iFm','0iFe'};
      embryo  = {'Mpe'};
      migrate = {'Ma'};
      food    = {'bjCi','bjPz','jiB'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Enteromius_liberiensis'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iFr'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cyprinus_carpio'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fs','Fh'};
      migrate = {'Mp'};
      food    = {'biCi','biHl','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carassius_carassius'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm','0iFl'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi','biHl','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carassius_gibelio'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm','0iFl'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi','biHl','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Barbus_barbus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Capoeta_capoeta'
      climate = {'BSk','BWk'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm','0iFl'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi','biHl','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Luciobarbus_sclateri'
      climate = {'Csb'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Schizothorax_richardsonii'
      climate = {'Cwa'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Danio_rerio'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hypophthalmichthys_molitrix'
      climate = {'Cfa'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi','jiHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Tinca_tinca'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi','jiHl','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhodeus_amarus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iFp'};
      embryo  = {'Fbb'};
      migrate = {};
      food    = {'bjCi','jiHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gobio_gobio'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fs'};
      migrate = {'Mp'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Romanogobio_albipinnatus'
      climate = {'Dwa'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Phoxinus_phoxinus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFc'};
      embryo  = {'Fg'};
      migrate = {'Mp'};
      food    = {'biD','biHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Alburnoides_bipunctatus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fg'};
      migrate = {'Mp'};
      food    = {'biCii','biSii'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Abramis_brama'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFl'};
      embryo  = {'Fs','Fh'};
      migrate = {'Mp'};
      food    = {'biCi','biHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mirogrex_terraesanctae'
      climate = {'Csa'};
      ecozone = {'THp'};
      habitat = {'0iFl'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Vimba_vimba'
      climate = {'BSk','Dwa'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chondrostoma_nasus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fg'};
      migrate = {'Mp'};
      food    = {'biCi','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Iberochondrostoma_lemmingii'
      climate = {'Csa'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pseudochondrostoma_polylepis'
      climate = {'Csa'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rutilus_rutilus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi','jiHl','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scardinius_erythrophthalmus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi','jiHl','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Squalius_cii'
      climate = {'Csa'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi','jiHl','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Squalius_pyrenaicus'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi','jiHl','jiD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Semotilus_atromaculatus'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iFc','0iFl'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi','biHl','biD'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Blicca_bjoerkna'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFl','0iFr','0iFm'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pimephales_promelas'
      climate = {'Cfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iFc','0iFp'};
      embryo  = {'Fnm'};
      migrate = {'Mp'};
      food    = {'biD','biHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhinichthys_atratulus'
      climate = {'Cfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iFc','0iFp'};
      embryo  = {'Fnm'};
      migrate = {'Mp'};
      food    = {'biD','biHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhinichthys_cataractae'
      climate = {'BSk','Cfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iFc','0iFp'};
      embryo  = {'Fnm'};
      migrate = {'Mp'};
      food    = {'biD','biHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Catostomus_catostomus'
    climate = {'Cfb','Cfc'};
      ecozone = {'TH'};
      habitat = {'0iFm','0iFp'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cobitis_taenia'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iFp'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cobitis_paludica'
      climate = {'Csa'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iFp'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hydrocynus_vittatus'
      climate = {'Af','Am'};
      ecozone = {'TPa'};
      habitat = {'0iFr','0iFl'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'bjCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Colossoma_macropomum'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0iFm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'bjPz','jiCi','jiHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hyphessobrycon_pulchripinnis'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iFr'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Brycon_moorei'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iFr'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Leporinus_friderici'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iFr'};
      embryo  = {'Fp'};
      migrate = {'Mp'};
      food    = {'biCi','biHs'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Electrophorus_electricus'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0iFm'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Apteronotus_leptorhynchus'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0iFm','0iFr'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Silurus_glanis'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFl','0iFr'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pangasianodon_hypophthalmus'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'0iFr'};
      embryo  = {'Fs'};
      migrate = {'Mp'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Clarias_gariepinus'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iFr'};
      embryo  = {'Fs'};
      migrate = {'Mp'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Clarias_gariepinus_x_Heterobranchus_longifilis'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iFr'};
      embryo  = {'Fs'};
      migrate = {'Mp'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Heterobranchus_longifilis'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iFr'};
      embryo  = {'Fs'};
      migrate = {'Mp'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Heterobranchus_longifilis_x_Clarius_gariepinus'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iFr'};
      embryo  = {'Fs'};
      migrate = {'Mp'};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ictalurus_punctatus'
      climate = {'Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0iFr'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Noturus_phaeus'
      climate = {'Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0iFr'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Corydoras_aeneus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iFm'};
      embryo  = {'Fc','Fh'};
      migrate = {};
      food    = {'biCi','jiHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepidogalaxias_salamandroides'
      climate = {'BWh'};
      ecozone = {'TA'};
      habitat = {'0iFp'};
      embryo  = {'Ft'};
      migrate = {'TW'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Argentina_silus'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0iMdb'};
      embryo  = {'Mpm'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pseudobathylagus_milleri'
      climate = {'MA','MB','MC'};
      ecozone = {'MPN'};
      habitat = {'0iMpb'};
      embryo  = {'Mpm'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Leuroglossus_stilbius'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMpm'};
      embryo  = {'Mpm'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Galaxias_paucispondylus'
      climate = {'Cfa'};
      ecozone = {'TAz'};
      habitat = {'0iFc'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Galaxias_prognathus'
      climate = {'Cfa'};
      ecozone = {'TAz'};
      habitat = {'0iFc'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Galaxias_maculatus'
      climate = {'Cfa','BWk'};
      ecozone = {'TN','TA'};
      habitat = {'jiFc','jiFl','0jMcp'};
      embryo  = {'Th'}; % this is not a typo
      migrate = {'Mdc'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Coregonus_albula'
      climate = {'Dfc'};
      ecozone = {'MAb'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg','Fs'};
      migrate = {'Mda'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Coregonus_lavaretus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Coregonus_autumnalis'
      climate = {'ME','ET'};
      ecozone = {'MN'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Prosopium_cylindraceum'
      climate = {'ME','ET','Dfc'};
      ecozone = {'MN','TH'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thymallus_thymallus'
      climate = {'Cfa','Cfb','Dfa'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thymallus_tugarinae'
      climate = {'Dwd'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Oncorhynchus_tshawytscha'
      climate = {'MC','ME'};
      ecozone = {'MPN'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'bjCi','jiCic','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Oncorhynchus_mykiss'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'bjCi','jiCic','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};
          
    case 'Oncorhynchus_clarkii_stomias'
      climate = {'BSk'};
      ecozone = {'THn'};
      habitat = {'0iFc','oiFr','oiFl'};
      embryo  = {'Fg'};
      migrate = {'Mp'};
      food    = {'bjCi','jiCii','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Oncorhynchus_keta'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'bjCi','jiCii','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Salmo_trutta'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'bjCi','jiCic','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Salmo_salar'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'bjCi','jiCic','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Salvelinus_alpinus'
      climate = {'MC','ME'};
      ecozone = {'MAN','MN'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Salvelinus_willoughbii'
      climate = {'Cfb'};
      ecozone = {'THp'};
      habitat = {'0jFl'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Salvelinus_namaycush'
      climate = {'Dfa'};
      ecozone = {'THn'};
      habitat = {'0jFl'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Salvelinus_leucomaenis'
      climate = {'Cfb','MC'};
      ecozone = {'THp','MPNW'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Salvelinus_malma'
      climate = {'Dfc'};
      ecozone = {'THn','MPN'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Salvelinus_curilus'
      climate = {'Dfc'};
      ecozone = {'THn','MPN'};
      habitat = {'0jFr','jiMpe'};
      embryo  = {'Fg'};
      migrate = {'Mda'};
      food    = {'biCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Esox_lucius'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFl'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'bjCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Osmerus_mordax'
      climate = {'MC'};
      ecozone = {'MPN','MAN'};
      habitat = {'0jFr','jiMcp'};
      embryo  = {'Fs','Fg','Fh'};
      migrate = {'Ma'};
      food    = {'biPz','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Osmerus_eperlanus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jFr','jiMcp'};
      embryo  = {'Fs','Fg','Fh'};
      migrate = {'Ma'};
      food    = {'biPz','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mallotus_villosus'
      climate = {'MC','ME'};
      ecozone = {'MPN','MAN','MN'};
      habitat = {'0jFr','jiMcp'};
      embryo  = {'Fs'};
      migrate = {'Ma'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Maurolicus_muelleri'
      climate = {'MB','MC'};
      ecozone = {'MC','MAm'};
      habitat = {'0iMpm'};
      embryo  = {'Mpf'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Maurolicus_imperatorius'
      climate = {'MB','MC'};
      ecozone = {'MPNW'};
      habitat = {'0iMpm'};
      embryo  = {'Mpf'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Vinciguerria_nimbaria'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpm'};
      embryo  = {'Mpf'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Borostomias_panamensis'
      climate = {'MA','MB','MC'};
      ecozone = {'MPE'};
      habitat = {'0iMpb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Harpadon_nehereus'
      climate = {'MA'};
      ecozone = {'MIE','MPW'};
      habitat = {'0iMpb'};
      embryo  = {'Ms'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Saurida_undosquamis'
      climate = {'MA'};
      ecozone = {'MIE','MPW'};
      habitat = {'0jMp','jiMc','jiMr'};
      embryo  = {'Mp'};
      migrate = {'Ma'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Bathypterois_dubius'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Benthosema_suborbitale'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Benthosema_pterotum'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Benthosema_glaciale'
      climate = {'MA','MB','MC','ME'};
      ecozone = {'MAN','MN'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Electrona_antarctica'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Myctophum_asperum'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0jMpe','jiMpb'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Symbolophorus_californiensis'
      climate = {'MB','MC'};
      ecozone = {'MPN'};
      habitat = {'0jMpe','jiMpm'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Tarletonbeania_crenularis'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jMpe','jiMpm'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ceratoscopelus_warmingii'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0jMpe','jiMpb'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Diaphus_dumerilii'
      climate = {'MA','MB','MC'};
      ecozone = {'MA'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Diaphus_theta'
      climate = {'MA','MB','MC'};
      ecozone = {'MP'};
      habitat = {'0jMpe','jiMpb'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Nannobrachium_ritteri'
      climate = {'MC'};
      ecozone = {'MPNE'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Nannobrachium_regale'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Stenobrachius_leucopsarus'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jMpe','jiMpm'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Triphoturus_mexicanus'
      climate = {'MA','MB'};
      ecozone = {'MPE'};
      habitat = {'0jMpe','jiMpm'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lampanyctodes_hectoris'
      climate = {'MC'};
      ecozone = {'MAS','MPS','MIS'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Notoscopelus_resplendens'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Notoscopelus_elongatus'
      climate = {'MB'};
      ecozone = {'MAm'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepidophanes_guentheri'
      climate = {'MA','MC'};
      ecozone = {'MA'};
      habitat = {'0jMpe','jiMp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lampris_guttatus'
      climate = {'MA','MC','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bpPz','bpCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Percopsis_omiscomaycus'
      climate = {'Dfc'};
      ecozone = {'THn'};
      habitat = {'0iFl','0iFr','0iFc'};
      embryo  = {'Fs','Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Zeus_faber'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bpPz','bpCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Trisopterus_luscus'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMc'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Trisopterus_minutus'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gadiculus_argenteus'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','0iMcp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Micromesistius_poutassou'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMpm'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCic','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Micromesistius_australis'
      climate = {'MC'};
      ecozone = {'MASW','MPSE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pollachius_virens'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Melanogrammus_aeglefinus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','0iMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Merlangius_merlangus'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMc'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gadus_morhua'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMc'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gadus_chalcogrammus'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jMp','jiMc'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Boreogadus_saida'
      climate = {'ME'};
      ecozone = {'MN'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Eleginus_gracilis'
      climate = {'ME'};
      ecozone = {'MN','MPN'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Ma'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Merluccius_merluccius'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jpCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Merluccius_hubbsi'
      climate = {'MC'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jpCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Merluccius_polli'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jpCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Merluccius_senegalensis'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jpCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Merluccius_capensis'
      climate = {'MB'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jpCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Macruronus_novaezelandiae'
      climate = {'MC'};
      ecozone = {'MPSW'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jpCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Coryphaenoides_rupestris'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Coryphaenoides_acrolepis'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Coelorinchus_caelorhincus'
      climate = {'MA','MB'};
      ecozone = {'MA','MAm'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Nezumia_sclerorhynchus'
      climate = {'MA','MB'};
      ecozone = {'MA','MAm'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hymenocephalus_italicus'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Macrourus_berglax'
      climate = {'MC','ME'};
      ecozone = {'MAN','MN'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Trachyrincus_scabrus'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Raniceps_raninus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCie','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Phycis_phycis'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Phycis_blennoides'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gaidropsarus_guttatus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','0iMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lota_lota'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFl','0iFr'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Brosme_brosme'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Molva_molva'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Molva_dypterygia'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pseudophycis_bachus'
      climate = {'MB'};
      ecozone = {'MPS'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Antimora_rostrata'
      climate = {'MB','MC'};
      ecozone = {'MA','MPS','MIS'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Polymixia_nobilis'
      climate = {'MA'};
      ecozone = {'MA'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mp'}; % guess, since eggs are unknown
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hoplostethus_atlanticus'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Beryx_splendens'
      climate = {'MB'};
      ecozone = {'MC'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Poromitra_crassiceps'
      climate = {'MA','MB','MC'};
      ecozone = {'MPNE','MAS','MANE'};
      habitat = {'0jMp','jiMpb'};
      embryo  = {'Mpb'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Holocentrus_adscensionis'
      climate = {'MA'};
      ecozone = {'MA'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Carapus_bermudensis'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi','jiTie'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Genypterus_blacodes'
      climate = {'MC'};
      ecozone = {'MAS'};
      habitat = {'0jMp','0iMdb'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiTie'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Opsanus_tau'
      climate = {'MB'};
      ecozone = {'MAW'};
      habitat = {'0iMr','0iMcd'};
      embryo  = {'Mnm'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Opsanus_beta'
      climate = {'MB'};
      ecozone = {'MAW'};
      habitat = {'0iMr','0iMcd'};
      embryo  = {'Mnm'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Halobatrachus_didactylus'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0iMcd'};
      embryo  = {'Mnm'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Kurtus_gulliveri'
      climate = {'MA'};
      ecozone = {'MIE'};
      habitat = {'0iMm'};
      embryo  = {'Mbm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ostorhinchus_doederleini'
      climate = {'MA'};
      ecozone = {'MIE','MPW'};
      habitat = {'0iMr'};
      embryo  = {'Mbm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Siphamia_tubifer'
      climate = {'MA'};
      ecozone = {'MIE','MPW'};
      habitat = {'0iMr'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pomatoschistus_minutus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jFe','jiMcd','jiMi'};
      embryo  = {'Ms'};
      migrate = {'Ma'};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhinogobius_brunneus'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'0jFe','jiMcd'};
      embryo  = {'Ms'};
      migrate = {'Ma'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gobius_niger'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0iMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gobius_paganellus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jFe','jiMcd'};
      embryo  = {'Ms'};
      migrate = {'Ma'};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ponticola_iranicus'
      climate = {'BWk'};
      ecozone = {'THp'};
      habitat = {'0jFr'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Neogobius_melanostomus'
      climate = {'MC'};
      ecozone = {'MAm'};
      habitat = {'0iMc','0iMm','jiFr','jiFm'};
      embryo  = {'Mc'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Knipowitschia_caucasica'
      climate = {'MC'};
      ecozone = {'MAm'};
      habitat = {'0iMc','0iMm','jiFr','jiFm'};
      embryo  = {'Mnm'};
      migrate = {'Ma'};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Boleophthalmus_pectinirostris'
      climate = {'MA'};
      ecozone = {'MPW'};
      habitat = {'0iMm'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gymnogobius_urotaenia'
      climate = {'Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fnfm'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hippocampus_whitei'
      climate = {'MA'};
      ecozone = {'MPSW'};
      habitat = {'0iMcd','0iMr'};
      embryo  = {'Mbm'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hippocampus_kuda'
      climate = {'MA'};
      ecozone = {'MPSW','MIE'};
      habitat = {'0iMcd','0iMr'};
      embryo  = {'Mbm'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hippocampus_guttulatus'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMcd','0iMr'};
      embryo  = {'Mbm'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Phyllopteryx_taeniolatus'
      climate = {'MC'};
      ecozone = {'MIE'};
      habitat = {'0iMcd','0iMr'};
      embryo  = {'Mbm'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Macroramphosus_scolopax'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0pMp','piMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Macroramphosus_gracilis'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0pMp','piMpe'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Upeneus_moluccensis'
      climate = {'MA'};
      ecozone = {'MINE','MPSW'};
      habitat = {'0pMp','piMcb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Upeneus_tragula'
      climate = {'MA'};
      ecozone = {'MINE','MPSW'};
      habitat = {'0pMp','piMcb','piMr'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Parupeneus_multifasciatus'
      climate = {'MA','MB'};
      ecozone = {'MINE','MPSW'};
      habitat = {'0pMp','piMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi','biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thunnus_orientalis'
      climate = {'MA','MB','MC'};
      ecozone = {'MA'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCic','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thunnus_thynnus'
      climate = {'MA','MB','MC'};
      ecozone = {'MA'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thunnus_maccoyii'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thunnus_obesus'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thunnus_albacares'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Thunnus_alalunga'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Katsuwonus_pelamis'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scomber_scombrus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scomber_japonicus'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scomberomorus_commerson'
      climate = {'MA','MB'};
      ecozone = {'MIN','MPSW'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scomberomorus_plurilineatus'
      climate = {'MA','MB'};
      ecozone = {'MIW'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scomberomorus_sierra'
      climate = {'MA'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Trichiurus_nanhaiensis'
      climate = {'MA'};
      ecozone = {'MPW'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Trichiurus_lepturus'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Aphanopus_carbo'
      climate = {'MB','MC'};
      ecozone = {'MANE'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Brama_brama'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pomatomus_saltatrix'
      climate = {'MA','MB'};
      ecozone = {'MA','MI','MPS'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Promethichthys_prometheus'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mastacembelus_erythrotaenia'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'0iFm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCii','biHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Channa_punctata'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'0iFm','0iFp'};
      embryo  = {'Fp'};
      migrate = {'Mp'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Channa_argus'
      climate = {'Cfa'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iFp'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Leptomelanosoma_indicum'
      climate = {'MA'};
      ecozone = {'MIN'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Ma'};
      food    = {'bjPz','jiCi','piCvf'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Filimanus_heptadactyla'
      climate = {'MA'};
      ecozone = {'MPW'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Eleutheronema_tetradactylum'
      climate = {'MA'};
      ecozone = {'MPSW','MINE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Polydactylus_macrochir'
      climate = {'MA','Aw','Cfa'};
      ecozone = {'MPSW','MIN','TA'};
      habitat = {'0jMp','jiMcd','jiFr'};
      embryo  = {'Mp'};
      migrate = {'Mdc'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Coryphaena_hippurus'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCic'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Trachurus_trachurus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Trachurus_mediterraneus'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Seriola_dumerili'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Echeneis_naucrates'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCvf','jiSvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sphyraena_barracuda'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0jMm','jiMr','jiMpe'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCvf','jiCic'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Xiphias_gladius'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCvf','jiCic'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Makaira_nigricans'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCvf','jiCic'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Istiompax_indica'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCvf','jiCic'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Istiophorus_platypterus'
      climate = {'MA','MB'};
      ecozone = {'MP'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCvf','jiCic'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Centropomus_undecimalis'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0iMm','jiMr'};
      embryo  = {'Mp'};
      migrate = {'Ma'};
      food    = {'bjPz','jiCvf','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Solea_solea'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dicologlossa_cuneata'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Microchirus_azevia'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Microchirus_variegatus'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pegusa_lascaris'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pegusa_impar'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Buglossidium_luteum'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Psetta_maxima'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepidorhombus_whiffiagonis'
      climate = {'MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepidorhombus_boscii'
      climate = {'MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Bothus_podas'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Arnoglossus_laterna'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Arnoglossus_thori'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Paralichthys_californicus'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Syacium_gunteri'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hippoglossus_hippoglossus'
      climate = {'MC','ME'};
      ecozone = {'MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hippoglossus_stenolepis'
      climate = {'MC','ME'};
      ecozone = {'MPN'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Reinhardtius_hippoglossoides'
      climate = {'MC'};
      ecozone = {'MPN','MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hippoglossoides_elassodon'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Glyptocephalus_cynoglossus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Microstomus_kitt'
      climate = {'MC'};
      ecozone = {'MANE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hypsopsetta_guttulata'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepidopsetta_polyxystra'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepidopsetta_bilineata'
      climate = {'MB','MC'};
      ecozone = {'MPN'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pleuronectes_platessa'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Limanda_limanda'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Limanda_ferruginea'
      climate = {'MC'};
      ecozone = {'MANW'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Platichthys_stellatus'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jFe','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mdc'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Liopsetta_pinnifasciata'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jFe','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mdc'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Eopsetta_jordani'
      climate = {'MC','ME'};
      ecozone = {'MPNE'};
      habitat = {'0jFe','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mdc'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Oreochromis_niloticus'
      climate = {'Am','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iFl','0iFr'};
      embryo  = {'Fbf'};
      migrate = {'Mp'};
      food    = {'biHa','biPz'};
      gender  = {'Dg','Dtfm'};
      reprod  = {'O'};

    case 'Amphilophus_citrinellus'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0iFl','0iFr'};
      embryo  = {'Fnfm'};
      migrate = {};
      food    = {'biO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Oryzias_latipes'
      climate = {'Aw','Cfa'};
      ecozone = {'TPi','THp'};
      habitat = {'0jFm','jiMm'};
      embryo  = {'Fs','Fh'};
      migrate = {'Mda','Ma'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Belone_belone'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'biMcp'};
      embryo  = {'Ms'};
      migrate = {'Mo'};
      food    = {'biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scomberesox_saurus'
      climate = {'MB';'MC'};
      ecozone = {'MA'};
      habitat = {'biMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hirundichthys_affinis'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0iMcp'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hyporhamphus_picarti'
      climate = {'MA','MB'};
      ecozone = {'MAE'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {'Mo'};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hyporhamphus_australis'
      climate = {'MB'};
      ecozone = {'MPSW'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'biPz','biHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hyporhamphus_regularis'
      climate = {'BWh','BSh'};
      ecozone = {'TA','TO'};
      habitat = {'0jFr','0iMm'};
      embryo  = {'Fp'};
      migrate = {};
      food    = {'biPz','biHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Arrhamphus_sclerolepis'
      climate = {'MA'};
      ecozone = {'MPSW'};
      habitat = {'0iMpe'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'biPz','biHl'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Kryptolebias_marmoratus'
      climate = {'Af','Am','Cfa'};
      ecozone = {'TN'};
      habitat = {'0iFm','0iMm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Hsmm'};
      reprod  = {'O'};

    case 'Poecilia_reticulata'
      climate = {'Af','Am','Cfa'};
      ecozone = {'TN'};
      habitat = {'0iFm','0iMm'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Quintana_atrizona'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Limia_vittata'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gambusia_puncticulata'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gambusia_punctata'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFc'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gambusia_holbrooki'
      climate = {'BSk','Cfa','Cfb'};
      ecozone = {'TP'};
      habitat = {'0iFc'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Girardinus_metallicus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Girardinus_uninotatus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFc'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Girardinus_creolus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFc'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Girardinus_denticulatus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFc'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Girardinus_microdactylus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFc'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Girardinus_falcatus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Fundulus_parvipinnis'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0iMm'};
      embryo  = {'Mc'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Aphanius_fasciatus'
      climate = {'Csa','MB'};
      ecozone = {'MAm'};
      habitat = {'0iFm','0iMm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cyprinodon_variegatus'
      climate = {'Aw';'Cfa'};
      ecozone = {'THn','TN'};
      habitat = {'0iFm','0iMm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Nothobranchius_furzeri'
      climate = {'Cwc'};
      ecozone = {'TPa'};
      habitat = {'0iFpe'};
      embryo  = {'Ft'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Nothobranchius_kadleci'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iFpe'};
      embryo  = {'Ft'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Fundulopanchax_gardneri'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Atherina_presbyter'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0iMcp'};
      embryo  = {'Fc','Fh'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Atherina_boyeri'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMcp'};
      embryo  = {'Fc','Fh'};
      migrate = {'Ma'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Menidia_beryllina'
      climate = {'MB'};
      ecozone = {'MAW'};
      habitat = {'0iMcp','0iMm','jiFr'};
      embryo  = {'Mp'};
      migrate = {'Ma'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Odontesthes_argentinensis'
      climate = {'MB'};
      ecozone = {'MAW'};
      habitat = {'0iMcp','0iMm','jiFr'};
      embryo  = {'Mp'};
      migrate = {'Ma'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chromis_chromis'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0iMc','0iMr'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pomacentrus_amboinensis'
      climate = {'MC'};
      ecozone = {'MIE','MPW'};
      habitat = {'0iMr'};
      embryo  = {'Mnm'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pomacentrus_coelestis'
      climate = {'MC'};
      ecozone = {'MIE','MPW'};
      habitat = {'0iMr'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chelon_labrosus'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'jiFm','0iMm'};
      embryo  = {'Mp'};
      migrate = {'Mdc'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mugil_liza'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'jiFm','0iMm'};
      embryo  = {'Mp'};
      migrate = {'Mdc'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hyperprosopon_argenteum'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0iMc'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pseudochromis_flavivertex'
      climate = {'MA'};
      ecozone = {'MINW'};
      habitat = {'0iMr'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepadogaster_lepadogaster'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0iMi','jiMi'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Parablennius_ruber'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0iMcd','jiMi'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lipophrys_pholis'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0iMcd'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gerres_equulus'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'}; % guess
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ammodytes_marinus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pseudopercis_semifasciata'
      climate = {'MC'};
      ecozone = {'MASW'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Uranoscopus_scaber'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Achoerodus_viridis'
      climate = {'MB'};
      ecozone = {'MPSW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'Hsff'};
      reprod  = {'O'};

    case 'Semicossyphus_pulcher'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsff'};
      reprod  = {'O'};

    case 'Symphodus_tinca'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsff'};
      reprod  = {'O'};

    case 'Symphodus_roissali'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsff'};
      reprod  = {'O'};

    case 'Symphodus_melops'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Coris_julis'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsff'};
      reprod  = {'O'};

    case 'Labrus_merula'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsff'};
      reprod  = {'O'};

    case 'Bodianus_frenchii'
      climate = {'MB'};
      ecozone = {'MISE'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsff'};
      reprod  = {'O'};

    case 'Centrolabrus_exoletus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ctenolabrus_rupestris'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scarus_rivulatus'
      climate = {'MA'};
      ecozone = {'MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsff'};
      reprod  = {'O'};


    case 'Sillago_robusta'
      climate = {'MB'};
      ecozone = {'MIE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sillago_bassensis'
      climate = {'MB'};
      ecozone = {'MIE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dicentrarchus_labrax'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Morone_americana'
      climate = {'MC'};
      ecozone = {'MANW'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Platax_orbicularis'
      climate = {'MA'};
      ecozone = {'MIN','MIE','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'}; % guess
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chaetodon_larvatus'
      climate = {'MA'};
      ecozone = {'MIr'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sciaena_umbra'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Argyrosomus_regius'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Argyrosomus_japonicus'
      climate = {'MA'};
      ecozone = {'MPW'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Umbrina_canariensis'
      climate = {'MA','MB'};
      ecozone = {'MAE'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Macrodon_atricauda'
      climate = {'MB'};
      ecozone = {'MASW'};
      habitat = {'0jMp','0jMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cynoscion_nebulosus'
      climate = {'MB','MC'};
      ecozone = {'MAW'};
      habitat = {'0jMp','0jMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cynoscion_othonopterus'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0jMp','0jMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Atractoscion_nobilis'
      climate = {'MB','MC'};
      ecozone = {'MPE'};
      habitat = {'0jMp','0jMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pogonias_cromis'
      climate = {'MB'};
      ecozone = {'MAW'};
      habitat = {'0jMp','0jMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Stellifer_lanceolatus'
      climate = {'MB'};
      ecozone = {'MAW'};
      habitat = {'0jMp','0jMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Larimichthys_polyactis'
      climate = {'MB'};
      ecozone = {'MPW'};
      habitat = {'0jMp','0jMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acanthurus_lineatus'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiHa', 'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Acanthurus_olivaceus'
      climate = {'MA'};
      ecozone = {'MIE','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ctenochaetus_striatus'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ctenochaetus_binotatus'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Zebrasoma_scopas'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Naso_brevirostris'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jpHa','piPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Naso_hexacanthus'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Naso_tuberosus'
      climate = {'MA'};
      ecozone = {'MI'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Naso_unicornis'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Naso_vlamingii'
      climate = {'MA'};
      ecozone = {'MI','MP'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','biO'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Prionurus_maculatus'
      climate = {'MB'};
      ecozone = {'MPSW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pomacanthus_imperator'
      climate = {'MA'};
      ecozone = {'MIE','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'jiCis','jiCit'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pomadasys_kaakan'
      climate = {'MA'};
      ecozone = {'MINE','MPSW'};
      habitat = {'0jMp','jiMr','jpMm'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Conodon_nobilis'
      climate = {'MB'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Rhomboplites_aurorubens'
      climate = {'MB'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_analis'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMr','jpMm'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_fulviflamma'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0jMp','jiMr','jpMm'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_guttatus'
      climate = {'MA'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_erythropterus'
      climate = {'MA'};
      ecozone = {'MPSW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_malabaricus'
      climate = {'MA'};
      ecozone = {'MPSW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_sebae'
      climate = {'MA'};
      ecozone = {'MPSW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_carponotatus'
      climate = {'MA'};
      ecozone = {'MPSW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_vitta'
      climate = {'MA'};
      ecozone = {'MPSW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_synagris'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lutjanus_kasmira'
      climate = {'MA'};
      ecozone = {'MPSW','MI'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Caulolatilus_affinis'
      climate = {'MA'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lobotes_surinamensis'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMm'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dentex_dentex'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pagellus_erythrinus'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Pagellus_acarne'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Sparus_aurata'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'bjMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Rhabdosargus_sarba'
      climate = {'MA'};
      ecozone = {'MPSW'};
      habitat = {'bjMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Argyrozona_argyrozona'
      climate = {'MB'};
      ecozone = {'MIS'};
      habitat = {'bjMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Diplodus_puntazzo'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biCi','jiHa'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Diplodus_sargus'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biCi','jiHa'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Diplodus_annularis'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biCi','jiHa'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Diplodus_vulgaris'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biCi','jiHa'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Diplodus_cervinus'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biCi','jiHa'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Pagrus_auriga'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0iMp'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'biCim','biCic'};
      gender  = {'Hsf'};
      reprod  = {'O'};

    case 'Lithognathus_mormyrus'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Boops_boops'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsf'};
      reprod  = {'O'};

    case 'Acanthopagrus_berda'
      climate = {'MA'};
      ecozone = {'MI'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Acanthopagrus_schlegelii'
      climate = {'MA','MB'};
      ecozone = {'MPSE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsm'};
      reprod  = {'O'};

    case 'Spicara_smaris'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsf'};
      reprod  = {'O'};

    case 'Sarpa_salpa'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'Hsf'};
      reprod  = {'O'};

    case 'Siganus_sutor'
      climate = {'MA'};
      ecozone = {'MI'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Siganus_rivulatus'
      climate = {'MA','MB'};
      ecozone = {'MI'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiHa'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scatophagus_argus'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0jMp','jiMr','jiFm','jiMm'};
      embryo  = {'Mp','Fp'};
      migrate = {'Ma'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Priacanthus_macracanthus'
      climate = {'MA'};
      ecozone = {'MIE','MPW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cepola_macrophthalma'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Capros_aper'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lophius_piscatorius'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lophius_budegassa'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lophius_vomerinus'
      climate = {'MB','MC'};
      ecozone = {'MASE'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Balistes_vetula'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'jiCie'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Stephanolepis_hispidus'
      climate = {'MA','MB'};
      ecozone = {'MA'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'jiCie'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mola_mola'
      climate = {'MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','biCij'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Masturus_lanceolatus'
      climate = {'MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMpe'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','biCij'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Epigonus_crassicaudus'
      climate = {'MC'};
      ecozone = {'MPSE'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pempheris_adusta'
      climate = {'MA'};
      ecozone = {'MI','MP'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pempheris_schwenkii'
      climate = {'MA'};
      ecozone = {'MP'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Polyprion_americanus'
      climate = {'MB','MC'};
      ecozone = {'MA','MAm'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Stereolepis_gigas'
      climate = {'MB','MC'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scorpis_aequipinnis'
      climate = {'MB'};
      ecozone = {'MISE','MPSW'};
      habitat = {'0iMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lepomis_cyanellus'
      climate = {'Cfb','Dfa'};
      ecozone = {'THn'};
      habitat = {'0iFl','0iFp'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Micropterus_dolomieu'
      climate = {'Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0iFl','0iFp'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Siniperca_chuatsi'
      climate = {'Cfa','Dfa'};
      ecozone = {'THp'};
      habitat = {'0iFl','0iFr'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Amniataba_caudavittata'
      climate = {'MA'};
      ecozone = {'MPW'};
      habitat = {'0iMm','0iFr'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Epinephelus_marginatus'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'Hsff'};
      reprod  = {'O'};

    case 'Epinephelus_morio'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'Hsff'};
      reprod  = {'O'};

     case 'Epinephelides_armatus'
      climate = {'MA'};
      ecozone = {'MIE'};
      habitat = {'0jMp','jiMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'}; % MoorHeso2007
      reprod  = {'O'};

   case 'Hyporthodus_octofasciatus'
      climate = {'MA','MB'};
      ecozone = {'MPSW','MIE'};
      habitat = {'0jMp','jiMp'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'Hsf'};
      reprod  = {'O'};

    case 'Serranus_scriba'
      climate = {'MB'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Serranus_cabrilla'
      climate = {'MB','MC'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'Hh'};
      reprod  = {'O'};

    case 'Mycteroperca_microlepis'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'Hsf'};
      reprod  = {'O'};

    case 'Etheostoma_rubrum'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Etheostoma_cragini'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fg'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sander_lucioperca'
      climate = {'Cfa','Dfc','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFl','0iFe'};
      embryo  = {'Fnm'};
      migrate = {'Mp'};
      food    = {'biCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sander_vitreus'
      climate = {'Dwa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0iFr','0iFl','0iFe'};
      embryo  = {'Fnm'};
      migrate = {'Mp'};
      food    = {'biCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sander_volgensis'
      climate = {'BSk','BWk'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFl','0iFe'};
      embryo  = {'Fnm'};
      migrate = {'Mp'};
      food    = {'biCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Zingel_asper'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fc','Fh'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gymnocephalus_cernuus'
      climate = {'Cfa','Dfc','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFl','0iFp','0iFe'};
      embryo  = {'Fc','Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Perca_fluviatilis'
      climate = {'Cfa','Dfc','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFl','0iFp'};
      embryo  = {'Fc','Fh'};
      migrate = {};
      food    = {'biCi','piCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Lethrinus_lentjan'
      climate = {'MA'};
      ecozone = {'MINE'};
      habitat = {'0iMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Hsf'};
      reprod  = {'O'};

    case 'Lethrinus_mahsena'
      climate = {'MA'};
      ecozone = {'MINE'};
      habitat = {'0iMr'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Hsf'};
      reprod  = {'O'};

    case 'Notothenia_coriiceps'
      climate = {'EF'};
      ecozone = {'MS'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Patagonotothen_guntheri'
      climate = {'MC'};
      ecozone = {'MS'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pleuragramma_antarcticum'
      climate = {'EF'};
      ecozone = {'MS'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'biPz'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dissostichus_eleginoides'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'biPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Dissostichus_mawsoni'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mpe'};
      migrate = {};
      food    = {'biPz','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chaenocephalus_aceratus'
      climate = {'EF'};
      ecozone = {'MS'};
      habitat = {'0bMcd','bjMp','jiMcd'};
      embryo  = {'Ms'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Platycephalus_fuscus'
      climate = {'MA'};
      ecozone = {'MPW'};
      habitat = {'0jMp','jiMm'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Platycephalus_indicus'
      climate = {'MA'};
      ecozone = {'MPSW','MI'};
      habitat = {'0jMp','jiMm'};
      embryo  = {'Mp'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Chelidonichthys_lucerna'
      climate = {'MB','MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Eutrigla_gurnardus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0jMp','jiMd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Helicolenus_dactylopterus'
      climate = {'MA','MB','MC'};
      ecozone = {'MA'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Helicolenus_percoides'
      climate = {'MC'};
      ecozone = {'MPSW'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sebastes_capensis'
      climate = {'MB'};
      ecozone = {'MAS'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sebastes_rufus'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sebastes_mentella'
      climate = {'MC','ME'};
      ecozone = {'MAN','MN'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sebastes_minor'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Sebastes_taczanowskii'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scorpaena_maderensis'
      climate = {'MB'};
      ecozone = {'MAE','MAm'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pontinus_clemensi'
      climate = {'MB'};
      ecozone = {'MPE'};
      habitat = {'0jMp','jiMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Anoplopoma_fimbria'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMcd'};
      embryo  = {'Mp'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Anarhichas_denticulatus'
      climate = {'EF'};
      ecozone = {'MN'};
      habitat = {'0bMcb','bpMp','piMd'};
      embryo  = {'Mnm'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Anarhichas_lupus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0bMb','bjMp','jiMd'};
      embryo  = {'Mnm'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi','jiCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Anarhichas_minor'
      climate = {'EF'};
      ecozone = {'MN','MAN'};
      habitat = {'0bMcb','bpMp','piMd'};
      embryo  = {'Mnm'};
      migrate = {'Mo'};
      food    = {'bjPz','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Zoarces_viviparus'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Zoarces_elongatus'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'0iMcd'};
      embryo  = {'Mv'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Lycodes_raridens'
      climate = {'ME'};
      ecozone = {'MN','MPN'};
      habitat = {'0iMcd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Gymnelus_viridis'
      climate = {'ME'};
      ecozone = {'MN','MPN'};
      habitat = {'0iMcd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Hadropareia_middendorffii'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'0iMcd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Stichaeus_punctatus'
      climate = {'ME'};
      ecozone = {'MN','MPN','MAN'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mnf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Alectrias_alectrolophus'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0jMp','jiMcd'};
      embryo  = {'Mnf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Pholis_fangi'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'0iMcd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Pholis_gunnellus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMcd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};
      
    case 'Gasterosteus_aculeatus'
      climate = {'MC'};
      ecozone = {'MA','MP','TH'};
      habitat = {'piMc','0iFe','0iFl','0iFp'};
      embryo  = {'Fnm'};
      migrate = {'Ma'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pungitius_pungitius'
      climate = {'MC'};
      ecozone = {'MA','MP','TH'};
      habitat = {'piMc','0iFe','0iFl','0iFp'};
      embryo  = {'Fnm'};
      migrate = {'Ma'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hexagrammos_stelleri'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMcd'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Hexagrammos_octogrammus'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMcd'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cyclopterus_lumpus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMd'};
      embryo  = {'Mnm'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Scorpaenichthys_marmoratus'
      climate = {'MC'};
      ecozone = {'MPE'};
      habitat = {'0iMcd'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Myoxocephalus_scorpius'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMcd'};
      embryo  = {'Mnm'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Batrachocottus_baicalensis'
      climate = {'Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Paracottus_knerii'
      climate = {'Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cottus_volki'
      climate = {'Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFr'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Cottus_leiopomus'
      climate = {'Dfa'};
      ecozone = {'THn'};
      habitat = {'0iFr'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gymnocanthus_herzensteini'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'bjMp','jiMd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gymnocanthus_detrisus'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'bjMp','jiMd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gymnocanthus_pistilliger'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'bjMp','jiMd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Gymnocanthus_intermedius'
      climate = {'MC'};
      ecozone = {'MPNW'};
      habitat = {'bjMp','jiMd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Taurocottus_bergii'
      climate = {'MC','ME'};
      ecozone = {'MPNW'};
      habitat = {'bjMp','jiMd'};
      embryo  = {'Mnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Latimeria_chalumnae'
      climate = {'MA'};
      ecozone = {'MIW'};
      habitat = {'0iMdb'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'biCic','biCvf'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Neoceratodus_forsteri'
      climate = {'Cfb'};
      ecozone = {'TA'};
      habitat = {'0iFr','0iFm'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi','biHl','biHs'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Protopterus_aethiopicus'
      climate = {'A'};
      ecozone = {'TPa'};
      habitat = {'0pFm','0iFr','0iFl'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'biCii','jiCim'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Ichthyophis_kohtaoensis'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'0bTf','bjFc','jiTf'};
      embryo  = {'Tnsf'};
      migrate = {'TW'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Boulengerula_taitana'
      climate = {'BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {'TW'};
      food    = {'bjTva','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Typhlonectes_compressicauda'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'bjTva','jiCi','jiSvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dermophis_mexicanus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bjTva','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Siphonops_annulatus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {'TW'};
      food    = {'bjTva','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Andrias_japonicus'
      climate = {'Cfb'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fnm'};
      migrate = {'TT'};
      food    = {'biCi','piCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Andrias_davidianus'
      climate = {'Cfb'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fnm'};
      migrate = {'TT'};
      food    = {'biCi','piCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cryptobranchus_alleganiensis'
      climate = {'Cfb'};
      ecozone = {'THn'};
      habitat = {'0iFr','0iFc'};
      embryo  = {'Fnm'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Onychodactylus_japonicus'
      climate = {'Cfb','Dfa'};
      ecozone = {'THp'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pachyhynobius_shangchengensis'
      climate = {'Cfa'};
      ecozone = {'THp'};
      habitat = {'0jFc'};
      embryo  = {'Fc'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Salamandrella_keyserlingii'
      climate = {'BWk','BSk','Dfb','Dfc','Dsc','Dwa','Dwc'};
      ecozone = {'THp'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hynobius_nebulosus'
      climate = {'Cfb'};
      ecozone = {'THp'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hynobius_kimurae'
      climate = {'Cfa','Dfa'};
      ecozone = {'THp'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bolitoglossa_mexicana'
      climate = {'Am','Af'};
      ecozone = {'TN'};
      habitat = {'jiTf'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bolitoglossa_subpalmata'
      climate = {'Am','Af'};
      ecozone = {'TN'};
      habitat = {'jiTf'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Plethodon_cinereus'
      climate = {'Cfb','Dfa','Dwa'};
      ecozone = {'THn'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Tns'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Plethodon_kentucki'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Tns'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Desmognathus_ocoee'
      climate = {'Cwa'};
      ecozone = {'THn'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Desmognathus_monticola'
      climate = {'Cwa'};
      ecozone = {'THn'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Desmognathus_quadramaculatus'
      climate = {'Cwa'};
      ecozone = {'THn'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aneides_flavipunctatus'
      climate = {'Csa'};
      ecozone = {'THn'};
      habitat = {'0iFcc','jiTf'};
      embryo  = {'Fc'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Speleomantes_ambrosii'
      climate = {'Cfb'};
      ecozone = {'THp'};
      habitat = {'0iTc'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Speleomantes_imperialis'
      climate = {'Csa'};
      ecozone = {'THp'};
      habitat = {'0iTc'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eurycea_lucifuga'
      climate = {'Cwa'};
      ecozone = {'THn'};
      habitat = {'0iFcc','jiTf'};
      embryo  = {'Fc'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gyrinophilus_palleucus'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iFcc','jiTf'};
      embryo  = {'Fc'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Amphiuma_means'
      climate = {'Cfb'};
      ecozone = {'THn'};
      habitat = {'0bTf','biFl','biFm'};
      embryo  = {'Tnsf'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhyacotriton_olympicus'
      climate = {'Cfb'};
      ecozone = {'THn'};
      habitat = {'0bFc','biTf'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ambystoma_mexicanum'
      climate = {'Cwc'};
      ecozone = {'THn'};
      habitat = {'0iFl'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ambystoma_macrodactylum'
      climate = {'Dsc'};
      ecozone = {'THn'};
      habitat = {'0iFl'};
      embryo  = {'Fc'};
      migrate = {'TT'};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dicamptodon_tenebrosus'
      climate = {'Csb'};
      ecozone = {'THn'};
      habitat = {'0bFc','biTf'};
      embryo  = {'Fnf'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Salamandrina_perspicillata'
    climate = {'Csa','Cfb'};
      ecozone = {'THp'};
      habitat = {'0jFc','0jTf'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mertensiella_caucasica'
      climate = {'Csb'};
      ecozone = {'THp'};
      habitat = {'0iFc'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chioglossa_lusitanica'
      climate = {'Cfb','Csb'};
      ecozone = {'THp'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fs'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Salamandra_salamandra'
      climate = {'Csb','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fs'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Salamandra_lanzai'
      climate = {'ET'};
      ecozone = {'THp'};
      habitat = {'biTg','biTf'};
      embryo  = {'Fs'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lyciasalamandra_atifi'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'biTh','biTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lyciasalamandra_billae'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'biTh','biTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lyciasalamandra_luschani'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'biTh','biTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pleurodeles_waltl'
      climate = {'Csa','Csb'};
      ecozone = {'THp'};
      habitat = {'biFc','jiTh'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
 
    case 'Echinotriton_andersoni'
      climate = {'Cwa'};
      ecozone = {'THp'};
      habitat = {'biFc','jiTf'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Tylototriton_verrucosus'
      climate = {'Cwa'};
      ecozone = {'THp'};
      habitat = {'biFc','jiTf'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Notophthalmus_viridescens'
      climate = {'Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0jFp','jpTg','jpTf','jpTh','piFp'};
      embryo  = {'Fh'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lissotriton_vulgaris'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTg'};
      embryo  = {'Fh'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neurergus_microspilotus'
      climate = {'BSh'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTh','jiFm'};
      embryo  = {'Fh'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neurergus_kaiseri'
      climate = {'BSh'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTh','jiFm'};
      embryo  = {'Fh'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ommatotriton_vittatus'
      climate = {'Csa','Dsa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTh','jiFm'};
      embryo  = {'Fh'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calotriton_arnoldi'
      climate = {'BSk'};
      ecozone = {'THp'};
      habitat = {'0iFc'};
      embryo  = {'Fc'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Triturus_cristatus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTh','jiFm'};
      embryo  = {'Fh'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Triturus_karelinii'
      climate = {'Cfa','Cfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTh','jiTf'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ichthyosaura_alpestris'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTh','jiFm'};
      embryo  = {'Fh'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Paramesotriton_hongkongensis'
      climate = {'Cwa'};
      ecozone = {'TPi'};
      habitat = {'0iFp','jiFr'};
      embryo  = {'Fh'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

     case 'Proteus_anguinus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFcc'};
      embryo  = {'Fnf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Siren_lacertina'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iFm'};
      embryo  = {'Fh'};
      migrate = {'Mp'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hoplobatrachus_tigerinus'
      climate = {'Dfb','Cwa','BSh','BWh'};
      ecozone = {'TPi'};
      habitat = {'0bFm','biTg'};
      embryo  = {'Fpf'};
      migrate = {'TW'};
      food    = {'biCi','piCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bombina_bombina'
      climate = {'Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTs','jiTf','jiFp'};
      embryo  = {'Fpf'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Alytes_muletensis'
      climate = {'Csa'};
      ecozone = {'THp'};
      habitat = {'0jFc','jiTf'};
      embryo  = {'Fbm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Xenopus_laevis'
      climate = {'BWk','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iFm'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelobates_fuscus'
      climate = {'Dfa','Dfb','BSk'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTs','jiTf','jiTg'};
      embryo  = {'Fh'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelobates_syriacus'
      climate = {'Csa','BSk'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTs','jiTi','jiTg'};
      embryo  = {'Fpf'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bufo_bufo'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhinella_arenarum'
      climate = {'Am','Cfa','Cfb'};
      ecozone = {'TN'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Peltophryne_lemur'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anaxyrus_baxteri'
      climate = {'BSk'};
      ecozone = {'THn'};
      habitat = {'0jFp','jiFm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Anaxyrus_americanus'
      climate = {'Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0jFp','jiFm'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Rhaebo_blombergi'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0jF','jiF'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Crinia_nimbus'
      climate = {'Cfb'};
      ecozone = {'TAt'};
      habitat = {'0jTf','bjFl','jiTf'};
      embryo  = {'Tnfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Crinia_georgiana'
      climate = {'Csb'};
      ecozone = {'TA'};
      habitat = {'0jFp','jiTg','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Geocrinia_vitellina'
      climate = {'Csb'};
      ecozone = {'TA'};
      habitat = {'0bFp','biTg','biTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Geocrinia_rosea'
      climate = {'Csb'};
      ecozone = {'TA'};
      habitat = {'0bFp','biTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pseudophryne_bibronii'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0bTf','0iTg'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Limnodynastes_peronii'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0bTf','0iTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mannophryne_trinitatis'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'bjH','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hyla_arborea'
      climate = {'Cfb','Dfb','Csb','BSk'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hyla_eximia'
      climate = {'Am','BSk','BSh'};
      ecozone = {'THn','TN'};
      habitat = {'0jFp','jiTh','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hyla_annectans'
    climate = {'Cwa','Dwa'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTh','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pseudis_paradoxa'
      climate = {'Am','Af'};
      ecozone = {'THn'};
      habitat = {'0jFp','0jFm'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pleurodema_thaul'
      climate = {'BWk','Csb','Cfb'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTg'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'0iCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Engystomops_pustulosus'
      climate = {'Am','Af'};
      ecozone = {'TN'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'0iCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Leptodactylus_fuscus'
      climate = {'Am','Af','Cfa'};
      ecozone = {'TN'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Tntm'};
      migrate = {};
      food    = {'0iCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ceratophrys_stolzmanni'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'0iCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ceratophrys_cranwelli'
    climate = {'Aw','BSh','Cfa'};
      ecozone = {'TN'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'0iCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eleutherodactylus_coqui'
      climate = {'Af'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tnpm'};
      migrate = {};
      food    = {'0iCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dyscophus_antongilii'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TPam'};
      habitat = {'0jFp','jiTf','jiTh'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dyscophus_guineti'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TPam'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fc'};
      migrate = {};
      food    = {'bjHl','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dermatonotus_muelleri'
      climate = {'Am','BSh','Cfa'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTg','jiTi'};
      embryo  = {'Fc'};
      migrate = {};
      food    = {'bjHl','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rana_temporaria'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTg','jiTi'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rana_arvalis'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rana_sierrae'
      climate = {'Dsc'};
      ecozone = {'THn'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rana_muscosa'
      climate = {'Dsb'};
      ecozone = {'THn'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rana_macrocnemis'
      climate = {'BWh','BSk','Dsa'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rana_iberica'
      climate = {'BSk','Csb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rana_amurensis'
      climate = {'BSk','BWk','Dw'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rana_tagoi'
      climate = {'Cfa','Dfa'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hylarana_guentheri'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hylarana_erythraea'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lithobates_sphenocephalus'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lithobates_clamitans'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0jFp','jiTf','jiTg'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelophylax_ridibundus'
      climate = {'BSk','Cfb','Dsa','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTg','jiTa','jiTs'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelophylax_lessonae'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTi'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelophylax_esculentus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTi'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelophylax_saharicus'
      climate = {'BWh','Csa'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTi'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelophylax_nigromaculatus'
      climate = {'Cfa','Cfb'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTi'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelophylax_bedriagae'
      climate = {'BWh','BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf','jiTi'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Conraua_goliath'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0jFr'};
      embryo  = {'Fh'};
      migrate = {};
      food    = {'bjHl','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Euphlyctis_cyanophlyctis'
      climate = {'Am','BSh','BWh'};
      ecozone = {'TPa'};
      habitat = {'0iFp','jiFm'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Nanorana_taihangnica'
    climate = {'Cwa','Cfa','Dwa'};
      ecozone = {'THp'};
      habitat = {'0iFc'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Pyxicephalus_adspersus'
      climate = {'BSh','BWh','Cwb','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0jFp','jiTs','jiTa','jiTd'};
      embryo  = {'Fnm'};
      migrate = {};
      food    = {'bjO','jiCi'};
      gender  = {'D'};
      reprod  = {'O'};

    case 'Mantidactylus_grandidieri'
      climate = {'Aw'};
      ecozone = {'TPam'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjHl','bjCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhacophorus_moltrechti'
      climate = {'Cfa'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjHl','bjCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Kurixalus_eiffingeri'
      climate = {'Cfa'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjCvae','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Kurixalus_idiootocus'
      climate = {'Cfa'};
      ecozone = {'THp'};
      habitat = {'0jFp','jiTf'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'bjHl','jiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hyperolius_viridiflavus'
      climate = {'Aw'};
      ecozone = {'TPa'};
      habitat = {'0jFp','jiTi'};
      embryo  = {'Fpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sphenodon_punctatus'
      climate = {'Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biCv'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Eublepharis_macularius'
      climate = {'BWh'};
      ecozone = {'THp'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sphaerodactylus_vincenti'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Homonota_williamsii'
      climate = {'BWk','BSk'};
      ecozone = {'TN'};
      habitat = {'0iTa','0iTs'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Heteronotia_binoei'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Heteronotia_binoei_3N1A'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'Apo'};

    case 'Heteronotia_binoei_3N1B'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'Apo'};

    case 'Heteronotia_binoei_EA6'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Heteronotia_binoei_SM6'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Christinus_marmoratus'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cyrtopodion_scabrum'
      climate = {'BWh','BSh','Dsa'};
      ecozone = {'THp'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gekko_hokouensis'
      climate = {'Cwa','Cfa'};
      ecozone = {'THp'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eulamprus_quoyii'
      climate = {'Cfb','Cfc'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tiliqua_rugosa'
      climate = {'Cfb','Cfc','BWh','BWk','BSh','BSk'};
      ecozone = {'TA'};
      habitat = {'0iTd','0iTa','0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg','Dtfm'};
      reprod  = {'O'};

    case 'Egernia_cunninghami'
      climate = {'Cfb','Cfc','BWh','BWk','BSh','BSk'};
      ecozone = {'TA'};
      habitat = {'0iTd','0iTa','0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Egernia_striolata'
      climate = {'Cfb','Cfc','BSh','BSk'};
      ecozone = {'TA'};
      habitat = {'0iTd','0iTa','0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Liopholis_striata'
      climate = {'Cfb','Cfc','BWh','BWk','BSh','BSk'};
      ecozone = {'TA'};
      habitat = {'0iTd','0iTa','0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Liopholis_inornata'
      climate = {'BWh','BWk','BSh','BSk'};
      ecozone = {'TA'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chalcides_chalcides'
      climate = {'Csa'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Oligosoma_suteri'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Plestiodon_chinensis'
      climate = {'Cfa'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iTh'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gerrhosaurus_validus'
      climate = {'BWh','BWk','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anadia_bogotensis'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aspidoscelis_exsanguis'
      climate = {'BSk','BWk','BWh'};
      ecozone = {'TN'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'Apo'};

    case 'Aspidoscelis_neomexicana'
      climate = {'BSk','BWk','BWh'};
      ecozone = {'TN'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'Apo'};

    case 'Aspidoscelis_uniparens'
      climate = {'BSk','BWk','BWh'};
      ecozone = {'TN'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'Apo'};

    case 'Aspidoscelis_marmorata'
      climate = {'BSk','BWk','BWh'};
      ecozone = {'TN'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Amphisbaena_alba'
      climate = {'Af','Am','Aw'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lacerta_agilis'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iTh','0iTa'};
      embryo  = {'Tt'};
      migrate = {'TT'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lacerta_strigata'
      climate = {'BWh','BSh','Csa','Csb'};
      ecozone = {'THp'};
      habitat = {'0iTa','0iTd','0iTs','0iTh'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Darevskia_valentini'
      climate = {'BWh','BSh','Dsa'};
      ecozone = {'THp'};
      habitat = {'0iTa','0iTd','0iTs','0iTh'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acanthodactylus_erythrurus'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Takydromus_hsuehshanensis'
      climate = {'Cfa'};
      ecozone = {'TPi'};
      habitat = {'0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gallotia_galloti'
      climate = {'BWh'};
      ecozone = {'THp'};
      habitat = {'0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Varanus_komodoensis'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'bpCvr','biCvm','biSv'};
      gender  = {'Dg'};
      reprod  = {'O','Apa'};

    case 'Varanus_bengalensis'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'bpCvr','biCvm','biSv'};
      gender  = {'Dg'};
      reprod  = {'O','Apa'};

    case 'Varanus_juxtindicus'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'bpCvr','biCvm','biSv'};
      gender  = {'Dg'};
      reprod  = {'O','Apa'};

    case 'Heloderma_suspectum'
    climate = {'BSh','BWh','BWk'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTa'};
      embryo  = {'Tts'};
      migrate = {};
      food    = {'bpCvbe','biCi','biSv'};
      gender  = {'Dg'};
      reprod  = {'O','Apa'};

    case 'Xenosaurus_grandis'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'bpCvr','biCvm','biSv'};
      gender  = {'Dg'};
      reprod  = {'O','Apa'};

    case 'Anguis_fragilis'
      climate = {'Cfb','Dfb','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Furcifer_labordi'
      climate = {'Am','Aw'};
      ecozone = {'TPam'};
      habitat = {'0iTf'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ctenophorus_ornatus'
      climate = {'BWh','BSh','BSk','Csa'};
      ecozone = {'TA'};
      habitat = {'0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Ctenophorus_adelaidensis'
      climate = {'B'};
      ecozone = {'TA'};
      habitat = {'0iThh'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Calotes_versicolor'
      climate = {'B'};
      ecozone = {'TPi'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anolis_nebulosus'
      climate = {'Aw'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anolis_gundlachi'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Basiliscus_basiliscus'
      climate = {'Af','Am'};
      ecozone = {'THn'};
      habitat = {'0iTa'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cyclura_pinguis'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iTd','0iTh'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Iguana_iguana'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iTd','0iTh'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gambelia_sila'
      climate = {'Csa'};
      ecozone = {'THn'};
      habitat = {'0iTa'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gambelia_wislizenii'
      climate = {'Csa'};
      ecozone = {'THn'};
      habitat = {'0iTa'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sceloporus_undulatus'
      climate = {'Cfa','Dfa','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sceloporus_occidentalis'
      climate = {'Cfa','Dfa','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh','0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phrynosoma_ditmarsi'
      climate = {'BSk','BSh'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phrynosoma_douglasii'
      climate = {'BSk','BSh'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phymaturus_patagonicus'
      climate = {'BWk'};
      ecozone = {'TN'};
      habitat = {'0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Liolaemus_pictus'
      climate = {'BWk'};
      ecozone = {'TN'};
      habitat = {'0iTs'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Oplurus_cuvieri'
      climate = {'Aw'};
      ecozone = {'TPam'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tropidurus_itambere'
      climate = {'Am'};
      ecozone = {'THn'};
      habitat = {'0iTa'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Python_regius'
      climate = {'BSh','Aw'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTh','0iTi'};
      embryo  = {'Tntf'};
      migrate = {};
      food    = {'biCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Python_sebae'
      climate = {'BSh','Aw'};
      ecozone = {'TPa'};
      habitat = {'0iT'};
      embryo  = {'Tntf'};
      migrate = {};
      food    = {'biCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Python_molurus'
      climate = {'Am','BSh','Cwa'};
      ecozone = {'TPi'};
      habitat = {'0iT'};
      embryo  = {'Tntf'};
      migrate = {};
      food    = {'biCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Apodora_papuana'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tntf'};
      migrate = {};
      food    = {'biCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eunectes_murinus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iFr'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'Apf'};

    case 'Eunectes_notaeus'
      climate = {'Aw','Cfa'};
      ecozone = {'TN'};
      habitat = {'0iFr','0iFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'Apf'};

    case 'Boa_constrictor'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'Apf'};

    case 'Vipera_berus'
      climate = {'Cfb','Dfb','BWk','BSk'};
      ecozone = {'THp'};
      habitat = {'0iThh','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Vipera_latastei'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0iThh','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Daboia_russelii'
      climate = {'Aw','BSh','Cwa'};
      ecozone = {'TPi'};
      habitat = {'0iThh','0iTg','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bitis_gabonica'
      climate = {'A','Cw'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O','Apa'};

    case 'Bitis_arietans'
      climate = {'A','Cw'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTh','0iTg','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O','Apa'};

    case 'Agkistrodon_piscivorus'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};
 
    case 'Gloydius_blomhoffii'
    climate = {'Cwa','Cfa','Dfa','Dwa'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Crotalus_horridus'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Crotalus_oreganus'
      climate = {'BWk','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Crotalus_pricei'
      climate = {'Cwa','Cwb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sistrurus_miliarius'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bothrops_insularis'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cerberus_rynchops'
      climate = {'Aw','Am'};
      ecozone = {'TPi'};
      habitat = {'0iMm'};
      embryo  = {'Fv','Mv'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Natrix_natrix'
      climate = {'Cfb','Dfb','Dfa'};
      ecozone = {'THp'};
      habitat = {'0bTg','biFm'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'biCva'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Natrix_maura'
      climate = {'BSk'; 'BWh'; 'Cfb'; 'Csa'};
      ecozone = {'THp'};
      habitat = {'0bFr','biFc'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Thamnophis_gigas'
      climate = {'BWk','BSk'};
      ecozone = {'THn'};
      habitat = {'biFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCva'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Thamnophis_radix'
      climate = {'Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'biFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCva'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Coronella_austriaca'
      climate = {'Cfb','Dfb','Dfa'};
      ecozone = {'THp'};
      habitat = {'0iThh','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Orthriophis_taeniurus'
      climate = {'Am','Cwa','Cfa','Dwa','Dfa'};
      ecozone = {'THp'};
      habitat = {'0iThh','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Elaphe_climacophora'
      climate = {'Cfa','Dfa'};
      ecozone = {'THp'};
      habitat = {'biTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hierophis_viridiflavus'
      climate = {'BSk','Cfb','Dfb'};
      ecozone = {'THn'};
      habitat = {'biFm'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhabdophis_tigrinus'
      climate = {'Cwa','Cfa','Dwa','Dfa'};
      ecozone = {'THp'};
      habitat = {'biFm'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tantilla_melanocephala'
      climate = {'Aw','Am','Dwa','Dfa'};
      ecozone = {'TN'};
      habitat = {'biTf'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Boaedon_fuliginosus'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'biTa'};
      embryo  = {'Tnt'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Psammophis_sibilans'
      climate = {'Aw','BWh','BSh','Csa'};
      ecozone = {'TPa'};
      habitat = {'biTi','biTs'};
      embryo  = {'Tnt'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Psammophylax_rhombeatus'
      climate = {'BWh','BWk','Csa'};
      ecozone = {'TPa'};
      habitat = {'biTi','biTs'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Naja_kaouthia'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'biTf'};
      embryo  = {'Tnt'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acanthophis_antarcticus'
      climate = {'BWh','BWk','BSh','Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'biTf','biTh','biTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Emydocephalus_ijimae'
      climate = {'MB'};
      ecozone = {'MPW'};
      habitat = {'biMr'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'biCvfe'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Micrurus_fulvius'
      climate = {'BSk','Cfa'};
      ecozone = {'THn'};
      habitat = {'biTf','biTa'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Micrurus_corallinus'
      climate = {'Am','BSk','Cfa'};
      ecozone = {'TN'};
      habitat = {'biTf','biTa'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelomedusa_subrufa'
      climate = {'Aw','BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0bTd','biFp','biFm'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Podocnemis_lewyana'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0bTd','biFr','biFm'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHl','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Podocnemis_unifilis'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0bTd','biFr','biFm'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHl','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pseudemydura_umbrina'
      climate = {'Csa'};
      ecozone = {'TA'};
      habitat = {'0bTd','biFp'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chelodina_oblonga'
      climate = {'Aw'};
      ecozone = {'TA'};
      habitat = {'0bTd','biFm','biMm'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biCvf','biCva'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Elseya_dentata'
      climate = {'Aw'};
      ecozone = {'TA'};
      habitat = {'0bTd','biFm'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biCvf','biCva'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hydromedusa_maximiliani'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0bTd','biFc'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chelus_fimbriata'
      climate = {'Af','Am','Aw'};
      ecozone = {'TN'};
      habitat = {'0bTd','biFc','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Carettochelys_insculpta'
      climate = {'Af','Aw'};
      ecozone = {'TA'};
      habitat = {'0bTd','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHl','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Apalone_spinifera'
      climate = {'BSk','Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0bTd','biFp','biFl','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelodiscus_sinensis'
      climate = {'Cfa','Cwa','Cfa'};
      ecozone = {'THp'};
      habitat = {'0bTd','biFp','biFl','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chelydra_serpentina'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0bTd','biFp','biFl','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biCv','biSv','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dermatemys_mawii'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0bTd','biFl','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Kinosternon_sonoriense'
      climate = {'BWh'};
      ecozone = {'THn'};
      habitat = {'0bTd','biFp','biFc'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Claudius_angustatus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0bTd','biFp','biFc'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dermochelys_coriacea'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0bTd','biMp'};
      embryo  = {'Tt'};
      migrate = {'Mo'};
      food    = {'biCij'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Caretta_caretta'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0bTd','biMcp'};
      embryo  = {'Tt'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Caretta_caretta_MED'
      climate = {'MB'};
      ecozone = {'MAm'};
      habitat = {'0bTd','biMcp'};
      embryo  = {'Tt'};
      migrate = {'Mo'};
      food    = {'biCi'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Lepidochelys_kempii'
      climate = {'MA','MB','MC'};
      ecozone = {'MAW'};
      habitat = {'0bTd','biMcp'};
      embryo  = {'Tt'};
      migrate = {'Mo'};
      food    = {'biCi','biHa'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Lepidochelys_olivacea'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0bTd','biMcp'};
      embryo  = {'Tt'};
      migrate = {'Mo'};
      food    = {'biCi','biHa'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Natator_depressus'
      climate = {'MA','MB'};
      ecozone = {'MIE'};
      habitat = {'0bTd','biMcp'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHa'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Chelonia_mydas'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0bTd','biMcp','biMr'};
      embryo  = {'Tt'};
      migrate = {'Mo'};
      food    = {'biCi','piHa'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Emydura_macquarii'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0bTd','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Emydura_victoriae'
      climate = {'Aw','BSh'};
      ecozone = {'TA'};
      habitat = {'0bTd','biFr','biFl'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Platysternon_megacephalum'
      climate = {'Cwa'};
      ecozone = {'TPi'};
      habitat = {'0bTd','biFc'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCim','biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Emys_orbicularis'
      climate = {'BSk','Csa','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0bTd','biFp'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Actinemys_marmorata'
      climate = {'Csa','Csb'};
      ecozone = {'THn'};
      habitat = {'0bTd','biFp'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Glyptemys_insculpta'
      climate = {'Dfb'};
      ecozone = {'THn'};
      habitat = {'0bTd','biFp'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Terrapene_carolina'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0bTd','biFp'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biHl'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Gopherus_agassizii'
      climate = {'BWh'};
      ecozone = {'THn'};
      habitat = {'0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Gopherus_morafkai'
      climate = {'BWh'};
      ecozone = {'THn'};
      habitat = {'0iTd'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Gopherus_polyphemus'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Testudo_hermanni'
      climate = {'Csa'};
      ecozone = {'THp'};
      habitat = {'0iTh'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Testudo_graeca'
      climate = {'Csa','BSk'};
      ecozone = {'THp'};
      habitat = {'0iTh'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Astrochelys_yniphora'
      climate = {'Aw'};
      ecozone = {'TPam'};
      habitat = {'0iTh','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Psammobates_geometricus'
      climate = {'Cfa'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Aldabrachelys_gigantea'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTg'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biHl'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Chelonoidis_niger'
      climate = {'BWh'};
      ecozone = {'TN'};
      habitat = {'0iTa'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biHl'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Stigmochelys_pardalis'
      climate = {'BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTa','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biHl'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Centrochelys_sulcata'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTa','0iTi'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biHl'};
      gender  = {'Dtmf'};
      reprod  = {'O'};

    case 'Mauremys_japonica'
      climate = {'Cfa'};
      ecozone = {'THp'};
      habitat = {'0bTd','biFm','biFp','biFl','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mauremys_sinensis'
      climate = {'Cfa'};
      ecozone = {'TPi'};
      habitat = {'0bTd','biFm','biFp','biFl','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cuora_flavomarginata'
      climate = {'Cfa'};
      ecozone = {'TPi'};
      habitat = {'0bTd','biFm','biFp'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Batagur_baska'
      climate = {'Am','Aw'};
      ecozone = {'TPi'};
      habitat = {'0bTd','biFm','biFp'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Melanochelys_tricarinata'
      climate = {'Am','Cwa'};
      ecozone = {'TPi'};
      habitat = {'0bTd','biFm','biFp'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'biCi','biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Deinosuchus_rugosus'
      climate = {'Aw'};
      ecozone = {'THn'};
      habitat = {'0bTd','biFm','biFr'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'biCvr','biCvf'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Alligator_mississippiensis'
      climate = {'Aw','Cfa'};
      ecozone = {'THn'};
      habitat = {'0bTd','biFm','biFp','biFp','biFr'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'biCv','biCi'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Caiman_crocodilus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0bTd','biFp','biFm','biFr'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'biCvr','biCvf'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Paleosuchus_palpebrosus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0bTd','biFp','biFm','biFr'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'biCvr','biCvf'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Gavialis_gangeticus'
      climate = {'Aw','BWh','BSh','Cfa'};
      ecozone = {'TPi'};
      habitat = {'0bTd','biFc','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'bpCi','bpCva','biCvf'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Crocodylus_johnsoni'
      climate = {'BSh'};
      ecozone = {'TA'};
      habitat = {'0bTd','biFm','biFr'};
      embryo  = {'Tt'};
      migrate = {};
      food    = {'bpCi','biCv'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Crocodylus_niloticus'
      climate = {'Am','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0bTd','biFm','biFl','biFp','biFr'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'bpCi','biCv'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Crocodylus_porosus'
      climate = {'MA','Am','Aw'};
      ecozone = {'TPa','TA'};
      habitat = {'0bTd','biFm','biFr','biMc'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'bpCi','biCv'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Crocodylus_acutus'
      climate = {'MA'};
      ecozone = {'TN'};
      habitat = {'0bFe','biMm'};
      embryo  = {'Tl'};
      migrate = {'Ms'};
      food    = {'bpCi','biCv'};
      gender  = {'Dtfm'};
      reprod  = {'O'};

    case 'Crocodylus_moreletii'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0bFe'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'bpCi','biCv'};
      gender  = {'Dtfm'};
      reprod  = {'O'};
      
    case 'Pterodaustro_guinazui'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0bTd','biMm'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biP'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Plateosaurus_engelhardti'
      climate = {'BS','Df'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTh'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Camerasaurus_spec'
      climate = {'BS'};
      ecozone = {'THn'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rapetosaurus_krausei'
      climate = {'A','Df'};
      ecozone = {'TPam'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Apatosaurus_spec'
      climate = {'BS'};
      ecozone = {'THn'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mamenchisaurus_spec'
      climate = {'BS'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Ts'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Psittacosaurus_mongoliensis'
      climate = {'BS','Df'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Maiasaura_peeblesorum'
      climate = {'BS','Df'};
      ecozone = {'THn'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Daspletosaurus_torosus'
      climate = {'BS','Df'};
      ecozone = {'THn'};
      habitat = {'0iTi'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCvr','biSvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gorgosaurus_libratus'
      climate = {'BS','Df'};
      ecozone = {'THn'};
      habitat = {'0iTi'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCvr','biSvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tyrannosaurus_rex'
      climate = {'BS','Df'};
      ecozone = {'THn'};
      habitat = {'0iTi'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCvr','biSvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Archaeopteryx_lithographica'
      climate = {'Df'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTf'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Struthio_camelus'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTg','0iTs','0iTd'};
      embryo  = {'Tnsm'};
      migrate = {};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhynchotus_rufescens'
      climate = {'A','Cfa','Cwa','Cwb'};
      ecozone = {'TN'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tnsm'};
      migrate = {};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhea_americana'
      climate = {'Aw','Cfa','Cwa','Cwb'};
      ecozone = {'TN'};
      habitat = {'0iTg','0iTs','0iTd'};
      embryo  = {'Tnsm'};
      migrate = {};
      food    = {'biCi','biCv','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Apteryx_mantelli'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTf'};
      embryo  = {'Tntm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dromaius_novaehollandiae'
      climate = {'BWh','BSh','Cfa'};
      ecozone = {'TA'};
      habitat = {'0iTg','0iTs','0iTd'};
      embryo  = {'Tnsm'};
      migrate = {};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Casuarius_casuarius'
      climate = {'Af'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnsm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Casuarius_bennetti'
      climate = {'Af'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnsm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Alectura_lathami'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tl'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Crax_blumenbachii'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Oreophasis_derbianus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Numida_meleagris'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Colinus_virginianus'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTh','0iTf'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Coturnix_japonica'
      climate = {'Dwa','Dwb'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Meleagris_gallopavo'
      climate = {'BSk'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gallus_gallus'
      climate = {'A'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gallus_gallus_IR'
      climate = {'A'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gallus_gallus_WL'
      climate = {'A'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Polyplectron_inopinatum'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phasianus_colchicus'
      climate = {'B','C','D'};
      ecozone = {'TH'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pavo_cristatus'
      climate = {'Am','BSh','Cwa','Cwb'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tetrastes_bonasia'
      climate = {'Dfb','Dfc','Dwb','Dwc'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lagopus_lagopus'
      climate = {'Df','Dw'};
      ecozone = {'TH'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dendragapus_obscurus'
      climate = {'BSk','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tympanuchus_pallidicinctus'
      climate = {'Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0iTg'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'bxCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dendrocygna_autumnalis'
      climate = {'A','Cfa'};
      ecozone = {'THn','TN'};
      habitat = {'biFp','biFm'};
      embryo  = {'Tnwf'};
      migrate = {'Ml'};
      food    = {'biCi','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anas_platyrhynchos'
      climate = {'Cfa','Cfb','Csa','Csb','Dfa','Dfb','Dfc'};
      ecozone = {'TH','TPi','TA'};
      habitat = {'biFp','biFm','biMm'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCi','xiHl','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anas_acuta'
      climate = {'Cfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'biFp','biFm','biMm'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCi','xiHl','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anas_sparsa'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'biFp','biFm','biMm'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi','xiHl','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mareca_strepera'
      climate = {'C','D'};
      ecozone = {'TH'};
      habitat = {'biFp','biFm','biMm'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCi','xiHl','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Oxyura_jamaicensis'
      climate = {'BSk','Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'biFp','biFm','biMm'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cygnus_cygnus'
      climate = {'A','B','C'};
      ecozone = {'THp','TPi'};
      habitat = {'xiF'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Anser_anser'
      climate = {'Dfb','Dfc','Dwc'};
      ecozone = {'THp'};
      habitat = {'xiFm','xiFl'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Anser_caerulescens'
      climate = {'ET'};
      ecozone = {'THn'};
      habitat = {'xiFm','biTht'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Branta_hutchinsii'
      climate = {'Dfc'};
      ecozone = {'THn'};
      habitat = {'xiFm','biTht'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Branta_leucopsis'
      climate = {'ET'};
      ecozone = {'TH','MA'};
      habitat = {'xiFm','biTht'};
      embryo  = {'Tncf'};
      migrate = {'Ml'};
      food    = {'biCi','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Cereopsis_novaehollandiae'
      climate = {'Cfb','BSk'};
      ecozone = {'TA'};
      habitat = {'xiMc'};
      embryo  = {'Tns'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Mergus_merganser'
      climate = {'Cfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'biFp','biFm'};
      embryo  = {'Tnwf'};
      migrate = {'Ml'};
      food    = {'biCi','biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mergus_serrator'
      climate = {'Cfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'biFp','biFm','xiMc'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biCvf','biCva'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Somateria_mollissima'
      climate = {'Dfc'};
      ecozone = {'MC'};
      habitat = {'xiMc'};
      embryo  = {'Tncf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Melanitta_perspicillata'
      climate = {'Dfc'};
      ecozone = {'THn'};
      habitat = {'biFp','biFm','xiMc'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Melanitta_deglandi'
      climate = {'Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'biFp','biFm','xiMc'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aythya_fuligula'
      climate = {'Cfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'biFp','biFm'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCi','biCim'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aythya_americana'
      climate = {'Cfb','Dfc','BSk'};
      ecozone = {'THn'};
      habitat = {'biFp','biFm'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCi','biCim','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aythya_affinis'
      climate = {'Cfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'biFp','biFm'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCi','biCim','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aythya_valisineria'
      climate = {'Cfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'biFp','biFm'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCi','biCim','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tadorna_cana'
      climate = {'B','C'};
      ecozone = {'TPa'};
      habitat = {'xiFm'};
      embryo  = {'Tntf'};
      migrate = {};
      food    = {'biCi','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Aix_galericulata'
      climate = {'Cfa','Dfa','Dwc'};
      ecozone = {'THp'};
      habitat = {'xiTf'};
      embryo  = {'Tnwf'};
      migrate = {'Ml'};
      food    = {'biCi','xiHs','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Chloephaga_picta'
      climate = {'Cwc'};
      ecozone = {'TN'};
      habitat = {'xiTh'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi','xiHs','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Podilymbus_podiceps'
      climate = {'BSk','Cf','Csb','Dfa','Dfb'};
      ecozone = {'THn','TN'};
      habitat = {'0iFp','0iFm'};
      embryo  = {'Tnffm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phoeniconaias_minor'
      climate = {'BSh','Cw'};
      ecozone = {'TPa'};
      habitat = {'0iS'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biP'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phoenicopterus_roseus'
      climate = {'B','C'};
      ecozone = {'TPa'};
      habitat = {'0iS'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biP'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Zenaida_macroura'
      climate = {'BSk','Csb','Df'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTg','0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {'Ml'};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Patagioenas_fasciata'
      climate = {'BSk','Csb'};
      ecozone = {'THn'};
      habitat = {'0iTd'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Streptopelia_decaocto'
      climate = {'A','B','C','D'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Columba_oenas'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {'Ms'};
      food    = {'biHs','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Columba_livia'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTd'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biHs','bxCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Columba_palumbus'
      climate = {'BSk','Cfb','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTd'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biHs','bxCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Caloenas_nicobarica'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hemiphaga_novaeseelandiae'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTf'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mesitornis_variegatus'
      climate = {'A'};
      ecozone = {'TPam'};
      habitat = {'0iTf'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pterocles_alchata'
      climate = {'BSk','BWk','Csa'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'bxCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pterocles_orientalis'
      climate = {'BSk','BWk','Csa'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'bxCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Apus_apus'
      climate = {'BSh','BSk','Csa','Cfb','Dfb','Dfc'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTh','0iTf','0iTi','0iTg'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aerodramus_fuciphagus'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aerodramus_spodiopygius'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Archilochus_alexandri'
      climate = {'BSk','BWk'};
      ecozone = {'THn'};
      habitat = {'0iTh'};
      embryo  = {'Tnpf'};
      migrate = {'Ml'};
      food    = {'biCi','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sternoclyta_cyanopectus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Doricha_eliza'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Coeligena_torquata'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lampornis_clemenciae'
      climate = {'Am','Cwa'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aegotheles_cristatus'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chordeiles_minor'
      climate = {'BSk','Cfa','Dfa'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Caprimulgus_pectoralis'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Podargus_strigoides'
      climate = {'BSh','BSk','Cfa'};
      ecozone = {'TA'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cuculus_canorus'
      climate = {'Cwa','Cfa','Cfb','Dfb','Dfc'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tnpo'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Clamator_glandarius'
      climate = {'BSh','BSk','Csa','Csb'};
      ecozone = {'THp','TPa'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tnpo'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dromococcyx_pavoninus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpo'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chalcites_basalis'
      climate = {'BWh','BSh','Cfc'};
      ecozone = {'TA','TAt'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpo'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chalcites_lucidus'
      climate = {'Cfb','Cfc'};
      ecozone = {'TA','TAt','TAz'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpo'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tauraco_erythrolophus'
      climate = {'Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ardeotis_kori'
      climate = {'BSh','BWh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chlamydotis_undulata'
      climate = {'BWh','BWk','BSk'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTd'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Opisthocomus_hoazin'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'bxHlf','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calidris_ferruginea'
      climate = {'ET'};
      ecozone = {'THp'};
      habitat = {'0iTht'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calidris_alpina'
      climate = {'ET','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calidris_bairdii'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calidris_minuta'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calidris_minutilla'
      climate = {'Dfc','ET'};
      ecozone = {'THn'};
      habitat = {'0iTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calidris_maritima'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTht'};
      embryo  = {'Tnsm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Philomachus_pugnax'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTht','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tringa_flavipes'
      climate = {'Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tringa_totanus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iThh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Coenocorypha_huegeli'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTg','0iThf'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Coenocorypha_pusilla'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTg','0iThf'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Limnodromus_griseus'
      climate = {'Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iThh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Limosa_haemastica'
      climate = {'Cfa','Dfb','Dfa'};
      ecozone = {'THn'};
      habitat = {'0iTh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Limosa_limosa'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTg'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Numenius_phaeopus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTh','0iTg'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Uria_aalge'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Uria_lomvia'
      climate = {'MC','ME'};
      ecozone = {'MAN'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Alle_alle'
      climate = {'ME'};
      ecozone = {'MAN'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pinguinus_impennis'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Alca_torda'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cepphus_grylle'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biCvf','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Brachyramphus_brevirostris'
      climate = {'ME'};
      ecozone = {'MPN'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ptychoramphus_aleuticus'
      climate = {'MC'};
      ecozone = {'MPNE'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aethia_pusilla'
      climate = {'MC','ME'};
      ecozone = {'MPNE'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aethia_cristatella'
      climate = {'MC','ME'};
      ecozone = {'MPNW'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aethia_pygmaea'
      climate = {'MC','ME'};
      ecozone = {'MPNW'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cerorhinca_monocerata'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tntfm'};
      migrate = {'Ms'};
      food    = {'biCik','biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Fratercula_arctica'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tntfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Fratercula_cirrhata'
      climate = {'MC'};
      ecozone = {'MPNE'};
      habitat = {'xiMcp','0bTd'};
      embryo  = {'Tntfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Onychoprion_fuscatus'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'biMc'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Onychoprion_anaethetus'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'biMc'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sterna_paradisaea'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTht','0iThh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sterna_hirundo'
      climate = {'Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTht','0iThh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sterna_dougallii'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sterna_sumatrana'
      climate = {'MA'};
      ecozone = {'MI','MPW'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Thalasseus_sandvicensis'
      climate = {'Dfb','Dfc'};
      ecozone = {'MA'};
      habitat = {'0iTht','0iThh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Thalasseus_elegans'
      climate = {'MA','MB'};
      ecozone = {'MPE'};
      habitat = {'0iTht','0iThh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chlidonias_leucopterus'
      climate = {'Dfb'};
      ecozone = {'THp','TPa','TA'};
      habitat = {'0iFm'};
      embryo  = {'Tnffm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chlidonias_hybrida'
      climate = {'B'};
      ecozone = {'THp'};
      habitat = {'0iFm'};
      embryo  = {'Tnffm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gelochelidon_nilotica'
      climate = {'B','MA'};
      ecozone = {'THp','MC'};
      habitat = {'0iFm','xiMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hydroprogne_caspia'
      climate = {'Cfb','Dfb','MA'};
      ecozone = {'TH','TA','TP','MC'};
      habitat = {'0iFm','xiMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sternula_albifrons'
      climate = {'C','D'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chroicocephalus_ridibundus'
      climate = {'Cfb','Dfb'};
      ecozone = {'TH'};
      habitat = {'0iFl','0iFm','0iMm'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Larus_argentatus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFe','0iMm','biMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCi','biSi','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Larus_fuscus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFe','0iMm','biMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCi','biSi','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Larus_dominicanus'
      climate = {'MB','MC'};
      ecozone = {'MAS','MPSE'};
      habitat = {'0iMm','biMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCi','biSi','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Larus_pacificus'
      climate = {'MB','MC'};
      ecozone = {'MIS','MPSW'};
      habitat = {'0iMm','biMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCi','biSi','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ichthyaetus_audouinii'
      climate = {'MB'};
      ecozone = {'MAm','MAE'};
      habitat = {'biMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rissa_tridactyla'
      climate = {'MC','ME'};
      ecozone = {'MAN','MPN','MN'};
      habitat = {'biMc','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rissa_brevirostris'
      climate = {'MC','ME'};
      ecozone = {'MPN'};
      habitat = {'biMc','0bTd'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gygis_alba'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'biMc'};
      embryo  = {'Tnwfm','Tncfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anous_tenuirostris'
      climate = {'MA'};
      ecozone = {'MI'};
      habitat = {'biMc'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anous_stolidus'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'biMc'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Stercorarius_longicaudus'
      climate = {'ET','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCvb','biCvm','biSv','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Stercorarius_skua'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iTg','xiMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCvb','biCvm','biSv','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Stercorarius_maccormicki'
      climate = {'MC'};
      ecozone = {'MS'};
      habitat = {'0iTg','xiMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCvb','biCvm','biSv','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Stercorarius_antarcticus'
      climate = {'MC'};
      ecozone = {'MS'};
      habitat = {'0iTg','xiMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCvb','biCvm','biSv','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Dromas_ardeola'
      climate = {'MA'};
      ecozone = {'MI'};
      habitat = {'0iSm'};
      embryo  = {'Tnsm'};
      migrate = {};
      food    = {'biCid'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Turnix_sylvaticus'
      climate = {'A','B','C','D'};
      ecozone = {'THp','TPa','TPi'};
      habitat = {'0iTh','0iTg'};
      embryo  = {'Tnsm'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Burhinus_capensis'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTg'};
      embryo  = {'Tnt'};
      migrate = {};
      food    = {'biC'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Chionis_minor'
      climate = {'C'};
      ecozone = {'MIS'};
      habitat = {'0iMi'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biO'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Himantopus_mexicanus'
      climate = {'BWh','BSh'};
      ecozone = {'THn','TN'};
      habitat = {'0xTs','xiFm','xiFe'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Himantopus_novaezelandiae'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'xiFm','xiFe'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Haematopus_moquini'
      climate = {'BWk','BSh','BSk'};
      ecozone = {'TPa'};
      habitat = {'0xTs','xiFm','xiFe'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCim'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Haematopus_ostralegus'
      climate = {'Cfb','Dfa','Dfb','Dwa','Dwb'};
      ecozone = {'THp'};
      habitat = {'0xTs','xiFm','xiFe'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCim'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Vanellus_vanellus'
      climate = {'Cfb'};
      ecozone = {'THp'};
      habitat = {'0xTg','xiFm','xiFe'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Vanellus_armatus'
      climate = {'Aw','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTg','0iTs','0iTa'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Vanellus_coronatus'
      climate = {'Aw','BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTg','0iTs','0iTa'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Charadrius_pecuarius'
      climate = {'Aw','BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTg','0iTs','0iFm','0iSm'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Charadrius_melodus'
      climate = {'Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iFm'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Charadrius_vociferus'
      climate = {'Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTh','0iFm'};
      embryo  = {'Tnsfm'};
      migrate = {'Ms'};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Charadrius_hiaticula'
      climate = {'Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTg','0iTh','0iFm'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pluvialis_dominica'
      climate = {'ET','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pluvialis_apricaria'
      climate = {'ET','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Psophia_crepitans'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'xiTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Psophia_leucoptera'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'xiTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Grus_japonensis'
      climate = {'Dwb'};
      ecozone = {'THp'};
      habitat = {'xiFm','0xTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Grus_monacha'
      climate = {'Dwb','Dwc','Dfc'};
      ecozone = {'THp'};
      habitat = {'xiFm','0xTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Grus_americana'
      climate = {'Dfb'};
      ecozone = {'THn'};
      habitat = {'xiThh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Grus_virgo'
      climate = {'BSk','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTa','0iTs'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Antigone_antigone'
      climate = {'Aw','BSh'};
      ecozone = {'TPi','TA'};
      habitat = {'0iTg','xiFm'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Antigone_vipio'
      climate = {'Dwc'};
      ecozone = {'THp'};
      habitat = {'0iTs','0iThh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Antigone_canadensis'
      climate = {'Cfa','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTg','0iTht','0iThh'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Antigone_rubicunda'
      climate = {'Aw','BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTg','0iTs','0iTa','xiFm','xiMm'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Leucogeranus_leucogeranus'
      climate = {'ET'};
      ecozone = {'THp'};
      habitat = {'0iTht'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gallinula_chloropus'
      climate = {'Aw','BSk','Cfb','Dfb'};
      ecozone = {'THp','TPa','TPi'};
      habitat = {'0iFm'};
      embryo  = {'Tnffm'};
      migrate = {'Ms'};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Crex_crex'
      climate = {'BWk','BSk','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFm'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi','biHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phaethon_lepturus'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'xiMpe','0xTd'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phaethon_rubricauda'
      climate = {'MA'};
      ecozone = {'MP','MI'};
      habitat = {'xiMpe','0xTd'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phaethon_aethereus'
      climate = {'MA'};
      ecozone = {'MP','MI','MPE'};
      habitat = {'xiMpe','0xTd'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhynochetos_jubatus'
      climate = {'Af'};
      ecozone = {'TAz'};
      habitat = {'0iTf'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCi','biCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gavia_stellata'
      climate = {'Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFl','xiMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gavia_immer'
      climate = {'Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iFl','xiMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pterodroma_phaeopygia'
      climate = {'MA'};
      ecozone = {'MPE'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pterodroma_atrata'
      climate = {'MA'};
      ecozone = {'MP'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pterodroma_incerta'
      climate = {'MB'};
      ecozone = {'MAS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pterodroma_macroptera'
      climate = {'MC'};
      ecozone = {'MAS','MIS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pterodroma_solandri'
      climate = {'MA','MB'};
      ecozone = {'MPW'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pterodroma_pycrofti'
      climate = {'MC'};
      ecozone = {'MP'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pterodroma_nigripennis'
      climate = {'MA','MB','MC'};
      ecozone = {'MP'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pterodroma_axillaris'
      climate = {'MB','MC'};
      ecozone = {'MPS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pterodroma_hypoleuca'
      climate = {'MA'};
      ecozone = {'MP'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pterodroma_leucoptera'
      climate = {'MA','MB','MC'};
      ecozone = {'MP'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
 
    case 'Macronectes_giganteus'
      climate = {'MB','MC','ME'};
      ecozone = {'MS','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik','bjSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macronectes_halli'
      climate = {'MB','MC','ME'};
      ecozone = {'MS','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik','bjSv'};
      gender  = {'Dg'};
      reprod  = {'O'};
                     
    case 'Fulmarus_glacialis'
      climate = {'MC','ME'};
      ecozone = {'MN','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik','biCij','bjSv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Fulmarus_glacialoides'
      climate = {'MC','ME'};
      ecozone = {'MS','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik','bjSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pagodroma_nivea'
      climate = {'MC','ME'};
      ecozone = {'MS','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik','bjSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Thalassoica_antarctica'
      climate = {'MC'};
      ecozone = {'MS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
                 
    case 'Daption_capense'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
        
    case 'Procellaria_cinerea'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
           
    case 'Procellaria_aequinoctialis'
      climate = {'MB','MC','ME'};
      ecozone = {'MC','MS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
           
    case 'Pachyptila_belcheri'
      climate = {'MB','MC','ME'};
      ecozone = {'MS','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
           
    case 'Pachyptila_vittata'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
           
    case 'Halobaena_caerulea'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
                      
    case 'Bulweria_bulwerii'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
           
    case 'Puffinus_assimilis'
      climate = {'MC'};
      ecozone = {'MS','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Puffinus_baroli'
      climate = {'MC'};
      ecozone = {'MS','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Puffinus_lherminieri'
      climate = {'MA','MB','MC'};
      ecozone = {'MA'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Puffinus_puffinus'
      climate = {'MC','ME'};
      ecozone = {'MA','MN'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'}; 
      
    case 'Puffinus_gavia'
      climate = {'MB','MC'};
      ecozone = {'MPW','MIE'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'}; 
      
    case 'Puffinus_opisthomelas'
      climate = {'MA','MB','MC'};
      ecozone = {'MPE'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'}; 
      
    case 'Puffinus_huttoni'
      climate = {'MB','MC'};
      ecozone = {'MPW','MIE'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'}; 
      
    case 'Calonectris_borealis'
      climate = {'MC'};
      ecozone = {'MA'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm','Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCim'};
      gender  = {'Dg'};
      reprod  = {'O'};
                
    case 'Calonectris_leucomelas'
      climate = {'MA','MB'};
      ecozone = {'MPW'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCim'};
      gender  = {'Dg'};
      reprod  = {'O'};
                
   case 'Ardenna_tenuirostris'
      climate = {'M'};
      ecozone = {'MS','MA','MI'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'}; 
                  
    case 'Ardenna_gravis'
      climate = {'M'};
      ecozone = {'MA','MS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Ardenna_grisea'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'}; 
                  
    case 'Ardenna_carneipes'
      climate = {'MA','MB','MC'};
      ecozone = {'MP'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'}; 
                  
    case 'Pseudobulweria_rostrata'
      climate = {'MC'};
      ecozone = {'MPS'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm','Tntfm'};
      migrate = {};
      food    = {'biSic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelecanoides_georgicus'
      climate = {'MC'};
      ecozone = {'MAS','MIS','MPS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pelecanoides_urinatrix'
      climate = {'MC'};
      ecozone = {'MAS','MIS','MPS'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
           
    case 'Diomedea_exulans'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCic','biCik','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Diomedea_epomophora'
      climate = {'MC','ME'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCic','biCik','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Thalassarche_melanophrys'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCic','biCik','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Thalassarche_cauta'
      climate = {'MC'};
      ecozone = {'MIS'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCic','biCik','biCit','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Thalassarche_chrysostoma'
      climate = {'MB','MC'};
      ecozone = {'MS','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCic','biCik','biCit','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Phoebetria_fusca'
      climate = {'MB','MC','ME'};
      ecozone = {'MS','MAS','MIS'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCic','biCik','biCit','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Phoebetria_palpebrata'
      climate = {'MC','ME'};
      ecozone = {'MS','MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCic','biCik','biCit','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Hydrobates_pelagicus'
      climate = {'M'};
      ecozone = {'MA'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCij','biCic','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
  case 'Oceanodroma_microsoma'
      climate = {'MA','MB'};
      ecozone = {'MPE'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};
              
  case 'Oceanodroma_leucorhoa'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
  case 'Oceanodroma_castro'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
  case 'Oceanodroma_furcata'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
  case 'Oceanodroma_tristrami'
      climate = {'MB'};
      ecozone = {'MP'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Pelagodroma_marina'
      climate = {'M'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Oceanites_oceanicus'
      climate = {'MA','MB','MC','ME'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};
                    
    case 'Fregetta_tropica'
      climate = {'MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};
                    
    case 'Spheniscus_demersus'
      climate = {'MB','MC'};
      ecozone = {'MISW','MASE'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Spheniscus_humboldti'
      climate = {'MB','MC'};
      ecozone = {'MPSE'};
      habitat = {'0iMc'};
      embryo  = {'Tntfm'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eudyptula_minor'
      climate = {'MC'};
      ecozone = {'MISE','MPSW'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eudyptes_pachyrhynchus'
      climate = {'MC'};
      ecozone = {'MISE','MPSW'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eudyptes_chrysocome'
      climate = {'MC'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pygoscelis_adeliae'
      climate = {'ME'};
      ecozone = {'TS'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pygoscelis_antarcticus'
      climate = {'ME','MC'};
      ecozone = {'TS'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pygoscelis_papua'
      climate = {'ME','MC'};
      ecozone = {'MS'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf','biCic','biCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ciconia_ciconia'
      climate = {'BSk','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iTs','xiFm'};
      embryo  = {'Tncfm'};
      migrate = {'Ml'};
      food    = {'biCva','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ciconia_stormi'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biCv','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ciconia_abdimii'
      climate = {'Aw','BSh','Cwb','Cwc'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCv','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mycteria_cinerea'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Leptoptilos_crumeniferus'
      climate = {'A','BSh','Cwb','Cwc'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCv','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phalacrocorax_auritus'
      climate = {'MA'};
      ecozone = {'MA','MPE'};
      habitat = {'0xMc'};
      embryo  = {'Tnpfm','Tncfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phalacrocorax_aristotelis'
      climate = {'MC'};
      ecozone = {'MAE'};
      habitat = {'0xMc'};
      embryo  = {'Tnpfm','Tncfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phalacrocorax_carbo'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TP','TA'};
      habitat = {'0xMc','0xFm'};
      embryo  = {'Tnpfm','Tncfm'};
      migrate = {'Ml'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phalacrocorax_brasilianus'
      climate = {'A','B'};
      ecozone = {'TN'};
      habitat = {'0xMc','0xFm'};
      embryo  = {'Tnpfm','Tncfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microcarbo_coronatus'
      climate = {'MC'};
      ecozone = {'MASE'};
      habitat = {'0xMc'};
      embryo  = {'Tnpfm','Tncfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Fregata_minor'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnpf'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Fregata_magnificens'
      climate = {'MA'};
      ecozone = {'MA','MPE'};
      habitat = {'0xTf','0iMi','xiFl','xiFp'};
      embryo  = {'Tnpf'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Fregata_ariel'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0xTf','0iMi','xiFl','xiFp'};
      embryo  = {'Tnpf'};
      migrate = {'Ms'};
      food    = {'biCvf','biCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Morus_bassanus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Morus_serrator'
      climate = {'MB','MC'};
      ecozone = {'MPW'};
      habitat = {'0iMc'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sula_nebouxii'
      climate = {'MA','MB'};
      ecozone = {'MPE'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sula_dactylatra'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sula_leucogaster'
      climate = {'MA'};
      ecozone = {'MC'};
      habitat = {'0iMc'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Papasula_abbotti'
      climate = {'MA'};
      ecozone = {'MI'};
      habitat = {'0iMc'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Balaeniceps_rex'
      climate = {'Aw','Cwb','Cwc'};
      ecozone = {'TPa'};
      habitat = {'0iFm'};
      embryo  = {'Tnsfm'};
      migrate = {};
      food    = {'biCvf','biCva','biCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelecanus_onocrotalus'
      climate = {'Csa','Dfa','Dfb'};
      ecozone = {'TPa','THp'};
      habitat = {'0iFl','0iFe'};
      embryo  = {'Tnpfm','Tnsfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pelecanus_occidentalis'
      climate = {'MA','MB'};
      ecozone = {'MPE','MAW'};
      habitat = {'0iMc'};
      embryo  = {'Tnpfm','Tnsfm'};
      migrate = {};
      food    = {'biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Scopus_umbretta'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iFm'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biCvf','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ardea_herodias'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iFm','0iFe','0iMm'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ardea_purpurea'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iFe'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bubulcus_ibis'
      climate = {'A','B','C'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iFm','0iFe','0iMm'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Platalea_leucorodia'
      climate = {'BWk','BSk','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iFe'};
      embryo  = {'Tnpfm','Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCi','biCvf','biCva'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Geronticus_eremita'
      climate = {'BWh','BSk'};
      ecozone = {'THp'};
      habitat = {'0iTs','0iTa','0iTd'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biCi','biCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aquila_chrysaetos'
      climate = {'BSk','Cfa','Cfb','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTi','0iTs','0iTg','0iTht','0iThh'};
      embryo  = {'Tncf'};
      migrate = {'Ms'};
      food    = {'biCvb','biCvm','biSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Haliaeetus_albicilla'
      climate = {'Cfb','Dfb','Dfc','Dwb','Dwc'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTs','0iTg','0iTht','0iThh'};
      embryo  = {'Tnpf'};
      migrate = {'Ms'};
      food    = {'biCv','biCvm','biCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gyps_rueppellii'
      climate = {'Am','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTg','0iTht'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gyps_africanus'
      climate = {'Am','BSh','Cwb','Cwc'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTg','0iTht'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gyps_coprotheres'
      climate = {'BWh','BSh','Cwb','Cwc'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTg','0iTht'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neophron_percnopterus'
      climate = {'A', 'BW','Csa'};
      ecozone = {'THp','TPa','TPi'};
      habitat = {'0iTi','0iTg','0iTht'};
      embryo  = {'Tncfm'};
      migrate = {'Ms'};
      food    = {'biSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Necrosyrtes_monachus'
      climate = {'BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTg','0iTht'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Accipiter_fasciatus'
      climate = {'A','B','C'};
      ecozone = {'TA'};
      habitat = {'0iFm','0iTh'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCvb','biCvm','biCva','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Accipiter_nisus'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iTh'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCvb','biCvm','biCva','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Circus_aeruginosus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iTh'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCvb','biCvm','biCva','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Circus_cyaneus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iTh'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCvb','biCvm','biCva','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Milvus_milvus'
      climate = {'BSk','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iTh'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCvb','biCvm','biCva','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Butastur_rufipennis'
      climate = {'BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Buteo_oreophilus'
      climate = {'A','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCv','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Buteo_lineatus'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTi','0iTf'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCv','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sagittarius_serpentarius'
      climate = {'Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tnsfm'};
      migrate = {'Ml'};
      food    = {'biCv','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Vultur_gryphus'
      climate = {'BWk','BSk','Csb','Cfb'};
      ecozone = {'TN'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tncfm'};
      migrate = {};
      food    = {'biSvm','biSvb'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sarcoramphus_papa'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biSvm','biSvb'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tyto_alba'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCv','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bubo_scandiacus'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTht'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCva','biCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bubo_virginianus'
      climate = {'A','B','C','D'};
      ecozone = {'THn','TN'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpf'};
      migrate = {'Ms'};
      food    = {'biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ninox_novaeseelandiae'
      climate = {'Cfb'};
      ecozone = {'TAz','TAt'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Asio_otus'
      climate = {'Cfa','Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Asio_flammeus'
      climate = {'A','B','C','D'};
      ecozone = {'TH'};
      habitat = {'0iTh','0iTi','0iTs'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Otus_senegalensis'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTi','0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Athene_noctua'
      climate = {'B','C','D'};
      ecozone = {'TH'};
      habitat = {'0iTh','0iTi','0iTs'};
      embryo  = {'Tnsf'};
      migrate = {'Ms'};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Urocolius_macrourus'
      climate = {'BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTh'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biCi','biH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Leptosomus_discolor'
      climate = {'A'};
      ecozone = {'TPam'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Euptilotis_neoxenus'
      climate = {'BSk','Cwa','Cwb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biCi','biCvr','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhabdotorrhinus_exarhatus'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCii','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tockus_monteiri'
      climate = {'BSh','BWh'};
      ecozone = {'TPa'};
      habitat = {'0iTi'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCii','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bucorvus_leadbeateri'
      climate = {'BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi','biCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Upupa_epops'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTh'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi','biCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Todiramphus_cinnamominus'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm','Tntfm'};
      migrate = {};
      food    = {'biCvf','biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Merops_bulocki'
      climate = {'BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm','Tntfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Merops_orientalis'
    climate = {'Am','BSh','BWh'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm','Tntfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ramphastos_toco'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iTi'};
      embryo  = {'Tnwfm','Tntfm'};
      migrate = {};
      food    = {'biCii','biCvr','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Jynx_torquilla'
      climate = {'Cfa','Cfb','Dfb','Dwb','Dwc'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTh'};
      embryo  = {'Tnwfm','Tntfm'};
      migrate = {'Ml'};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cariama_cristata'
      climate = {'Aw','Cfa'};
      ecozone = {'TN'};
      habitat = {'0iTg'};
      embryo  = {'Tnsfm','Tnpfm'};
      migrate = {};
      food    = {'biCii','biCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Falco_naumanni'
      climate = {'BSk','BWk'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTg','0iTa'};
      embryo  = {'Tnwfm','Tncfm'};
      migrate = {'Ml'};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Falco_tinnunculus'
      climate = {'BSk','BWk','Cfb','Csa','Dfb','Dwc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTg','0iTa'};
      embryo  = {'Tncf'};
      migrate = {'Ms'};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Falco_columbarius'
      climate = {'Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTh'};
      embryo  = {'Tncf'};
      migrate = {'Ms'};
      food    = {'biCi','biCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Strigops_habroptila'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biHs','biHe'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Nestor_notabilis'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTh','0iTf','0iTd'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biHs','biCi','biSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calyptorhynchus_lathami'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Zanda_funerea'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA','TAt'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Probosciger_aterrimus'
      climate = {'Am','Af'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cacatua_ophthalmica'
      climate = {'Af'};
      ecozone = {'TAz'}; % endemic to New Britain
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biHs','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cacatua_moluccensis'
      climate = {'Af'};
      ecozone = {'TAz'}; % endemic to Seram archipelago
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biHs','biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cacatua_tenuirostris'
      climate = {'BSk', 'Cfa','Cfb'};
      ecozone = {'TA'}; 
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biHs','biHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Poicephalus_robustus'
      climate = {'Cw'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Poicephalus_cryptoxanthus'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cyanopsitta_spixii'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ara_ararauna'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ara_macao'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cyanoliseus_patagonus'
      climate = {'Cfa','Cwa'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTh','0iTi'};
      embryo  = {'Tntf'};
      migrate = {};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Amazona_amazonica'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Amazona_finschi'
      climate = {'Cwa','Cwb'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Myiopsitta_monachus'
      climate = {'Aw','Cwa','Cfa'};
      ecozone = {'TN'};
      habitat = {'0iTg','0iTh','0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Forpus_passerinus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTh','0iTi'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Psittrichas_fulgidus'
      climate = {'Af'};
      ecozone = {'TA'}; % endemic to New Guinea
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {'Ms'};
      food    = {'biHs'}; % almost only figs
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Coracopsis_barklyi'
      climate = {'Af'};
      ecozone = {'TA'}; % endemic to Prasin
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eos_histrio'
      climate = {'Af'};
      ecozone = {'TA'}; % endemic to Karakelang, Indonesia
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Melopsittacus_undulatus'
      climate = {'BWk','BSk'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tnwf'};
      migrate = {'Ms'};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Psittaculirostris_salvadorii'
      climate = {'Af'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biHs'}; % mainly figs
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Prosopeia_tabuensis'
      climate = {'Af'};
      ecozone = {'TAz'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biHs'}; 
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eunymphicus_cornutus'
      climate = {'Af'};
      ecozone = {'TAz'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biHs'}; 
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acanthisitta_chloris'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm','Tntfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aphrastura_spinicauda'
      climate = {'Csb','Cfb','Cfc'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dendroplex_picus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Premnoplex_brunnescens'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phacellodomus_ruber'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phacellodomus_sibilatrix'
      climate = {'Cfa','Cwa'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tyrannus_tyrannus'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {'Ml'};
      food    = {'biCii','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tyrannus_forficatus'
      climate = {'Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {'Ml'};
      food    = {'biCii','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tyrannus_savana'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biCii','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sayornis_phoebe'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {'Ms'};
      food    = {'biCii','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Empidonax_oberholseri'
      climate = {'BSk','Dsa'};
      ecozone = {'THn'};
      habitat = {'0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {'Ml'};
      food    = {'biCii','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Leptopogon_amaurocephalus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biCii','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mionectes_oleagineus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTi'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'biCii','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Archboldia_papuensis'
      climate = {'Af'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chlamydera_nuchalis'
      climate = {'Aw'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ailuroedus_crassirostris'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Malurus_splendens'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ramsayornis_modestus'
      climate = {'Aw','Am'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acanthiza_chrysorrhoa'
      climate = {'BWh','BSh','Cfb','Cfc'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acanthiza_inornata'
      climate = {'BSk','Csa','Csb'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gerygone_igata'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gerygone_flavolateralis'
      climate = {'Af'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pomatostomus_temporalis'
      climate = {'Am','BSh','BWh'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Paradisaea_rubra'
      climate = {'Af'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Paradigalla_brevicauda'
      climate = {'Af'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Astrapia_mayeri'
      climate = {'Af'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lanius_senator'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTh'};
      embryo  = {'Tnpf'};
      migrate = {'Ml'};
      food    = {'biCi','biCva','biCvb'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pica_pica'
      climate = {'A','B','C','D'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aphelocoma_coerulescens'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cyanopica_cyanus'
      climate = {'C','D'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tnpfm'};
      migrate = {};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Corvus_monedula'
      climate = {'A','B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'bxCi','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Corvus_hawaiiensis'
      climate = {'Af'};
      ecozone = {'TO'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'bxCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Corvus_splendens'
      climate = {'Am'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'bxCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Corvus_albus'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tnwfm'};
      migrate = {};
      food    = {'bxCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Picathartes_gymnocephalus'
      climate = {'Af'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tncfm'}; 
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Remiz_pendulinus'
      climate = {'Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iThf'};
      embryo  = {'Tnpfm'}; % either male or female who incubates
      migrate = {'Ms'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lophophanes_cristatus'
      climate = {'BSk','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Poecile_atricapillus'
      climate = {'Dfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Parus_major'
      climate = {'A','B','C','D'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTf','0iTh','0iTi'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cyanistes_caeruleus'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTs'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Periparus_ater'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Alauda_arvensis'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','xiHs','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Galerida_cristata'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','xiHs','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ammomanes_deserti'
      climate = {'BWh'};
      ecozone = {'THp','TPa'};
      habitat = {'0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi','xiHs','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calendulauda_erythrochlamys'
      climate = {'BWh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi','xiHs','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eremophila_alpestris'
      climate = {'C','D','ET'};
      ecozone = {'TH'};
      habitat = {'0iTi','0iTs','0iTg','0iTh'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','xiHs','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Delichon_urbicum'
      climate = {'BSk','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tncf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tachycineta_leucorrhoa'
      climate = {'Am','Cfa'};
      ecozone = {'TN'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tncf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tachycineta_albilinea'
      climate = {'Am','Aw'};
      ecozone = {'TN'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tncf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hirundo_tahitica'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tncf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hirundo_rustica'
      climate = {'B','C','D'};
      ecozone = {'TH'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tncf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hirundo_neoxena'
      climate = {'A','B','C'};
      ecozone = {'TA','TAz'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tncf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Petrochelidon_spilodera'
      climate = {'Cwa','Cwb'};
      ecozone = {'TH'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tncf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Petrochelidon_ariel'
      climate = {'A','B','C'};
      ecozone = {'TA'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tncf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sylvia_atricapilla'
      climate = {'BSk','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phylloscopus_trochilus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpf'}; % close to the ground
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acrocephalus_arundinaceus'
      climate = {'BSk','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFm'};
      embryo  = {'Tnpf'}; 
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acrocephalus_scirpaceus'
      climate = {'BSk','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFm'};
      embryo  = {'Tnpf'}; 
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Garrulax_strepitans'
      climate = {'Aw'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Argya_squamiceps'
      climate = {'BWh'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTd'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Regulus_regulus'
      climate = {'Cfa','Cfb','Cwc','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {'Ms'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Regulus_ignicapillus'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {'Ms'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tichodroma_muraria'
      climate = {'ET','Cwb','Cwc'};
      ecozone = {'THp'};
      habitat = {'0iTd'};
      embryo  = {'Tncf'};
      migrate = {'Ms'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Troglodytes_aedon'
      climate = {'BSk','Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sitta_europaea'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cinclus_cinclus'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tncf'};
      migrate = {'Ms'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Turdus_merula'
      climate = {'BSk','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpf'}; 
      migrate = {'Ms'};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Turdus_philomelos'
      climate = {'BSk','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpf'}; 
      migrate = {'Ms'};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Turdus_migratorius'
      climate = {'BSk','Cfa','Dfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpf'}; 
      migrate = {'Ml'};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Turdus_eremita'
      climate = {'Cfb'};
      ecozone = {'TN'};
      habitat = {'0iTh'};
      embryo  = {'Tnpf'}; 
      migrate = {};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Catharus_minimus'
      climate = {'Cfa','Dfa','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpf','Tnsf'}; 
      migrate = {'Ml'};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Myadestes_obscurus'
      climate = {'Am'};
      ecozone = {'TO'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpfm'}; 
      migrate = {};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Myadestes_palmeri'
      climate = {'Am'};
      ecozone = {'TO'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpfm'}; 
      migrate = {};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hylocichla_mustelina'
      climate = {'Cfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnpfm'}; 
      migrate = {};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sturnus_vulgaris'
      climate = {'B','C','D'};
      ecozone = {'TH'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tnwfm'}; 
      migrate = {'Ml'};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Buphagus_erythrorhynchus'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tnwfm'}; 
      migrate = {'Ms'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Toxostoma_curvirostre'
      climate = {'BWh','BSh','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Oenanthe_oenanthe'
      climate = {'B','C','D'};
      ecozone = {'TH'};
      habitat = {'0iTd','0iThh','0iTg'};
      embryo  = {'Tntf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
           
    case 'Saxicola_rubicola'
      climate = {'B','C'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iThh','0iTg'};
      embryo  = {'Tnwf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
           
    case 'Saxicola_torquata'
      climate = {'B','C'};
      ecozone = {'THp','TPa'};
      habitat = {'0iTd','0iThh','0iTg'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Saxicola_rubetra'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iThh'};
      embryo  = {'Tnwf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ficedula_hypoleuca'
      climate = {'BSk','Cfb','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iThh','0iTg'};
      embryo  = {'Tnwf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Myrmecocichla_formicivora'
      climate = {'BWh','BWk','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTd','0iThh','0iTg'};
      embryo  = {'Tnwf'};
      migrate = {};
      food    = {'biCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cinnyris_jugularis'
      climate = {'A'};
      ecozone = {'TPi','TA'};
      habitat = {'0iTh','0iMm'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ploceus_castaneiceps'
      climate = {'Aw'};
      ecozone = {'TPa'}; 
      habitat = {'0iTi'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Foudia_rubra'
      climate = {'Af'};
      ecozone = {'TPa'}; % Mauritius
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Passer_domesticus'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iTh','0iTi','0iTs','0iTg','0iTa'};
      embryo  = {'Tnwf','Tncf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Passer_montanus'
      climate = {'A','B','C','D'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTh','0iTi','0iTs','0iTg','0iTa'};
      embryo  = {'Tnwf','Tncf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Taeniopygia_guttata'
      climate = {'Af'};
      ecozone = {'TPi','TA'};
      habitat = {'0iTh','0iTi','0iTs','0iTg','0iTa'};
      embryo  = {'Tnwf','Tncf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Amandava_subflava'
      climate = {'A','C'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTg'};
      embryo  = {'Tnwf','Tncf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anthus_pratensis'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Anthus_spinoletta'
      climate = {'BSk','Csa','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Motacilla_flava'
      climate = {'BSk','Csa','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Motacilla_citreola'
      climate = {'BSk','Csa','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Motacilla_aguimp'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTi','0iTs','0iTg'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Motacilla_clara'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTi','0iTf'};
      embryo  = {'Tnsf'};
      migrate = {};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Calcarius_lapponicus'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTh'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Emberiza_calandra'
      climate = {'BSk','Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTh'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Emberiza_citrinella'
      climate = {'Cfb','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTh'};
      embryo  = {'Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Passerculus_sandwichensis'
      climate = {'BSk','Dfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTi','0iTs'};
      embryo  = {'Tnpf','Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Passerella_iliaca'
      climate = {'BSk','Dfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTi','0iTs'};
      embryo  = {'Tnpf','Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Zonotrichia_leucophrys'
      climate = {'BSk','Dfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTi','0iTs'};
      embryo  = {'Tnpf','Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Spizelloides_arborea'
      climate = {'BSk','Dfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTi','0iTs'};
      embryo  = {'Tnpf','Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Spizella_passerina'
      climate = {'BSk','Cfa','Dfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTi','0iTs'};
      embryo  = {'Tnpf','Tnsf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Atlapetes_melanolaemus'
      climate = {'Cwb'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chlorospingus_flavigularis'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Melospiza_melodia'
      climate = {'BSk','Dfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chlorodrepanis_virens'
      climate = {'Am'};
      ecozone = {'TO'};
      habitat = {'0iTf'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biCi','biHn','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acanthis_flammea'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTht','0iThh'};
      embryo  = {'Tnpf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Carduelis_carduelis'
      climate = {'BSk','Cfb','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iThh'};
      embryo  = {'Tnpf'};
      migrate = {'Ml'};
      food    = {'biCi','biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sporophila_beltoni'
      climate = {'Cwb'};
      ecozone = {'TN'};
      habitat = {'0iTg','0iTi'};
      embryo  = {'Tnpf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Geospiza_fortis'
      climate = {'BWh'};
      ecozone = {'TN'};
      habitat = {'0iTg','0iTh'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Geospiza_scandens'
      climate = {'BWh'};
      ecozone = {'TN'};
      habitat = {'0iTg','0iTh'};
      embryo  = {'Tnpf'};
      migrate = {};
      food    = {'biHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Setophaga_striata'
      climate = {'Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTi','0iTs'};
      embryo  = {'Tnpf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Xanthocephalus_xanthocephalus'
      climate = {'B','C','D'};
      ecozone = {'THn'};
      habitat = {'0iTh','0iTi','0iTg'};
      embryo  = {'Tnpf'};
      migrate = {'Ml'};
      food    = {'biCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Molothrus_bonariensis'
      climate = {'A','Cfa','D'};
      ecozone = {'TN'};
      habitat = {'0iTh','0iTi','0iTg'};
      embryo  = {'Tnpo'};
      migrate = {};
      food    = {'biCi','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ornithorhynchus_anatinus'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0xTf','xiFc'};
      embryo  = {'Tnt'};
      migrate = {};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tachyglossus_aculeatus'
      climate = {'Aw','BWh','BSh','Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTa','0iTd','0iTh'};
      embryo  = {'Tbf'};
      migrate = {};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Caluromys_philander'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs','xiCvr','xiCvb'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Didelphis_virginiana'
      climate = {'A','Cfa','Csb','Dfa','Dfb'};
      ecozone = {'THp','TN'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi','xiCv','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Monodelphis_domestica'
      climate = {'Am'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sarcophilus_harrisii'
      climate = {'Cfb'};
      ecozone = {'TAt'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO','xiCvm','xiSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dasyurus_viverrinus'
      climate = {'Cfb'};
      ecozone = {'TAt'};
      habitat = {'0iTf','0iTh','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm','xiSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phascogale_calura'
      climate = {'Csa'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Planigale_tenuirostris'
      climate = {'BS','BWh'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Perameles_nasuta'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi','xiHr','xiHl','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Isoodon_macrourus'
      climate = {'Am','Cfa'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTh','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi','xiHr','xiHl','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phascolarctos_cinereus'
      climate = {'BSh','Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tarsipes_rostratus'
      climate = {'BSk','Csa'};
      ecozone = {'TA'};
      habitat = {'0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lagostrophus_fasciatus'
      climate = {'BSk'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lagorchestes_conspicillatus'
      climate = {'Aw','BSk'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTi','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lagorchestes_hirsutus'
      climate = {'BWh'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTi','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macropus_agilis'
      climate = {'Aw','BSk'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTi','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macropus_antilopinus'
      climate = {'Aw'};
      ecozone = {'TA'};
      habitat = {'0iTi','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macropus_eugenii'
      climate = {'BSh','Csa','Csb'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macropus_fuliginosus'
      climate = {'BSh','Csa','Csb'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macropus_giganteus'
      climate = {'BSh','BSk','Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTs','0iTi','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macropus_parma'
      climate = {'Cfa'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTi','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macropus_rufogriseus'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTf','0iTi','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macropus_rufus'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Onychogalea_fraenata'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTd','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Petrogale_xanthopus'
      climate = {'BWh','BSh'};
      ecozone = {'TA'};
      habitat = {'0iTa','0iTd','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Setonix_brachyurus'
      climate = {'Csb'};
      ecozone = {'TA'};
      habitat = {'0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Wallabia_bicolor'
      climate = {'Aw','Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Choloepus_didactylus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTi','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Myrmecophaga_tridactyla'
      climate = {'A','Cwa','Cwb'};
      ecozone = {'TN'};
      habitat = {'0iTi','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tamandua_mexicana'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dasypus_novemcinctus'
      climate = {'A','BSh','Cwa','Cwb','Cfa'};
      ecozone = {'TN','THn'};
      habitat = {'0iTi','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Dasypus_septemcinctus'
      climate = {'A','BSh','Cwa','Cwb','Cfa'};
      ecozone = {'TN','THn'};
      habitat = {'0iTi','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Orycteropus_afer'
      climate = {'A','BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTh','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macroscelides_proboscideus'
      climate = {'BWh','BWk'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Elephantulus_rufescens'
      climate = {'BWh','BWk'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hemicentetes_semispinosus'
      climate = {'A'};
      ecozone = {'TPam'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCiw'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Loxodonta_africana'
      climate = {'Aw','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Elephas_maximus'
      climate = {'Aw','Cwa','Cwb','Cfa','Cfb'};
      ecozone = {'TPi'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Trichechus_inunguis'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iFr'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Trichechus_manatus'
      climate = {'MA'};
      ecozone = {'MAW'};
      habitat = {'0iFr','0iMc'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dugong_dugon'
      climate = {'MA'};
      ecozone = {'MIN','MPSE'};
      habitat = {'0iMc'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hydrodamalis_gigas'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMc'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiHa'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Procavia_capensis'
      climate = {'B'};
      ecozone = {'TPa'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sorex_araneus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Crocidura_russula'
      climate = {'C'};
      ecozone = {'THp'};
      habitat = {'0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Talpa_europaea'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Talpa_occidentalis'
      climate = {'BSk','Csa','Cfb','Csb'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Erinaceus_europaeus'
      climate = {'BSk','Csa','Cfb','Csb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi','xiHs','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Atelerix_albiventris'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi','xiHs','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eidolon_helvum'
      climate = {'Aw','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rousettus_aegyptiacus'
      climate = {'Aw','BWh','BWk','BSh','BSk'};
      ecozone = {'THp','TPa'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Epomops_buettikoferi'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Micropteropus_pusillus'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs','xiHn','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Megaderma_lyra'
      climate = {'Am','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiCi','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhinolophus_hipposideros'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhinolophus_cornutus'
      climate = {'Cfa','Dfa'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Miniopterus_schreibersii'
      climate = {'BSk','BSh','BWk','Csa'};
      ecozone = {'THp','TPa','TA'};
      habitat = {'0iTh','0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mystacina_tuberculata'
      climate = {'Cfb'};
      ecozone = {'TAz'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Desmodus_rotundus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiTvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Carollia_perspicillata'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs','xiHn','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dermanura_watsoni'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tadarida_brasiliensis'
      climate = {'BSk','Cfa','Cwa','Cwb'};
      ecozone = {'THn','TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {'Ms'};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pipistrellus_pipistrellus'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pipistrellus_subflavus'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hypsugo_savii'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Scotophilus_kuhlii'
      climate = {'A'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Plecotus_auritus'
      climate = {'C','D'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eptesicus_fuscus'
      climate = {'A','B','Cfa','Df'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eptesicus_serotinus'
      climate = {'B','Cfa','Df'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Nyctalus_noctula'
      climate = {'Cfa','Cwc','Df'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Manis_crassicaudata'
      climate = {'Aw','BSh','Cwa'};
      ecozone = {'TPi'};
      habitat = {'0iTf','0iTi','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Manis_pentadactyla'
      climate = {'Cfa','Cfb','Cfc'};
      ecozone = {'TPi'};
      habitat = {'0iTf','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Neofelis_nebulosa'
      climate = {'Af','Am', 'Cfa','Cfb'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Uncia_uncia'
      climate = {'B','D'};
      ecozone = {'THp'};
      habitat = {'0iT'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Panthera_tigris'
      climate = {'Am','Cfa'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm','xiSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Panthera_tigris_tigris'
      climate = {'Am','Cfa'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm','xiSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Panthera_pardus'
      climate = {'A','B'};
      ecozone = {'TPa','TPi'};
      habitat = {'0iT'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Panthera_onca'
      climate = {'Af','Am', 'Cfa'};
      ecozone = {'THn','TN'};
      habitat = {'0iTi','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Panthera_leo'
      climate = {'Am','BS'};
      ecozone = {'TPa'};
      habitat = {'0iTg','0iTs','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm','xiSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pardofelis_marmorata'
      climate = {'Af','Am'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiC'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Caracal_caracal'
      climate = {'BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTg','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm','xiCvb'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Profelis_aurata'
      climate = {'Af'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm','xiCvb'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Leopardus_wiedii'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm','xiCvb'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lynx_lynx'
      climate = {'BWk','Dfc','Dfd'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvb','xiCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lynx_pardinus'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvb','xiCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acinonyx_jubatus'
      climate = {'BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Puma_concolor'
      climate = {'A','B','C','D'};
      ecozone = {'THn','TN'};
      habitat = {'0iTi','0iTs','0iTg','0iTf','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Prionailurus_rubiginosus'
      climate = {'A'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Felis_nigripes'
      climate = {'B'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTg','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiC'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Felis_silvestris'
      climate = {'A','B','C','D'};
      ecozone = {'T'};
      habitat = {'0iT'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiC'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Arctictis_binturong'
      climate = {'A'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Paradoxurus_hermaphroditus'
      climate = {'A','Cwa'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Civettictis_civetta'
      climate = {'A','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Crocuta_crocuta'
      climate = {'Aw','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm','xiSvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hyaena_brunnea'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiSvm','xiHs','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Atilax_paludinosus'
      climate = {'Aw','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Herpestes_javanicus'
      climate = {'Am','Aw','BWh','BSh','BSk','Cwa','Cwb'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Suricata_suricatta'
      climate = {'BSh','BWh'};
      ecozone = {'TPa'};
      habitat = {'0iTd','0iTa','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cryptoprocta_ferox'
      climate = {'Af','Am','Aw','As'};
      ecozone = {'TPam'};
      habitat = {'0iTf','0iTf','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Vulpes_lagopus'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCva','xiCvm','xiSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Vulpes_vulpes'
      climate = {'B','C','D'};
      ecozone = {'TH','TPi'};
      habitat = {'0iTh','0iTf','0iTi','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Vulpes_zerda'
      climate = {'BWh'};
      ecozone = {'TP'};
      habitat = {'0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chrysocyon_brachyurus'
      climate = {'Aw','Cwa','Cwb'};
      ecozone = {'TN'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cerdocyon_thous'
      climate = {'A','Cfa','Cwb'};
      ecozone = {'TN'};
      habitat = {'0iTi','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Canis_lupus'
      climate = {'B','C','D'};
      ecozone = {'TH','TPi'};
      habitat = {'0iTh','0iTf','0iTi','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm','xiSvm','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Nyctereutes_procyonoides'
      climate = {'Cwa','Cwb','Cfa','Dw'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Speothos_venaticus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};  
      
    case 'Ursus_arctos'
      climate = {'BSk','BWk','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Ursus_arctos_middendorffi'
      climate = {'Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ursus_maritimus'
      climate = {'ME'};
      ecozone = {'MN'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {'Ms'};
      food    = {'bxM','xiCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ursus_americanus'
      climate = {'A','B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iT'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Ailuropoda_melanoleuca'
      climate = {'Dwa','Dwb'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ailurus_fulgens'
      climate = {'Cwa','Cwb','Cfa'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mephitis_mephitis'
      climate = {'BSk','Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lutra_lutra'
      climate = {'BSk','Cfa','Cfb','Dfb','Dfc'};
      ecozone = {'THp','TPi'};
      habitat = {'0iFm','0iFl','0iFr'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pteronura_brasiliensis'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iFm','0iFl','0iFr'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Enhydra_lutris'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMc'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Lutrogale_perspicillata'
      climate = {'A'};
      ecozone = {'TPi'};
      habitat = {'0iF'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiC'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mustela_nigripes'
      climate = {'BSk'};
      ecozone = {'THn'};
      habitat = {'0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neovison_vison'
      climate = {'BSk','Cfa','Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iFm','0iFl','0iFr'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gulo_gulo'
      climate = {'Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv','xiSv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Martes_pennanti'
      climate = {'Dfb','Dsb'};
      ecozone = {'THn'};
      habitat = {'0iFm','0iFl','0iFr'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCv','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eira_barbara'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Meles_meles'
      climate = {'BSk','Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiCiw','xiSv','xiHs','xiHn'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Mellivora_capensis'
      climate = {'A','B','C'};
      ecozone = {'TPa','TPi'};
      habitat = {'0iT','0iT'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO','xiS'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Procyon_lotor'
      climate = {'BSk','Cfa','Dfa','Dfb'};
      ecozone = {'TH'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

      
  case 'Potos_flavus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Phoca_vitulina'
      climate = {'MC'};
      ecozone = {'MPN','MAN'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pusa_hispida'
      climate = {'ME'};
      ecozone = {'MN'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {'Mo'};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Halichoerus_grypus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pagophilus_groenlandicus'
      climate = {'MC','ME'};
      ecozone = {'MAN'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {'Mo'};
      food    = {'bxM','xiCvf','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Erignathus_barbatus'
      climate = {'ME'};
      ecozone = {'MN'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {'Mo'};
      food    = {'bxM','xiCvf','xiCim','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cystophora_cristata'
      climate = {'MC','ME'};
      ecozone = {'MAN','MN'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {'Mo'};
      food    = {'bxM','xiCvf','xiCik','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mirounga_leonina'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0iMp'};
      embryo  = {'Tv'};
      migrate = {'Mo'};
      food    = {'bxM','xiCic','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lobodon_carcinophaga'
      climate = {'ME'};
      ecozone = {'MS'};
      habitat = {'0iMp'};
      embryo  = {'Tv'};
      migrate = {'Mo'};
      food    = {'bxM','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Callorhinus_ursinus'
      climate = {'MC','ME'};
      ecozone = {'MPN'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {'Mo'};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Zalophus_californianus'
      climate = {'MB','MC'};
      ecozone = {'MPE'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Arctocephalus_australis'
      climate = {'MC'};
      ecozone = {'MPSE','MASW'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Arctocephalus_tropicalis'
      climate = {'MC'};
      ecozone = {'MIS','MAS'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Arctocephalus_gazella'
      climate = {'MC'};
      ecozone = {'MS'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Arctocephalus_forsteri'
      climate = {'ME'};
      ecozone = {'MIS','MPS'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Arctocephalus_pusillus'
      climate = {'MC'};
      ecozone = {'MIS','MASE'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Otaria_flavescens'
      climate = {'MC'};
      ecozone = {'MPSE','MASW'};
      habitat = {'0iMc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Odobenus_rosmarus_rosmarus'
      climate = {'MC','ME'};
      ecozone = {'MN','MAN'};
      habitat = {'0iMp'};
      embryo  = {'Tv'};
      migrate = {'Mo'};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Odobenus_rosmarus_divergens'
      climate = {'MC','ME'};
      ecozone = {'MN','MPN'};
      habitat = {'0iMp'};
      embryo  = {'Tv'};
      migrate = {'Mo'};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Equus_quagga'
      climate = {'BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTs','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tapirus_terrestris'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tapirus_bairdii'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tapirus_pinchaque'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Acrocodia_indica'
      climate = {'A'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhinoceros_unicornis'
      climate = {'Cwb'};
      ecozone = {'TPi'};
      habitat = {'0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dicerorhinus_sumatrensis'
      climate = {'A'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Diceros_bicornis'
      climate = {'Am','BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTg','oiTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ceratotherium_simum'
      climate = {'Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTg','0iTi','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Camelus_dromedarius'
      climate = {'BWh'};
      ecozone = {'THp','TPa'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Camelus_bactrianus'
      climate = {'BWk','BSk','Dwb','Dwc'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tv'};
      migrate = {'Ms'};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lama_glama_guanicoe'
      climate = {'BWk','Cfa'};
      ecozone = {'TN'};
      habitat = {'0iTs','0iTg','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sus_scrofa'
      climate = {'Aw','Cfa','Cfb','Dfa','Dfb','Dwa','Dwb'};
      ecozone = {'THp','TPi'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phacochoerus_aethiopicus'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTd','0iTs','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pecari_tajacu'
      climate = {'A','Cfa','Cfb','Cwa'};
      ecozone = {'TN'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Monodon_monoceros'
      climate = {'ME'};
      ecozone = {'MN','MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ms'};
      food    = {'bxM','xiCvf','xiCic','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Delphinapterus_leucas'
      climate = {'ME'};
      ecozone = {'MN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ms'};
      food    = {'bxM','xiCvf','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phocoena_phocoena'
      climate = {'ME','MC'};
      ecozone = {'MPSW','MPSE'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phocoenoides_dalli'
      climate = {'ME','MC'};
      ecozone = {'MPSW','MPSE'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neophocaena_phocaenoides'
      climate = {'MA','MB'};
      ecozone = {'MPW','MIN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Steno_bredanensis'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sotalia_fluviatilis'
      climate = {'MA','A'};
      ecozone = {'MAW','TN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sousa_chinensis'
      climate = {'MA'};
      ecozone = {'MPW','MI'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Stenella_coeruleoalba'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Stenella_attenuata'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Stenella_longirostris'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Stenella_frontalis'
      climate = {'MA','MB'};
      ecozone = {'MA'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Delphinus_delphis'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tursiops_truncatus'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lagenodelphis_hosei'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lissodelphis_borealis'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cephalorhynchus_hectori'
      climate = {'MC'};
      ecozone = {'MPSE'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lagenorhynchus_obscurus'
      climate = {'MC'};
      ecozone = {'MPS'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};


    case 'Lagenorhynchus_albirostris'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Globicephala_macrorhynchus'
      climate = {'MA','MB'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCvm','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pseudorca_crassidens'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCvm','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Orcinus_orca'
      climate = {'MA','MB','MC','ME'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ms'};
      food    = {'bxM','xiCvf','xiCvm','xiCvb','xiSvm','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Kogia_breviceps'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCic','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Kogia_sima'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCic','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Physeter_macrocephalus'
      climate = {'MA','MB','MC','ME'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pontoporia_blainvillei'
      climate = {'MB','MC'};
      ecozone = {'MASW'};
      habitat = {'0iMm'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hyperoodon_ampullatus'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Berardius_bairdii'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {};
      food    = {'bxM','xiCvf','xiCic'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Balaenoptera_acutorostrata'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCvf','xiCic','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Balaenoptera_musculus'
      climate = {'MA','MB','MC','ME'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCvf','xiCic','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Balaenoptera_physalus'
      climate = {'MA','MB','MC','ME'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCvf','xiCic','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Balaenoptera_borealis'
      climate = {'MA','MB','MC'};
      ecozone = {'MC'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCvf','xiCic','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eschrichtius_robustus'
      climate = {'MC'};
      ecozone = {'MPN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Eubalaena_glacialis'
      climate = {'MC'};
      ecozone = {'MAN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCik'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Balaena_mysticetus'
      climate = {'ME'};
      ecozone = {'MN'};
      habitat = {'0iMp'};
      embryo  = {'Mv'};
      migrate = {'Ml'};
      food    = {'bxM','xiCik','xiCvf'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hippopotamus_amphibius'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iFr','0iFl'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hexaprotodon_liberiensis'
      climate = {'Am'};
      ecozone = {'TPa'};
      habitat = {'0iFr','0iFl','0iTf'};
      embryo  = {'Fv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Antilocapra_americana'
      climate = {'BSk'};
      ecozone = {'THn'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Giraffa_camelopardalis'
      climate = {'A','B','C'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Okapia_johnstoni'
      climate = {'A'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Muntiacus_reevesi'
      climate = {'Cwa','Cfa'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cervus_canadensis'
      climate = {'B','C','D'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {'Ms'};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cervus_elaphus'
      climate = {'BS','Cfa','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Capreolus_capreolus'
      climate = {'BSk','Cfb','Dfb','Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rangifer_tarandus'
      climate = {'Dfc','E'};
      ecozone = {'TH'};
      habitat = {'0iTf','0iTht'};
      embryo  = {'Tv'};
      migrate = {'Ms'};
      food    = {'bxM','xiHl','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Odocoileus_virginianus'
      climate = {'A','B','C'};
      ecozone = {'THn','TN'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Alces_alces'
      climate = {'Dfc'};
      ecozone = {'TH'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hydropotes_inermis'
      climate = {'Cwa','Cfa','Dfa'};
      ecozone = {'THp'};
      habitat = {'0iFm','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Taurotragus_oryx'
      climate = {'BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tragelaphus_strepsiceros'
      climate = {'BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tragelaphus_imberbis'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bos_primigenius_Angus'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bos_primigenius_Holstein'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bos_primigenius_Brahman'
      climate = {'B','C','D'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bison_bonasus'
      climate = {'Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Bison_bison'
      climate = {'BS','Df'};
      ecozone = {'THn'};
      habitat = {'0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Syncerus_caffer'
      climate = {'Af','Am','BWk','BSk','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gazella_subgutturosa'
      climate = {'BSk','BWk'};
      ecozone = {'THp'};
      habitat = {'0iTi','0iTs','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Antidorcas_marsupialis'
      climate = {'BWh','BWk'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Saiga_tatarica'
      climate = {'BWk','BSk'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Madoqua_kirkii'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cephalophus_dorsalis'
      climate = {'Af', 'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cephalophus_niger'
      climate = {'Af', 'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cephalophus_rufilatus'
      climate = {'Af', 'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cephalophus_sylvicultor'
      climate = {'Am', 'Af'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cephalophus_zebra'
      climate = {'Af', 'Am'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sylvicapra_grimmia'
      climate = {'A', 'BWh','BWk','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTh','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Kobus_kob'
      climate = {'BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Redunca_fulvorufula'
      climate = {'Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aepyceros_melampus'
      climate = {'Aw','BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ovibos_moschatus'
      climate = {'ET'};
      ecozone = {'TH'};
      habitat = {'0iTd','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Capra_ibex'
      climate = {'ET','Cfa'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ovis_canadensis'
      climate = {'BSk','BWk','BWh'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

   case 'Ovis_ammon'
      climate = {'BSk','BWk','BWh'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iTh','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Capricornis_crispus'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iTht','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Oreamnos_americanus'
      climate = {'Dsc','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rupicapra_rupicapra'
      climate = {'ET','Cfa'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hippotragus_niger'
      climate = {'Aw','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Oryx_leucoryx'
      climate = {'BWh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTh','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Addax_nasomaculatus'
      climate = {'BWh'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Connochaetes_gnou'
      climate = {'Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTa'};
      embryo  = {'Tv'};
      migrate = {'Ms'};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Connochaetes_taurinus'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTs','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {'Ms'};
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pedetes_capensis'
      climate = {'BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Heterocephalus_glaber'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTa','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cryptomys_mechowi'
      climate = {'Aw','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTh','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cryptomys_hottentotus'
      climate = {'BWk','BSk','Cwa'};
      ecozone = {'TPa'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cryptomys_damarensis'
      climate = {'BWk','BSk','Cwa'};
      ecozone = {'TPa'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Georychus_capensis'
      climate = {'BWk','BSk'};
      ecozone = {'TPa'};
      habitat = {'0iTd','0iTa','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bathyergus_suillus'
      climate = {'BWk','BSk'};
      ecozone = {'TPa'};
      habitat = {'0iTd','0iTa','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Bathyergus_janetta'
      climate = {'BWk','BSk'};
      ecozone = {'TPa'};
      habitat = {'0iTd','0iTa','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hystrix_africaeaustralis'
      climate = {'BWk','BWh','BSk','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTi','0iTh','0iTg','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHr','xiHw'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Atherurus_africanus'
      climate = {'Af','Am'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Geocapromys_ingrahami'
      climate = {'Aw'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cavia_porcellus'
      climate = {'BWk'};
      ecozone = {'TN'};
      habitat = {'0iTh','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cavia_tschudii'
      climate = {'BWk'};
      ecozone = {'TN'};
      habitat = {'0iTh','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Galea_musteloides'
      climate = {'BWk','BSk','Cwa','Cwb'};
      ecozone = {'TN'};
      habitat = {'0iTh','0iTa','0iTg','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hydrochoerus_hydrochaeris'
      climate = {'A','Cfa','Cwa','Cwb'};
      ecozone = {'TN'};
      habitat = {'0iFr','0iFm','0iFl','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dolichotis_patagonum'
      climate = {'C','B'};
      ecozone = {'TN'};
      habitat = {'0iTg','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    case 'Chinchilla_lanigera'
      climate = {'BWk','Csb'};
      ecozone = {'TN'};
      habitat = {'0iTh','0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lagostomus_maximus'
      climate = {'Aw','Cfa'};
      ecozone = {'TN'};
      habitat = {'0iTh','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Myoprocta_acouchy'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Erethizon_dorsatus'
      climate = {'BSk','Dsb','Dfa','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Myocastor_coypus'
      climate = {'Aw','Cwa','Cfa'};
      ecozone = {'TN'};
      habitat = {'0iFm','0iFr'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Octodon_degus'
      climate = {'Csb'};
      ecozone = {'TN'};
      habitat = {'0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aplodontia_rufa'
      climate = {'Csb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Glis_glis'
      climate = {'Cfb','Csa','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTf','0iThh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sciurus_carolinensis'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sciurus_aberti'
      climate = {'BWk','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tamiasciurus_hudsonicus'
      climate = {'BSk','Df'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Glaucomys_volans'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Glaucomys_sabrinus'
      climate = {'Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tamias_striatus'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiHs','xiCi','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tamias_amoenus'
      climate = {'BSk','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiHs','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tamias_townsendii'
      climate = {'BSk','Cs','Dsb'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiHs','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ammospermophilus_harrisii'
      climate = {'BSh','BWh'};
      ecozone = {'THn'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Callospermophilus_lateralis'
      climate = {'BSh','BWh'};
      ecozone = {'THn'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiHs','xiSv','xiCvm'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Callospermophilus_saturatus'
      climate = {'Dsa'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Otospermophilus_variegatus'
      climate = {'B','Cs','Dsb'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiH','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Xerospermophilus_mohavensis'
      climate = {'BWh'};
      ecozone = {'THn'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiH','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Xerospermophilus_tereticaudus'
      climate = {'BW'};
      ecozone = {'THn'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {'TT'}; % in torpor, but no hibernation
      food    = {'bxM','xiH','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Marmota_flaviventris'
      climate = {'BSk'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tv'};
      migrate = {'TT'}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Marmota_monax'
      climate = {'Dfa','Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tv'};
      migrate = {'TT'}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ictidomys_tridecemlineatus'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {'TT'}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cynomys_ludovicianus'
      climate = {'Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {'TT'}; % no full hibernation
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Urocitellus_richardsonii'
      climate = {'Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {'TT'}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Urocitellus_beldingi'
      climate = {'BSk'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {'TT'}; 
      food    = {'bxM','xiH','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Castor_fiber'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iFl','0iFr'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHw'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Geomys_bursarius'
      climate = {'BSk','Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd','0iTs','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dipodomys_merriami'
      climate = {'BWh','BWk','BSh','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dipodomys_deserti'
      climate = {'BWh','BWk','BSh','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dipodomys_heermanni'
      climate = {'BWh','BWk','BSk','Csa'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dipodomys_nitratoides'
      climate = {'Csa'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dipodomys_spectabilis'
      climate = {'BWh','BWk','BSh','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dipodomys_stephensi'
      climate = {'BWh','BWk','Csa'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Perognathus_longimembris'
      climate = {'BWh','BWk','BSh','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chaetodipus_formosus'
      climate = {'BWh','BWk','BSh','BSk'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Jaculus_jaculus'
      climate = {'BWh'};
      ecozone = {'THp','TPa'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Zapus_hudsonius'
      climate = {'Dfa','Dfb','Dfc','Dsb'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTi'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiHs','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Napaeozapus_insignis'
      climate = {'Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iFm'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiHs','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Arvicola_amphibius'
      climate = {'Cfb','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iFr','0iFm','0iFp'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_richardsoni'
      climate = {'Csb','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_agrestis'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_arvalis'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_cabrerae'
      climate = {'BSk','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_guentheri'
      climate = {'BSk','Csa','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iTht','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_subterraneus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_pennsylvanicus'
      climate = {'Cfb','Dfb','Dfc','Dsb'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_oeconomus'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_pinetorum'
      climate = {'BSk','Csb','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microtus_ochrogaster'
      climate = {'BSk','Cfa','Dfa'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Alticola_strelzowi'
      climate = {'BWk','BSk'};
      ecozone = {'THp'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ondatra_zibethicus'
      climate = {'B','C','D'};
      ecozone = {'TH'};
      habitat = {'0iFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dicrostonyx_groenlandicus'
      climate = {'ET'};
      ecozone = {'THn'};
      habitat = {'0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Dicrostonyx_torquatus'
      climate = {'ET'};
      ecozone = {'THp'};
      habitat = {'0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lagurus_lagurus'
      climate = {'Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTa','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lemmus_trimucronatus'
      climate = {'Dfc','ET'};
      ecozone = {'TH'};
      habitat = {'0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lemmus_lemmus'
      climate = {'Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTht'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Myopus_schisticolor'
      climate = {'Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Synaptomys_cooperi'
      climate = {'Dfc','Dwc'};
      ecozone = {'THp'};
      habitat = {'0iThh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phenacomys_intermedius'
      climate = {'Dfb','Dfc','Dsb'};
      ecozone = {'THn'};
      habitat = {'0iThh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Phenacomys_ungava'
      climate = {'Dfb','Dfc'};
      ecozone = {'THn'};
      habitat = {'0iThh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cricetus_cricetus'
      climate = {'BSk','BWk','Dfa','Dfb'};
      ecozone = {'THp'};
      habitat = {'0iTa','0iTs','0iTg'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiH','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Baiomys_taylori'
      climate = {'B'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {'TT'};
      food    = {'bxM','xiH','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neotoma_floridana'
      climate = {'BSk','BWk','Cfa'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTh','0iFm','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neotoma_albigula'
      climate = {'B'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neotoma_micropus'
      climate = {'B'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neotoma_lepida'
      climate = {'B'};
      ecozone = {'THn'};
      habitat = {'0iTa','0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Neotoma_cinerea'
      climate = {'BSk','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTf','0iTd','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiF','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Peromyscus_polionotus'
      climate = {'Cfa'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Peromyscus_leucopus'
      climate = {'BSk','Cfa','Dfa','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTh','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Peromyscus_californicus'
      climate = {'BSh','BWh'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTa','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Peromyscus_truei'
      climate = {'BWh'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTa','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Peromyscus_crinitus'
      climate = {'B'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTa','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Onychomys_torridus'
      climate = {'B'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTa','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Onychomys_leucogaster'
      climate = {'BS'};
      ecozone = {'THn'};
      habitat = {'0iTd','0iTa','0iTs'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi','xiCvm','xiCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sigmodon_hispidus'
      climate = {'Aw','Cfa'};
      ecozone = {'THn','TN'};
      habitat = {'0iTi','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Otonyctomys_hatti'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Nyctomys_sumichrasti'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tylomys_nudicaudus'
      climate = {'Aw'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Acomys_cahirinus'
      climate = {'BWh'};
      ecozone = {'THp'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Meriones_unguiculatus'
      climate = {'BSk'};
      ecozone = {'THp'};
      habitat = {'0iTs','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Meriones_libycus'
      climate = {'BW','BSk'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iTa','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Meriones_shawi'
      climate = {'BWh'};
      ecozone = {'THp'};
      habitat = {'0iTd','0iTa','0iTh'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Psammomys_obesus'
      climate = {'BWh'};
      ecozone = {'THp'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gerbillus_pyramidum'
      climate = {'BWh','Csa'};
      ecozone = {'THp'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Micaelamys_namaquensis'
      climate = {'BWh','BSh','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTd'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mus_musculus'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TP','TA','TN'};
      habitat = {'0iTa','0iTs','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Praomys_tullbergi'
      climate = {'A'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rattus_norvegicus'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TP','TA','TN'};
      habitat = {'0iTa','0iTs','0iTg','0iFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rattus_norvegicus_Wistar'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TP','TA','TN'};
      habitat = {'0iTa','0iTs','0iTg','0iFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rattus_lutreolus'
      climate = {'Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiCii','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rattus_fuscipes'
      climate = {'BSk','Cs','Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiCii','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rattus_exulans'
      climate = {'A'};
      ecozone = {'TPi','TA'};
      habitat = {'0iFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH','xiCii','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Apodemus_sylvaticus'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs','xiCi','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Apodemus_speciosus'
      climate = {'Cfa','Dfa'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Apodemus_agrarius'
      climate = {'Dfb','Dw'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTg','0iFm'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Apodemus_semotus'
      climate = {'Cfa'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Apodemus_flavicollis'
      climate = {'Cfb','Dfb','Dfc'};
      ecozone = {'THp'};
      habitat = {'0iTh','0iTf','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiHl','xiHs','xiCi','xiF'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chiropodomys_gliroides'
      climate = {'Aw','Cwa','Cwb','Cfa'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hydromys_chrysogaster'
      climate = {'BS','Cs','Cfa','Cfb'};
      ecozone = {'TA'};
      habitat = {'0iFm','0iFr','0iFc'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiCi','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Notomys_alexis'
      climate = {'BWh'};
      ecozone = {'TA'};
      habitat = {'0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Arvicanthis_niloticus'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTd','0iTi','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lemniscomys_striatus'
      climate = {'A'};
      ecozone = {'TPa'};
      habitat = {'0iTf','0iTg'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Rhabdomys_pumilio'
      climate = {'B','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTi','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pseudomys_australis'
      climate = {'BWh'};
      ecozone = {'TA'};
      habitat = {'0iTd','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Otomys_irroratus'
      climate = {'B','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTg','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Parotomys_brantsii'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTg','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aethomys_hindei'
      climate = {'Aw','Am'};
      ecozone = {'TPa'};
      habitat = {'0iTg','0iTf','0iTi'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mystromys_albicaudatus'
      climate = {'BWk','BSk','Cwa','Cwb'};
      ecozone = {'TPa'};
      habitat = {'0iTh','0iTa'};
      embryo  = {'Tv'};
      migrate = {};
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Oryctolagus_cuniculus'
      climate = {'BSk','Csa','Cfb','Dfb'};
      ecozone = {'THp','TA'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Oryctolagus_cuniculus_NZW'
      climate = {'BSk','Csa','Cfb','Dfb'};
      ecozone = {'THp','TA'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lepus_europaeus'
      climate = {'Cfa','Cfb','Dfb'};
      ecozone = {'THp','TA','TN'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lepus_timidus'
      climate = {'Dfb','Dfc','ET'};
      ecozone = {'THp'};
      habitat = {'0iTht'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lepus_townsendii'
      climate = {'BSk','Dfb'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lepus_capensis'
      climate = {'BSh','BWh'};
      ecozone = {'THp','TPa'};
      habitat = {'0iTg','0iTs'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Sylvilagus_floridanus'
      climate = {'Aw','Cfa','Dfa','Dfb'};
      ecozone = {'THn','TN'};
      habitat = {'0iTg','0iTs','0iTh'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ochotona_princeps'
      climate = {'BSk'};
      ecozone = {'THn'};
      habitat = {'0iTg','0iTh'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tupaia_glis'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHl','xiHs','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tupaia_belangeri'
      climate = {'Af','Cwa','Cfa'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHl','xiHs','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Galeopterus_variegatus'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHl','xiHs','xiHn','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Daubentonia_madagascariensis'
      climate = {'A'};
      ecozone = {'TPam'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Propithecus_diadema'
      climate = {'Aw','Cwa','Cwb'};
      ecozone = {'TPam'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Propithecus_tattersalli'
      climate = {'Af'};
      ecozone = {'TPam'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Microcebus_murinus'
      climate = {'Aw','BSh'};
      ecozone = {'TPam'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lepilemur_mustelinus'
      climate = {'Cwa','Cwb'};
      ecozone = {'TPam'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hapalemur_alaotrensis'
      climate = {'Am'};
      ecozone = {'TPam'};
      habitat = {'0iTg'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Varecia_variegata'
      climate = {'Am'};
      ecozone = {'TPam'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Nycticebus_coucang'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH','xiCim','xiCvbe'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Nycticebus_pygmaeus'
      climate = {'Am','Aw'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH','xiCim','xiCvbe'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Perodicticus_potto'
      climate = {'Af','Am'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Loris_tardigradus'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Galago_senegalensis'
      climate = {'Aw','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Tarsius_tarsier'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiCii','xiCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Carlito_syrichta'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiCii','xiCvr'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Callithrix_pygmaea'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHs','xiCii','xiCvr','xiCvbe'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Callithrix_jacchus'
      climate = {'Af','BSh'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHe','xiCii','xiCvbe'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Leontopithecus_rosalia'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHn','xiHs','xiCii','xiCvbe'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Aotus_trivirgatus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH','xiCii','xiCvbe'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pithecia_pithecia'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH','xiCii','xiCvm','xiCvb'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pithecia_monachus'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH','xiCii','xiCvm','xiCvb'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Cebus_capucinus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH','xiCi','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Saimiri_sciureus'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHs','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Ateles_geoffroyi'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
   case 'Ateles_paniscus'
      climate = {'A'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Alouatta_palliata'
      climate = {'Af','Am'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Lagothrix_lagothricha'
      climate = {'Af'};
      ecozone = {'TN'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHl','xiHs'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Chlorocebus_aethiops'
      climate = {'Am','Cs','Cw'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Mandrillus_sphinx'
      climate = {'Am','Af'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHs','xiCi','xiCv'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Papio_hamadryas'
      climate = {'BWh','BSh'};
      ecozone = {'TPa'};
      habitat = {'0iTa','0iTd','0iTi'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Nasalis_larvatus'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHl'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macaca_fascicularis'
      climate = {'Af','Am'};
      ecozone = {'TPi'};
      habitat = {'0iTf','0iTg','0iTi'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macaca_mulatta'
      climate = {'Am','BSh','Cwa','Cfa'};
      ecozone = {'TPi'};
      habitat = {'0iTf','0iTg','0iTa','0iTi'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Macaca_fuscata'
      climate = {'Cfa','Dfa'};
      ecozone = {'THp'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Hylobates_lar'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHs','xiHl','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Symphalangus_syndactylus'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHs','xiHl','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pongo_pygmaeus'
      climate = {'Af'};
      ecozone = {'TPi'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiHs','xiHl','xiHn','xiCii'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Gorilla_gorilla'
      climate = {'Am','Aw'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiH','xiCi'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Pan_troglodytes'
      climate = {'Am','Aw'};
      ecozone = {'TPa'};
      habitat = {'0iTf'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};

    case 'Homo_sapiens'
      climate = {'A','B','C','D'};
      ecozone = {'TH','TN','TP','TA'};
      habitat = {'0iT'};
      embryo  = {'Tv'};
      migrate = {}; 
      food    = {'bxM','xiO'};
      gender  = {'Dg'};
      reprod  = {'O'};
      
    otherwise 
      climate = {};
      ecozone = {};
      habitat = {};
      embryo  = {};
      migrate = {};
      food    = {};
      gender  = {};
      reprod  = {};
  end

  if isempty(climate) && isempty(ecozone) && isempty(habitat) &&  isempty(migrate) && isempty(food) && isempty(gender) && isempty(reprod)
    fprintf (['Warning from get_eco: all ecological specifications of ', taxon, ' are empty\n'])
  end
