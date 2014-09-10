function [ time ] = convertTime( times, dates_times )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
i =1;
try
while(times{i,1}~=' ')
        time{i,1}= dates_times{i,2}.*24;
        time{i,2}= dates_times{i,2}.*24*60;
        time{i,3}= num2str(floor(time{i,2}/60));
        time{i,4}= num2str(rem(time{i,2},60));
        time{i,5}=strcat(time{i,3},':',time{i,4});
        i = i+1;         
end
catch exception
   i = i-1;
end

end

