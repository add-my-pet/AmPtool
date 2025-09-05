function [data, auxData, metaData, txtData, weights] = mydata_Pusa_hispida 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Pusa_hispida'; 
metaData.species_en = 'Ringed seal'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp usually 37 or so for a mammal
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Li';  'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine','Ana Sofia Aniceto'};    
metaData.date_subm = [2016 12 08];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 12 12];  

%% set data
% zero-variate data

data.tg = 11*30;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 53;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'females';
data.am = 46*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 144;   units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'KrafKova2006';
  comment.Li = 'maximum observed length';

data.Wwb = 6e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 14e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 92e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KrafKova2006';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data females
data.tL81 = [ ...
0.163	0.119	0.169	0.169	0.888	0.933	0.882	2.075	2.074	2.025	2.117	1.973	3.065	3.164	3.119	3.074	3.076	4.075	4.073	3.931	3.928	3.927	4.069	4.068	4.113	4.923	4.970	4.974	6.072	6.069	5.925	7.020	7.018	6.968	7.014	8.017	8.063	8.012	9.111	9.108	9.058	10.059	10.053	11.106	11.057	11.055	11.054	12.052	11.956	12.003	11.955	13.052	13.003	13.000	13.094	12.951	13.045	14.053	13.999	14.043	13.092	15.092	14.949	15.091	14.995	16.091	16.138	16.042	15.991	17.041	17.087	17.086	16.989	17.083	18.040	18.037	18.084	18.083	18.035	18.035	18.034	18.127	19.122	18.984	18.938	18.939	20.032	20.980	18.937	21.978	22.071	22.023	22.068	22.161	22.067	20.927	23.021	23.024	22.979	24.023	24.163	24.065	24.251	23.963	25.017	25.059	25.153	26.157	26.107	26.107	27.200	28.008	28.008	28.098	29.005	30.097	29.953	30.046	31.044	31.944	32.043	34.090	39.023	40.069	40.161	44.910;
70.367	82.129	89.023	90.848	114.166	104.432	92.062	113.756	110.308	104.225	95.099	89.421	89.011	100.164	110.304	119.227	125.108	130.579	125.306	126.929	117.196	114.357	111.922	107.664	100.363	109.283	106.849	121.247	140.508	130.368	123.879	134.420	127.931	120.428	113.736	135.227	129.752	119.207	139.887	130.964	122.650	135.016	113.521	141.501	138.459	130.753	129.131	131.966	128.519	125.274	122.841	139.871	133.990	126.284	123.445	121.418	116.347	153.656	129.930	119.791	113.914	136.010	134.185	131.954	128.101	140.061	137.830	135.803	122.419	143.099	136.001	134.582	127.688	122.415	148.976	139.242	137.417	133.158	131.131	129.508	126.872	122.410	114.903	128.085	133.155	137.211	141.870	132.944	130.113	136.996	132.331	128.276	120.975	115.499	117.325	114.896	131.111	143.481	151.795	147.938	139.623	128.673	115.085	107.178	138.403	119.138	114.879	140.629	131.504	130.287	134.744	137.782	134.943	118.923	135.953	134.124	129.055	122.970	124.994	117.690	133.102	149.925	130.843	136.517	127.796	127.980
    ]';  % year, cm, age and standard length at f and T
[Y,I]=sort(data.tL81(:,1)); data.tL81=data.tL81(I,:); % sort rows
data.tL81(:,1) = data.tL81(:,1)* 365; % year to day
units.tL81   = {'d', 'cm'};  label.tL81 = {'time since birth', 'standard length'};  
temp.tL81    = C2K(37);  units.temp.tL81 = 'K'; label.temp.tL81 = 'temperature';
bibkey.tL81 = 'KrafKova2006'; comment.tL81 = 'females, Svalbard 1981-1982, fig. 2';

