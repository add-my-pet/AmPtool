function [data, auxData, metaData, txtData, weights] = mydata_Cyanea_capillata

%% set metaData

metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Scyphozoa'; 
metaData.order      = 'Semaeostomeae'; 
metaData.family     = 'Cyaneidae';
metaData.species    = 'Cyanea_capillata'; 
metaData.species_en = 'Lion''s mane jellyfish';

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPN', 'MAN', 'MN'};
metaData.ecoCode.habitat = {'0iMp', 'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Aa','Os'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author  = {'Bas Kooijman','Starrlight Augustine'};                  
metaData.date_subm = [2017 09 22];                      
metaData.email   = {'bas.kooijman@vu.nl'};      
metaData.address = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 22]; 

%% set data  
  
data.ap = 43;     units.ap = 'd';    label.ap = 'age at puberty of the medusae'; bibkey.ap = 'Brew1989';
  temp.ap = C2K(15);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = '28 till 58 d';
data.am = 365;     units.am = 'd';    label.am = 'life span of the medusae';     bibkey.am = 'aquariumofpacific';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '1 yr as mudusa, many as polyp';

data.Lb  = 0.5;   units.Lb  = 'cm';   label.Lb  = 'bell diameter at birth';    bibkey.Lb  = 'flickr';  
data.Lp  = 12.4;   units.Lp  = 'cm';   label.Lp  = 'bell diameter at puberty'; bibkey.Lp  = 'Brew1989';
data.Li  = 230.0;   units.Li  = 'cm';   label.Li  = 'ultimate bell diameter';  bibkey.Li  = 'Wiki';
  comment.Li = 'arm length 37 m';

data.Ni = 1.5e7;       units.Ni = '#';  label.Ni = 'cumulated # eggs';     bibkey.Ni = 'guess';
  temp.Ni = C2K(15); units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 
  comment.Ni = 'guess based on kap = 0.4';

% uni-variate data

% time-length at varying temperature
data.tL = [... Time (d) Bell diameter (cm)
 0.000	1.324
14.774	1.691
30.381	1.921
45.561	2.699
61.222	3.872
76.445	5.410
92.108	6.598
107.645	5.611
122.756	5.187
137.605	4.185];
units.tL   = {'d','cm'};  label.tL = {'time', 'bell diameter'};  
bibkey.tL = 'Brew1989';
temp.tL = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 

% length-wet weight
data.LW = [... log Bell diameter (mm) Wet weight (g)
1.622	0.658
1.696	0.896
1.706	0.960
1.713	0.777
1.715	0.842
1.721	0.995
1.730	0.777
1.737	1.064
1.747	0.906
1.761	0.896
1.776	1.134
1.790	1.173
1.800	1.119
1.802	1.188
1.802	1.208
1.802	1.252
1.819	1.114
1.821	1.243
1.821	1.351
1.833	1.198
1.844	1.238
1.855	1.391
1.884	1.436
1.895	1.450
1.897	1.351
1.897	1.480
1.897	1.505
1.906	1.421
1.906	1.525
1.909	1.465
1.918	1.500
1.923	1.584
1.956	1.569
1.971	1.579
1.995	1.807
2.061	2.401
2.091	2.272
2.161	2.342
2.177	2.490
2.194	2.540
2.333	2.817];
data.LW = 10.^data.LW; data.LW(:,1) = data.LW(:,1)/ 10; % convert mm to cm
units.LW   = {'cm', 'g'};  label.LW  = { 'bell diameter','wet weight'};  
bibkey.LW = 'Brew1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL(end-[0 1 2]) = 0;

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
D1 = 'This entry is about mudusae only; no mass of reproduction info available for the polyp stage';
D2 = 'Reproductive output is underestimated because ephyra is large relative to neonate planula';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Facts
F1 = 'eggs remain in the medusae till the 18 d of planula, which encyst before forming a polyp (planulocysts)';
metaData.bibkey.F1 = 'Brew1989';
F2 = 'Feeds mainly on copepods during max growth';
metaData.bibkey.F2 = 'Brew1989';
F3 = 'Polyp also produces cysts (stimulated by increase of temp) from which new polyps develop (podocysts); decrease of temp stimuates excystment ofpodocysts and the strobilation of polyps';
metaData.bibkey.F3 = 'BrewFein1991';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6C4NW'; % Cat of Life
metaData.links.id_ITIS = '51671'; % ITIS
metaData.links.id_EoL = '46554310'; % Ency of Life
metaData.links.id_Wiki = 'Cyanea_capillata'; % Wikipedia
metaData.links.id_ADW = 'Cyanea_capillata'; % ADW
metaData.links.id_Taxo = '11855'; % Taxonomicon
metaData.links.id_WoRMS = '135301'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyanea_capillata}}';
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
bibkey = 'Brew1989'; type = 'Article'; bib = [ ...
'author = {Brewer, R. H.}, ' ... 
'year = {1989}, ' ...
'title = {The annual pattern of feeding, growth, and sexual reproduction in \emph{Cyanea} ({C}nidaria: {S}cyphozoa) in the {N}iantic {R}iver {E}stuary, {C}onnecticut}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {176}, ' ...
'pages = {272--281}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrewFein1991'; type = 'Article'; bib = [ ...
'author = {Brewer, R. H. and Feingold, J. S.}, ' ... 
'year = {1991}, ' ...
'title = {The effect of temperature on the benthic stages of \emph{Cyanea} ({C}nidaria, {S}cyphozoa), and their seasonal distribution in the {N}iantic {R}iver {E}stuary, {C}onnecticut}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {152}, ' ...
'pages = {49--60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'flickr'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.flickr.com/photos/a_semenov/15620202340/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'aquariumofpacific'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.aquariumofpacific.org/onlinelearningcenter/species/lions_mane_jelly}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];