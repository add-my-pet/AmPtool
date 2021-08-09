function nm = check_status(pets)
n=length(pets); nm=cell(0,1);
for i=1:n
  [id, status_WoRMS] = get_id_WoRMS(pets{i});
  if ~isempty(id)
    [id, status_CoL] = get_id_CoL(pets{i});
    if ~strcmp(status_WoRMS,status_CoL)
      nm = [nm;pets{i}];
    end
  end
end