data.tL02 = [ ...
0.972	0.930	0.885	0.933	0.839	1.030	0.937	2.023	2.024	1.977	1.932	3.072	3.930	3.976	5.020	6.066	6.116	6.022	5.975	7.064	7.062	7.919	7.966	7.964	7.963	9.107	9.013	9.010	8.912	10.007	9.911	11.009	11.056	11.053	10.957	12.051	12.099	11.951	12.951	13.998	14.001	15.089	15.089	15.994	16.134	16.039	16.180	15.990	17.041	16.991	18.228	17.985	18.030	18.029	19.029	19.028	20.030	20.028	20.024	21.028	21.026	20.978	21.024	22.117	23.066	22.976	24.209	25.017	26.063	25.965	26.059	26.009	27.054	27.057	29.096	32.042;
75.028	94.293	101.188	103.215	106.460	110.515	118.019	98.344	99.763	101.589	109.092	111.927	123.076	119.426	116.988	120.026	127.934	131.585	133.208	122.861	116.980	124.885	122.046	116.571	114.137	127.720	131.978	119.608	110.686	118.793	116.360	135.215	133.998	125.278	122.642	127.302	130.749	110.065	120.201	126.483	139.056	125.465	123.031	133.978	126.272	123.838	120.999	119.377	140.666	131.743	140.053	121.397	112.880	110.852	119.365	116.323	134.570	127.472	111.858	135.783	130.510	128.077	123.615	125.842	123.202	139.831	133.539	136.780	140.629	133.126	128.259	119.945	122.983	132.514	121.149	128.438
    ]';  % year, cm, age and standard length at f and T
[Y,I]=sort(data.tL02(:,1)); data.tL02=data.tL02(I,:); % sort rows
data.tL02(:,1) = data.tL02(:,1)* 365; % year to day
units.tL02   = {'d', 'cm'};  label.tL02 = {'time since birth', 'standard length'};  
temp.tL02    = C2K(37);  units.temp.tL02 = 'K'; label.temp.tL02 = 'temperature';
bibkey.tL02 = 'KrafKova2006'; comment.tL02 = 'females, Svalbard 2002-2004, fig. 2';

% t-L data males  :
data.tLm81 = [ ...
0.121	0.214	0.115	0.977	0.835	2.021	1.880	1.835	2.026	1.980	1.933	1.982	1.982	2.887	2.981	2.931	2.929	2.975	3.932	3.931	3.930	3.882	3.879	3.974	3.878	3.877	5.026	4.930	5.025	4.928	4.925	5.019	5.926	5.926	5.972	5.970	5.922	5.921	6.929	7.020	6.923	6.965	7.011	7.971	7.922	7.920	7.966	8.013	7.916	7.962	8.967	8.917	8.915	9.871	9.870	9.963	9.915	9.961	9.913	9.912	11.012	10.916	10.963	10.961	10.956	10.908	10.860	11.959	11.910	11.908	13.003	12.953	13.908	13.904	13.903	13.903	13.901	13.947	13.851	14.999	14.855	14.902	14.901	14.995	14.994	15.951	15.945	16.947	16.943	16.894	16.940	17.948	17.991	17.893	18.033	17.984	19.082	18.891	18.937	18.981	17.934	20.927	19.934	20.980	21.975	23.973	24.017	23.066	23.016	24.825	25.962	26.056	28.956	29.001	27.858	29.997	30.996;
88.844	79.798	69.145	91.453	93.866	91.248	95.068	102.304	107.730	110.545	113.761	118.585	119.992	128.631	124.812	116.772	111.144	106.320	128.024	125.009	122.396	119.381	111.944	109.532	107.522	105.713	136.663	133.648	130.834	124.804	115.960	112.743	129.825	126.810	122.388	117.765	114.951	111.936	147.711	134.846	128.816	109.922	104.896	138.862	134.440	127.204	123.787	119.566	113.737	108.913	136.647	128.004	120.969	140.061	137.247	131.015	128.603	125.990	121.970	118.955	146.488	142.670	139.453	135.634	119.152	115.735	113.524	135.831	130.605	124.173	135.827	127.385	144.467	130.798	126.577	126.577	122.557	114.517	112.105	141.849	136.222	134.412	131.196	127.377	124.362	147.473	129.986	146.263	132.394	125.158	121.741	156.511	142.641	130.782	125.756	120.732	139.019	134.396	131.180	116.908	111.888	115.293	130.975	134.388	127.952	138.999	127.742	123.324	113.676	131.156	122.308	117.483	129.733	120.486	110.642	119.678	124.699
    ]';  % year, cm, age and standard length at f and T
