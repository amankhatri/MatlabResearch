function [ mean] = calculateTotalMean( mean, readingNumber )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
reading = 2;
    %initiating with some value. Do not remove this
    mean(3,14) = mean(reading,7);
 try 
    while(reading<=readingNumber)
        mean(3,14) = (mean(reading,7)+mean(3,14));
        reading =  reading+1;
    end
 catch exception
    reading;
end
    mean(3,14) = mean(3,14)/readingNumber;

end

