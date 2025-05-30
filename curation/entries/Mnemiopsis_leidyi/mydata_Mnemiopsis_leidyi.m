function [data, auxData, metaData, txtData, weights] = mydata_Mnemiopsis_leidyi

%% set metaData
metaData.phylum     = 'Ctenophora'; 
metaData.class      = 'Tentaculata'; 
metaData.order      = 'Lobata'; 
metaData.family     = 'Bolinopsidae';
metaData.species    = 'Mnemiopsis_leidyi'; 
metaData.species_en = 'Sea walnut'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'WC0'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'; 't-N'; 'L-Ww'; 'L-WC'; 'L-V'; 'L-R'; 'Ww-R'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'; 'Vania Freitas'; 'Lodewijk van Walraven'; 'Cornelia Jaspers'};    
metaData.date_subm = [2012 10 28];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'};   

metaData.author_mod_1   = {'Starrlight Augustine'};        
metaData.date_mod_1 = [2014 05 06];                           
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};                 
metaData.address_mod_1  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'}; 

metaData.author_mod_2   = {'Bas Kooijman'; 'Starrlight Augustine'};        
metaData.date_mod_2 = [2016 03 04];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 16]; 

%% set data
% zero-variate data

data.ab = 1;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'JaspHara2013';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 13;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BakeReev1974';
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*30.5;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'issg';   
  temp.am = C2K(26);    units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guessed from: "The life span of egg producing individuals may be many months"';
  
data.Lb  = 0.04;      units.Lb  = 'cm';  label.Lb  = 'oral-aboral length at birth'; bibkey.Lb  = 'Mart1987';
data.Lj  = 1;   units.Lj  = 'cm';  label.Lj  = 'oral-aboral length at metam';    bibkey.Lj  = 'RapoNova2005';
  comment.Lj = 'end of Cydippid larvae stage';
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'ReevSyms1989';
data.Li  = 6;   units.Li  = 'cm';  label.Li  = 'ultimate oral-aboral length';    bibkey.Li  = 'WalrLang2013';

data.Wc0 = 0.22; units.Wc0 = 'mug'; label.Wc0 = 'initial carbon weight of egg';bibkey.Wc0 = 'JaspCost2014';
data.Wwi = 50;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'Jasp2012','WalrLang2013'};

data.R78  = 11232; units.R78  = '#/d'; label.R78  = 'reprod rate at 78 mm total length';   bibkey.R78  = 'JaspCost2014';   
  temp.R78 = C2K(16.5); units.temp.R78 = 'K'; label.temp.R78 = 'temperature';
 comment.R78 = 'Northern Europe August/Sep 2010';
 
% uni-variate data

% length-weight (raw data from the study)
data.LWw = [... L, mm Wet mass, g  ||| OA length in petri dish mm	weight pre-fix
5	0.177; 5	0.156; 6	0.18; 7	0.426; 7	0.405; 7	0.585; 7	0.245; 7	0.483; 8	0.588; 8	0.553; 8	0.38;9	0.769;
9	0.49; 10	0.985; 11	0.776; 12	1.84; 12	1.25; 13	2.1; 14	2.52; 14	2.21; 15	3.89; 15	3.5; 15	2.63; 15	3.14;
15	3.91; 15	3.78; 15	4.84; 15	1.717; 16	4.1;  16	2.56; 16	3.99; 16	2.95;16	3.12; 16	2.97; 16	2.13; 16	4.19; 16	6.15;
17	3.15; 18	3.84; 18	6;    18	8.63; 18	5.81; 18	4.85; 18	6.55; 18	4.69; 19	2.82; 19	8.52; 19	6.72;
20	6.82; 20	7.08;     20	5.55; 20	6.98; 21	2.81; 21	8.4;  21	7.39; 21	9.44; 21	7.06; 21	6.07; 21	5.98;
22	6.78; 22	10.05;    22	7.22; 22	5.43; 22	7.11; 22	10.94;    23	10.2;
23	9.53; 23	6.81; 23	6.62; 23	6.76; 23	5.63; 24	8.31; 24	10.48;    24	7.38;  24	6.36; 25	11.43;    25	9.74;  26	8.33;
26	10.91;    26	7.43;  26	9.236;    27	10.38;    27	10.14; 27	7.143;     27	10.654;28	8.857; 29	10.327;  30	11.13;    32	11.993;
35	13.078;  36	15.506;   40	25.15;    40	22.59;    42	32.28;44	29.9;44	29.48;45	33.32;47	33.56;49	27.77];
units.LWw   = {'mm', 'g'};  label.LWw = {'oral-aboral length', 'wet weight'};  
bibkey.LWw = 'WalrLang2013';
comment.LWw = 'OA length in petri dish,	weight pre-fix';

