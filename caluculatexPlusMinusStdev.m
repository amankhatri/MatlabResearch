function [stdev] = caluculatexPlusMinusStdev(stdev,numberofDatapoints,firstMeteredReading)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
reading =2;
while(reading<numberofDatapoints- firstMeteredReading-4)
    stdev(reading,9) = stdev(reading,7)+ stdev(reading,8);
    stdev(reading,10) = stdev(reading,7)- stdev(reading,8);
    reading = reading +1;
end

end

