function edit_mydata(in)
% https://www.catalogueoflife.org/col/details/species/id/
% https://www.catalogueoflife.org/col/details/taxon/
cdCur;
nm=strsplit(fileread('empty_id_CoL.txt'),char(10));
n=size(in,2);
WD = cdEntr(nm{in(1)});
for i=1:n
  cd(['../',nm{in(i)}]);
  edit(['mydata_', nm{in(i)},'.m']);
end
cd(WD);