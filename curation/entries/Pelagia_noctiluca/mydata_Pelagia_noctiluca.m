function [data, auxData, metaData, txtData, weights] = mydata_Pelagia_noctiluca

%% set metaData
metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Scyphozoa'; 
metaData.order      = 'Semaeostomeae'; 
metaData.family     = 'Pelagiidae';
metaData.species    = 'Pelagia_noctiluca'; 
metaData.species_en = 'Mauve stinger'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'L0'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'RQ'}; 
metaData.data_1     = {'L-Ww'; 'L-Wd'; 'L-WN'; 'L-WC'; 't-Ww'; 'L-R'; 'T-ab'; 'T-JO'; 'T-JN'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'; 'Sara Rosa'; 'Bas Kooijman'; 'Francois Carlotti';  'Jean-Christophe Poggiale'};    
metaData.date_subm = [2012 12 07];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'};   

metaData.author_mod_1   = {'Starrlight Augustine'};        
metaData.date_mod_1     = [2013 03 25];                           
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};                 
metaData.address_mod_1  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'}; 

metaData.author_mod_2   = {'Bas Kooijman'};        
metaData.date_mod_2     = [2018 01 06];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2  = {'VU University, Amsterdam'}; 

metaData.author_mod_3   = {'Starrlight Augustine'};        
metaData.date_mod_3     = [2019 02 14];                           
metaData.email_mod_3    = {'sta@akvaplan.niva.no'};                 
metaData.address_mod_3  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'}; 


metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 02 15]; 

%% set data
% zero-variate data

data.tp = 150;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MaleMale1992';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps are guessed';
data.am = 1e3;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'this life span is artificial';

data.L0  = 0.03;  units.L0  = 'cm';  label.L0  = 'egg diameter';            bibkey.L0  = {'AviaRott1991','Berr1949'};
data.Lb  = 0.11;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Avia1986';
  comment.Lb = 'rhopalia to rhopalia';
data.Lp  = 7;     units.Lp  = 'cm';  label.Lp  = 'total length st puberty'; bibkey.Lp  = 'MaleMale1992';
  comment.Lp = '3-3.5 cm is min length where mature gonads were observed';
data.Li  = 12;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'RosaPans2012';

data.Wwi = 288;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guestimated for length-wet mass relationship in RosaPans2012 assuming 14 cm ultimate length';

data.Ri  = 2e4;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'extrapolated from the size-reproduction rate data'; 
  
data.RQ  = 0.8;   units.RQ  = '-';   label.RQ  = 'respiratory quotient';    bibkey.RQ  = 'Lars1987b';   
  
% uni-variate data

