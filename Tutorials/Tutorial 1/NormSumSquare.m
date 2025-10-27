function sos = NormSumSquare(arr)

len = length(arr);
summed = sum(arr.^2);

if (len >= 1) && (len <=4)
    sos = summed/len;
elseif (len > 4) && (len<=8)
    sos = (summed/len)^(1/2);
elseif (len > 8)
    sos = (summed/len)^(1/3);
else
    disp('there is an error')
end