[Y,I]=sort(data.tLm81(:,1)); data.tLm81=data.tLm81(I,:); % sort rows
data.tLm81(:,1) = data.tLm81(:,1)* 365; % year to day
units.tLm81   = {'d', 'cm'};  label.tLm81 = {'time since birth', 'standard length'};  
temp.tLm81    = C2K(37);  units.temp.tLm81 = 'K'; label.temp.tLm81 = 'temperature';
bibkey.tLm81 = 'KrafKova2006'; comment.tLm81 = 'males, Svalbard 1981-1982, fig. 2';

data.tLm02 = [ ...
0.118	0.925	0.973	0.974	0.927	1.026	0.885	0.887	1.838	1.884	2.026	2.025	1.929	3.021	2.882	2.884	2.885	3.833	3.833	3.982	4.929	4.975	4.974	4.973	4.923	4.971	5.880	5.973	6.020	6.018	6.015	6.918	7.014	6.968	6.968	6.969	6.970	6.973	7.067	7.922	7.921	7.871	8.012	8.873	8.917	9.011	8.963	9.055	10.012	10.958	10.912	10.910	12.056	10.916	10.867	11.910	11.909	11.907	11.952	11.906	13.003	12.859	13.047	13.047	13.047	12.997	14.000	13.903	14.951	14.900	14.946	15.945	16.040	16.042	17.086	16.942	17.987	17.797	17.938	17.841	17.889	19.837	19.980	18.891	18.892	20.931	20.831	21.830	21.831	21.974	21.927	21.976	22.075	20.930	24.016	24.922	24.968	26.012	29.051	30.187;
78.793	76.780	79.594	81.805	84.820	97.282	100.700	109.946	111.952	108.334	106.725	104.916	99.691	100.691	112.551	119.787	121.797	115.160	117.170	137.672	127.417	122.593	119.980	117.769	109.327	111.136	134.650	125.403	123.795	119.574	109.925	112.535	116.153	118.565	119.972	124.193	126.203	136.454	132.635	133.033	130.219	122.179	116.551	139.462	126.999	124.185	122.778	111.722	135.437	125.383	127.996	120.961	142.464	144.278	138.650	133.821	128.193	122.163	114.927	119.550	133.616	130.199	124.771	123.163	121.957	114.118	134.818	128.386	139.035	126.975	122.151	127.373	129.584	136.820	134.403	128.173	129.978	127.968	123.546	116.913	118.923	122.332	124.141	135.602	138.818	129.564	111.474	119.912	121.520	123.932	125.942	132.173	143.831	127.554	124.124	136.382	133.166	129.945	129.933	118.069
    ]';  % year, cm, age and standard length at f and T
[Y,I]=sort(data.tLm02(:,1)); data.tLm02=data.tLm02(I,:); % sort rows
data.tLm02(:,1) = data.tLm02(:,1)* 365; % year to day
units.tLm02   = {'d', 'cm'};  label.tLm02 = {'time since birth', 'standard length'};  
temp.tLm02   = C2K(37);  units.temp.tLm02 = 'K'; label.temp.tLm02 = 'temperature';
bibkey.tLm02 = 'KrafKova2006'; comment.tLm02 = 'males, Svalbard 2002-2004, fig. 2';

% t-W data females:
data.tW81 = [ ...
0.183	0.183	0.180	2.159	2.070	3.065	4.055	4.099	3.146	3.098	4.091	3.997	3.998	4.047	6.024	5.982	6.030	7.067	7.083	7.969	9.102	10.003	10.019	11.083	10.993	11.041	11.042	11.002	11.003	12.002	11.995	13.024	13.034	12.988	13.036	12.993	12.947	12.997	13.969	15.016	15.024	16.103	16.009	16.060	17.092	17.057	16.963	17.014	18.131	18.043	18.002	18.051	18.058	18.059	18.985	18.945	20.032	22.026	20.945	20.948	21.985	22.957	22.966	22.983	23.888	24.005	24.055	25.142	25.003	26.096	26.051	25.901	28.934	27.990	28.099	31.921	29.931	33.896	40.056	39.968;
11.866	12.876	17.167	34.972	25.126	23.235	30.938	36.998	48.986	50.879	53.028	51.261	49.746	45.959	67.929	56.316	55.054	64.019	34.230	59.857	65.288	60.999	32.346	79.053	70.343	67.945	66.178	52.040	50.021	42.198	55.325	79.059	59.368	56.843	55.960	46.998	45.230	39.171	82.218	71.240	55.209	74.525	73.010	65.310	83.111	61.148	58.371	53.069	89.300	76.046	64.306	61.025	47.266	46.004	85.137	71.126	75.042	64.067	49.168	43.362	51.318	92.345	75.304	43.242	33.147	80.482	75.307	79.224	74.048	65.089	60.166	75.313	70.274	64.338	36.316	60.185	63.082	86.194	73.338	60.337    
    ]';  % year, kg, age and wet weight at f and T