% *RosaPans2012*, field measurements + lab observation of age at birth,
% straits of Messina, central mediterranean sea
% Length - wet mass
data.LWw = [...	Bell diam, mm	Wet mass, g	
	16.092	0.673	
	19.779	2.689	
	20.735	2.682	
	21.691	2.676	
	23.739	7.422	
	25.104	4.014	
	26.333	2.646	
	27.835	3.316	
	29.61	3.305	
	31.385	3.973	
	33.023	3.963	
	34.116	8.715	
	34.116	5.995	
	35.345	3.268	
	35.891	8.023	
	37.529	6.653	
	38.758	5.965	
	40.124	11.395	
	40.26	6.635	
	40.397	10.034	
	41.625	12.745	
	41.899	7.984	
	41.899	9.344	
	42.445	7.981	
	42.854	6.619	
	42.991	29.734	
	42.991	14.776	
	42.991	12.057	
	43.674	4.574	
	43.674	10.013	
	44.766	22.244	
	44.766	12.045	
	44.766	7.966	
	44.902	17.483	
	46.131	18.155	
	46.131	14.756	
	46.131	11.357	
	46.131	9.317	
	46.131	7.957	
	47.087	9.991	
	47.906	9.985	
	49.135	20.855	
	49.135	16.776	
	49.135	12.697	
	49.272	9.297	
	49.272	5.897	
	49.954	32.408	
	50.091	47.365	
	50.091	9.971	
	50.091	26.288	
	50.774	29.683	
	50.774	22.885	
	50.91	9.966	
	50.91	18.124	
	50.91	14.725	
	51.047	37.16	
	51.866	9.96	
	52.276	12.677	
	52.412	9.956	
	52.412	30.353	
	52.412	24.914	
	52.412	18.115	
	53.368	9.95	
	53.641	22.186	
	53.778	9.947	
	54.051	5.866	
	54.051	32.382	
	54.051	40.54	
	54.187	25.582	
	54.187	16.064	
	54.324	27.621	
	54.597	14.021	
	54.733	18.1	
	54.87	75.209	
	55.143	35.094	
	55.143	33.734	
	55.143	12.658	
	55.28	41.212	
	55.553	23.533	
	55.689	19.453	
	55.689	21.493	
	55.826	12.654	
	55.962	15.372	
	56.099	28.969	
	56.508	27.607	
	56.782	50.721	
	56.782	21.486	
	56.782	15.367	
	56.918	16.726	
	57.874	34.397	
	57.874	28.958	
	58.01	24.197	
	58.01	22.158	
	58.283	18.077	
	58.42	35.073	
	58.693	35.751	
	58.693	16.034	
	58.966	39.829	
	58.966	15.353	
	58.966	26.231	
	59.239	1.753	
	59.239	30.308	
	59.512	40.505	
	59.512	24.868	
	59.649	20.108	
	59.785	56.821	
	59.785	50.702	
	59.785	43.903	
	59.785	14.668	
	59.785	33.704	
	60.195	14.665	
	60.332	35.74	
	60.468	21.462	
	60.605	27.58	
	60.878	23.499	
	61.014	38.456	
	61.287	47.292	
	61.424	30.294	
	61.56	16.696	
	61.56	26.894	
	61.697	46.61	
	61.697	41.171	
	61.834	17.374	
	62.107	18.052	
	62.243	54.765	
	62.243	36.408	
	62.243	30.969	
	62.38	44.566	
	62.516	28.927	
	62.789	34.365	
	63.062	12.607	
	63.062	17.366	
	63.062	22.125	
	63.062	49.321	
	63.199	26.883	
	63.199	30.283	
	63.199	39.121	
	63.336	43.2	
	63.609	40.478	
	64.155	11.92	
	64.291	56.111	
	64.428	44.552	
	64.428	38.434	
	64.428	30.275	
	64.428	26.196	
	64.428	22.796	
	64.428	18.717	
	64.428	18.717	
	64.837	47.949	
	65.111	62.905	
	65.247	53.386	
	65.247	49.306	
	65.384	15.991	
	65.384	24.83	
	65.52	28.228	
	65.657	43.185	
	65.657	35.706	
	66.203	14.626	
	66.203	22.785	
	66.339	44.54	
	66.476	32.981	
	66.612	43.858	
	66.612	52.017	
	67.022	52.014	
	67.432	35.015	
	67.568	39.773	
	67.841	54.729	
	67.978	30.252	
	68.114	79.203	
	68.114	45.209	
	68.251	28.89	
	68.251	30.93	
	68.251	52.686	
	68.661	39.766	
	68.661	47.245	
	68.797	26.167	
	68.934	19.368	
	69.207	73.757	
	69.207	30.924	
	69.343	22.764	
	69.48	51.999	
	69.48	53.358	
	69.753	5.085	
	69.753	2.365	
	69.753	69.674	
	69.753	58.116	
	69.753	49.277	
	69.753	37.039	
	69.753	32.96	
	69.889	41.798	
	70.026	63.553	
	71.118	71.705	
	71.118	43.829	
	71.118	47.229	
	71.255	60.826	
	71.255	56.746	
	71.255	51.987	
	71.255	41.109	
	71.255	29.551	
	71.391	59.465	
	71.664	43.146	
	71.938	45.184	
	72.074	79.177	
	72.074	59.46	
	72.074	32.265	
	72.893	48.577	
	73.03	59.454	
	73.166	40.417	
	74.122	108.399	
	74.122	73.045	
	74.122	60.127	
	74.259	100.919	
	74.259	53.327	
	74.259	39.05	
	74.395	54.006	
	74.395	47.887	
	74.395	28.851	
	74.668	43.126	
	74.668	43.126	
	74.805	35.647	
	74.941	78.479	
	75.078	93.435	
	75.078	68.28	
	75.078	54.002	
	75.215	30.885	
	75.351	35.643	
	75.624	59.437	
	75.761	55.357	
	75.761	47.199	
	75.897	46.518	
	75.897	43.118	
	76.034	65.554	
	76.17	35.638	
	76.17	28.159	
	76.307	75.07	
	76.307	32.917	
	77.263	68.265	
	77.263	58.747	
	77.263	52.628	
	77.263	47.869	
	78.218	62.82	
	78.901	84.572	
	79.038	69.614	
	79.038	60.095	
	79.174	50.576	
	79.174	48.536	
	79.174	41.737	
	79.311	52.615	
	79.447	56.013	
	79.857	81.166	
	79.857	70.968	
	79.993	91.364	
	80.13	68.927	
	80.267	94.762	
	80.676	47.167	
	80.949	99.516	
	80.949	85.919	
	80.949	64.162	
	81.086	60.762	
	81.086	77.759	
	81.495	52.601	
	82.042	70.954	
	82.178	81.831	
	82.315	70.952	
	82.997	89.985	
	83.134	60.749	
	83.544	66.865	
	83.953	120.573	
	83.953	101.537	
	84.09	67.541	
	84.226	91.336	
	84.226	78.419	
	84.499	70.258	
	84.772	62.778	
	84.909	84.533	
	85.182	93.37	
	85.182	52.577	
	85.182	45.098	
	85.455	75.011	
	85.455	64.133	
	86.411	92.002	
	86.411	86.563	
	86.411	77.045	
	86.411	66.167	
	86.547	96.081	
	87.23	61.402	
	87.503	68.199	
	87.503	68.879	
	87.776	109.67	
	87.776	73.636	
	87.913	96.072	
	88.186	68.875	
	89.415	93.343	
	89.551	65.466	
	89.551	77.024	
	89.824	103.538	
	90.098	47.786	
	90.234	64.102	
	90.371	78.379	
	90.507	70.899	
	90.507	89.936	
	90.507	88.576	
	90.644	96.054	
	90.917	102.171	
	92.009	113.722	
	92.009	87.887	
	92.965	108.957	
	93.101	42.327	
	94.057	109.63	
	94.876	93.307	
	95.286	116.421	
	95.286	76.987	
	95.423	122.539	
	95.423	101.462	
	96.925	95.334	
	99.109	87.841	
	101.157	143.578	
	101.43	82.387	
	102.25	125.894	
	102.25	112.976	
	104.98	151.032	
	112.081	197.898	
	114.265	180.887];
