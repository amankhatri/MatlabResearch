function [mean] = calculateMean( firstMeteredReading,rawdata,numberofDatapoints)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
TRUE =1;
FALSE =0;
readingNumber = 1;
%boolean is it a mean of the first reading for the day
firstMean=TRUE;
%is it the mean of the last reading for the day
lastMean = FALSE;
sensorGlucose  = rawdata(2:end,14);
if(firstMean)
    firstMean = FALSE;
  %  when we use "{}" this mean value inside the cell <-- important keep in mind
 mean(readingNumber)= (sensorGlucose{firstMeteredReading} + sensorGlucose{firstMeteredReading+readingNumber+1}+ sensorGlucose{firstMeteredReading+readingNumber+2})/3;
  readingNumber = readingNumber+1;
  secondReading = TRUE;
 % mean(4,1) = 5   
end

try
while(readingNumber<numberofDatapoints-firstMeteredReading-4)
    if(secondReading)
        mean(readingNumber, 1) = (sensorGlucose{firstMeteredReading+readingNumber-2}+sensorGlucose{firstMeteredReading+readingNumber-1}+sensorGlucose{firstMeteredReading+readingNumber+1}+sensorGlucose{firstMeteredReading+readingNumber+2})/4; 
        secondReading = FALSE;
        readingNumber = readingNumber+1;
    else
        mean(readingNumber, 1) = (sensorGlucose{firstMeteredReading+readingNumber-2}+sensorGlucose{firstMeteredReading+readingNumber-1}+sensorGlucose{firstMeteredReading+readingNumber+1}+sensorGlucose{firstMeteredReading+readingNumber+2})/4; 
        readingNumber = readingNumber+1;
    end
end
catch exception
      readingNumber
end


end