% length-volume
data.LV =  [ ... % oral-aboral length (mm)	displacement volume (mL)
28	9;19.6	4.5;23.5	10;14.8	2;22.5	6;21	6;14.6	1.5;12.8	1.4;18.9	3.8;11.3	1;54	45;56	47;51	45;
28	10;44	23.8;53	51;24.2	8;36.5	20;30.4	14;34.5	18;24	6;29	9;32	12;25	6.3;34	12.5;18	3.8;17	2.7;
25	9;21	5;20	4.5;17.3	3;28.5	8.5;19	3.2;37	24;47	30;44.7	33;48	34;57.5	41;46	28.2;40	22;26.5	8.5;
30.5	11;10	1.1;14.6	1.5;13.8	1.1;17.5	4;19.7	4;32	18;44.5	33;42.4	26;35.7	19.5;33	19;45.3	25.5;
40.7	24;16.3	3;25.3	10;45.4	20;13.4	1.8;44.5	27;46	27;15.7	1.4;7.9	0.2;12	1.00;12	1.00;16	1.00;9	0.50;
10	0.60;12	1.00;9	0.60;10	0.60;19.5	1.80;13	1.00;6.5	0.20;10	0.80;8	0.25;9.5	1.60;4.9	0.05;10	0.55;
14	1.00;7	0.40;11	0.75;7	0.30;8.2	0.40;9	0.45;8	0.5;6	0.1;6	0.3;7	0.4;11	0.8;11.25	1;11	0.75;9	0.7;
11	1;12.5	1;11	0.6;5.5	0.1;8.8	0.5;6.5	0.3;9	0.5;6	0.1;6	0.2;10	0.4;9	0.6;13	1.1;15	1;14	1.3;9	0.7;6	0.2;
14.5	1.75;17	2.1;16	2.25;15	1.6;14.5	2;13	1.2;7.2	0.2;8	0.4;5.5	0.1;6.5	0.2;16	2;19.5	2.2;14	1;14.5	0.9;13	1.4;
12.5	1.4;11	0.75;8	0.35;7	0.2;12	0.8;19	2.1;13	1;14.5	1.3;13	1.1;12.5	1.5;16.5	1.5;10	0.8;10.5	0.7;
8	0.55;8	0.4;9	0.6;9	0.8;12.5	1;9.5	0.55;5.5	0.2;15	1.9;16	2;10.5	0.6;8	0.4;8	0.4;16	1.9;17	2;13	1.5;
11	1;12.5	1;7	0.2;9	0.3;9.5	0.5;12	0.6;8	0.4;14	1;11.5	1;17.5	2;13.5	1;6	0.2;7.5	0.4;9.5	0.6;5.4	0.1;8.5	0.5;8.5	0.4 ];
units.LV   = {'mm', 'mL'};  label.LV = {'oral-aboral length', 'displacement volume'};  
bibkey.LV = 'Jasp2012';
comment.LV = 'Kristineberg wild + lab 2010/2011 (n=168), sizes from calibrated pictures';

