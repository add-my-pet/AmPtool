function [data, auxData, metaData, txtData, weights] = mydata_Ptilosarcus_gurneyi

%% set metaData
metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Anthozoa'; 
metaData.order      = 'Pennatulacea'; 
metaData.family     = 'Pennatulidae';
metaData.species    = 'Ptilosarcus_gurneyi'; 
metaData.species_en = 'Orange sea pen'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 25]; 

%% set data
% zero-variate data

data.tp = 5*365;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Birk1974';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15*365;    units.am = 'd';     label.am = 'life span';             bibkey.am = 'Birk1974';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'this is the highest age in tL data, but it is still growing fast at this age';

data.Lp  = 12;  units.Lp  = 'cm'; label.Lp  = 'style height at puberty';    bibkey.Lp  = 'Birk1974';
data.Li  = 33;  units.Li  = 'cm'; label.Li  = 'ultimate style height';      bibkey.Li  = 'Birk1974';

data.Wwb  = 8.7e-5;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';      bibkey.Wwb  = 'ADW';
  comment.Wwb = 'based on egg diameter of 550 mum: pi/6*0.055^3';
data.Wwi  = 282;  units.Wwi  = 'g'; label.Wwi  = 'ultimate wet weight';      bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on ratio of style diameter/length of 0.1: pi/4*3.3^2*33';

data.Ri  = 1e5/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess'; 
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';
 
% uni-variate data
% tL-data 
data.tL = [ ... % time (yr), pen length (cm)
0.109	0.862
1.894	4.493
2.053	4.651
2.802	6.794
3.066	6.896
3.999	8.710
5.125	13.060
6.114	15.846
7.150	17.063
8.115	20.660
9.124	21.608
10.130	22.015
11.114	23.503
12.150	24.558
13.212	25.613
14.224	27.695
15.264	29.885];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'pen length'};  
temp.tL   = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Birk1974';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 4;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Aging at individual level hardly occurs, since cell differentiation is reversible';
D2 = 'A new bud is formed as soon as the earlier one steps off';
D3 = 'Bud is treated similar to foetus';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Total height is twice the style height';
metaData.bibkey.F1 = 'Birk1974';  
F2 = 'Planula does not feed anf settles quickly';
metaData.bibkey.F2 = 'ADW';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4Q8FL'; % Cat of Life
metaData.links.id_ITIS = '52424'; % ITIS
metaData.links.id_EoL = '46549421'; % Ency of Life
metaData.links.id_Wiki = 'Ptilosarcus_gurneyi'; % Wikipedia
metaData.links.id_ADW = 'Ptilosarcus_gurneyi'; % ADW
metaData.links.id_Taxo = '114546'; % Taxonomicon
metaData.links.id_WoRMS = '290947'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ptilosarcus_gurneyi}}';
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
bibkey = 'Birk1974'; type = 'Article'; bib = [ ... 
'author = {C. Birkeland}, ' ... 
'year = {1974}, ' ...
'title = {INTERACTIONS BETWEEN A SEA PEN AND SEVEN OF ITS PREDATORS}, ' ...
'journal = {Ecological Monographs}, ' ...
'volume = {44}, ' ...
'pages = {211--232}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Ptilosarcus_gurneyi/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

