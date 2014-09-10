function [ dates times dates_times ] = getDateTime(rawdata)
%getDateTime Summary of this function goes here
%   it gets Date and time from rawdatafile
dates = rawdata(2:end,5);
times = rawdata(2:end,6);
dates_times = [dates times];
end

