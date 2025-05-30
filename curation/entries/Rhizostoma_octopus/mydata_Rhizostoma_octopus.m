function [data, auxData, metaData, txtData, weights] = mydata_Rhizostoma_octopus

%% set metaData

metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Scyphozoa'; 
metaData.order      = 'Rhizostomeae'; 
metaData.family     = 'Rhizostomatidae';
metaData.species    = 'Rhizostoma_octopus'; 
metaData.species_en = 'Barrel jellyfish';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN', 'MAN'};
metaData.ecoCode.habitat = {'0iMp', 'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Aa','Os'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ni'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author  = {'Bas Kooijman','Starrlight Augustine'};                  
metaData.date_subm    = [2017 10 22];                      
metaData.email   = {'bas.kooijman@vu.nl'};      
metaData.address = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 22]; 

%% set data  
  
data.tp = 30;     units.tp = 'd';    label.tp = 'time since birth at puberty of the medusae'; bibkey.tp = 'guess';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1.5*365;  units.am = 'd';    label.am = 'life span of the medusae';   bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess beased on large max diameter, while 30 cm is more commen in autumn';

data.Lb  = 0.45;   units.Lb  = 'cm';   label.Lb  = 'bell diameter at birth';    bibkey.Lb  = 'HolsSotj2007';  
data.Lp  = 12;   units.Lp  = 'cm';   label.Lp  = 'bell diameter at puberty';    bibkey.Lp  = 'guess';
  comment.Lp = 'guess based on Cyanea capillata';
data.Li  = 90;   units.Li  = 'cm';   label.Li  = 'ultimate bell diameter';      bibkey.Li  = 'Wiki';
data.L76  = 30.0;    units.L76  = 'cm';   label.L76  = 'bell diameter at 76 d'; bibkey.L76  = 'HolsSotj2007';
  temp.L76 = C2K(15);  units.temp.L76 = 'K'; label.temp.L76 = 'temperature';
  comment.L76 = 'from Elbe area where max length is probably much smaller than 90 cm';

data.Wwb  = 5.20e-7; units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'HolsSotj2007';
  comment.Wwb = 'based on egg diameter of 100 mum: pi/6*0.01^3';
data.Wwi  = 3.5e5;   units.Wwi  = 'g';   label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'Wiki';
  comment.Wwi = 'based on 90 cm bell diamater and general spherical shape: pi/6*90^3';

data.Ni = 7e11; units.Ni = '#';  label.Ni = 'cumulated # eggs';        bibkey.Ni = 'guess';
  temp.Ni = C2K(15); units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 
  comment.Ni = 'guess based on kap = 0.6 accumulation of 1.5 yr and';

% uni-variate data

% time-length
data.tL = [... Time (d) Bell diameter (cm)
  1 0.45
  7 0.58
 14 0.77
 21 0.95
 91 2.50 % 2-3 cm
213 4
275 4.5]; 
units.tL   = {'d','cm'};  label.tL = {'time', 'bell diameter'};  
temp.tL = C2K(12.5); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'HolsSotj2007';
comment.tL = 'lab data';

% time-weight polyp (scyphistomae)
data.tW_p = [ ... % time since settlement (d), wet weight (g)
  0 5.20e-7 % planula length 110-150 mum, width 80-90 mum, settlement 1-5 d 
  2 1.43e-6 % height 130-170 mum, width 100-120 mum: pi/4*.011^2*.015 
 12 2.21e-5 % height 400-500 mum, width 200-300 mum: pi/4*.025^2*.045
 28 1.25e-4 % height 1300 mum, width 300-400 mum:    pi/4*.035^2*.13
730 4.6e-3];% height 2.3 mm, width 1.6 mm; max 24 tentacles, reaching up to 2 cm length: pi/4*.16^2*.23
units.tW_p   = {'d','g'};  label.tW_p = {'time', 'polyp wet weight'};  
temp.tW_p = C2K(12.5); units.temp.tW_p = 'K'; label.temp.tW_p = 'temperature'; 
bibkey.tW_p = 'HolsSotj2007';
comment.tW_p = '15 C in summer, 10 C in winter';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 0 * weights.Lb; % exclude length at birth since shape ephedra differs from later medusa
%weights.Ni = 0 * weights.Ni;

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
D1 = 'Polyps are assumed to differ from medusae by {p_Am} and E_Hp only and by isomorphic growth';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'polyps 2.3-24 mm high (including arms); 1-5 ephyrae per strobila; strobilation 24 d at 10 C;';
metaData.bibkey.F1 = 'HolsSotj2007';
F2 = 'budding of scyphistomae is rare, especially at low temperatures';
metaData.bibkey.F2 = 'HolsSotj2007';
F3 = 'Newly liberated ephyrae were able to catch and feed on living Artemia nauplii, and within a few days they could swim well in culture dishes';
metaData.bibkey.F3 = 'HolsSotj2007';
F4 = 'It is a favourite food of the leatherback turtle';
metaData.bibkey.F4 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '84N2T'; % Cat of Life
metaData.links.id_ITIS = '51917'; % ITIS
metaData.links.id_EoL = '46554273'; % Ency of Life
metaData.links.id_Wiki = 'Rhizostoma'; % Wikipedia
metaData.links.id_ADW = 'Rhizostoma_octopus'; % ADW
metaData.links.id_Taxo = '11875'; % Taxonomicon
metaData.links.id_WoRMS = '152203'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhizostoma_octopus}}';
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
bibkey = 'HolsSotj2007'; type = 'Article'; bib = [ ...
'author = {S. Holst and I. Sotje and H. Tiemann and G. Jarms}, ' ... 
'year = {2007}, ' ...
'title = {Life cycle of the rhizostome jellyfish \emph{Rhizostoma octopus} (L.) ({S}cyphozoa, {R}hizostomeae), with studies on cnidocysts and statoliths}, ' ...
'doi = {10.1007/s00227-006-0594-8}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {151}, ' ...
'pages = {1695-1710}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
