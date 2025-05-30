function [data, auxData, metaData, txtData, weights] = mydata_Metridium_senile

%% set metaData
metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Anthozoa'; 
metaData.order      = 'Actiniaria'; 
metaData.family     = 'Metridiidae';
metaData.species    = 'Metridium_senile'; 
metaData.species_en = 'Frilled anemone'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN','MPE'};
metaData.ecoCode.habitat = {'0iMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-A','A-Ww','Ww-WwR'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 02 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 02 01]; 

%% set data
% zero-variate data

data.am = 15*365;    units.am = 'd';     label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb  = 8.7e-5;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';      bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 550 mum: pi/6*0.055^3';
data.Wwp  = 0.37;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';      bibkey.Wwp  = 'Buck1987a';
  comment.Wwp = 'based on smallest value in WWR-data';
data.Wwi  = 396;  units.Wwi  = 'g'; label.Wwi  = 'ultimate wet weight';      bibkey.Wwi  = 'Wiki';
  comment.Wwi = 'based on height 30 cm, width 4.1 cm (from photo): 30*pi*4.1^2/4';
 
% uni-variate data
% tA-data 
data.tA = [ ... % time (d), pedal disc area (cm^2)
0   	5.065
28.456	8.791
59.416	15.717
88.180	18.030
120.846	24.063
149.895	29.575
182.062	30.028
210.120	34.423
239.736	36.290
271.705	34.510
301.212	45.156
363.663	44.946
395.837	45.473];
units.tA  = {'d', 'cm^2'};  label.tA = {'time', 'pedal disc area'};  
temp.tA   = C2K(15);  units.temp.tA = 'K'; label.temp.tA = 'temperature';
bibkey.tA = 'Buck1987';
comment.tA = 'Temperature is guessed; laboratory conditions';

% AW-data 
data.AW = [ ... % wet weight (g), pedal disc area (cm^2)
0.185	0.277
0.188	0.373
0.282	0.235
0.286	0.368
0.286	0.290
0.287	0.874
0.289	0.122
0.291	0.709
0.353	1.251
0.370	0.374
0.374	1.063
0.376	1.613
0.391	1.329
0.413	0.364
0.433	0.544
0.434	0.469
0.436	0.660
0.476	0.490
0.477	0.369
0.477	2.081
0.490	0.586
0.508	0.681
0.528	2.146
0.560	1.716
0.564	1.435
0.565	0.865
0.620	1.183
0.633	1.718
0.633	1.458
0.645	0.545
0.654	0.642
0.685	1.995
0.696	1.334
0.741	2.387
0.753	1.296
0.755	0.758
0.769	1.967
0.816	1.240
0.821	1.597
0.826	2.498
0.841	0.704
0.859	1.022
0.888	1.939
0.904	0.894
0.918	0.580
0.940	2.390
0.951	0.704
0.955	1.599
0.963	1.223
0.969	1.941
1.013	1.069
1.033	2.392
1.046	0.493
1.052	0.855
1.057	1.600
1.060	0.737
1.084	4.278
1.120	1.463
1.135	2.062
1.136	1.699
1.146	1.086
1.159	2.820
1.181	0.674
1.268	0.882
1.350	1.726
1.382	1.088
1.383	0.896
1.396	0.516
1.396	3.804
1.411	1.488
1.457	0.599
1.482	2.433
1.489	4.830
1.494	1.861
1.584	1.534
1.603	2.955
1.606	1.807
1.672	3.865
1.675	2.435
1.683	4.762
1.786	3.092
1.864	3.811
1.883	1.535
1.895	2.131
2.046	4.108
2.098	1.680
2.236	2.333
2.418	3.145
2.451	4.237
2.485	5.299
2.545	2.670
2.643	1.658
2.660	1.983
2.809	5.148
2.936	4.180
2.969	9.921
2.972	7.816
3.743	8.434
4.682	8.077
4.794	4.795];
data.AW = data.AW(:,[2 1]);
units.AW  = {'cm^2','g'};  label.AW = {'pedal disc area','wet weight'};  
bibkey.AW = 'Buck1987a';

