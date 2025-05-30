function [data, auxData, metaData, txtData, weights] = mydata_Bolinopsis_mikado

%% set metaData
metaData.phylum     = 'Ctenophora'; 
metaData.class      = 'Tentaculata'; 
metaData.order      = 'Lobata'; 
metaData.family     = 'Bolinopsidae';
metaData.species    = 'Bolinopsis_mikado'; 
metaData.species_en = 'Japanese comb jelly'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'WC0'; 'WN0'; 'Wwb'; 'Wwp'; 'Wdi'; 'R_L'}; 
metaData.data_1     = {'L-Wd';'L-Ww';'Wd-JO';'Wd-JN'; 'T-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2013 07 03];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'};   

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1 = [2019 08 19];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 08 19]; 

%% set data
% zero-variate data

data.am = 90;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'KasuIshi2002 suggest 30 d on the basis of growth curve';
 
data.Lj  = 1.5;   units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'KasuIshi2002';
  comment.Lj = 'size at metamorphosis assumed to coincide with the end of the cydippid larvae stage (range 6-10)';
data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = {'KasuIshi2002','KasuIshi2008'};
data.Li  = 12;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'KasuIshi2002';
  comment.Li = 'individuals over 100 mm were observed';

data.WC0 = 0.57;   units.WC0 = 'mug';   label.WC0 = 'carbon weight of egg';     bibkey.WC0 = 'KasuIshi2008';
data.WN0 = 0.15;   units.WN0 = 'mug';   label.WN0 = 'nitrogen weight of egg';     bibkey.WN0 = 'KasuIshi2008';
data.Wwb  = 1.8e-3; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'KasuIshi2008';
  comment.Wwb = 'based on egg diameter of 0.07 cm: pi/6*0.07^3';
data.Wwp = 1.7;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'KasuIshi2008';
data.Wdi = 2;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'KasuIshi2000a';

data.R65  = 2550;   units.R65  = '#/d'; label.R65  = 'reprod rate at 65mm';     bibkey.R65  = 'KasuIshi2008';   
  temp.R65 = C2K(22);  units.temp.R65 = 'K'; label.temp.R65 = 'temperature';
 
% uni-variate data

% length weight data
data.LWd = [...	total length, mm	dry mass, mg	
	18.078	41.912	
	21.066	73.395	
	24.226	86.63	
	24.229	100.297	
	31.091	217.81	
	33.033	285.882	
	34.079	249.293	
	36.913	399.247	
	38.121	289.742	
	40.956	444.253	
	41.101	275.668	
	41.29	348.535	
	43.07	498.633	
	44.989	434.59	
	50.268	524.984	
	53.109	720.496	
	54.317	601.88	
	54.894	893.373	
	58.053	897.497	
	60.301	710.401	
	62.273	956.145];
units.LWd   = {'mm', 'mg'};  label.LWd = {'total length', 'dry weight'};  
bibkey.LWd = 'KasuIshi2000a';
comment.LWd = ['July to December 1992 and from October to November 1993 at the Banda Marine Laboratory of Tokyo University of Fisheries, Tateyama, Chiba Prefecture. ' ...
    'Salinity = 32 - 35;  rinsed with 5% isotonic ammonium formate to remove seawater and dried upon preweighed Whatman GF/C filters in petri dishes at 90 C for 2 d.'];
%
data.LWw = [ ... TL (mm) - wet mass (g)
5.09	0.09
6.06	0.19
6.10	0.09
7.05	0.19
7.08	0.29
8.04	0.29
8.11	0.19
9.14	0.29
10.04	0.58
10.11	0.48
11.14	0.48
11.20	0.99];
data.LWw(:,1) = data.LWw(:,1)/ 10; % convert mm to cm
units.LWw   = {'cm', 'g'};  label.LWw = {'total length', 'dry weight'};  
bibkey.LWw = 'KasuIshi2000a';
comment.LWw = ['After excess water around the body was removed with tissue paper, 13 larvae of B. mikado with their TL ranging from 5 to 13 mm ' ...
    'were individually placed on a preweighed petridish, and wet weight (WW) was measured on an electric balance with a precision of 0.1 g'];

% dioxygen consumption  at 22 C:
data.WdJO = [ ...	dry mass,g	mu l O2/h	
	0.048	3.196	
	0.079	2.98	
	0.118	5.672	
	0.379	25.531	
	0.401	23.04	
	0.404	18.42	
	0.775	43.65	
	0.883	50.21	
	0.998	60.162	
	1.118	56.489	
	1.184	61.213	
	1.462	60.986	
	2.011	96.8	];