units.LWw   = {'mm', 'g'};  label.LWw = {'bell diameter', 'wet weight'};  
bibkey.LWw = 'RosaPans2012';
comment.LWw = 'straits of Messina, central mediterranean sea';

% length dry mass
data.LWd= [...	Bell diam, mm	dry mass, g	
	33.982	0.344	
	35.893	0.371	
	36.029	0.206	
	40.264	0.564	
	40.401	0.646	
	43.133	0.757	
	43.273	1.307	
	44.224	0.591	
	44.773	1.087	
	44.906	0.509	
	45.045	0.839	
	49.552	1.032	
	50.236	1.252	
	50.37	0.812	
	51.054	1.114	
	51.329	1.362	
	52.283	1.087	
	54.056	0.729	
	54.058	1.087	
	54.062	1.609	
	54.064	1.884	
	55.018	1.719	
	55.02	1.939	
	55.285	0.812	
	55.972	1.389	
	56.244	1.224	
	56.933	2.242	
	58.432	1.692	
	59.933	1.664	
	59.935	1.857	
	60.073	2.105	
	60.205	1.499	
	60.213	2.572	
	61.303	2.215	
	62.117	1.499	
	62.121	2.077	
	62.26	2.462	
	63.075	1.912	
	64.437	1.389	
	64.44	1.719	
	64.445	2.49	
	65.257	1.472	
	65.26	1.912	
	65.263	2.27	
	66.214	1.582	
	66.215	1.829	
	66.219	2.435	
	68.126	1.692	
	68.13	2.297	
	69.766	1.884	
	69.909	2.902	
	70.048	3.177	
	70.049	3.343	
	71.133	2.105	
	71.27	2.242	
	71.278	3.315	
	72.359	1.774	
	72.361	2.077	
	73.182	2.215	
	73.185	2.765	
	74.137	2.132	
	74.278	2.847	
	74.29	4.553	
	74.293	5.021	
	74.419	3.535	
	75.102	3.563	
	75.108	4.388	
	75.232	2.545	
	76.051	2.545	
	76.19	2.902	
	76.33	3.453	
	79.061	3.453	
	79.064	3.81	
	80.012	2.71	
	80.025	4.608	
	80.153	3.37	
	80.287	3.04	
	80.291	3.645	
	81.114	4.168	
	81.119	4.856	
	81.245	3.37	
	83.437	4.415	
	83.978	3.563	
	83.979	3.838	
	84.112	3.287	
	84.118	4.195	
	84.382	2.875	
	85.07	3.59	
	85.212	4.415	
	86.031	4.278	
	90.26	3.838	
	90.264	4.36	
	90.268	4.966	
	90.401	4.47	
	92.184	5.626	
	93.955	5.021	
	95.182	4.801	
	95.323	5.351	
	95.325	5.736	
	95.327	5.928	
	102.42	4.883	
	102.559	5.268	
	105.302	7.139	
	112.418	9.367	
	114.46	8.487];
