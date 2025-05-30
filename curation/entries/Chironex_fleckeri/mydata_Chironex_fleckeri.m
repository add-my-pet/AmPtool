function [data, auxData, metaData, txtData, weights] = mydata_Chironex_fleckeri

%% set metaData
metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Cubozoa'; 
metaData.order      = 'Chirodropida'; 
metaData.family     = 'Chirodropidae';
metaData.species    = 'Chironex_fleckeri'; 
metaData.species_en = 'Sea wasp'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN', 'MAS'};
metaData.ecoCode.habitat = {'0bMp', 'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCik', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 10 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2018 01 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 06]; 


%% set data
% zero-variate data

data.ab = 30;   units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'GordSeym2012';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'read from tL-curve';
data.am = 200;  units.am = 'd';    label.am = 'life span';                  bibkey.am = 'GordSeym2012';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.13;   units.Lb  = 'cm'; label.Lb  = 'IPD just after metamorphosis from polyp'; bibkey.Lb  = 'GordSeym2012';
  comment.Lb = 'IPD: interpedalia distance: 0.12-0.14 cm'; 
data.Lp  = 5;   units.Lp  = 'cm';   label.Lp  = 'IPD at puberty';            bibkey.Lp  = 'GordSeym2012';
data.Li = 18.8; units.Li  = 'cm';   label.Li  = 'ultimate IPD';              bibkey.Li  = 'GordSeym2012';

data.Wwi = 18.8^3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'GordSeym2012';