[Y,I]=sort(data.tW81(:,1)); data.tW81=data.tW81(I,:); % sort rows
data.tW81(:,1) = data.tW81(:,1)* 365; % year to day
data.tW81(:,2) = data.tW81(:,2)* 1e3; % kg to g
units.tW81   = {'d', 'g'};  label.tW81 = {'time since birth', 'wet weight'};  
temp.tW81    = C2K(37);  units.temp.tW81 = 'K'; label.temp.tW81 = 'temperature';
bibkey.tW81 = 'KrafKova2006'; comment.tW81 = 'females, Svalbard 1981-1982, fig. 2';

data.tW02 = [ ...
0.987	0.982	0.978	0.979	1.070	1.020	0.972	0.968	0.963	3.049	1.966	2.061	2.015	2.016	2.019	3.150	3.861	3.995	3.995	3.945	5.035	4.989	6.063	6.020	5.975	5.980	6.029	6.970	7.074	8.058	8.013	8.015	8.019	9.093	9.098	9.005	9.102	9.009	9.010	9.106	9.059	8.967	9.997	9.999	9.953	9.959	9.916	11.035	11.036	10.991	11.091	11.048	11.953	11.938	12.081	12.035	12.037	13.917	13.932	13.935	16.095	15.013	14.972	15.072	15.077	16.025	16.063	17.000	16.956	18.050	18.000	18.085	18.013	18.014	19.047	19.044	18.948	19.136	19.995	19.976	20.030	20.880	20.976	20.979	20.889	20.938	21.980	22.875	22.959	23.961	25.048	25.896	26.091	25.999	26.000	25.962	26.944	26.992	28.987	31.869;
13.005	23.986	30.298	28.783	34.968	40.270	42.037	49.232	58.320	53.151	42.166	40.904	39.137	38.001	31.184	41.160	39.016	55.174	54.290	59.087	58.080	54.167	82.950	74.241	70.201	60.987	57.074	68.185	50.008	69.198	66.295	62.382	54.177	81.193	72.231	69.201	64.278	61.249	60.239	57.210	55.821	52.160	73.117	70.466	67.058	54.940	46.862	80.442	77.286	73.120	64.158	54.313	44.343	73.376	71.230	69.210	65.297	91.180	61.138	56.089	90.303	77.046	65.559	54.199	45.742	43.220	61.145	79.324	72.003	62.161	68.346	85.260	43.100	41.081	56.105	62.038	65.445	67.971	54.719	90.063	78.955	81.482	79.968	73.278	65.578	62.422	61.290	68.361	90.199	74.045	77.204	85.285	74.051	69.507	67.109	50.194	73.171	71.151	59.166	69.904
    ]';  % year, kg, age and wet weight at f and T
[Y,I]=sort(data.tW02(:,1)); data.tW02=data.tW02(I,:); % sort rows
data.tW02(:,1) = data.tW02(:,1)* 365; % year to day
data.tW02(:,2) = data.tW02(:,2)* 1e3; % kg to g
units.tW02   = {'d', 'g'};  label.tW02 = {'time since birth', 'wet weight'};  
temp.tW02    = C2K(37);  units.temp.tW02 = 'K'; label.temp.tW02 = 'temperature';
bibkey.tW02 = 'KrafKova2006'; comment.tW02 = 'females, Svalbard 2002-2004, fig. 2';