data.WWR = [ ... % wet weight (g), gonad area (mm^2)
0.373	6.558
0.373	5.296
0.384	3.323
0.385	1.441
0.399	1.892
0.520	8.454
0.523	25.592
0.536	1.931
0.589	9.322
0.591	0.118
0.637	19.896
0.645	6.323
0.645	5.008
0.678	26.123
0.687	7.533
0.692	9.149
0.698	11.329
0.782	29.947
0.787	3.533
0.807	6.579
0.814	9.705
0.817	2.539
0.834	21.529
0.861	3.534
0.871	1.756
0.879	1.503
0.883	7.396
0.884	4.639
0.890	9.708
0.937	24.203
0.969	42.526
0.973	13.779
0.981	17.398
0.981	0.640
0.984	0.262
0.997	32.401
1.037	7.845
1.038	6.094
1.084	10.502
1.089	44.233
1.100	37.866
1.103	12.269
1.113	14.901
1.174	13.264
1.175	11.136
1.184	16.748
1.192	38.622
1.213	46.006
1.215	27.759
1.223	52.711
1.264	8.006
1.275	9.536
1.283	18.825
1.285	12.518
1.293	35.746
1.331	14.912
1.347	0.267
1.363	46.932
1.389	30.609
1.400	54.831
1.414	37.177
1.419	11.814
1.465	46.946
1.500	0.257
1.562	25.216
1.563	21.586
1.564	0.858
1.589	33.751
1.632	1.795
1.633	1.567
1.645	50.766
1.687	102.191
1.700	153.689
1.704	65.364
1.737	44.320
1.740	27.802
1.789	19.598
1.842	8.500
1.883	47.918
1.897	79.419
1.921	24.276
1.971	36.512
2.008	30.067
2.041	50.812
2.058	60.524
2.072	139.576
2.158	27.291
2.194	42.673
2.225	169.563
2.226	6.356
2.286	7.426
2.292	68.039
2.299	21.621
2.303	13.302
2.322	15.539
2.332	82.638
2.469	28.389
2.493	20.011
2.646	64.225
2.680	16.806
2.736	160.100
2.797	38.761
2.814	104.421
2.816	81.112
2.820	48.942
3.106	98.550
3.167	59.468
3.199	43.579
3.277	117.409
3.369	84.390
3.593	48.992
3.811	190.963
3.919	134.618
4.169	198.605
4.253	94.919
4.256	78.157
4.615	73.756
4.956	89.602
5.566	104.723
7.026	124.858];
data.WWR(:,2) = (4*pi/3)*(data.WWR(:,2)/(1e3*pi)).^1.5; % convert surface area to volume in cm^3
units.WWR  = {'g', 'g'};  label.WWR = {'wet weight', 'gonad weight'};  
temp.WWR   = C2K(15);  units.temp.WWR = 'K'; label.temp.WWR = 'temperature';
bibkey.WWR = 'Buck1987a';
comment.WWR = 'Temperature is guessed; field conditions; gonad area A is convert to weight by (4*pi/3)*(A/pi)^1.5';

%% set weights for all real data
weights = setweights(data, []);
weights.tA = weights.tA * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Planula stays 1 to 6 months in the plankton';
metaData.bibkey.F1 = 'Wiki';  
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '42J2K'; % Cat of Life
metaData.links.id_ITIS = '52737'; % ITIS
metaData.links.id_EoL = '421495'; % Ency of Life
metaData.links.id_Wiki = 'Metridium_senile'; % Wikipedia
metaData.links.id_ADW = 'Metridium_senile'; % ADW
metaData.links.id_Taxo = '11981'; % Taxonomicon
metaData.links.id_WoRMS = '100982'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Metridium_senile}}';
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
bibkey = 'Buck1987'; type = 'Article'; bib = [ ... 
'author = {Ann Bucklin}, ' ... 
'year = {1987}, ' ...
'title = {Growth and asexual reproduction of the sea anemone \emph{Metridium}: comparative laboratory studies of three species}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {110}, ' ...
'pages = {41-52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Buck1987a'; type = 'Article'; bib = [ ... 
'author = {Ann Bucklin}, ' ... 
'year = {1987}, ' ...
'title = {Adaptive advantages of patterns of growth and asexual reproduction of the sea anemone \emph{Metridium senile} ({L},) in intertidal and submerged populations}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {110}, ' ...
'pages = {225-243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

