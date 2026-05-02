Create Database SuperStoreDB;
GO
USE SuperstoreDB;

Select * From people

Select * From superstore

Select * From returns

-- Changing the wrong imported column headers
Delete From people
Where Person= 'Person'

-- Renaming columns
EXEC sp_rename 'people.column1', 'Person', 'COLUMN'
EXEC sp_rename 'people.column2', 'Region', 'COLUMN';


--Checks null values
Select* 
From superstore
Where Sales IS NULL or Profit IS NULL or Order_id IS NULL

Select* 
From returns
Where Returned IS NULL 

-- Add new columns

Alter Table superstore
ADD Order_Year INT,
	Profit_Margin INT;

Update superstore
Set Order_Year = Year(Order_Date),
	Profit_Margin = ROUND((Profit/Sales)*100,2);

Select 
	s.Order_ID,
	s.Region,
	p.Person AS Sales_Rep,
	s.Sales,
	s.Profit
From superstore AS s
Left Join people as P 
ON s.Region = p.Region
Left Join Returns as r
ON s.Order_ID = r.Order_ID