units.WdJO   = {'g', 'mul O2/h'};  label.WdJO = {'dry weight', 'O_2 consumption'};  
temp.WdJO    = C2K(22);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
bibkey.WdJO = 'KasuIshi2000a';
comment.WdJO = ['52 ctenophores ranging from 15 to 83-mm TL were used for determining respiration rate, and 20 ctenophores ranging from 18 to 67-mm TL for excretion. ' ...
  'B. mikado was incubated for 12 to 30 h at 16, 22, 27 C for respiration and 16, 22, 24 C for excretion, settings within 4 C of the water temperature when samples were collected. ' ...
  'When water temperature in the experiment and in the collected water differed by over 3 C, specimens were acclimated to the experimental temperature for 1 h. '...
  'Because respiration and excretion of B. mikado were measured during different seasons, the experimental temperatures at the high end were set differently.' ...
  'The predictions assume that the units are ml O2/h, rather than mul O2/h';];
% ammonia excretion at 22 C
data.WdJN = [...	dry mass,g	mu g-at N/h	
	0.061	0.425	
	0.132	0.82	
	0.202	0.814	
	0.23	1.436	
	0.267	1.982	
	0.306	2.189	
	0.322	3.154	
	0.376	3.412	
	0.534	5.092	
	0.899	6.985	
	1.195	8.87	];
units.WdJN   = {'g', 'mu g-at N/h'};  label.WdJN = {'dry weight', 'NH_3 production'};  
temp.WdJN    = C2K(22);  units.temp.WdJN = 'K'; label.temp.WdJN = 'temperature';
bibkey.WdJN = 'KasuIshi2000a';
comment.WdJN = 'The predictions assume that the units are mg N/h, rather than mug/h';

% temp-reprod data
TR = [ ... T (deg C) - egg/d.g Wet mass - middle wet weight (g)
22.8 24  25.75 % 1
25.7 47  22.45 % 2 
23.8 44  19    % 3
21.3 66  26.15 % 4 the authors exclude this data point (crosses fig 3 KasuIshi2008)
22.9 0.8 23.3  % 5 the authors exclude this data point (crosses fig 3 KasuIshi2008)
20.8 14  31.3  % 6
20.8 10  39.75 % 7
17.4 19  40.1  % 8
15.1 8   44.2];% 9
data.TR = TR(:,[1 2]); 
weight.TR = TR(:,3); units.weight.TR = 'g'; label.weight.TR = 'wet weight';
units.TR   = {'C', '#/d.g'};  label.TR = {'temperature', 'egg production per gram'};
treat.TR = {0}; units.treat.TR = ''; label.treat.TR = '-';
bibkey.TR = 'KasuIshi2008';
comment.TR = 'In the experiment, 59 specimens, ranging from 17 to 73 mm TL, were used to determine the egg production rate.';
  
% time-length
data.tL24 = [ ... % time since birth (d), total length (cm)
8.649	0.689
9.671	0.808
10.577	1.387
10.682	1.282
11.488	1.795
12.601	2.308
12.604	2.189
12.609	2.018
13.512	2.716
13.518	2.505
14.625	3.216
15.536	3.637
15.634	3.808
16.650	4.124
17.563	4.426
18.477	4.729
19.394	4.913];
units.tL24   = {'d', 'cm'};  label.tL24 = {'time since birth', 'total length', '24 C'};  
temp.tL24    = C2K(24);  units.temp.tL24 = 'K'; label.temp.tL24 = 'temperature';
bibkey.tL24 = 'KasuIshi2002';
%
data.tL17 = [ ... % time since birth (d), total length (cm)
17.978	0.518
19.412	0.518
20.024	0.637
21.046	0.703
21.050	0.558
22.069	0.782
22.175	0.663
22.991	0.795
23.907	1.005
24.117	0.808
25.035	0.953
26.050	1.308
26.155	1.216
26.865	1.479
28.092	1.584
29.007	1.847
29.011	1.689
30.027	2.005
30.133	1.874
31.049	2.111
31.353	2.216
32.059	2.637
32.268	2.492
33.081	2.729
34.304	2.979
34.909	3.334
36.128	3.729
37.142	4.111
37.647	4.361];
units.tL17   = {'d', 'cm'};  label.tL17 = {'time since birth', 'total length', '17 C'};  
temp.tL17    = C2K(17);  units.temp.tL17 = 'K'; label.temp.tL17 = 'temperature';
bibkey.tL17 = 'KasuIshi2002';

