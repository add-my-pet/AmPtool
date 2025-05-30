function [data, auxData, metaData, txtData, weights] = mydata_Actinia_equina

%% set metaData
metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Anthozoa'; 
metaData.order      = 'Actiniaria'; 
metaData.family     = 'Actiniidae';
metaData.species    = 'Actinia_equina'; 
metaData.species_en = 'Beadlet anemone'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww','Ww-Wd','L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 24];

%% set data
% zero-variate data

data.am = 8*365;    units.am = 'd';     label.am = 'life span';             bibkey.am = 'ChomKame2004';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 1.5;     units.Lp  = 'cm';  label.Lp  = 'pedal disk diameter at puberty'; bibkey.Lp  = 'ChomKame2004'; 
data.Li  = 6;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'ChomKame2004';

data.Wwb  = 2.55e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';      bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on pedal disk diam of 1 mm: (0.1/6)^3*55';
data.Wwp  = 0.86;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';      bibkey.Wwp  = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (1.5/6)^3*55';
data.Wwi  = 55;  units.Wwi  = 'g'; label.Wwi  = 'ultimate wet weight';      bibkey.Wwi  = 'ChomKame2004';
 
data.Ri  = 420; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';      bibkey.Ri  = 'guess';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data
% time-wet weight
data.tW = [ ... % time (d), % change in wet weight
5.930	-0.583
13.004	7.807
21.118	16.199
29.129	22.199
41.092	26.017
48.166	36.798
62.419	42.216
71.261	41.241
80.208	53.224];
data.tW(:,2) = 19.2+0.01*data.tW(:,2); % convert % change in mass to mass 
units.tW  = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW   = C2K(23);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ChomKame2004';
comment.tW = 'individuals were fed 2 times per week at instantaneous lib; initial wet weight 1.3-86.5 g, mean 19.2 g';

% wet weight-dry weight
data.WW = [ ... % wet weight (g), dry weight (g)
1.530	0.222
1.822	0.191
3.354	0.253
4.448	0.322
7.147	0.467
8.094	0.597
8.382	0.835
8.604	0.643
11.666	0.881
19.828	1.807
21.141	1.845
22.018	1.746
22.161	2.006
23.839	2.060
24.058	2.021
25.663	2.121
28.074	1.922
43.301	3.890
45.432	2.894];
units.WW  = {'g', 'g'};  label.WW = {'wet weight', 'dry weight'};  
bibkey.WW = 'ChomKame2004';

% length-wet weight
data.LW = [ ... % pedal disk diameter (cm), wet weight (g)
1.585	1.380
1.661	1.200
1.775	2.739
2.041	1.839
2.136	4.372
2.383	6.817
2.696	8.268
2.886	8.543
2.886	7.548
3.456	11.444
4.120	21.943
4.120	19.682
4.291	21.222
4.367	23.755
4.509	21.135
4.528	27.916
4.576	25.476
4.623	23.578
5.032	45.193
5.212	43.388];
units.LW  = {'cm', 'g'};  label.LW = {'pedal disk diameter', 'wet weight'};  
bibkey.LW = 'ChomKame2004';
    
%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J  = 0; weights.psd.k = .1;;

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
F1 = 'Viviparous, embryos develop inside parent and are ejected via the arms';
metaData.bibkey.F1 = 'Wiki';  
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9T7Z'; % Cat of Life
metaData.links.id_ITIS = '52596'; % ITIS
metaData.links.id_EoL = '51258216'; % Ency of Life
metaData.links.id_Wiki = 'Actinia_equina'; % Wikipedia
metaData.links.id_ADW = 'Actinia_equina'; % ADW
metaData.links.id_Taxo = '11960'; % Taxonomicon
metaData.links.id_WoRMS = '100803'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Actinia_equina}}';
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
bibkey = 'ChomKame2004'; type = 'Article'; bib = [ ... 
'author = {O. Chomskya and Y. Kamenir and M. Hyams and Z. Dubinskya and N.E. Chadwick-Furman}, ' ... 
'year = {2004}, ' ...
'title = {Effects of feeding regime on growth rate in the {M}editerranean {S}ea anemone \emph{Actinia equina} ({L}innaeus)}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {299}, ' ...
'pages = {217-229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

