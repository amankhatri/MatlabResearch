function [ Data ] = setMinMax( Data )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
minval = -3; maxval =3;
for k = 1:Data.count
    v = Data.Value{k};
    
    if v>maxval || v<minval
        if v >maxvalue
           Data.Value{k} = maxval;
        else
            Data.Value{k} = minval;
        end
    end
end
end