% t-W data males:
data.tWm81 = [ ...
0.128	0.031	0.017	0.535	1.851	2.987	2.984	1.838	1.926	2.970	2.903	3.905	3.909	3.911	4.908	4.998	4.944	4.985	5.021	6.949	5.889	5.897	7.820	6.889	7.787	7.932	7.007	7.854	7.803	8.980	8.857	8.859	9.849	9.814	9.824	9.920	9.844	10.933	10.923	10.918	10.833	10.788	10.844	10.893	10.802	10.949	11.937	11.752	11.849	11.809	11.862	12.831	12.849	12.864	13.818	13.846	13.805	14.863	14.833	14.941	14.852	15.923	15.932	15.731	16.845	17.795	17.903	16.885	18.018	17.882	17.891	18.868	18.803	20.840	20.766	20.772	21.854	22.804	22.902	23.796	23.874	25.779	27.872	28.911;
10.191	11.847	21.529	23.185	30.064	30.064	31.975	39.236	44.076	42.038	56.051	50.064	47.516	45.987	44.076	47.389	51.592	56.178	64.076	73.758	52.866	47.771	60.127	48.662	50.064	47.771	32.866	36.178	38.981	43.185	63.439	61.656	64.968	56.051	49.172	47.771	34.904	34.904	42.038	44.968	71.847	69.936	64.076	62.803	60.000	56.815	60.764	58.089	56.178	51.083	47.006	65.096	52.102	41.911	69.682	50.064	45.605	67.006	55.032	45.732	41.911	54.522	47.771	89.682	71.720	69.045	60.000	43.439	45.860	41.656	35.159	47.006	59.745	58.344	44.076	40.000	44.204	42.293	39.873	76.815	55.159	47.134	40.127	42.038
    ]';  % year, kg, age and wet weight at f and T
[Y,I]=sort(data.tWm81(:,1)); data.tWm81=data.tWm81(I,:); % sort rows
data.tWm81(:,1) = data.tWm81(:,1)* 365; % year to day
data.tWm81(:,2) = data.tWm81(:,2)* 1e3; % kg to g
units.tWm81   = {'d', 'g'};  label.tWm81= {'time since birth', 'wet weight'};  
temp.tWm81    = C2K(37);  units.temp.tWm81 = 'K'; label.temp.tWm81 = 'temperature';
bibkey.tWm81 = 'KrafKova2006'; comment.tWm81 = 'females, Svalbard 1981-1982, fig. 2';

data.tWm02 = [ ...
0.878	0.920	0.870	0.867	1.001	0.903	0.899	0.892	0.937	0.873	1.863	1.963	1.965	1.968	1.876	1.976	1.883	1.987	2.896	2.947	2.904	2.907	3.012	2.966	3.893	3.851	3.854	3.872	4.860	4.916	4.924	4.882	4.884	4.890	4.941	4.943	4.902	5.906	5.862	5.915	5.871	5.920	5.874	5.876	5.834	5.790	5.934	6.839	6.938	6.810	6.864	6.961	6.962	6.919	6.921	6.881	6.977	6.932	6.896	7.845	7.898	7.806	7.858	7.860	7.910	7.964	7.777	8.871	8.928	8.889	8.845	8.901	8.856	8.908	8.958	8.920	8.880	9.816	9.868	9.793	9.856	9.811	11.751	10.910	10.829	10.878	10.857	10.861	11.860	11.758	11.797	11.836	11.874	11.824	11.815	12.813	12.918	12.876	12.937	12.859	13.834	13.858	13.805	13.798	13.749	13.749	13.792	14.835	14.818	14.915	14.826	15.856	15.908	15.912	16.854	16.793	17.814	17.854	18.010	17.830	20.901	19.848	18.836	18.834	18.761	20.802	21.931	20.818	20.965	21.715	21.818	21.926	23.906	24.794	25.827	24.868	29.874;
15.159	19.108	20.382	22.548	28.153	31.083	33.376	38.726	40.382	51.975	54.904	51.210	49.554	47.389	45.350	41.656	40.764	34.268	61.019	58.089	54.904	52.994	45.987	44.841	58.981	55.032	52.611	73.758	77.707	71.847	65.987	62.166	60.764	56.943	54.013	52.866	48.153	74.777	71.847	67.898	65.860	64.968	63.694	62.166	58.854	56.306	54.777	83.949	81.019	71.338	66.752	64.968	63.949	60.892	59.873	54.904	53.758	52.102	43.949	75.796	71.847	69.936	66.624	65.096	63.185	58.726	56.815	86.497	79.873	73.885	71.847	65.732	63.822	60.764	58.854	52.102	46.879	88.025	84.586	70.828	60.000	57.962	91.720	84.076	74.650	73.503	55.159	51.975	48.280	54.013	59.618	65.223	71.720	73.758	80.127	77.834	69.936	66.624	56.943	45.096	58.854	74.777	78.854	84.076	85.350	85.096	87.898	86.879	65.732	63.949	59.745	68.025	64.841	62.038	65.096	74.650	89.045	60.892	51.210	44.968	48.917	56.943	69.682	71.338	88.790	84.968	90.318	74.140	70.573	75.924	69.809	60.764	65.987	74.013	79.873	88.790	63.567
    ]';  % year, kg, age and wet weight at f and T
