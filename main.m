filename = 'GU112 CGM raw.xlsx';
[datapoints totaldays]=getNumberofDatapoints(filename);
rawdata = getRawData(filename);
dates_times = getDateTime(rawdata);
firstMeteredReading = findMeteredReading(rawdata,datapoints)
[mean readingNumber] = calculateMean(firstMeteredReading,rawdata,datapoints);
% I am storing everthing in slope table, the data is arranged according to
% the heading sequence - Patient Id, Date, Time, Metered Bg, Sensor Glucose
% BG/ISIG, Mean of 4 SD of 4, x+2SD, X-2SD, Deviation 1 , Deviation 2,
% Slope
stdev = calculateStdev(mean, rawdata,datapoints,firstMeteredReading);
grandMean = calculateTotalMean(mean, readingNumber);
slope = calculateSlope(mean,readingNumber,grandMean,stdev);
xlswrite('filename', slope)
%deleteUptoFirstCalibration(filename);