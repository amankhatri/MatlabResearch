function [mean] = calculateSlope( mean, readingNumber )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%calculating slope.
reading = 2
try
    while(reading<=readingNumber)
        %to calculate absolute value of slope uncomment this line
        %mean(reading+1,2) = abs(mean(reading,1)-mean(reading+1,1));
        mean(reading+1,2) = (mean(reading,1)-mean(reading+1,1));
        reading = reading+1;
    end
catch exception
    reading;
end

end

