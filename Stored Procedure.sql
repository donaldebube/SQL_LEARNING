-- Part 18 - Stored procedures in sql server   

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

INSERT INTO #temp_tblEmployee
( -- columns to insert data into
 [ID], [NAME], [SALARY], [GENDER], [CITY], [DEPARTMENT ID]
)
VALUES
( -- first row: values for the columns in the list above
    10, 'Mike', 100000, 'Male', 'Lagos', 8
)
GO

SELECT *
FROM #temp_tblEmployee
GO

-- CREATE A STORED PROCEDURE THAT WILL ONLY PROVIDE NAME, SALARY AND GENDER OF EMPLOYEES
CREATE PROC sptempTblEmployeeNSG
AS
BEGIN
    SELECT NAME, SALARY, GENDER
    FROM #temp_tblEmployee
    ORDER BY SALARY
END
GO

-- Execute sptempTblEmployeeNSG
sptempTblEmployeeNSG
GO

-- CREATE A STORED PROCEDURE THAT WILL PROVIDE NAME, SALARY AND CITY OF EMPLOYEES BUT ADD A PARAMETER
CREATE PROC sptempTblEmployeeNSC
@City NVARCHAR(100),
@Name NVARCHAR(100)
AS
BEGIN
    SELECT NAME, SALARY, CITY
    FROM #temp_tblEmployee
    ORDER BY SALARY
END
GO

-- To make changes
ALTER PROC sptempTblEmployeeNSC
-- @City NVARCHAR(100),
@GENDER NVARCHAR(100),
@ID INT
AS
BEGIN
    SELECT ID, NAME, SALARY, CITY, GENDER
    FROM #temp_tblEmployee
    WHERE ID = @ID AND GENDER = @GENDER 
    --AND CITY = @City
    -- ORDER BY SALARY
END
GO

-- Execute syntax
sptempTblEmployeeNSC @GENDER = 'Male', @ID = 4

-- Drop a procedure
DROP PROC sptempTblEmployeeNSC
GO

--Use the sp_helptext feature to get the syntax that was used in creating a stored procedure
sp_helptext sptempTblEmployeeNSC
GO

-- To encypt a stored procedure, do this!
ALTER PROC sptempTblEmployeeNSG
WITH ENCRYPTION
AS
BEGIN
     SELECT NAME, SALARY, GENDER
    FROM #temp_tblEmployee
    ORDER BY SALARY
END
GO

sp_helptext sptempTblEmployeeNSG
GO


-- Part 19 - Stored procedures with output parameters   
-- To create an SP with output parameter, we use the keywords OUT or OUTPUT

CREATE PROC spGetEmployeeCountByGender1
@Gender NVARCHAR (100),
@EmployeeCount INT output
AS
BEGIN
    SELECT @EmployeeCount = COUNT(ID)
    FROM #temp_tblEmployee
    WHERE GENDER = @Gender
END
GO

DECLARE @EmployeeTotal INT
EXEC spGetEmployeeCountByGender1 @Gender = 'Male', @EmployeeCount = @EmployeeTotal OUTPUT
PRINT @EmployeeTotal

SELECT COUNT(GENDER) AS [Male Count]
FROM #temp_tblEmployee
WHERE GENDER = 'Male'

SELECT *
FROM #temp_tblEmployee