units.LWd   = {'mm', 'g'};  label.LWd = {'bell diameter', 'dry weight'};  
bibkey.LWd = 'RosaPans2012';
comment.LWd = 'straits of Messina, central mediterranean sea';

% RosaPans2012: age at ephrae stage (birth) at different temperatures:
data.Tab = [ ... temperature C, age at ephyrea stage d
    14   5
    17   4
    20   3
    23   2];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at ephyrea stage'};  
bibkey.Tab = 'RosaPans2012';

% *RottAvia1983* : age against developmental milestone - we will quantify
% joules invested to reach each developmental milestone (DM) following
% methodology in MuelAugu2012. Each DM is associated
% with a maturity level E_H (j); we minimize the distance between the
% predicted age at each DM and the real age at each DM.
%
% raw data from the study by RosaPan2012, in *AuguRosa2013*
LRT =  [ ...female diameter (mm)	eggs spawned after 24 h	water temperature (C)
68	1143	14
84	5798	14
61	3943	14
75	3427	14
67	2262	14
72	1698	14
90	2786	14
105	7820	14
105	2979	14
86	6327	14
92	1088	14
72	2284	17
100	14098	17
84	7060	17
96	5411	17
85	3592	20
68	1176	20
76	653	    20
65	981	    20
90	3488	20
85	3592	20
72	111	    23
75	1068	23];
data.LR = LRT(:,[1 2]); 
temp.LR = LRT(:,[1 3]); units.temp.LR = 'K'; label.temp.LR = 'temperature';
units.LR   = {'cm', '#/d'};  label.LR = {'bell diameter', 'reproduction rate'};  
bibkey.LR = 'RosaPans2012';

% *Lars1987a* growth in terms of increase in wet mass of 4 individuals (we
% exclude the part where they are starved)
% T = 27-29 C

% -------------- Individual A -------------------
data.tWwA = [ ...	time, d	wet mass, g	
	0.145	3.896	
	6.953	7.496	
	14.017	8.524	];
units.tWwA   = {'d', 'g'};  label.tWwA = {'time since birth', 'wet weight'};  
temp.tWwA    = C2K(28);  units.temp.tWwA = 'K'; label.temp.tWwA = 'temperature';
bibkey.tWwA = 'Lars1987a';
%
% -------------- Individual B -------------------			
data.tWwB = [...	time, d	wet mass, g	
	0.113	4.161	
	6.952	7.176	
	13.996	7.034	];
