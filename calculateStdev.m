function [ mean ] = calculateStdev(mean,rawdata,numberofDatapoints,firstMeteredReading)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
TRUE =1;
FALSE =0;
readingNumber = 1;
% boolean is it a mean of the first reading for the day
 firstStd=TRUE;
% %is it the mean of the last reading for the day
 laststd = FALSE;
 sensorGlucose  = rawdata(2:end,14);
sprintf('Wierd Things happen');
 if(firstStd)
     firststd = FALSE;
%   %  when we use "{}" this mean value inside the cell <-- important keep in
%   %  mind
    mean(readingNumber+1,8) = 0;
    mean(readingNumber+1,8)= (abs((sensorGlucose{firstMeteredReading})- mean(readingNumber+1,7)))^2;
    mean(readingNumber+1,8) = (abs((sensorGlucose{firstMeteredReading+readingNumber+1})- mean(readingNumber+1,7)))^2+mean(readingNumber+1,8);
    mean(readingNumber+1,8) = (abs((sensorGlucose{firstMeteredReading+readingNumber+2})- mean(readingNumber+1,7)))^2+mean(readingNumber+1,8);
    mean(readingNumber+1,8) = sqrt(mean(readingNumber+1,8)/2);
    readingNumber = readingNumber+1;
    secondstd = TRUE;
 end
try if(secondstd)
    while(readingNumber<(numberofDatapoints- firstMeteredReading-4))
             mean(readingNumber+1,8)= (abs((sensorGlucose{firstMeteredReading+readingNumber-2})- mean(readingNumber+1,7)))^2;
             mean(readingNumber+1,8) = (abs((sensorGlucose{firstMeteredReading+readingNumber-1})- mean(readingNumber+1,7)))^2+mean(readingNumber+1,8);
             mean(readingNumber+1,8) = (abs((sensorGlucose{firstMeteredReading+readingNumber+1})- mean(readingNumber+1,7)))^2+mean(readingNumber+1,8);
             mean(readingNumber+1,8) = (abs((sensorGlucose{firstMeteredReading+readingNumber+2})- mean(readingNumber+1,7)))^2+mean(readingNumber+1,8);
             mean(readingNumber+1,8) = sqrt(mean(readingNumber+1,8)/3);
            readingNumber = readingNumber+1;
    end
    end
catch exception
    sprintf('I am in exception of second reading')
end
   
end

