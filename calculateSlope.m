function [mean] = calculateSlope( mean, readingNumber,grandMean,stdev,xPlusMinusStdev,rawdata,firstMeteredReading,time,dates )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%calculating slope.
 %sensorGlucose  = rawdata(2:end,14);
reading = 1;
try
   sensorGlucose  = rawdata(2:end,14);
    %sensorGlucose
    while(reading<=readingNumber)
        %to calculate absolute value of slope uncomment this line
        %mean(reading+1,2) = abs(mean(reading,1)-mean(reading+1,1));
        mean(2,5) = sensorGlucose{firstMeteredReading};
        firstSensorReading = false;
        if(~firstSensorReading)
        mean(reading+2,5)= sensorGlucose{firstMeteredReading+reading};
        end
        mean(reading,8) = stdev(reading,8);
        mean(reading,9) = xPlusMinusStdev(reading,9); 
        mean(reading,10) = xPlusMinusStdev(reading,10); 
        mean(2, 11) = xPlusMinusStdev(2,9)-sensorGlucose{firstMeteredReading};
        mean(2,12) = xPlusMinusStdev(2,10)-sensorGlucose{firstMeteredReading};
        firstDevReading = false;
        if(~firstDevReading)
             mean(reading+2, 11) = xPlusMinusStdev(reading+1,9)- sensorGlucose{firstMeteredReading+reading};
             mean(reading+2, 12) = xPlusMinusStdev(reading+1,10)- sensorGlucose{firstMeteredReading+reading};
        end      
        mean(reading+1,13) = (mean(reading,7)-mean(reading+1,7));
        mean(reading,14) = grandMean(reading+1,14);
        reading = reading+1;
    end
catch exception
    reading;
end

end