units.tWwB   = {'d', 'g'};  label.tWwB = {'time since birth', 'wet weight'};  
temp.tWwB    = C2K(28);  units.temp.tWwB = 'K'; label.temp.tWwB = 'temperature';
bibkey.tWwB = 'Lars1987a';
%
% -------------- Individual C -------------------			
data.tWwC = [...	time, d	wet mass, g	
	0.108	2.671	
	6.963	5.465	
	14.013	7.387	];
units.tWwC   = {'d', 'g'};  label.tWwC = {'time since birth', 'wet weight'};  
temp.tWwC    = C2K(28);  units.temp.tWwC = 'K'; label.temp.tWwC = 'temperature';
bibkey.tWwC = 'Lars1987a';

% *MoraCarr1986*
% lappet to lappet length to nitrogen, carbon and dry mass
%
% ------- lapet to lapet length against nitrogen mass
data.LWN = [...	diam mm	N mass, mug	
	6.079	4.899	
	7.012	9.115	
	8.237	17.691	
	9.097	20.428	
	9.296	15.248	
	10.207	20.815	
	10.783	30.875	
	12.177	51.136	
	13.026	58.552	];
units.LWN   = {'mm', 'mug'};  label.LWN = {'bell diameter', 'nitrogen mass'};  
bibkey.LWN = 'Lars1987a';
%
% ----- lappet to lappet length against carbon mass
data.LWC = [ ...	diam, mm	C mass, mug	
	6.058	18.527	
	7.043	32.51	
	8.248	65.794	
	9.076	84.694	
	9.317	89.842	
	10.218	80.046	
	10.773	126.945	
	12.177	185.458	
	13.047	201.967	];
% ------ lappet to lappet length against dry mass
units.LWC   = {'mm', 'mug'};  label.LWC = {'bell diameter', 'carbon mass'};  
bibkey.LWC = 'Lars1987a';
%
data.LWd_MC = [ ...	diam, mm	dry mass, mug	
	6.058	152.537	
	6.991	256.678	
	8.237	485.872	
	9.118	516.018	
	9.296	764.841	
	10.207	913.283	
	10.783	977.545	
	12.166	2300.615	
	13.015	2568.984	];
units.LWd_MC  = {'mm', 'mug'};  label.LWd_MC = {'bell diameter', 'dry weight'};  
bibkey.LWd_MC = 'Lars1987a';

% *Male1989c*
% dry mass specific dioxygen consumption and ammonia excretion at different temperatures
% range of dry mass of individual used: 0.06-1.65
% range of bell diameters of individuals used: 13-60 mm
%
data.TJO = [ ...	temperature C	mumol/d/g Wd	
	12	103	
	12	42	
	12	45	
	12	61	
	12	8	
	12	36	
	12	68	
	16	205	
	16	37	
	16	83	
	16	153	
	16	398	
	16	62	
	16	98	
	16	107	
	19	157	
	19	262	
	19	108	
	19	115	
	19	124	
	23	1064	
	23	291	
	23	706	
	23	912	
	23	96	
	23	163	
	23	225	
	23	317	
	23	333	
	23	538	
	23	585	
	25	1674	
	25	1732	];
units.TJO  = {'C', 'mumol/d/g Wd'};  label.TJO = {'temperature', 'dry-mass spec O_2 consumption'};  
bibkey.TJO = 'Male1989c';
comment.TJO = 'range of dry mass of individual used: 0.06-1.65; range of bell diameters of individuals used: 13-60 mm';
%
data.TJN = [ ...	temperature C	mumol/d/g Wd	
	12	29.7	
	12	40	
	12	19.4	
	16	13.9	
	16	17.9	
	16	9.9	
	19	28.8	
	19	35.4	
	19	22.2	
	23	32.4	
	23	46	
	23	18.8	];
