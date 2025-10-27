clear
car(1) = struct('bhp',39,'colour','beige','weight',436,'wheels',3,'fuel_type','petrol','model_name','Reliant Robin');
car(2)= struct('bhp',651,'colour','red','weight',1400,'wheels',4,'fuel_type','hybrid','model_name','Ferrari Enzo');
car(3) = struct('bhp',201,'colour','blue','weight',1747,'wheels',4,'fuel_type','electric','model_name','Volkswagen ID3');

for i = 1:length(car)
    car(i).pwr = car(i).bhp / car(i).weight;
end

[~, idx] = sort([car.pwr], 'descend');
car = car(idx);
disp(car)