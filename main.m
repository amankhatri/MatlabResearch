filename = 'GU112 CGM raw.xlsx';
[datapoints totaldays]=getNumberofDatapoints(filename);
rawdata = getRawData(filename);
dates_times = getDateTime(rawdata);
firstMeteredReading = findMeteredReading(rawdata,datapoints)
[mean readingNumber] = calculateMean(firstMeteredReading,rawdata,datapoints);
slope = calculateSlope(mean,readingNumber);

%deleteUptoFirstCalibration(filename);