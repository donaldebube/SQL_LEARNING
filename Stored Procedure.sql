-- A stored procedure is a group of T-SQL (Transact SQL)statements.
-- Example 1:

-- Get tblEmployee table from main query
SELECT * 
INTO #temp_tblEmployee
FROM tblEmployees1

-- DROP TABLE #temp_tblEmployee
-- GO

SELECT *
FROM #temp_tblEmployee

-- First of all change the column header to full caps
EXEC sp_rename '#temp_tblEmployee.Department ID', '#temp_tblEmployee.DEPARTMENT ID';

-- Add some more rows to the dataset
-- Insert rows into table '#temp_tblEmployee'
INSERT INTO #temp_tblEmployee
( -- columns to insert data into
 [ID], [NAME], [SALARY], [GENDER], [CITY], [DEPARTMENT ID]
)
VALUES
( -- first row: values for the columns in the list above
    7, 'Ayo', 80000, 'Male', 'Lagos', 3
),
( -- second row: values for the columns in the list above
    8, 'Tobi', 89000, 'Female', 'Ogun', 7
),
-- third row
(
    9, 'Ladi', 100000, 'Male', 'Osun', 2
)
GO

SELECT *
FROM #temp_tblEmployee


SELECT *
INTO #temp_tblPerson
FROM tblPerson

SELECT *
FROM #temp_tblPerson