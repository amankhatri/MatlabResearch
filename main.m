filename = 'GU112 CGM raw.xlsx';
[datapoints totaldays]=getNumberofDatapoints(filename);
rawdata = getRawData(filename);
[dates times dates_times] = getDateTime(rawdata);
firstMeteredReading = findMeteredReading(rawdata,datapoints);
[mean readingNumber] = calculateMean(firstMeteredReading,rawdata,datapoints);
% I am storing everthing in slope table, the data is arranged according to
% the heading sequence - Patient Id, Date, Time, Metered Bg, Sensor Glucose
% BG/ISIG, Mean of 4 SD of 4, x+2SD, X-2SD, Deviation 1 , Deviation 2,
% Slope
time = convertTime(times, dates_times);
stdev = calculateStdev(mean, rawdata,datapoints,firstMeteredReading);
xPlusMinusStdev = caluculatexPlusMinusStdev(stdev,datapoints,firstMeteredReading);
grandMean = calculateTotalMean(mean, readingNumber);
slope = calculateSlope(mean,readingNumber,grandMean,stdev,xPlusMinusStdev,rawdata,firstMeteredReading,time,dates);
%xlswrite('filename', slope);
%deleteUptoFirstCalibration(filename);
%S = datestr(date)

