function [data, auxData, metaData, txtData, weights] = mydata_Haliclona_oculata

global tX tT

%% set metaData
metaData.phylum     = 'Porifera'; 
metaData.class      = 'Demospongiae'; 
metaData.order      = 'Haplosclerida'; 
metaData.family     = 'Chalinidae';
metaData.species    = 'Haliclona_oculata'; 
metaData.species_en = 'Mermaid''s glove'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN', 'MAS'};
metaData.ecoCode.habitat = {'0bMp', 'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Ob'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 17]; 

%% set data
% zero-variate data

data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.0016;  units.Wwb  = 'g';  label.Wwb  = 'wet weight of larva';  bibkey.Wwb  = 'VaceBour1987';
  comment.Wwb = 'Estimated from photo: cylinder of 1 mm diameter, 2 mm length: pi*0.05^2*0.2';
data.Wwp = 1;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'guess';
  comment.Wwp = 'No info on start egg production could be found';
data.Wwi = 100;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';     bibkey.Wwi  = 'guess';

data.Ri  = 1000/365; units.Ri  = '#/d'; label.Ri  = 'max repod rate';       bibkey.Ri  = 'guess';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'No info on spawning could be found';

% uni-variate data
% t-V data
data.tV = [ ... % time since 2015/06/01 (d), volume (cm^3)
65.996	1.753
103.708	3.165
139.400	4.299
197.315	5.303
252.537	6.071
286.208	8.555
329.308	10.01
362.306	11.87];
units.tV   = {'d', 'cm^3'};  label.tV = {'time since 2015/06/01', 'volume'};  
bibkey.tV = 'KoopWijf2008';
comment.tV = 'Volume measured with stereo photogrammetry from a single individual at 13 m deep in Oosterschelde, Netherlands, placed on pavement tile';
%
tT = [ ... % time since 2015/06/01 (d), tmeperature (C)
57.565	20.455
85.271	15.909
120.716	12.184
149.941	6.376
177.178	4.040
205.976	2.525
242.029	3.346
253.903	4.924
269.921	7.828
282.835	9.912
297.300	12.374
311.756	14.394
327.715	14.394
369.042	21.275];
%units.tT   = {'d', 'C'};  label.tT = {'time since 2015/06/01', 'volume'};  
%
tX = [ ... % time since 2015/06/01 (d), particulate organic carbon mg/L
57.390	0.347
85.511	0.307
120.519	0.421
149.788	0.204
174.465	0.255
202.586	0.280
238.742	0.243
252.516	0.565
265.142	0.471
279.489	0.268
293.836	0.488
307.610	0.869
321.958	0.436
363.852	0.427];
%units.tX   = {'d', 'mg C/L'};  label.tX = {'time since 2015/06/01', 'POM'};  

%% set weights for all real data
weights = setweights(data, []);
weights.tV = 5 * weights.tV;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Ash-free dry weight volume conversion: 0.0587 g/cm^3';
D2 = 'Isomorphy is assumed, but a bit questionable';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Hermaphroditic';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Free-swimming parenchymella larva stage before settlement';
metaData.bibkey.F2 = 'sealifebase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3JCBW'; % Cat of Life
metaData.links.id_ITIS = '47779'; % ITIS
metaData.links.id_EoL = '1158233'; % Ency of Life
metaData.links.id_Wiki = 'Haliclona_oculata'; % Wikipedia
metaData.links.id_ADW = 'Haliclona_oculata'; % ADW
metaData.links.id_Taxo = '11495'; % Taxonomicon
metaData.links.id_WoRMS = '132833'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haliclona_oculata}}';
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
bibkey = 'VaceBour1987'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {J. Vacelet and N. Boury-Esnault}, ' ...
'year = {1987}, ' ...
'title  = {Taxonomy of Porifers from the N. E. Atlantic and Mediterranean Sea}, ' ...
'publisher = {Springer}, ' ...
'series = {NATO ASI Series G: ECological Sciences}, ' ...
'volume = {13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoopWijf2008'; type = 'Article'; bib = [ ... 
'author = {Koopmans, M. and Wijffels, R. H.}, ' ... 
'year = {2008}, ' ...
'title = {Seasonal Growth Rate of the Sponge \emph{Haliclona oculata} ({D}emospongiae: {H}aplosclerida)}, ' ...
'journal = {Mar. Biotechnol.}, ' ...
'volume = {10}, ' ...
'pages = {502--510}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/summary/Haliclona-oculata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

