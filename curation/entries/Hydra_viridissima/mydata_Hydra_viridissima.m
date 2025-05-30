function [data, auxData, metaData, txtData, weights] = mydata_Hydra_viridissima

%% set metaData
metaData.phylum     = 'Cnidaria'; 
metaData.class      = 'Hydrozoa'; 
metaData.order      = 'Anthomedusae'; 
metaData.family     = 'Hydridae';
metaData.species    = 'Hydra_viridissima'; 
metaData.species_en = 'Green hydra'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', 'biFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'biAa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Ob'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Vb'; 'Vp'; 'Vi'; 'Ri'}; 
metaData.data_1     = {'t-A'; 't-V'; 't-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 10 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 01 06];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 06]; 

%% set data
% zero-variate data

data.ab = 1.5;    units.ab = 'd';     label.ab = 'age at birth';          bibkey.ab = 'MassRoch2008';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 7;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'MassRoch2008';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2e4;    units.am = 'd';     label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'this life span is artificial';

data.Vb  = 0.02;  units.Vb  = 'mm^3'; label.Vb  = 'volume at birth';      bibkey.Vb  = 'MassRoch2008';
data.Vp  = 0.14;  units.Vp  = 'mm^3'; label.Vp  = 'volume at puberty';    bibkey.Vp  = 'MassRoch2008';
data.Vi  = 1.12;  units.Vi  = 'mm^3'; label.Vi  = 'ultimate volume';      bibkey.Vi  = 'MassRoch2008';

data.Ri  = 5/1.5; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Kali2011';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% tL-data from MassRoch2008: T = 273 + 20
tLD1 = [ ... % time (d), length (mm), diameter (mm)
1 1.2 0.08
2 1.2 0.08
3 1.6 0.08
4 1.8 0.12
5 1.8 0.12];
tV1 = [tLD1(:,1), pi * tLD1(:,2) .* tLD1(:,3).^2]; tV1 = [tV1, 10./tV1(:,2).^2];
tA1 = [tLD1(:,1), pi * tLD1(:,2) .* tLD1(:,3)]; tA1 = [tA1, 10./tA1(:,2).^2];
%
tLD2 = [ ... % time (d), length (mm), diameter (mm)
1 1.2 0.12
2 2.0 0.12
3 2.0 0.12];
tV2 = [tLD2(:,1), pi * tLD2(:,2) .* tLD2(:,3).^2]; tV2 = [tV2, 10./tV2(:,2).^2];
tA2 = [tLD2(:,1), pi * tLD2(:,2) .* tLD2(:,3)]; tA2 = [tA2, 10./tA2(:,2).^2];
%
tLD3 = [ ... % time (d), length (mm), diameter (mm)
1 1.2 0.08
2 2.0 0.12
3 2.0 0.12
4 2.0 0.12
5 2.0 0.12
6 2.0 0.12];
tV3 = [tLD3(:,1), pi * tLD3(:,2) .* tLD3(:,3).^2]; tV3 = [tV3, 10./tV3(:,2).^2];
tA3 = [tLD3(:,1), pi * tLD3(:,2) .* tLD3(:,3)]; tA3 = [tA3, 10./tA3(:,2).^2];
%
tLD4 = [ ... % time (d), length (mm), diameter (mm)
1 0.8  0.08
2 2.4  0.08
3 2.52 0.08
4 2.8  0.08
5 2.8  0.08
6 2.8  0.12
7 3.0  0.12];
tV4 = [tLD4(:,1), pi * tLD4(:,2) .* tLD4(:,3).^2]; tV4 = [tV4, 10./tV4(:,2).^2];
tA4 = [tLD4(:,1), pi * tLD4(:,2) .* tLD4(:,3)]; tA4 = [tA4, 10./tA4(:,2).^2];
%
tLD5 = [ ... % time (d), length (mm), diameter (mm)
1 1.2 0.08
2 1.6 0.08
3 1.8 0.08
4 1.8 0.08
5 2.4 0.08
6 2.4 0.08
7 2.4 0.08];
tV5 = [tLD5(:,1), pi * tLD5(:,2) .* tLD5(:,3).^2]; tV5 = [tV5, 10./tV5(:,2).^2];
tA5 = [tLD5(:,1), pi * tLD5(:,2) .* tLD5(:,3)]; tA5 = [tA5, 10./tA5(:,2).^2];
%
tLD6 = [ ... % time (d), length (mm), diameter (mm)
1 2.0  0.12
2 2.48 0.12];
tV6 = [tLD6(:,1), pi * tLD6(:,2) .* tLD6(:,3).^2]; tV6 = [tV6, 10./tV6(:,2).^2];
tA6 = [tLD6(:,1), pi * tLD6(:,2) .* tLD6(:,3)]; tA6 = [tA6, 10./tA6(:,2).^2];
%
tLD7 = [ ... % time (d), length (mm), diameter (mm)
1 0.8 0.08
2 1.2 0.12
3 1.4 0.12
4 1.6 0.16
5 2.0 0.16];
tV7 = [tLD7(:,1), pi * tLD7(:,2) .* tLD7(:,3).^2]; tV7 = [tV7, 10./tV7(:,2).^2];
tA7 = [tLD7(:,1), pi * tLD7(:,2) .* tLD7(:,3)]; tA7 = [tA7, 10./tA7(:,2).^2];
%
tV = [1:7;
    [(tV1(1,2) + tV2(1,2) + tV3(1,2) + tV4(1,2) + tV5(1,2) + tV6(1,2) + tV7(1,2))/7, ...
     (tV1(2,2) + tV2(2,2) + tV3(2,2) + tV4(2,2) + tV5(2,2) + tV6(2,2) + tV7(2,2))/7, ...
     (tV1(3,2) + tV2(3,2) + tV3(3,2) + tV4(3,2) + tV5(3,2) +            tV7(3,2))/6, ...
     (tV1(4,2) +            tV3(4,2) + tV4(4,2) + tV5(4,2) +            tV7(4,2))/5, ...
     (tV1(5,2) +            tV3(5,2) + tV4(5,2) + tV5(5,2) +            tV7(5,2))/5, ...
     (                      tV3(6,2) + tV4(6,2) + tV5(6,2)                      )/3, ...
     (                                 tV4(7,2) + tV5(7,2)                      )/2]]';
%
data.tVs = [1:7; % mean volume of selected individuals
    [(tV1(1,2) +            tV3(1,2) + tV4(1,2) +                       tV7(1,2))/4, ...
     (tV1(2,2) +            tV3(2,2) + tV4(2,2) +                       tV7(2,2))/4, ...
     (tV1(3,2) +            tV3(3,2) + tV4(3,2) +                       tV7(3,2))/4, ...
     (tV1(4,2) +            tV3(4,2) + tV4(4,2) +                       tV7(4,2))/4, ...
     (tV1(5,2) +            tV3(5,2) + tV4(5,2) +                       tV7(5,2))/4, ...
     (                      tV3(6,2) + tV4(6,2)                                 )/2, ...
     (                                 tV4(7,2)                                 )/1]]';
units.tVs  = {'d', 'mm^3'};  label.tVs = {'time since birth', 'volume'};  
temp.tVs   = C2K(20);  units.temp.tVs = 'K'; label.temp.tVs = 'temperature';
bibkey.tVs = 'MassRoch2008';
comment.tVs = ['illuminated at 800 lux with a photoperiod of 12 hours light: 12 hours dark, ' ...
    'and were fed on neonates of the cladoceran Ceriodaphnia silvestrii (3 or 4 neonates per hydra, 3 times a week). ' ...
    'Recipient media were changed twice a week. ' ...
    'Start of growth-data coincides with bud being independent. ' ...
    'end of growth-data coincides with appeareance of first bud. '];
%    
data.tAs = [1:7; % mean surface area of selected individuals
    [(tA1(1,2) +            tA3(1,2) + tA4(1,2) +                       tA7(1,2))/4, ...
     (tA1(2,2) +            tA3(2,2) + tA4(2,2) +                       tA7(2,2))/4, ...
     (tA1(3,2) +            tA3(3,2) + tA4(3,2) +                       tA7(3,2))/4, ...
     (tA1(4,2) +            tA3(4,2) + tA4(4,2) +                       tA7(4,2))/4, ...
     (tA1(5,2) +            tA3(5,2) + tA4(5,2) +                       tA7(5,2))/4, ...
     (                      tA3(6,2) + tA4(6,2)                                 )/2, ...
     (                                 tA4(7,2)                                 )/1]]';
units.tAs  = {'d', 'mm^2'};  label.tAs = {'time since birth', 'surface area'};  
temp.tAs   = C2K(20);  units.temp.tAs = 'K'; label.temp.tAs = 'temperature';
bibkey.tAs = 'MassRoch2008';

% data.tN = [ ... % time (d), population numbers
%  5   6.9
% 15  17.5 
% 25  20.9
% 35  26.7
% 45  48.5
% 55  72.8
% 65 109.1];
% units.tN  = {'d', '#'};  label.tN = {'time', 'number of individuals'};  
% temp.tN   = C2K(20);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
% bibkey.tN = 'MassRoch2008';

% reprod data from Kali2011 for males; guessed temp: 20 C
data.AN = [ ... % A = pi * L * D (mm^2); N: number of buds
    1.9 1
    3.2 2
    3.5 3
    3.8 5];
% R(A) = N/ ab;
units.AN  = {'mm^2', '#'};  label.AN = {'surface area', 'number of buds'};  
temp.AN   = C2K(20);  units.temp.AN = 'K'; label.temp.AN = 'temperature';
bibkey.AN = 'Kali2011';
comment.AN = 'Data for males; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
%weights.tN = 0 * weights.tN;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D4 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% Facts
F1 = 'Medusa stage is absent in Hydra; this species is symbiontic with algae';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3N2DN'; % Cat of Life
metaData.links.id_ITIS = '50859'; % ITIS
metaData.links.id_EoL = '1006246'; % Ency of Life
metaData.links.id_Wiki = 'Hydra_viridissima'; % Wikipedia
metaData.links.id_ADW = 'Hydra_viridissima'; % ADW
metaData.links.id_Taxo = '168318'; % Taxonomicon
metaData.links.id_WoRMS = '290156'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hydra_viridissima}}';
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
bibkey = 'MassRoch2008'; type = 'Article'; bib = [ ... 
'author = {Massaro, F. C. and Rocha, O.}, ' ... 
'year = {2008}, ' ...
'title = {Development and population growth of \emph{Hydra viridissima} Pallas, 1766 ({C}nidaria, {H}ydrozoa) in the laboratory}, ' ...
'journal = {Braz. J. Biol.}, ' ...
'volume = {68}, ' ...
'number = {2}, '...
'pages = {379--383}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kali2011'; type = 'Article'; bib = [ ... 
'author = {Kaliszewicz, A.}, ' ... 
'year = {2011}, ' ...
'title = {Interference of asexual and sexual reproduction in the green hydra}, ' ...
'journal = {Ecol Res}, ' ...
'volume = {26}, ' ...
'pages = {147-152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

