filename = 'GU112 CGM raw.xlsx';
%To import this file, first convert the dates within Excel to a numeric
%format. however rawdata and text contains these dates as sting.
[numeric,text,rawdata] = xlsread(filename);
%Reading dates from text data from row 2:end and column 5
dates = rawdata(2:end,5);
times = rawdata(2:end,6);
%concatinating dates and times because they are in different Columns.
dates_times = [dates times];
%we can convert dates in numbers or in vectors (dates_num and/or date_vecs)
%converting the dates to dates_num
%dates_num = datenum(dates_times,'mm/dd/yyyy HH:MM:SS');
%converting the dates to dates_vecs it contains(year in first column, month
%in second column and date in third, fourth column contains hours, fifth
%contains min, and sixth contains seconds
dates_vec = datevec(dates,'mm/dd/yyyy');
metered_bg = rawdata(2:end,9);
%calculating the number of data points in excel files. 
i =1; 
try
while(dates_vec(i,1)~=' ')
         i = i+1;         
end
catch exception
   i = i-1;
end
numberofDatapoints  =i;
%the number of days for which study was done 
totalDays = (dates_vec(i,3)-dates_vec(3,2)) +1;
for j=1:i
   metered_bg(j);
   %Use code128B{a,1} instead of code128B(a,1) to get the number instead of a cell containing the number.
   if((~isempty(metered_bg{j}))&&(metered_bg{j}>0))
     j;
     j=j+1
   break;
   end
end
for j=j:i
   metered_bg(j);
   %Use code128B{a,1} instead of code128B(a,1) to get the number instead of a cell containing the number.
   if((~isempty(metered_bg{j}))&&(metered_bg{j}>0))
     j;
    break;
   end
end
TRUE =1;
FALSE =0;
firstMeteredReading = j;
readingNumber = 1;
%boolean is it a mean of the first reading for the day
firstMean=TRUE;
%is it the mean of the last reading for the day
lastMean = FALSE;
sensorGlucose  = rawdata(2:end,14);
if(firstMean)
    firstMean = FALSE;
  %  when we use "{}" this mean value inside the cell <-- important keep in
  %  mind
 mean(readingNumber+1,1)= (sensorGlucose{firstMeteredReading} + sensorGlucose{firstMeteredReading+readingNumber+1}+ sensorGlucose{firstMeteredReading+readingNumber+2})/3;
  readingNumber = readingNumber+1;
  secondReading = TRUE;
 % mean(4,1) = 5   
end

try
while(readingNumber<numberofDatapoints-firstMeteredReading-4)
    if(secondReading)
        mean(readingNumber+1, 1) = (sensorGlucose{firstMeteredReading+readingNumber-2}+sensorGlucose{firstMeteredReading+readingNumber-1}+sensorGlucose{firstMeteredReading+readingNumber+1}+sensorGlucose{firstMeteredReading+readingNumber+2})/4; 
        secondReading = FALSE;
        readingNumber = readingNumber+1;
    else
        mean(readingNumber+1, 1) = (sensorGlucose{firstMeteredReading+readingNumber-2}+sensorGlucose{firstMeteredReading+readingNumber-1}+sensorGlucose{firstMeteredReading+readingNumber+1}+sensorGlucose{firstMeteredReading+readingNumber+2})/4; 
        readingNumber = readingNumber+1;
    end
end
catch exception
    readingNumber;
end
%calculating slope.
reading = 2
    
try
    while(reading<=readingNumber)
    mean(reading+1,2) = (mean(reading,1)-mean(reading+1,1));
   
    reading = reading+1;
    end
catch exception
    reading;
end
%total mean calculation 
reading = 2;
    %initiating with some value. Do not remove this
    mean(2,3) = mean(reading,1);
 try 
    while(reading<=readingNumber)
        mean(2,3) = (mean(reading,1)+mean(2,3));
        reading =  reading+1;
    end
catch exception
end
    mean(2,3) = mean(2,3)/readingNumber;
     
% Calculations for standard davieation add this to the code :D
 readingNumber = 1;
% boolean is it a mean of the first reading for the day
 firstStd=TRUE;
% %is it the mean of the last reading for the day
 laststd = FALSE;
sprintf('Wierd Things happen');
 if(firstStd)
     firststd = FALSE;
%   %  when we use "{}" this mean value inside the cell <-- important keep in
%   %  mind
    mean(readingNumber+1,4) = 0;
    mean(readingNumber+1,4)= (abs((sensorGlucose{firstMeteredReading})- mean(readingNumber+1,1)))^2;
    mean(readingNumber+1,4) = (abs((sensorGlucose{firstMeteredReading+readingNumber+1})- mean(readingNumber+1,1)))^2+mean(readingNumber+1,4);
    mean(readingNumber+1,4) = (abs((sensorGlucose{firstMeteredReading+readingNumber+2})- mean(readingNumber+1,1)))^2+mean(readingNumber+1,4);
    mean(readingNumber+1,4) = sqrt(mean(readingNumber+1,4)/2);
    readingNumber = readingNumber+1;
    secondstd = TRUE;
 end
try if(secondstd)
    while(readingNumber<(numberofDatapoints- firstMeteredReading-4))
             mean(readingNumber+1,4)= (abs((sensorGlucose{firstMeteredReading+readingNumber-2})- mean(readingNumber+1,1)))^2;
             mean(readingNumber+1,4) = (abs((sensorGlucose{firstMeteredReading+readingNumber-1})- mean(readingNumber+1,1)))^2+mean(readingNumber+1,4);
             mean(readingNumber+1,4) = (abs((sensorGlucose{firstMeteredReading+readingNumber+1})- mean(readingNumber+1,1)))^2+mean(readingNumber+1,4);
             mean(readingNumber+1,4) = (abs((sensorGlucose{firstMeteredReading+readingNumber+2})- mean(readingNumber+1,1)))^2+mean(readingNumber+1,4);
             mean(readingNumber+1,4) = sqrt(mean(readingNumber+1,4)/3);
            readingNumber = readingNumber+1;
    end
    end
catch exception
    sprintf('I am in exception of second reading')
end
%calculating x+2sd & x-2sd
reading =2;
while(reading<numberofDatapoints- firstMeteredReading-4)
    mean(reading,5) = mean(reading,1)+mean(reading,4);
    mean(reading,6) = mean(reading,1)- mean(reading,4);
    reading = reading +1;
end

