-- A stored procedure is a group of T-SQL (Transact SQL)statements.
-- Example 1:

-- Get tblEmployee table from main query
SELECT * 
INTO #temp_tblEmployee
FROM tblEmployees1

SELECT TOP 2 *
FROM #temp_tblEmployee

-- First of all change the column header to full caps
EXEC sp_rename '#temp_tblEmployee.Department ID', '#temp_tblEmployee.DEPARTMENT ID';

-- Add some more rows to the dataset
-- Insert rows into table '#temp_tblEmployee'
INSERT INTO #temp_tblEmployee
( -- columns to insert data into
 [ID], [NAME], [SALARY], [GENDER], [CITY], [Department ID]
)
VALUES
( -- first row: values for the columns in the list above
 Column1_Value, Column2_Value, Column3_Value
),
( -- second row: values for the columns in the list above
 Column1_Value, Column2_Value, Column3_Value
)
-- add more rows here
GO


SELECT *
INTO #temp_tblPerson
FROM tblPerson

SELECT *
FROM #temp_tblPerson