% length-reprod rate
data.LR = [ ... size (oral aboral, mm) from pictures	eggs (ind-1 24h-1)
33  	4435;25.6	1350;31.5	2671;19.5	541;28  	2323;27.4	1052;16.0	0;17.0	177;27.3	1020;
16.5	47;33.4 	2309;40.1	3626;32   	548;34.4	3489;37.2	1440;17.5	65;21.8	171;19.4	371;
14.7	11;33.1 	920;39  	1702;49.6	1816;32.6	1674;40.1	4502;21.4	318;20.5	123;31.5	330;
40.2	2358;20.6	178;23.5	463;18.5	118;38.4	2914;22.8	294;27.8	1373;26.5	1182;
34.2	1231;27 	563;45	3942;20.7	253;22.7	76;28.5	1426;10.3	3;16.8	2;18.1	238;13.2	3;22	121;
14.3	16;23.6 	256;17.9	23;54	11232;56	8812;51	6970;28	193;44	2616;53	8715;24.2	231;36.5	1576;
30.4	1449;34.5	2772;24	119;29	367;32	416;25	295;34	800;18	0;17	5;25	762;21	21;20	3;17.3	64;
28.5	820;19	5;37  	3039;47  	3683;46  	2891;44.7	4624;48  	5133;57.5	6432;46  	3358;40  	1982;
26.5	35;30.5	823;10  	0;14.6	0;13.8	0;17.5	31;19.7	5;33  	914;45.3	3118;40.7	4339;16.3	5;25.3	478;
45.4	3009;13.4	2;44.5	2606;15.7	2;7.9  	0]; 
units.LR   = {'mm', '#/d'};  label.LR = {'oral-aboral length', 'reproduction rate'};  
temp.LR    = C2K(16.5);  units.temp.LR = 'K'; label.temp.LR = 'temperature';
bibkey.LR = 'Jasp2012';
comment.LR = 'Egg production rates of wild caught Mnemiopsis leidyi in Skagerrak, Gullmar Fjord, Sweden, between 29 Aug. and 10 Sep. 2010 (n=97 including six zeroobservations and a total of 148,816 eggs counted). Salinity was constant at 22.5 and in situ temperatures were c. 16.5 C.';

% wet weight-reprod rate
data.WwR = [...	Wet mass, g	reproduction rate, # eggs/d	
	1.3  	75.94	;	1.7	     78.34	;	1.86	124.74	;	1.97	374.99	;	2.85	1061.1	;	3.86	1180.7	;
	4.73	732.09	;	5.38	1394.14; 	6.88	2129.39	;	7.99	1387.2	;	9.21	5002.77	;	10.67	6736.28	;
	10.81	1676.58	;	11.48	3201.11	;	11.95	7220.6	;	19.79	6496.48	;	20.92	3734.74	;
	26.69	14231.1	];
units.WwR   = {'g', '#/d'};  label.WwR = {'wet weight', 'reproduction rate'};  
temp.WwR    = C2K(18);  units.temp.WwR = 'K'; label.temp.WwR = 'temperature';
bibkey.WwR = 'Krem1976';
comment.WwR = 'these are the higher values of all the value presented in the appendix of Krem1974; from field caught animals';

% length-reprod rate, 
data.LR2 = [ ... Length (mm),	# offspring after 24H
28.9	709.6805296; 37.1	1548.390724; 37.7	838.7134409; 41.9	516.1331235; 46.4	161.2947574;
49     	0.004620089; 49.4	129.0368762; 51   	0.004735892; 51.6	161.2950672; 55.8	193.553356;
57.1	32.26313473; 66.2	0.005514832; 67.9	0.005585692; 67.9	258.0700321; 44.8	870.9719643;
45.8	1548.391255; 47.2	2580.649163; 47.5	1967.746094; 49.4	1677.423675; 50.7	967.7464719;
52   	838.7143089; 55.9	677.42422; 54.9	    1129.036973; 53.9	1580.649722; 54.6	1741.940034; 60.1	645.1663648;
61.4	870.9728171; 60.1	1032.263041; 59.1	1548.391893; 63.4	1193.553455; 61.8	1967.74671;
64	    2096.779006; 61.8	2419.359467; 67.9	1129.037519; 73.1	1387.102127; 81.8	967.7477054;
82.2	548.3930316; 51.4	3806.455426; 56	    3774.197513; 76.1	4129.036485; 82.3	4064.520477; 76.8	4870.971566;
59.6	5354.842045; 61.9	6032.261049; 65.5	6483.873699; 67.8	6870.970225; 72.9	6612.905912; 74.9	6419.357668;
65.5	7483.873005; 67.8	7677.421254; 76.5	7322.582831; 79.1	7516.131076; 70.1	8806.452623; 77.6	8677.420474;
73.7	9935.483939; 75.6	9870.967864; 84.7	9935.48394];
units.LR2   = {'mm', '#/d'};  label.LR2 = {'total length', 'reproduction rate'};  
temp.LR2    = C2K(26);  units.temp.LR2 = 'K'; label.temp.LR2 = 'temperature';
bibkey.LR2 = 'BakeReev1974';
comment.LR2 = 'Egg production in field captured animals who were left overnight in total number of offspring after 24H at non specified temperature.  The length measurement is also not specified';

