function [mydata, info] = convert_mydata(my_pet)

info = 1;

txt = fileread(['mydata_', my_pet, '.m']);
n0 = strfind(txt,'metaData.T_typical');
if isempty(n0)
  info = 0; cd(WD);
  fprintf(['No set data in ', my_pet]);
  return
end

mydata = txt(1:n0-1);
eol = char([13 10]);

[climate, ecozone, habitat, embryo, migrate, food, gender, reprod] = get_eco(my_pet);
mydata = [mydata, 'metaData.ecoCode.climate = {', cell2txt(climate), '};', eol];
mydata = [mydata, 'metaData.ecoCode.ecozone = {', cell2txt(ecozone), '};', eol];
mydata = [mydata, 'metaData.ecoCode.habitat = {', cell2txt(habitat), '};', eol];
mydata = [mydata, 'metaData.ecoCode.embryo  = {', cell2txt(embryo), '};', eol];
mydata = [mydata, 'metaData.ecoCode.migrate = {', cell2txt(migrate), '};', eol];
mydata = [mydata, 'metaData.ecoCode.food    = {', cell2txt(food), '};', eol];
mydata = [mydata, 'metaData.ecoCode.gender  = {', cell2txt(gender), '};', eol];
mydata = [mydata, 'metaData.ecoCode.reprod  = {', cell2txt(reprod), '};', eol];

n1 = strfind(txt,'%% References');
if isempty(n1)
  info = 0; cd(WD);
  fprintf(['No references in ', my_pet]);
  return
end
    
mydata = [mydata, txt(n0:n1-1)];

mydata = [mydata, '%% Links', eol];
[lk, id] = get_link(my_pet); n = size(id,1);
for i = 1:n
  mydata = [mydata, 'metaData.links.', id{i,1}, ' = ''', id{i,2}, '''; % ', lk{i,2}, '', eol];
end
mydata = [mydata, eol, txt(n1:end)];

end

function txt = cell2txt(cell)
 txt = ''; 
 if ~isempty(cell)
   n = length(cell); 
   for i = 1:n
     txt = [txt, '''', cell{i}, ''', '];
   end
   txt(end) = []; txt(end) = [];
 end
end