data.Ri  = 1.6e5; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), IPD (cm)
24.615	4.601
32.557	1.447
33.861	1.855
34.065	2.523
34.744	1.447
34.927	3.117
35.303	5.900
35.370	2.857
35.827	1.929
35.977	5.083
36.896	3.080
36.937	1.187
37.007	8.015
37.549	3.191
37.566	2.449
37.728	5.009
37.733	4.787
37.984	3.302
38.635	3.562
38.667	2.115
38.830	4.638
39.093	2.597
39.098	2.375
39.287	3.748
39.579	10.390
39.728	3.562
39.734	3.302
39.742	2.931
39.769	1.707
39.871	7.050
40.390	3.302
40.997	5.566
41.268	3.191
41.643	6.011
41.669	4.824
41.675	4.564
41.707	3.080
41.873	5.529
42.043	7.718
42.159	2.412
42.280	6.902
42.584	3.006
42.767	4.638
42.842	1.187
42.978	5.009
43.120	8.497
43.189	5.343
43.656	3.970
43.677	3.043
43.680	2.894
44.005	8.052
44.061	5.455
44.304	4.341
44.564	2.449
44.704	6.085
44.931	5.677
44.935	5.492
45.117	7.199
45.125	6.827
45.131	6.531
45.179	4.341
45.302	8.720
45.364	5.900
45.406	3.970
45.430	2.894
45.503	9.536
45.971	8.126
46.048	4.601
46.082	3.080
46.240	5.826
46.444	6.531
46.710	4.341
46.718	4.007
46.729	3.488
47.100	6.531
47.110	6.085
47.250	9.685
47.570	5.046
47.804	4.341
47.817	3.748
47.970	6.753
48.151	8.460
48.158	8.126
48.172	7.495
48.175	7.347
48.314	11.020
48.412	6.531
48.653	5.529
48.825	7.644
48.882	5.046
48.963	1.336
49.108	4.712
49.124	3.970
49.439	9.573
49.691	8.052
49.928	7.199
49.932	7.013
49.935	6.902
50.140	7.532
50.457	13.024
50.591	6.902
50.612	5.937
50.628	5.195
50.649	4.267
50.755	9.425
50.774	8.534
50.825	6.197
50.860	4.601
50.874	3.970
51.015	7.532
51.259	6.345
51.452	7.532
51.572	12.059
51.713	5.603
51.898	7.161
52.080	8.831
52.287	9.351
52.328	7.495
52.353	6.345
52.503	9.499
52.564	6.679
52.995	6.976
53.007	6.456
53.108	11.800
53.203	7.495
53.455	5.974
53.518	3.080
53.613	8.720
53.812	9.610
53.839	8.386
54.038	9.314
54.041	9.165
54.095	6.716
54.262	9.054
54.324	6.234
54.555	5.640
54.744	7.013
54.891	10.315
54.892	10.241
54.895	10.093
54.951	7.532
55.365	8.609
55.394	7.310
55.411	6.531
55.531	11.058
55.575	9.017
55.675	4.453
55.774	9.944
56.232	8.980
56.429	9.981
56.477	7.792
56.482	7.570
56.490	7.199
56.690	8.052
56.711	7.087
56.823	11.948
56.853	10.612
57.055	11.354
57.083	10.093
57.169	6.160
57.174	5.900
57.243	12.764
57.310	9.685
57.313	9.573
57.511	10.501
57.544	8.980
57.966	9.722
57.971	9.462
57.976	9.239
58.011	7.644
58.157	10.983
58.177	10.056
58.210	8.534
58.244	7.013
58.562	12.468
58.594	10.983
58.616	9.981
58.624	9.610
58.653	8.312
58.817	10.798
58.879	7.978
58.883	7.792
59.107	7.532
59.211	12.764
59.236	11.614
59.241	11.429
59.304	8.534
59.337	7.013
59.469	10.983
59.924	10.167
59.949	9.017
59.983	7.495
59.995	6.939
60.313	12.393
60.337	11.317
60.637	7.570
61.036	9.351
61.067	7.904
61.194	12.096
61.211	11.317
61.262	8.980
61.428	11.429
61.446	10.575
61.654	11.058
61.709	8.571
61.906	9.536
62.541	10.538
62.918	13.284
62.931	12.690
63.108	14.583
63.155	12.430
63.184	11.132
63.450	8.980
63.457	8.646
63.657	9.499
64.053	11.391
64.068	10.686
64.260	11.948
64.995	8.312
65.177	10.019
65.184	9.685
65.370	11.169
65.550	12.950
65.582	11.503
65.721	15.139
65.969	13.766
66.035	10.761
66.073	9.017
66.397	14.212
66.926	10.019
67.069	13.506
67.107	11.763
67.348	10.724
67.535	12.208
67.561	10.983
67.606	8.942
67.965	12.542
68.866	11.317
69.514	11.688
70.547	14.471
70.818	12.096
71.457	12.876
71.647	14.174
72.132	12.022
72.826	10.278
75.566	14.991
76.038	13.432
76.994	9.722];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'inter pedalia distance'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GordSeym2012';
comment.tL = 'IPD is the distance between the mid line of alternate pedalia along the line passing through the rhopalia';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'At metamorphosis, juvenile C. fleckeri medusae are approximately 1.2 to 1.4 mm in size';
metaData.bibkey.F1 = 'GordSeym2012'; 
F2 = 'Age determination: daily growth rings in s tatoliths in statocysts of cubomedusae rhopalia (eye bearing sensory structures)  C. fleckeri medusae undergo an ontogenetic shift in their cnidome (and diet) that potentially explains the lethality of larger medusae to humans at 60--100 mm IPD [52], a size they would reach after ,50--65 d';
metaData.bibkey.F2 = 'GordSeym2012'; 
F3 = 'At metamorphosis, juvenile C. fleckeri medusae are approximately 1.2 to 1.4 mm in size';
metaData.bibkey.F3 = 'CarrAlde2002'; 
F4 = 'nematocyst ratio changed with increasing size, with mastigophores (nematocysts believed to hold the lethal venom component for prey) increasing in proportion. The change in cnidome ratio is correlated with a change in the prey of C. fleckeri with increased size. Small C. fleckeri appeared to feed exclusively on prawns, medium sized animals fed on fish and prawns and large animals fed predominantly on fish.';
metaData.bibkey.F4 = 'GordSeym2012'; 
F5 = 'When the polyp has reached its maximum size and receives certain environmental stimuli, it begins to metamorphose into a medusae';
metaData.bibkey.F5 = 'jcu'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '5XSVZ'; % Cat of Life
metaData.links.id_ITIS = '51478'; % ITIS
metaData.links.id_EoL = '200766'; % Ency of Life
metaData.links.id_Wiki = 'Chironex_fleckeri'; % Wikipedia
metaData.links.id_ADW = 'Chironex_fleckeri'; % ADW
metaData.links.id_Taxo = '11821'; % Taxonomicon
metaData.links.id_WoRMS = '289593'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chironex_fleckeri}}';
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
bibkey = 'GordSeym2012'; type = 'Article'; bib = [ ... 
'author = {M. Gordon and J. Seymour}, ' ... 
'year = {2012}, ' ...
'title = {Growth, Development and Temporal Variation in the Onset of Six \emph{Chironex fleckeri} Medusae Seasons: A Contribution to Understanding Jellyfish Ecology}, ' ...
'doi = {10.1371/journal.pone.0031277}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {7}, ' ...
'number = {2}, '...
'pages = {e31277}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CarrAlde2002'; type = 'Article'; bib = [ ... 
'author = {T. Carrettea and P. Aldersladeb and J. Seymour}, ' ... 
'year = {2002}, ' ...
'title = {Nematocyst ratio and prey in two {A}ustralian cubomedusans, \emph{Chironex fleckeri} and \emph{Chiropsalmus sp.}}, ' ...
'journal = {Toxicon}, ' ...
'volume = {40}, ' ...
'pages = {1547-1551}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'jcu'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.jcu.edu.au/stingers/biology 2lifecycle.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

