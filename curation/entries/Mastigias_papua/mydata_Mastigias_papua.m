function [data, auxData, metaData, txtData, weights] = mydata_Mastigias_papua

global tT

%% set metaData

metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Scyphozoa'; 
metaData.order      = 'Rhizostomeae'; 
metaData.family     = 'Mastigiidae';
metaData.species    = 'Mastigias_papua'; 
metaData.species_en = 'Spotted jelly';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW', 'MI'};
metaData.ecoCode.habitat = {'0iMp', 'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'jiAa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'};  
metaData.data_1     = {'t-L_T'; 'L-Ww';'L-JO'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Nicolas Djeghri'};           
metaData.date_subm = [2017 05 23];                      
metaData.email    = {'nicolas.djeghri@univ-brest.fr'};            
metaData.address  = {'IUEM, Technopole Brest-Iroise, rue Dumont dUrville, 29280 Plouzane, France'};  

metaData.author_mod_1   = {'Bas Kooijman'};           
metaData.date_mod_1     = [2018 01 06];                      
metaData.email_mod_1    = {'bas.kooijman@vu.vl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};  

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.vl'}; 
metaData.date_acc    = [2018 01 06]; 

%% set data  
  
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth of the medusae (release of ephyrae)';  bibkey.ab = 'Sugi1965';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = 'approximate latency between begining of strobilation and release of ephyra'; 
data.aj = 15;      units.aj = 'd';    label.aj = 'age at metam of the medusae (release of ephyrae)';  bibkey.aj = 'guess';
  temp.aj = C2K(27);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 40;     units.ap = 'd';    label.ap = 'age at puberty of the medusae'; bibkey.ap = 'Sugi1963';
  temp.ap = C2K(27);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 360;     units.am = 'd';    label.am = 'life span of the medusae';     bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;   units.Lb  = 'cm';   label.Lb  = 'bell diameter at birth';    bibkey.Lb  = 'Sugi1963';  
data.Lj  = 1;   units.Lj  = 'cm';   label.Lj  = 'bell diameter at metam';    bibkey.Lj  = 'guess'; 
data.Lp  = 5.5;   units.Lp  = 'cm';   label.Lp  = 'bell diameter at puberty';  bibkey.Lp  = 'Sugi1963';
data.Li  = 20.0;   units.Li  = 'cm';   label.Li  = 'ultimate bell diameter';    bibkey.Li  = 'Hamn1982';

% uni-variate data

% time-length at varying temperature
data.tL = [... Time (d) Bell diameter (cm)
0 0.16
15 0.32
20 0.53
27 2.51
31 4.95
33 5.4
34 7.28
41 8.86
57 13.89
69 16.03];
units.tL   = {'d','cm'};  label.tL = {'time', 'bell diameter'};  
tT = [ ... time (d), temperature (C)
-7.28405 24
-5.60311 23.8310
-4.76265 22.0282
0.00000 25.0704
7.84436 23.1549
7.28404 24.9014
7.28405 25.1831
14.0078 28.3380
14.5681 29.0141
27.7354 28.5070
31.0972 28.0563
31.0973 28.6761
35.0194 29.1831
35.0195 30.3099
41.1828 30.5352
41.1829 29.5211
56.8716 27.3803
70.8794 28
68.3580 26.9859
76.7626 22.7606
77.0428 22.3099];
tT = [tT(:,1), C2K(tT(:,2))];
bibkey.tL = 'Sugi1963';

% length -  wet weight data
data.LW = [... Bell diameter (cm) Wet weight (g)
2.2 0.70
2.7 1.16
3.3 1.91
4.2 3.45
4.3 3.69
4.5 4.09
4.6 4.32
5.0 5.30
5.0 5.30
5.8 7.63
5.8 7.63
7.5 14.36
8.0 16.82
8.2 17.89
9.0 22.49
10.0 29.15
10.0 29.15
11.0 36.85
12.0 45.65
12.0 45.65
13.5 60.99
14.5 72.71
15.0 79.03
15.1 80.34
16.0 92.63];
units.LW   = {'cm', 'g'};  label.LW  = { 'bell diameter','wet weight'};  
bibkey.LW = 'Musc1986';
comment.LW = 'masses obtained indirectly via convertion factors from ikeda 2014, orignally those were in mg of proteins';

% length - respiration in medusae,
data.LJO = [... Bell diameter (cm)  Medusa respiration (mg O2/d)
2.2 2.56
2.7 6.05
3.3 4.94
4.2 6.29
4.2000001 8.68
4.5 7.28
4.6 8.76
5.0 8.86
5.0000001 13.08
5.8 16.47
5.8000001 13.79
7.5 26.01
8.0 25.24
8.2 27.58
9.0 37.06
10.0 44.00
10.0000001 40.94
11.0 59.08
12.0 73.48
12.0000001 66.20
13.5 99.18
14.5 108.99
15.0 112.34
15.1 110.60
16.0 110.62];
units.LJO   = {'cm','mg O2/d'};  label.LJO = {'bell diameter', 'Medusa respiration'};  
bibkey.LJO = 'McCl1994';
comment.LJO = 'Some values have been slightly changes (000001) to allow the code to run properly';
temp.LJO = C2K(27); units.temp.LJO = 'K'; label.temp.LJO = 'temperature'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weights.psd)
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'I had to make a few of guesses to fill gaps. I based those assumptions on general results for other Scyphozoans';
metaData.bibkey.D1 = 'Arai1997';
D2 = 'This entry is about mudusae only; no mass info availeble for the polyp stage';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Two reproduction modes: asexual when polyp and sexual when medusae';
metaData.bibkey.F1 = 'Sugi1964';
F2 = 'Asexual reproduction produce either new polyp (budding) or ephyrae (strobilation)';
metaData.bibkey.F2 = 'Sugi1964';
F3 = 'This species lives in symbiosis with zooxanthellae';
metaData.bibkey.F3 = 'Sugi1964';
F4 = 'Zooxanthellae are taken at the polyp stage and are transmitted via asexual reproduction but not via sexual reproduction';
metaData.bibkey.F4 = 'Sugi1964';
F5 = 'Zooxanthellae seem necessary for the strobilation';
metaData.bibkey.F5 = 'Sugi1964';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '3YCV5'; % Cat of Life
metaData.links.id_ITIS = '51813'; % ITIS
metaData.links.id_EoL = '46554227'; % Ency of Life
metaData.links.id_Wiki = 'Mastigias_papua'; % Wikipedia
metaData.links.id_ADW = 'Mastigias_papua'; % ADW
metaData.links.id_Taxo = '458143'; % Taxonomicon
metaData.links.id_WoRMS = '220485'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mastigias_papua}}';
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
bibkey = 'Musc1986'; type = 'Article'; bib = [ ...
'author = {Muscatine, L. and Wilkerson, F.P. and McCloskey, L.R.}, ' ... 
'year = {1986}, ' ...
'title = {Regulation of population density of symbiotic algae in a tropical marine jellyfish (\emph{Mastigias} sp.)}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {32}, ' ...
'pages = {279-290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McCl1994'; type = 'Article'; bib = [ ...
'author = {McCloskey, L.R. and Muscatine, L. and Wilkerson, F.P.}, ' ...
'year = {1994}, ' ...
'title = {Daily photosynthesis, respiration, and carbon budgets in a tropical marine jellyfish (\emph{Mastigias} sp.)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {119}, ' ...
'pages = {13--22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sugi1963'; type = 'Article'; bib = [ ...
'author = {Sugiura, Y.}, ' ...
'year = {1963}, ' ...
'title = {On the life-history of rhizostome medusae I. \emph{Mastigias papua} {L}. {A}gassiz}, ' ...
'journal = {Annotation Zoologicae Japonenses}, ' ...
'volume = {36}, ' ...
'number = {4},'...
'pages = {194--202}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
bibkey = 'Sugi1964'; type = 'Article'; bib = [ ...
'author = {Sugiura, Y.}, ' ...
'year = {1964}, ' ...
'title = {On the life-history of rhizostome medusae II. {I}ndispensability of zooxanthellae for strobilation in \emph{Mastigias papua}}, ' ...
'journal = {Embryologia}, ' ...
'volume = {8}, ' ...
'number = {3},'...
'pages = {223--233}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sugi1965'; type = 'Article'; bib = [ ...
'author = {Sugiura, Y.}, ' ...
'year = {1965}, ' ...
'title = {On the life-history of rhizostome medusae. III. {O}n the effects of temperature on the strobilation of \emph{Mastigias papua}}, ' ...
'journal = {The Biological Bulletin}, ' ...
'volume = {128}, ' ...
'number = {3},'...
'pages = {493--496}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hamn1982'; type = 'Article'; bib = [ ...
'author = {Hamner, W.M. and Gilmer, R.W. and Hamner, P.P.}, ' ...
'year = {1982}, ' ...
'title = {The physical, chemical, and biological characteristics of a stratified, saline, sulfide lake in {P}alau}, ' ...
'journal = {Limnology and Oceanography}, ' ...
'volume = {27}, ' ...
'number = {5},'...
'pages = {896--909}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Arai1997'; type = 'Book'; bib = [ ...  % gave general knowledge on scyphozoan used to fill the gaps in the literature
'author = {Arai, M.N.}, ' ...
'year = {1997}, ' ...
'title  = {A Functional Biology of Scyphozoa}, ' ...
'publisher = {Chapman \& Hall, 2-6 Boundary Row, London SE1 8HN}, ' ...
'pages = {316}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

