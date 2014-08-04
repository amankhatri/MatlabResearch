
excel = actxserver('Excel.Application');
%file = excel.Workbooks.Open('myExample.xls');
%file = excel.Workbooks.Open('yourExcelFile.xls’);
file =excel.Workbooks.Open('C:\Users\kaman\Documents\MATLAB\myExample.xls'); 
sheet1=excel.Worksheets.get('Item', 'yourSheetName');
range1=get(sheet1,'Range', 'A1','B4');
%range1=get(sheet1,'Range', 'StartCell','EndCell');
% In your case: range1=get(sheet1,'Range', 'A1','F'100);
range1.Value=[];
file.Save;
file.Close;
delete(excel);