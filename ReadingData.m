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
%the number of days for which study was done 
totalDays = (dates_vec(i,3)-dates_vec(3,2)) +1;
for j=1:i
   metered_bg(j)
   %Use code128B{a,1} instead of code128B(a,1) to get the number instead of a cell containing the number.
   if((~isempty(metered_bg{j}))&&(metered_bg{j}>0))
     j
       break;
   end
end
isnumeric(pi);
