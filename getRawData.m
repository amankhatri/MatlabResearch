function [ rawdata ] = getRawData(filename)
%getRawDat Summary of this function goes here
%   It reads excel files
[numeric,text,rawdata] = xlsread(filename);

end