%% set weights for all real data
weights = setweights(data, []);
weights.TR([4 5]) = 0; % remove weight from the same points as the authors did
weights.Li = 2 * weights.Li;
weights.Wwb = 0 * weights.Wwb; % in view of C and N data, eggs have a watery layer
weights.Wdi = 2 * weights.Wdi;
weights.R65 = 2 * weights.R65;
weights.tL17 = 5 * weights.tL17;
weights.tL24 = 5 * weights.tL24;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 5 * weights.psd.kap;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL24','tL17'}; subtitle1 = {'Data at 24, 17 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Chemical pars are assumed to relate to ash-free dry mass; MaleFaga1993 report ash free dry mass over dry mass ratio of 0.263 - 0.297 with mean 0.279, which makes del_W = 3.5842';
D2 = 'mod_1: tL data added to determine growth; the low respiration and excretion is incompatible with the high growth; predicted fluxes have been divided by 1e3 to match observations';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'After hatching _B. mikado_ passes through a cydippid larva stage with a pair of tentacles';
metaData.bibkey.F1 = 'KasuIshi2000a'; 
F2 = 'B. mikado loses its tentacles at a total length (TL) of ca. 15 mm, becoming similar to the adult morphology'; 
metaData.bibkey.F2 = 'KasuIshi2000b'; 
F3 = 'In Japanese coastal waters, B. mikado is the predominant ctenophore species and is most abundant from late summer to mid-fall in Tokyo Bay';
metaData.bibkey.F3 = 'KasuIshi2008'; 
F4 = 'The Total length (TL) of larval B. mikado is considered the length from the aboral pole to the mouth; For larvae with  developing oral lobes and for the post-larvae, TL is the length from the aboral pole to the end of the lobes';
metaData.bibkey.F4 = 'KasuIshi2002'; 
F5 = 'The ammonia and phosphate excreted by  B. mikado population might represent around 21% of the standing stock of nutrient in the seawater of Tokyo Bay';
metaData.bibkey.F5 = 'KasuIshi2000a'; 
F6 = 'Hermaphrodite';
metaData.bibkey.F6 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4, 'F5',F5, 'F6',F6);

%% Links
metaData.links.id_CoL = 'MDDB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46544763'; % Ency of Life
metaData.links.id_Wiki = 'Bolinopsis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '86084'; % Taxonomicon
metaData.links.id_WoRMS = '265201'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://nl.wikipedia.org/wiki/Bolinopsis_mikado}}';
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
bibkey = 'KasuIshi2000a'; type = 'Article'; bib = [ ... 
'author = {Kasuya. T. and Ishimaru, T. and Murano, M.}, ' ... 
'year = {2000}, ' ...
'title = {Metabolic characteristics of the lobate ctenophore \emph{Bolinopsis mikado} ({M}oser)}, ' ...
'journal = {Plankton Biol. Ecol.}, ' ...
'volume = {47}, ' ...
'pages = {114-121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KasuIshi2000b'; type = 'Article'; bib = [ ... 
'author = {Kasuya, T. and T. Ishimaru and M. Murano}, ' ... 
'year = {2000}, ' ...
'title = {Seasonal variations in abundance and size composition of the lobate ctenophore \emph{Bolinopsis mikado} ({M}oser) in {T}okyo {B}ay, central {J}apan}, ' ...
'journal = {J. Oceanogr}, ' ...
'volume = {56}, ' ...
'number = {4}, '...
'pages = {419--427}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KasuIshi2002'; type = 'Article'; bib = [ ... 
'author = {Kasuya, T. and Ishimaru, T. and Murano, M.}, ' ... 
'year = {2002}, ' ...
'title = {Laboratory study of growth of the lobate ctenophore \emph{Bolinopsis mikado} ({M}oser)}, ' ...
'journal = {Plankton Biol. Ecol.}, ' ...
'volume = {49}, ' ...
'pages = {81--87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KasuIshi2008'; type = 'Article'; bib = [ ... 
'author = {Kasuya, T. and Ishimaru, T. and Murano, M.}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive characteristics of the lobate ctenophore \emph{Bolinopsis mikado} ({M}oser)}, ' ...
'journal = {Plankton Benthos Res.}, ' ...
'volume = {3}, ' ...
'number = {2}, '...
'pages = {72-77}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaleFaga1993'; type = 'Article'; bib = [ ... 
'author = {Malej, A. and Faganeli, J. and Pezdic, J.}, ' ... 
'year = {1993}, ' ...
'title = {Stable isotope and biochemical fractionation in the marine pelagic food chain: the jellyfish \emph{Pelagia noctiluca} and net zooplankton}, ' ...
'journal = {Marine  Biology}, ' ...
'volume = {116}, ' ...
'pages = {565--570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