units.TJN  = {'C', 'mumol/d/g Wd'};  label.TJN = {'temperature', 'dry-mass spec NH_3 production'};  
bibkey.TJN = 'Male1989c';
comment.TJN = 'range of dry mass of individual used: 0.06-1.65; range of bell diameters of individuals used: 13-60 mm';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWwC','tWwB','tWwA'}; subtitle1 = {'Data for individual C, B, A'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Chemical pars are assumped to relate to ash-free dry mass; MaleFaga1993 report ash free dry mass over dry mass ratio of 0.263 - 0.297 with mean 0.279, which makes del_W = 3.5842';
D2 = 'dry weight for T-JN and T-JC is assumed to be 1.1 g (parameter Wd0)';
D3 = 'd_V and d_E taken to be 0.01 as opposed to AmP standard 0.02, after AuguRosa2014';

metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'This entry is discussed in AuguRosa2014';
metaData.bibkey.F1 = 'AuguRosa2014'; 
F2 = 'Pelagia has no polyp stage';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '75XQ6'; % Cat of Life
metaData.links.id_ITIS = '51661'; % ITIS
metaData.links.id_EoL = '46554343'; % Ency of Life
metaData.links.id_Wiki = 'Pelagia_noctiluca'; % Wikipedia
metaData.links.id_ADW = 'Pelagia_noctiluca'; % ADW
metaData.links.id_Taxo = '11851'; % Taxonomicon
metaData.links.id_WoRMS = '135305'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://it.wikipedia.org/wiki/Pelagia_noctiluca}}';
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
bibkey = 'AuguRosa2014'; type = 'Article'; bib = [ ... 
'author = {Augustine, S. and Rosa, S. and Kooijman, S. A. L. M. and Carlotti, F. and Poggiale, J.-C.}, ' ... 
'year = {2014}, ' ...
'doi = {10.1016/j.seares.2014.06.007}, ' ...
'title = {Modelling the eco-physiology of the purple mauve stinger, \emph{Pelagia noctiluca} using Dynamic Energy Budget theory}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {52-64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Avia1986'; type = 'Article'; bib = [ ... 
'author = {Avian, M.}, ' ... 
'year = {1986}, ' ...
'title = {Temperature influence on in vitro reproduction and development of \emph{Pelagia noctiluca} ({F}orsk\r{a}l)}, ' ...
'journal = {Bolletino di zoologia}, ' ...
'volume = {53}, ' ...
'doi = {10.1080/11250008609355528}, ' ...
'number = {4}, '...
'pages = {385-391}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AviaRott1991'; type = 'Article'; bib = [ ... 
'author = {Avian, M. and Rottini Sandrini, L.}, ' ... 
'year = {1991}, ' ...
'doi = {10.1007/bf00026461}, ' ...
'title = {Oocyte development in four species of scyphomedusa in the northern {A}driatic {S}ea}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {216/217}, ' ...
'pages = {189-195}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Berr1949'; type = 'Article'; bib = [ ... 
'author = {Berrill, N. J.}, ' ... 
'doi = {10.1111/j.1469-185x.1949.tb00581.x}, ' ...
'year = {1949}, ' ...
'title = {Developmental analysis of scyphomedusae}, ' ...
'journal = {Biological Reviews}, ' ...
'volume = {24}, ' ...
'pages = {393-410}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GoyMora1989'; type = 'Article'; bib = [ ... 
'author = {Goy, J. and Morand, P. and Etienne, M.}, ' ... 
'year = {1989}, ' ...
'doi = {10.1016/0198-0149(89)90138-6}, ' ...
'title = {Long-term fluctuations of \emph{Pelagia noctiluca} ({C}nidaria, {S}cyphomedusa) in the western {M}editerranean {S}ea. Prediction by climatic variables.}, ' ...
'journal = {Deep-sea Research}, ' ...
'volume = {36}, ' ...
'number = {2}, '...
'pages = {269-279}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lars1987a'; type = 'Article'; bib = [ ... 
'author = {Larson, R. J.}, ' ... 
'year = {1987}, ' ...
'title = {A note on the feeding, growth and reproduction of the epipelagic scyphomedusa \emph{Pelagia noctiluca} ({F}orsk\r{a}l)}, ' ...
'journal = {Biological Oceanography}, ' ...
'volume = {4}, ' ...
'number = {4}, '...
'pages = {447-454}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lars1987b'; type = 'Article'; bib = [ ... 
'author = {Larson, R. J.}, ' ... 
'doi = {10.1016/0300-9629(87)90430-0}, ' ...
'year = {1987}, ' ...
'title = {Respiration and carbon turnover rates of medusae from the {N}{E} {P}acific}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A: Physiology}, ' ...
'volume = {87}, ' ...
'pages = {93--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Male1989a'; type = 'Article'; bib = [ ... 
'author = {Malej, A.}, ' ... 
'year = {1989}, ' ...
'doi = {10.1016/0022-0981(89)90191-3}, ' ...
'title = {Behaviour and trophic ecology of the jellyfish \emph{Pelagia noctiluca}}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {126}, ' ...
'pages = {259-270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Male1989c'; type = 'Incollection'; bib = [ ... 
'author = {Malej, A.}, ' ... 
'year = {1989}, ' ...
'title = {Respiration and excretion rates of \emph{Pelagia noctiluca} ({S}emaeostomeae, {S}cyphozoa)}, ' ...
'booktitle = {Proceedings of the 21st EMBS, Academy of Siences}, ' ...
'publisher = {Institute of Oceanology}, ' ...
'address = {Gdansk}, ' ...
'pages = {107-113}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaleMale1992'; type = 'Incollection'; bib = [ ... 
'author = {Malej, A. and Malej, M.}, ' ... 
'year = {1992}, ' ...
'title = {Population dynamics of the jellyfish, \emph{Pelagia noctiluca} ({F}orsk\r{a}l, 1775)}, ' ...
'booktitle = {Marine Eutrophication and Population Dynamics, Proceedings of the 25st EMBS, Academy of Siences}, ' ...
'editor = {G. Colombo}, ' ...
'publisher = {Olsen \& Olsen}, ' ...
'address = {Fredensborg}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaleFaga1993'; type = 'Article'; bib = [ ... 
'author = {Malej, A. and Faganeli, J. and Pezdic, J.}, ' ... 
'year = {1993}, ' ...
'doi = {10.1007/bf00355475}, ' ...
'title = {Stable isotope and biochemical fractionation in the marine pelagic food chain: the jellyfish \emph{Pelagia noctiluca} and net zooplankton}, ' ...
'journal = {Marine  Biology}, ' ...
'volume = {116}, ' ...
'pages = {565-570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoraCarr1987'; type = 'Article'; bib = [ ... 
'author = {Morand, P. and Carr\''{e}, C. and Biggs, D. C.}, ' ... 
'year = {1987}, ' ...
'doi = {10.1093/plankt/9.4.651}, ' ...
'title = {Feeding and metabolism of the jellyfish \emph{Pelagia noctiluca} ({S}cyphomedusae, {S}emaeostomae)}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {9}, ' ...
'number = {4}, '...
'pages = {651-665}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RosaPans2012'; type = 'Article'; bib = [ ... 
'author = {Rosa, S. and Pansera, M. and Granata, A. and Guglielmo, L.}, ' ... 
'year = {2012}, ' ...
'doi = {10.1016/j.jmarsys.2012.10.001}, ' ...
'title = {Interannual variability, growth, reproduction and feeding of \emph{Pelagia noctiluca} ({C}nidaria: {S}cyphozoa) in the {S}traits of {M}essina ({C}entral {M}editerranean {S}ea): {L}inkages with temperature and diet. }, ' ...
'journal = {Journal of Marine Systems}, ' ...
'volume = {111-112}, ' ...
'pages = {97-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RottAvia1983'; type = 'Article'; bib = [ ... 
'author = {Rottini Sandrini, L. and Avian, M.}, ' ... 
'year = {1983}, ' ...
'doi = {10.1007/bf00413920}, ' ...
'title = {Biological cycle of \emph{Pelagia noctiluca}: morphological aspects of the development from planula to ephyra}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {74}, ' ...
'pages = {169-174}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'thecephalopodpage'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.thecephalopodpage.org/MarineInvertebrateZoology/Pelagianoctiluca.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



