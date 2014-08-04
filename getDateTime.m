function [ dates_times ] = getDateTime(rawdata)
%getDateTime Summary of this function goes here
%   it gets Date and time from rawdatafile
dates = rawdata(2:end,5);
times = rawdata(2:end,6);
dates_vec = datevec(dates,'mm/dd/yyyy');
dates_times = [dates times];
end