[Y,I]=sort(data.tWm02(:,1)); data.tWm02=data.tWm02(I,:); % sort rows
data.tWm02(:,1) = data.tWm02(:,1)* 365; % year to day
data.tWm02(:,2) = data.tWm02(:,2)* 1e3; % kg to g
units.tWm02   = {'d', 'g'};  label.tWm02 = {'time since birth', 'wet weight'};  
temp.tWm02   = C2K(37);  units.temp.tWm02 = 'K'; label.temp.tWm02 = 'temperature';
bibkey.tWm02 = 'KrafKova2006'; comment.tWm02 = 'females, Svalbard 2002-2004, fig. 2';

%% set weights for all real data
weights = setweights(data, []);
weights.tg = 20 * weights.Wwb;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL81'; 'tL02'}; subtitle1 = {'standard length females: 1981-82, 2002-04'};
set2 = {'tLm81'; 'tLm02'}; subtitle2 = {'standard length males: 1981-82, 2002-04'};
set3 = {'tW81'; 'tW02'}; subtitle3= {'wet weight females: 1981-82, 2002-04'};
set4 = {'tWm81'; 'tWm02'}; subtitle4= {'wet weight males: 1981-82, 2002-04'};

metaData.grp.sets = {set1; set2; set3; set4};
metaData.grp.subtitle = {subtitle1; subtitle2; subtitle3; subtitle4};

%% Discussion points
D1 = 'males and females assumed to have same parameters although slight differences are reported in maximum size and age at maturity have been reported in KrafKova2006.';
D2 = 'The parameter t_0 is fixed at 2.5 months (treated as an observation).';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'The total gestation time includes 3.5 months of delayed implantation.';
metaData.bibkey.F1 = 'AnAge'; 
F2 = 'no (or very little) dimorphism between sexes';
metaData.bibkey.F2 = 'KrafKova2006'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4QKSL'; % Cat of Life
metaData.links.id_ITIS = '622018'; % ITIS
metaData.links.id_EoL = '46559170'; % Ency of Life
metaData.links.id_Wiki = 'Pusa_hispida'; % Wikipedia
metaData.links.id_ADW = 'Pusa_hispida'; % ADW
metaData.links.id_Taxo = '67467'; % Taxonomicon
metaData.links.id_WoRMS = '159021'; % WoRMS
metaData.links.id_MSW3 = '14001068'; % MSW3
metaData.links.id_AnAge = 'Pusa_hispida'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pusa_hispida}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pusa_hispida}}';
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
bibkey = 'KrafKova2006'; type = 'Article'; bib = [ ... 
'author = {B. A. Krafft and K. M. Kovacs and A. K. Frie and T. Haug and C. Lydersen}, ' ... 
'year = {2006}, ' ...
'title = {Growth and population parameters of ringed seals (\textit{Pusa hispida}) from {S}valbard, {N}orway, 2002-2004}, ' ...
'journal = {ICES journal of marine research}, ' ...
'volume = {63}, ' ...
'number = {3}, '...
'doi = {10.1016/j.icesjms.2006.04.001}, '...
'pages = {1136--114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

