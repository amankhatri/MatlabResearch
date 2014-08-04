function [ ] = deleteUptoFirstCalibration(filename)
%UNTITLED13 Summary of this function goes here
%   This file would delete data uptoFirst Calibration
% First open an Excel Server
excel = actxserver('Excel.Application');
excel.Visible = true;
file = excel.Workbooks.Open('C:\Users\kaman\Documents\MATLAB\myExample.xlsx');
% Make the sheet active
Sheets = excel.ActiveWorkBook.Sheets;
%sheet1 = get(Sheet, 'Item', 1); 1 is the sheet number 
sheet1 = get(Sheets, 'Item', 1);
invoke(sheet1, 'Activate');
% Get a handle to the active sheet
Activesheet = excel.Activesheet;
ActivesheetRange = get(Activesheet,'Range','A1:B2');
% Get back a range.  It will be a cell array, 
% since the cell range can
% contain different types of data.
Range = get(Activesheet, 'Range', 'A1:B2');
%now replace the values from A1 to B2 with empty string 
Range.Value=[];
%save file
file.Save;
%close file
file.Close;
%delete now redundant object. :)
delete(excel);

end

