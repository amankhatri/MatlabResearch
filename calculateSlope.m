function [mean] = calculateSlope( mean, readingNumber,grandMean,stdev )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%calculating slope.
reading = 1
try
    while(reading<=readingNumber)
        %to calculate absolute value of slope uncomment this line
        %mean(reading+1,2) = abs(mean(reading,1)-mean(reading+1,1));
        mean(reading,8) = stdev(reading,8);
        mean(reading+1,13) = (mean(reading,7)-mean(reading+1,7));
        mean(reading,14) = grandMean(reading+1,14);
        reading = reading+1;
    end
catch exception
    reading;
end

end

