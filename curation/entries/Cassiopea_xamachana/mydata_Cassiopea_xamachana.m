function [data, auxData, metaData, txtData, weights] = mydata_Cassiopea_xamachana
global tT

%% set metaData

metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Scyphozoa'; 
metaData.order      = 'Rhizostomeae'; 
metaData.family     = 'Cassiopeidae';
metaData.species    = 'Cassiopea_xamachana'; 
metaData.species_en = 'Upside-down jellyfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMp', 'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'jiAa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE  = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};           
metaData.date_subm = [2024 02 18];                      
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 18]; 

%% set data  
  
data.am = 200;     units.am = 'd';    label.am = 'life span of the medusae';     bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.02;   units.Lb  = 'cm';   label.Lb  = 'bell diameter at birth';    bibkey.Lb  = 'guess';  
data.Lj  = 1;   units.Lj  = 'cm';   label.Lj  = 'bell diameter at metam';    bibkey.Lj  = 'guess'; 
data.Lp  = 5.5;   units.Lp  = 'cm';   label.Lp  = 'bell diameter at puberty';  bibkey.Lp  = 'guess';
data.Li  = 25;   units.Li  = 'cm';   label.Li  = 'ultimate bell diameter';    bibkey.Li  = 'Wiki';

data.Wwi  = 995.5;   units.Wwi  = 'g';   label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'MuffAulg2022';
  comment.Wwi = 'based on Li and Lw data: (25/0.829)^3*0.0363';

data.Ri  = 3.7e6;   units.Ri  = '#/d';   label.Ri  = 'max reprod rate';    bibkey.Ri  = 'guess';
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';

% uni-variate data

% time-length at varying temperature
data.tL = [... Time (d) oral arm appendages density per mm rhopaliar radius (#)
0	0.000 0.000 0.000 0.000 0.000 0.000
1	0.000 0.000 0.000 0.000 0.000 0.000
2	0.000 0.000 0.000 0.000 0.000 0.000
3	0.000 0.000 0.000 0.000 0.000 0.000
4	0.000 0.000 0.000 0.000 0.000 0.000
5	0.000 0.000 0.000 0.000 0.000 0.000
6	0.000 0.000 0.000 0.000 0.000 0.000
7	0.010 0.001 0.023 0.000 0.000 0.000
8	0.066 0.034 0.088 0.000 0.000 0.000
9	0.137 0.061 0.121 0.007 0.007 0.000
10	0.267 0.104 0.175 0.099 0.056 0.000
11	0.522 0.278 0.283 0.164 0.077 0.000
12	0.766 0.321 0.376 0.267 0.153 0.000
13	0.950 0.376 0.398 0.408 0.213 0.000
14	1.422 0.582 0.582 0.593 0.251 0.000
15	1.558 0.674 0.604 0.652 0.360 0.000
16	1.747 0.788 0.663 0.680 0.436 0.013
17	1.710 0.994 0.680 0.718 0.485 0.019
18	1.623 1.173 0.685 0.680 0.463 0.035
19	1.645 1.217 0.723 0.691 0.485 0.030
20	1.677 1.238 0.740 0.642 0.485 0.024
21	1.732 1.266 0.724 0.729 0.518 0.035
22	1.737 1.472 0.794 0.751 0.556 0.030
23	1.672 1.423 0.800 0.800 0.583 0.063
24	1.716 1.429 0.784 0.789 0.578 0.063
25	1.694 1.396 0.854 0.778 0.578 0.074
26	1.776 1.423 0.871 0.849 0.659 0.079
27	1.689 1.451 0.925 0.838 0.665 0.079
28	1.765 1.478 0.979 0.833 0.681 0.080
29	1.792 1.483 0.931 0.876 0.638 0.080
30	1.771 1.549 1.012 0.844 0.698 0.091
31	1.798 1.484 1.023 0.877 0.725 0.091
32	1.776 1.473 1.018 0.893 0.736 0.129
33	1.684 1.468 0.996 0.834 0.703 0.140
34	1.641 1.527 1.040 0.839 0.725 0.129
35	1.609 1.582 1.029 0.861 0.747 0.118
36	1.582 1.544 1.067 0.861 0.807 0.140
37	1.560 1.598 1.078 0.883 0.791 0.140
38	1.598 1.582 1.067 0.834 0.769 0.135
39	1.468 1.626 0.997 0.807 0.737 0.151
40	1.490 1.604 0.986 0.786 0.775 0.135
41	1.436 1.588 0.959 0.764 0.753 0.146
42	1.415 1.599 0.959 0.743 0.705 0.092
43	1.377 1.642 0.927 0.710 0.737 0.103];
units.tL   = {'d','#'};  label.tL = {'time', 'oral arm appendages density per mm rhopaliar radius'};  
temp.tL = C2K(23); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MuffAulg2022'; treat.tL = {1, {'D, 8','D, 4','L, 8','L, 4','L, 2','L, 0'}};
label.treat.tL = 'dark/light, # artemia/d';

% length-weight
data.LW = [ ... % bell diameter (mm), wet weight (mg) at 43 d
    5.62 4.55  8.29 6.53 5.71 3.19;
    9.12 3.74 36.3 17.48 9.04 1.66]';
data.LW(:,1) = data.LW(:,1)/10; % convert mm to cm
data.LW(:,2) = data.LW(:,2)/1e3; % convert mg to g
units.LW   = {'cm','g'};  label.LW = {'bell diameter', 'wet weight'};
bibkey.LW = 'MuffAulg2022';
comment.LW = 'length weight at 43 d, for data.tL';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lj = 0 * weights.Lj;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'I had to make a few of guesses to fill gaps. I based those assumptions on general results for other Scyphozoans';
metaData.bibkey.D1 = 'Arai1997';
D2 = 'This entry is about mudusae only; no mass info available for the polyp stage';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Two reproduction modes: asexual when polyp and sexual when medusae';
metaData.bibkey.F1 = 'ADW';
F2 = 'Asexual reproduction produce either new polyp (budding) or ephyrae (strobilation)';
metaData.bibkey.F2 = 'ADW';
F3 = 'This species lives in symbiosis with zooxanthellae';
metaData.bibkey.F3 = 'ADW';
F4 = 'Zooxanthellae are taken at the polyp stage and are transmitted via asexual reproduction but not via sexual reproduction';
metaData.bibkey.F4 = 'ADW';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '84MW2'; % Cat of Life
metaData.links.id_ITIS = '719074'; % ITIS
metaData.links.id_EoL = '46554200'; % Ency of Life
metaData.links.id_Wiki = 'Cassiopea_xamachana'; % Wikipedia
metaData.links.id_ADW = 'Cassiopea_xamachana'; % ADW
metaData.links.id_Taxo = '302481'; % Taxonomicon
metaData.links.id_WoRMS = '287172'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cassiopea_xamachana}}';
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
bibkey = 'MuffAulg2022'; type = 'Article'; bib = [ ...
'doi = {10.3389/fmars.2021.783876}, ' ...
'author = {Kaden McKenzie Muffett and Joleen Aulgur and Maria Pia Miglietta}, ' ... 
'year = {2022}, ' ...
'title = {Impacts of Light and Food Availability on Early Development of {C}assiopea Medusae}, ' ...
'journal = {Front. Mar. Sci.}, ' ...
'volume = {8}, ' ...
'pages = {783876}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cassiopea_xamachana/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