% Growth and reproduction of 6 individual ctenophores
tLN = [... %	ind 1		ind 2		ind 3		ind 4		ind 5		ind 6	
%                    1 	2   	3	4	5	6	7	8	9	10	11	12	13
%a. dph	L. mm	#/d	L. mm	#/d	L. mm	#/d	L. mm	#/d	L. mm	#/d	L. mm	#/d
6	4.64	0   	5.44	0	3.68	0	4.48	0	3.84	0	4.48	0; 9	14.4	0   	12	0	12.5	0	13.4	0	12	0	12.3	0;
12	28	0	23   	0	26	0	27	0	31	0	31	0;13	32	57	29  	77	33	58	31	14	34	7	34	147;
14	39	0	34.5	76	39	0	38	0	40	0	38	0;15	42	0	39  	44	45	0	43	0	45	0	44	0;
16	46.5	188 	40	0	53	0	47	0	46	0	46	0;17	50      	935 	42	61	60	387	52	273	46	248	49	290;
18	53.5	912 	48	146	65.5	1792	56.5	310	48	361	51	305;19	55   	1906	48	1016	67	1617	60	1915	49	917	56	1528;
20	59  	2514	50	1154	74	2120	61	1885	50	1800	58	926;21	61  	1917	53	780	76	1927	62	1293	51	464	58	490;
22	62  	2064	58	1067	78	1153	65	1068	53	1101	59	1047;23	64.5	1930	58.5	1691	80	1186	66	1976	54	1158	61	957];
% mean and standard deviation:
data.tL      = [tLN(:,1), mean(tLN(:,[2,4,6,8,10,12]),2)];
units.tL   = {'d', 'mm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BakeReev1974';
%
data.tN      = [tLN(:,1), cumsum(mean(tLN(:,[3,5,7,9,11,13]),2))];
units.tN   = {'d', '#'};  label.tN = {'time since birth', 'cumulative # of eggs'};  
temp.tN    = C2K(26);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'BakeReev1974';

% *ReevSyms1989* T = 26 degrees C, Total lengths
data.LWC = [ ... % TOT Length (mm), micro gram carbon
11	162; 26	1421; 25	1579; 27	1576; 13	272;25	1447;
25	1295; 24	1427; 24	1340; 6	33;5	22; 13	151;16	368;
17	644; 16	750;10	90; 6	82; 14	216; 17	377; 23	867;
25	1187; 17	269; 14	142; 19	320; 24	718; 26	826; 26	1336;
10	90; 8	71;11	117; 14	194; 11	89;9	60;11	107;14	179;
18	255;24	570;32	1696;31	1920;21	313;49	3422;63	8203;
69	14232;77	20912;17	123;52	4850;66	12096;72	17877;84	26843];
data.LWC(:,2) = data.LWC(:,2) * 1e-3; % convert mug to mg
units.LWC   = {'mm', 'mg'};  label.LWC = {'total length', 'carbon'};  
bibkey.LWC = 'ReevSyms1989';
  
%% set weights for all real data
weights = setweights(data, []);
weights.LR(data.LR(:,2) == 0) = 0; weights.LR2(data.LR2(:,2) == 0) = 0;
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

weights.psd.p_M = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Length measurement are either: [1] total length= including lobes (TL), [2] oral-aboral length, i.e. aboral pole to mouth (OA) or [3] oral-statocyst length, i.e. statocyst to mouth opening (OS). But there are more types of length measurements, see Mutl1999';
D2 = 'The type of length measurement is not specified in BakeReev1974 (data from Fig.1, Tab2) nor in ReevSyms1989. Pers. comm. with Particia Kremer tells that it is total length (including the lobes). The length measurement is also really sensitive to whether or not the animal was immerged in water (Pers. Comm. P. Kremer)';     
D3 = 'There might be the possibility for larvae to reproduce sexually while they are still larvae, a condition known as dissogeny but which was only observed in LAB (and in M. mccrady by Mart1987)';
D4 = 'metamorphosis (as defined by switching from V1 morphic growth to isomorphic growth) is assumed to occur at end of cydippid larval stage';
D5 = 'LR-data were given weight zero because zero-reprod data distort estimation';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Facts
F1 = 'This entry is discussed in AuguJasp2014';
metaData.bibkey.F1 = 'AuguJasp2014'; 
F2 = 'Data from all Mnemiopsis leidyi and mccradyi species can be combined as the genus is considered monospecific until further research is done';
metaData.bibkey.F2 = 'Bayh2005'; 
F3 = ['There are no benthic resting stages. '...
    'Mnemiopsis sp. has 3 larval stages: ' ...
    'tentaculate (from hatching to ca. 4 mm), ' ...
    'transition (ca. 5 - 10 mm) and lobate (from about 6 - 18 mm) distinctly different morphologies, '...
    'which can influence diet composition, feeding rates and digestion.'];
metaData.bibkey.F3 = 'RapoNova2005'; 
F4 = 'After the cydippid larvae stage (= tentaculate) the tentacles disappear and the lobes are formed. Diet switches from microzooplankton to mesozooplankton (0.2-20 mm)';
metaData.bibkey.F4 = 'RapoNova2005'; 
F5 = 'The species is a simultaneous hermaphrodite able to perform self-fertilisation ';
metaData.bibkey.F5 = 'nobanis'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '6RMT2'; % Cat of Life
metaData.links.id_ITIS = '53917'; % ITIS
metaData.links.id_EoL = '45502605'; % Ency of Life
metaData.links.id_Wiki = 'Mnemiopsis_leidyi'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '12339'; % Taxonomicon
metaData.links.id_WoRMS = '106401'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mnemiopsis_leidyi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BakeReev1974'; type = 'Article'; bib = [ ... 
'author = {L. D. Baker and M. R. Reeve}, ' ... 
'year = {1974}, ' ...
'title = {Laboratory Culture of the Lobate Ctenophore \emph{Mnemiopsis mccradyi} with Notes on Feeding and Fecundity}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {26}, ' ...
'pages = {57-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bayh2005'; type = 'Phdthesis'; bib = [ ... 
'author = {Bayha, K. M.}, ' ... 
'year = {2005}, ' ...
'title = {The molecular systematics and population genetics of four coastal ctenophores and scyphozoan jellyfish of the {U}nited {S}tates {A}tlantic and {G}ulf of {M}exico}, ' ...
'school = {Dept. of Biology, University of Delaware}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'RapoNova2005'; type = 'Article'; bib = [ ... 
'author = {R. Rapoza and D. Novak and J. H. Costello}, ' ... 
'year = {2005}, ' ...
'title = {Life-stage dependent, in situ dietary patterns of the lobate ctenophore \emph{Mnemiopsis leidyi} {A}gassiz 1865}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {27}, ' ...
'number = {9}, '...
'pages = {951--956}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReevSyms1989'; type = 'Article'; bib = [ ... 
'author = {M. R. Reeve and M. A. Syms and P. Kremer}, ' ... 
'year = {1989}, ' ...
'title = {Growth dynamics of a ctenophore (\emph{Mnemiopsis}) in relation to variable food supply. {I}. {C}arbon biomass, feeding, egg production, growth and assimilation efficiency}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {11}, ' ...
'pages = {535-552}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Krem1974'; type = 'Phdthesis'; bib = [ ... 
'author = {Kremer, P.}, ' ... 
'year = {1974}, ' ...
'title = {The ecology of the ctenophore \emph{Mnemiopsis leidyi} in {N}arragansett {B}ay}, ' ...
'school = {University of Rhode Island}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Krem1976'; type = 'Incollection'; bib = [ ... 
'author = {P. Kremer}, ' ... 
'year = {1976}, ' ...
'title = {Population dynamics and ecological energetics of a pulsed zooplankton predator, the ctenophore \emph{Mnemiopsis leidyi}}, ' ...
'booktitle = {Estuarine Processes}, ' ...
'editor = {Wiley, M}, ' ...
'publisher = {Academic Press}, ' ...
'address = {New York}, ' ...
'pages = {197-215}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mart1987'; type = 'Article'; bib = [ ... 
'author = {M. Q. Martindale}, ' ... 
'year = {1987}, ' ...
'title = {Larval reproduction in the ctenophore \emph{Mnemiopsis mccradyi} (order {L}obata)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {94}, ' ...
'pages = {409--414}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mutl1999'; type = 'Article'; bib = [ ... 
'author = {Mutlu, E.}, ' ... 
'year = {1999}, ' ...
'title = {Distribution and abundance of ctenophores and their zooplankton food in the Black Sea. II. \emph{Mnemiopsis leidyi}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {135}, ' ...
'number = {4}, '...
'pages = {603--613}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WalrLang2013'; type = 'Article'; bib = [ ... 
'author = {Walraven, L. van and Langenberg, V. T. and Veer, H. W. van der}, ' ... 
'year = {2013}, ' ...
'title = {\emph{Mnemiopsis leidyi} in the western {D}utch {W}adden {S}ea}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {82}, ' ...
'pages = {86-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AuguJasp2014'; type = 'Article'; bib = [ ... 
'author = {Augustine, S. and Jaspers, C. and Kooijman, S. A. L. M.  and Carlotti, F. and Poggiale, J.-C. and Freitas, V. and Veer, H. van der and Walraven, L. van}, ' ... 
'year = {2014}, ' ...
'title = {Mechanisms behind the metabolic flexibility of an invasive comb jelly}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {156--165}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jasp2012'; type = 'Phdthesis'; bib = [ ... 
'author = {Jaspers, C.}, ' ... 
'year = {2012}, ' ...
'title = {Ecology of Gelatinous Plankton with Emphasis on Feeding Interactions, Distribution Pattern and Reproduction Biology of \emph{Mnemiopsis leidyi} in the {B}altic}, ' ...
'school = {National Institute of Aquatic Resources, Technical University of Denmark}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JaspHara2013'; type = 'Article'; bib = [ ... 
'author = {Jaspers, C. and Haraldsson, M. and Lombard, F. and Bolte, S. and Ki{\o}rboe, T.}, ' ... 
'year = {2013}, ' ...
'title = {Seasonal dynamics of early life stages of invasive and native ctenophores gives clues to invasion and bloom potential in the {B}altic {S}ea}, ' ...
'journal = {J. Plankton Res.}, ' ...
'volume = {35}, ' ...
'pages = {583--594}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JaspCost2014'; type = 'Article'; bib = [ ... 
'author = {Jaspers, C. and Costello, J. H. and Colin, S. P.}, ' ... 
'year = {2014}, ' ...
'title = {Carbon content of \emph{Mnemiopsis leidyi} eggs and specific egg production rates in {N}orthern {E}urope}, ' ...
'journal = {J. Plankton Res.}, ' ...
'doi = {10.1093/plankt/fbu102}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nobanis'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.nobanis.org/globalassets/speciesinfo/m/mnemiopsis-leidyi/mnemiopsis_leidyi.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'issg'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.issg.org/database/species/ecology.asp?si=95}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

