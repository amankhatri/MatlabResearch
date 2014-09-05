function [ firstMeteredReading ] = findMeteredReading( rawdata,datapoints )
for j=1:datapoints
   metered_bg = rawdata(2:end,9);
   metered_bg(j);
   %Use code128B{a,1} instead of code128B(a,1) to get the number instead of a cell containing the number.
   if((~isempty(metered_bg{j}))&&(metered_bg{j}>0))
     j;
     j=j+1;
       break;
   end
end
for j=j:datapoints
   metered_bg(j);
   %Use code128B{a,1} instead of code128B(a,1) to get the number instead of a cell containing the number.
   if((~isempty(metered_bg{j}))&&(metered_bg{j}>0))
     j;
    break;
   end
end
firstMeteredReading = j;
end

