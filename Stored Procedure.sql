-- A stored procedure is a group of T-SQL (Transact SQL)statements.
-- Example 1:

-- Get tblEmployee table from main query
SELECT * 
INTO #temp_tblEmployee
FROM tblEmployees1

SELECT *
FROM #temp_tblEmployee

-- Add some more rows to the dataset



SELECT *
INTO #temp_tblPerson
FROM tblPerson

SELECT *
FROM #temp_tblPerson