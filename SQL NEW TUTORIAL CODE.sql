--SQL NEW TUTORIAL
-- Create a new table called 'TableName' in schema 'SchemaName'
-- Create the table in the specified schema
CREATE TABLE tblPerson
(
    ID INT NOT NULL PRIMARY KEY, -- primary key column
    Name NVARCHAR (50) NOT NULL,
    Email NVARCHAR (50) NOT NULL,
    GenderID NUMERIC NOT NULL,
    Age NUMERIC NOT NULL,
    City NVARCHAR (50) NOT NULL
    -- specify more columns here
);


-- Insert rows into table 'TableName'
INSERT INTO tblPerson
( -- columns to insert data into
 ID, Name, Email, GenderID, Age, City 
)
VALUES
( -- first row: values for the columns in the list above
    1, 'Tom', 'tom.com', 1, 23, 'London'
),
( -- second row: values for the columns in the list above
    2, 'Richard', 'rich.com', 1, 20, 'New York'
),
(-- third row: values for the columns in the list above
    3, 'Amanda', 'ama.com', 2, 21, 'Lagos'
),
(-- forth row: values for the columns in the list above
    4, 'Tolu', 'tolu.com', 1, 29, 'Abuja'
),
(
    5, 'Michael', 'mike.com', 2, 25, 'Delta'
)


--Tutorial 10 (SELECT STATEMENT)
--Filtering with WHERE CLAUSE
SELECT *
FROM tblPerson
GO

--To add a column to a pre-existing table
ALTER TABLE  EmployeeDemographics
ADD City NVARCHAR(50)

--Add different Cities in the new City column
-- Update rows in table 'EmployeeDemographics'
UPDATE EmployeeDemographics
SET
    City = 'Abuja'
   
WHERE EmployeeID in (1002, 1003) --1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1015)
GO

UPDATE EmployeeDemographics
SET
    City = 'Abuja'
   
WHERE EmployeeID in (1004, 1007, 1009, 1015) 
GO

UPDATE EmployeeDemographics
SET
    City = 'Lagos'
   
WHERE EmployeeID in (1005, 1006, 1008, 1012) 
GO

UPDATE EmployeeDemographics
SET
    City = 'Ibadan'
   
WHERE EmployeeID in (1010, 1011) 
GO


-- Update rows in table 'TableName'
UPDATE EmployeeDemographics
SET
   Gender = 'Male'
WHERE Firstname = 'William'
GO

-- Delete rows from table 
DELETE FROM EmployeeDemographics
WHERE City IN ('Lagos', 'Abuja')
GO

-- Insert rows into table 'TableName'
INSERT INTO EmployeeDemographics
( -- columns to insert data into
    EmployeeID, Firstname, Lastname, Age, Gender, City
)
VALUES
( -- first row: values for the columns in the list above
    1001, 'Donald', 'Ebube', 23, 'Male', 'Lagos'
),
( -- second row: values for the columns in the list above
    1004, 'Cynthia', 'Ade', 27, 'Female', 'Ogun'
),
(
    1005, 'Olu', 'Maintain', 26, 'Male', 'Osun'
),
(
    1006, 'Mayor', 'DMW', 23, 'Male', 'Lagos'
),
(
    1007, 'Ikenna', 'Roland', 60, 'Male', 'Abia'
),
(
    1008, 'Hermes', 'Hater', 30, 'Male', 'Kaduna'
),
(
    1009, 'Chioma', 'Ada', 22, 'Female', 'Imo'
),
(
    1012, 'Carren', 'Aka', 24, 'Female', 'Imo'
),
(
    1013, 'Bethel', 'Hum', 29, 'Female', 'Ogun'
),
(
    1014, 'Adamu', 'Just', 27, 'Male', 'Kastina'
)
-- add more rows here
GO

SELECT *
FROM EmployeeDemographics
ORDER BY EmployeeID
--Change column name
EXEC sp_rename 'tblPerson.Employee ID1', 'Employee ID' --'COLUMN'

--Add Column
ALTER TABLE tblPerson
ADD [MANAGER ID] VARCHAR(50)

EXEC sp_rename 'tblPerson.MANAGER ID', 'Manager ID'

--Input information into new column
UPDATE tblPerson
SET
   [Manager ID] = NULL
WHERE Name = 'Rachel'
GO

-- Insert rows into table 'tblPerson'
INSERT INTO tblPerson
( -- columns to insert data into
    [Employee ID], Name, Email, GenderID, Age, City, [Manager ID]
)
VALUES
( -- first row: values for the columns in the list above
    6, 'Rachel', 'Rac.com', 2, 25, 'Lisbon', ''
)
GO

SELECT *
FROM tblPerson

--Using the Wild Cards in SQL Server

--Instead of using OR function continously to selct particular values, just use IN function
--To specifiy a list of values, use the IN operator
SELECT *
FROM tblPerson
WHERE Age IN (20,21,25)

--To specify a range of values
--Use BETWEEN operator
SELECT *
FROM tblPerson
WHERE Age BETWEEN 20 AND 28

--To specify a pattern
--Use the LIKE opeartor
SELECT *
FROM tblPerson
WHERE Email LIKE 'A%'

SELECT *
FROM tblPerson
WHERE Name NOT LIKE '%A%'

--To find any character in the bracktes
--Here, I wanted to find the list of names that started with the letter 'A','M' and 'T'
SELECT *
FROM tblPerson
WHERE Name LIKE '[AMT]%'
--Here, I wanted to find the list of names that didn't start with 'A','M' or 'T'
SELECT *
FROM tblPerson
WHERE Name NOT LIKE '[AMT]%'
--Here, I wanted to find the list of names that didn't start with 'A','M' or 'T'
SELECT *
FROM tblPerson
WHERE Name LIKE '[^AMT]%'

--Joining multiple conditions using AND and OR operators
--FOR AND operator ONLY
SELECT *
FROM tblPerson
WHERE CITY IN ('Lagos', 'London') AND AGE >= 20
--FOR AND operator and OR operator
SELECT *
FROM tblPerson
WHERE City = 'Lagos' OR City = 'London' AND AGE >= 20

--Sorting rows using order by
--Order names in DESCENDING order
SELECT *
FROM tblPerson
ORDER BY Name DESC
--Order names in ASCENDING order
SELECT *
FROM tblPerson
ORDER BY Name 

--Selecting TOP N or TOP N Percentage of rows
--TOP N
SELECT TOP 2 AGE 
FROM tblPerson
--TOP N PERCENTAGE
SELECT TOP 50 PERCENT AGE 
FROM tblPerson
GO

--TUTORIAL 11 (GROUP BY STATEMENT)
--Grouping rows using Group BY
--Filtering Groups
--Difference between WHERE and HAVING CLAUSE

--Grouping rows using Group BY
SELECT City, SUM(Salary) AS [Total Salary]
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY CITY
ORDER BY CITY DESC

SELECT City, Gender, SUM(Salary) AS [Total Salary In City], COUNT(City) AS [Total Employees]
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY City, Gender 
ORDER BY City

SELECT *
FROM EmployeeSalary

--Filtering Groups
SELECT Gender, City, SUM(Salary) AS [Total Salary In City], COUNT(City) AS [Total Employee]
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE Gender = 'Male'
GROUP BY City, Gender

--Difference between WHERE and HAVING CLAUSE
SELECT Gender, City, SUM(Salary) AS [Total Salary In City], COUNT(City) AS [Total Employee]
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY Gender, City
HAVING SUM(Salary) > 20000 AND Gender = 'Male'

--Tutorial 12 (JOINS)
--Different types of joins in SQL
--Cross Join
--Inner Join
--Outer Join - Left, Right and Full Outer Join

--Different types of joins in SQL
SELECT Firstname, Lastname, Age, Gender, JobTitle, Salary
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GO
--INNER JOIN SYNTAX
SELECT *
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GO
--FULL OUTER JOIN
SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GO
--LEFT OUTER JOIN
SELECT *
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GO
--RIGHT OUTER JOIN
SELECT *
FROM EmployeeDemographics
RIGHT OUTER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GO
--CROSS JOIN
--It produces the cartesian product of the 2 tables involved in the join.
--Cross Join shouldn't have an ON clause
--It simply multiplies the rows of the two tables and gives the total number of rows after multiplication
SELECT *
FROM EmployeeDemographics
CROSS JOIN EmployeeSalary 
GO

---IN SUMMARY
--CROSS JOIN (RETURNS CARTESIAN PRODUCT OF THE TABLES INVOLVED IN THE JOIN)
--INNER JOIN (RETURNS ONLY THE MATCHING ROWS. NON MATCHING ROWS ARE ELIMINATED)
--LEFT JOIN (RETURNS ALL THE MATCHING ROWS + NON MATCHING ROWS FROM THE LEFT TABLE)
--RIGHT JOIN (RETURNS ALL THE MATCHING ROWS + NON MATCHING ROWS FROM THE RIGHT TABLE)
--FULL JOIN (RETURNS ALL ROWS FROM BOTH TABLES, INCLUDING THE NON-MATCHING ROWS)



--Tutorial 13 (Advanced JOINS)
--Advanced or intelligent joins in SQL 
--Retrieve only the non matching rows from the left table
--Retrieve only the non matching rows from the right table
--Retrieve only the non matching rows from both the left and right table

--Retrieve only the non matching rows from the left table
SELECT *
FROM EmployeeDemographics
LEFT JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE EmployeeSalary.EmployeeID is NULL

--Retrieve only the non matching rows from the right table
SELECT *
FROM EmployeeDemographics
RIGHT JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE EmployeeSalary.EmployeeID IS  NULL

SELECT *
FROM EmployeeDemographics
RIGHT JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE EmployeeSalary.EmployeeID IS NOT NULL


--Practice Tutorial 14,15,16 and 17 next

--Tutorial 14 (Self Join)
--Self Join is simply joining a table with itself.
SELECT *
FROM tblPerson

--Left Self Join
SELECT E.Name AS [Employee Name], M.Name AS [Manager Name]
FROM tblPerson E
LEFT JOIN tblPerson M
ON E.[Manager ID] = M.[Employee ID]

--Right Self Join
SELECT E.Name AS [Employee Name], M.Name AS [Manager Name]
FROM tblPerson E
RIGHT JOIN tblPerson M
ON E.[Manager ID] = M.[Employee ID]

--Inner Self Join
SELECT E.Name AS [Employee Name], M.Name AS [Manager Name]
FROM tblPerson E
INNER JOIN tblPerson M
ON E.[Manager ID] = M.[Employee ID]


--Tutorial 15 - Different ways to replace NULL in SQL
--Different ways to replace NULL values
--ISNULL() Function
--CASE statement
--COALESCE() Function

--Using ISNULL() Function
SELECT E.Name AS [Employee Name], ISNULL (M.Name,'No Manager') AS [Manager Name] 
FROM tblPerson E
LEFT JOIN tblPerson M
ON E.[Manager ID] = M.[Employee ID]

--Using CASE Statement
SELECT E.Name AS [Employee Name],
CASE 
    WHEN M.Name IS NULL THEN 'No Manager' ELSE M.Name
END
FROM tblPerson E
LEFT JOIN tblPerson M
ON E.[Manager ID] = M.[Employee ID]

--Using COALESCE() Function
SELECT E.Name AS [Employee Name], COALESCE(M.Name, 'No Manager') AS [Manager Name]
FROM tblPerson E
LEFT JOIN tblPerson M
ON E.[Manager ID] = M.[Employee ID]


--Tutorial 16 - COALESCE Function
--COALESCE Function returns the first NON NULL value

--Verify Columns
SELECT *
FROM tblPerson

-- Add a new column to table 
ALTER TABLE tblPerson
    ADD [Middle Name] /*new_column_name*/ NVARCHAR(50) /*new_column_datatype*/ NULL /*new_column_nullability*/
GO
-- Add a new column to table 
ALTER TABLE tblPerson
    ADD [Last Name] /*new_column_name*/ NVARCHAR(50) /*new_column_datatype*/ NULL /*new_column_nullability*/
GO
-- Add a new column to table 
ALTER TABLE tblPerson
    ADD [First Name] /*new_column_name*/ NVARCHAR(50) /*new_column_datatype*/ NULL /*new_column_nullability*/
GO

-- Update rows in table 'TableName'
UPDATE tblPerson
SET
    [First Name] = 'Rachel',
    [Middle Name] = 'Tosin',
    [Last Name] = NULL
    -- add more columns and values here
WHERE [Employee ID] = 6	/* add search conditions here */
GO

-- Drop 'ColumnName' from table 'TableName' in schema 'SchemaName'
ALTER TABLE tblPerson
    DROP COLUMN "[First Name]"
GO

--COALESCE Function returns the first NON NULL value
SELECT [Employee ID], COALESCE ( [Middle Name], [Last Name]) AS Name
FROM tblPerson

--See you on Monday

--Part 17 - UNION and UNIOIN ALL
--Purpose of UNION and UNION ALL
--Difference between UNION and UNION ALL
--Difference between JOIN and UNION


--Purpose of UNION and UNION ALL
--UNION and UNION ALL operators in SQL server are used to combine the result-set of two or more SELECT queeries

 --UNION joins two tables with same number, data types and the order of the columns in the select statement.
--UNION ALL gets all the duplicates 
SELECT * 
FROM tblPerson

--Create new tables for this lessonNew
-- Create a new table called 'TableName' in schema 'SchemaName'

CREATE TABLE tblIndiaCustomers
(
    ID INT NOT NULL PRIMARY KEY, -- primary key column
    Name [NVARCHAR](50) NOT NULL,
    Email [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
GO

--Delete the ID column in tblIndiaCustomers
ALTER TABLE tblIndiaCustomers
DROP COLUMN ID

--Change the name of the column
EXEC sp_rename 'tblIndiaCustomers.TableNameId', 'ID'

SELECT *
FROM tblIndiaCustomers

--Add Values
--Insert rows into table 'TableName'
INSERT INTO tblIndiaCustomers
( -- columns to insert data into
 [ID], [Name], [Email]
)
VALUES
( -- first row: values for the columns in the list above
 1, 'John', 'john@yahoo.com'
),
( -- second row: values for the columns in the list above
 2, 'Michael', 'mike@gmail.com'
),
( -- second row: values for the columns in the list above
 3, 'Rachel', 'rach@hotmail.com'
)

GO

CREATE TABLE tblUKCustomers
(
    TableNameId INT NOT NULL PRIMARY KEY, -- primary key column
    ID [NUMERIC] NOT NULL,
    Name [NVARCHAR](50) NOT NULL,
    Email [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
GO

SELECT *
FROM tblUKCustomers

--Delete unwanted row
ALTER TABLE tblUKCustomers
DROP COLUMN ID

--Rename the column name
EXEC sp_rename 'tblUKCustomers.TableNameId', 'ID'

--Add values
-- Insert rows into table 'TableName'
INSERT INTO tblUKCustomers
( -- columns to insert data into
 ID, Name, Email
)
VALUES
( -- first row: values for the columns in the list above
 1, 'John', 'john@yahoo.com'
),
( -- second row: values for the columns in the list above
 2, 'Michael', 'mike@gmail.com'
),
( -- second row: values for the columns in the list above
 3, 'Donald', 'rach@hotmail.com'
)
GO

--Using the UNION statement
SELECT *
FROM tblIndiaCustomers
UNION
SELECT *
FROM tblUKCustomers

--Using the UNION ALL statement
SELECT *
FROM tblIndiaCustomers
UNION ALL
SELECT *
FROM tblUKCustomers
GO

--Part 18 - Stored Procedures
--What is a stored procedure
--Stored procedure example
--Creating a stored procedure with parametres
--Altering SP
--Viewing the text of the SP
--Dropping the SP

--Example 1:

-- Create a new stored procedure called 'StoredProcedureName' in schema 'SchemaName'
CREATE PROCEDURE spGetEmployeesBasicInfo
AS
BEGIN
    SELECT Firstname, Lastname, Gender
    FROM EmployeeDemographics
END
GO

--To run the stored procedure, just type the name of the 
--stored proedure and run it
spGetEmployeesBasicInfo
GO


--Creating a stored procedure with parametres

-- Create the stored procedure in the specified schema
CREATE PROCEDURE spGetEmployeesByGenderAndFirstname
    @Gender NVARCHAR(50),
    @Firstname NVARCHAR(50)
AS
    -- body of the stored procedure
    SELECT Firstname, Lastname, Gender, Age
    FROM EmployeeDemographics
    WHERE Gender = @Gender AND Firstname = @Firstname 
GO
-- example to execute the stored procedure we just created
EXECUTE spGetEmployeesByGenderAndFirstname 'Male', 'Donald'
GO

--Altering SP
EXEC spGetEmployeesByGenderAndFirstname @firstname = 'Amanda', @gender = 'Female'

--Viewing the text of the SP
--To get the code (text) behind the stored procedure

EXEC sp_helptext spGetEmployeesByGenderAndFirstname
GO

--Change definition of the Store Procedure by using the ALTER statement
ALTER PROC spGetEmployeesBasicInfo
AS
    SELECT Firstname, Lastname, Gender
    FROM EmployeeDemographics
    ORDER by Firstname DESC
GO

--Running an SP
EXEC spGetEmployeesBasicInfo
GO

--Dropping the SP
DROP PROCEDURE spGetEmployeesByGenderAndFirstname
GO

--Encrypting an SP
ALTER PROC spGetEmployeesBasicInfo
WITH ENCRYPTION
AS  
BEGIN
    SELECT Firstname, Lastname, Gender
    FROM EmployeeDemographics
    ORDER BY Firstname
END
GO

EXEC sp_helptext spGetEmployeesBasicInfo
GO

--Part 19 - Stored procedures with output parameters
--Creating and executing stored procedures with output parameters
--Learn about some of the useful system stored procedures.

--Creating and executing stored procedures with output parameters
CREATE PROC spGetEmployeeCountByGender
@Gender NVARCHAR(50),
@GenderCount INT OUTPUT
AS
    SELECT @GenderCount = COUNT(EmployeeID)
    FROM EmployeeDemographics
    WHERE Gender = @Gender
GO

DECLARE @TotalCount INT
EXEC spGetEmployeeCountByGender 'Male', @TotalCount output
PRINT @TotalCount
GO

SELECT *
FROM EmployeeDemographics
GO

--Part 20 - Stored procedure output parameters or return values
--Understand what are stored procedures return values
--Difference between stored procedure, return values and output parameters
--When to use output parameters over return values

--Stored Procedure Example
CREATE PROC spGetTotalCount1
@TotalCount INT OUTPUT
AS
BEGIN
    SELECT @TotalCount = COUNT(EmployeeID)
    FROM EmployeeDemographics
END
GO

--Run the stored procedure
DECLARE @TotalCount INT
EXEC spGetTotalCount1 @TotalCount OUTPUT
PRINT @TotalCount
GO

--Return Values Example
CREATE PROC spGetTotalCount2
AS
BEGIN
    RETURN
    (
        SELECT COUNT(EmployeeID)
        FROM EmployeeDemographics
    )
END
GO

--Run Return values
DECLARE @Total INT
EXEC @Total = spGetTotalCount2
PRINT @Total
GO


--NOTE: OUTPUT PARAMETERS CAN USE ANY DATATYPE (INT, NVARCHAR)
--Stored Procedure WITH OUTPUT PARAMETERS Example WITH ENCRYPTION
ALTER PROC spGetNameByID11
@EmployeeID INT,
@Name NVARCHAR (50) OUTPUT
WITH ENCRYPTION
AS
BEGIN
    SELECT @Name = [Full Name]
    FROM EmployeeDemographics
    WHERE @EmployeeID = EmployeeID
END
GO

--Run Stored Proc
DECLARE @Name NVARCHAR (50)
EXEC  spGetNameByID11 1003, @Name OUTPUT
PRINT '[Full Name] =' + @Name
GO

--Stored Procedure WITH OUTPUT PARAMETERS Example WITHOUT ENCRYPTION
CREATE PROC spGetNameByID13
@EmployeeID INT,
@Name NVARCHAR (50) OUTPUT
AS
BEGIN
    SELECT @Name = [Full Name]
    FROM EmployeeDemographics
    WHERE @EmployeeID = EmployeeID
END
GO

DECLARE @Name NVARCHAR (50)
EXEC  spGetNameByID13 1002, @Name OUTPUT
PRINT '[Full Name] =' + @Name
GO


-- Drop the stored procedure called 'StoredProcedureName' in schema 'SchemaName'
DROP PROCEDURE spGetNameByID11
GO

--Return value example
CREATE PROC spGetNameByID12
@EmployeeID INT
WITH ENCRYPTION
AS
BEGIN
    RETURN
    (
        SELECT [Full Name]
        FROM EmployeeDemographics
        WHERE @EmployeeID = EmployeeID
    )
END
GO

--NOTE: RETURN VALUES ARE USED TO ONLY RETURN AN INTEGER
--Run Return Value
DECLARE @EmployeeName
EXEC @EmployeeName = spGetNameByID12 1001
PRINT 'Name of the Employee =' + @Total


--Add New Column to table
-- ALTER TABLE EmployeeDemographics
--     ADD [Full Name] NVARCHAR (100)
-- GO

-- Update rows in table 'TableName'
UPDATE EmployeeDemographics
SET
    [Full Name] = CONCAT(Firstname, ' ', Lastname)
WHERE 	EmployeeID = 1014
        -- EmployeeID = 1007 AND 
        -- EmployeeID = 1008 AND 
        -- EmployeeID = 1009 AND 
        -- EmployeeID = 1010 AND 
        -- EmployeeID = 1011 AND 
        -- EmployeeID = 1012 AND 
        -- EmployeeID = 1013 AND 
        -- EmployeeID = 1014 AND 
        -- EmployeeID = 1005 AND 
        -- EmployeeID = 1004
GO

--Part 21 -- Advantages of Stored Procedures
--Advantages of using Stored Procedures over adhoc queries (inline SQL)
-- 1.) Execution plan and reusablity
-- 2.) Reduce network traffic
-- 3.) Code reusability and better maintainability
-- 4.) Better Security
-- 5.) Avoids SQL injection attack

-- Part 22 - String Functions
--Commonly used built -in string functions in SQL Server
--Two types of functions are 
--1.) User defined functions
--2.) System functions

--System Functions

--Using the ASCII Function
SELECT ASCII (1) AS Number

--Using the CHAR - CHARACTER FUNCTION
SELECT CHAR(65) AS ALPHABETS

--Using CHAR Function to create a loop of A - Z
DECLARE @start INT
SET @start = 65
WHILE (@start <= 91)
BEGIN
    PRINT CHAR(@Start)
    SET @start = @start +1
END

--Using LTRIM function to remove blanks on the left handside of the given character expression
SELECT EmployeeID, LTRIM(Firstname) AS [First Name], Lastname AS [Last Name]
FROM EmployeeDemographics
ORDER BY EmployeeID

SELECT *
FROM EmployeeDemographics

--Using RTRIM function to remove blanks on the right handside of the given character expression
SELECT EmployeeID , RTRIM(Firstname) AS [First Name], LTRIM(Firstname) AS [First Name]
FROM EmployeeDemographics

--Side Distraction
-- Update rows in table 'TableName'
UPDATE EmployeeDemographics
SET
    [Firstname] = '     Aadamu       '
  
WHERE EmployeeID = 101	/* add search conditions here */
GO

--Part 25 - DateTime Functions in SQL
--DateTime Data Types
--DateTime Functions
--Understand UTC time and Time Zone offset
--UTC means Coordinated Universal Time, based on which, the world regulates clocks and time.

--Create a Date and Time table
-- Create a new table called 'TableName' in schema 'SchemaName'

CREATE TABLE tblDateTime
(
    [C Time] TIME (7),
    [C Date] DATE,
    [C Small DateTime] SMALLDATETIME,
    [C DateTime] DATETIME,
    [C DateTime2] DATETIME2(7),
    [C DateTimeOffset] DATETIMEOFFSET
);
GO
--Insert Values into Table
INSERT INTO tblDateTime 
VALUES 
(
    GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE()
)

--UPDATE only the DATETIME OFFSET (That is the only DateTime statement that can be updated)
UPDATE tblDateTime 
SET [C DateTimeOffset] = '2022-09-24 18:29:56.2633333 +10:00'
WHERE [C DateTimeOffset] = '2022-09-24 18:29:56.2633333 +00:00'

--Side Distraction
SELECT GETDATE() AS [Current System Date and Time]

SELECT *
FROM tblDateTime


--Part 26 - DateTime Function
--IsDate, Day, Month, Year and DateName
--A practical example of using these functions

--ISDATE() FUNCTION - Checks if the given value, is a valid date, time or datetime. It returns 1 for success, 0 for failure
--NOTE: For datetime2 values, ISDATE() returns ZERO

--DAY() FUNCTION - Returns the 'Day number of the Month' of the given date
SELECT DAY(GETDATE()) --Returns the current date day number of the month
SELECT DAY('01/31/2022') --Returns 31

--Month() Function - Returns the 'Month number of the year' of the given date
SELECT MONTH(GETDATE()) --Returns the current month number of the year
SELECT MONTH('01/31/2022') -- Returns 01

--Year() Function - Returns the 'Year number' of the given date
SELECT YEAR(GETDATE()) --Returns the current year
SELECT YEAR('01/31/2022') --Returns 2022

--DateName(DatePart, Date) - Returns a string that represents a part of the given date
--This function takes two parameters. The first parameter DatePart specifies, the part of the date, we want.
--The second parameter is the actual date from which we want the part of the date

--Example 1:
SELECT DATENAME(DAY, GETDATE()) -- Returns 24
SELECT DATENAME(WEEKDAY, '01/13/2022') --Returns Thusrday
SELECT DATENAME(MONTH, '01/24/2022') --Returns January

--Example 2:
SELECT 
    [First Name] + ' ' + [Last Name] AS [Full Name], 
    [Date of Birth], 
    DATENAME(WEEKDAY, [Date of Birth]) AS [Day of Birth],
    DATENAME(MONTH, [Date of Birth]) AS [Month of Birth],
    YEAR([Date of Birth]) AS Year
FROM tblPerson


--Side Distraction
SELECT *--[Employee ID], [Date of Birth]
FROM tblPerson

ALTER TABLE tblPerson
    ADD [Date of Birth] DATETIME
GO

-- Update rows in table 'TableName'
UPDATE tblPerson
SET
    [Date of Birth] = '02/08/1992'
   
WHERE [Employee ID] = 6 /* add search conditions here */
GO

--Part 27 - DateTime Function contd
--DatePart, DateAdd and DateDiff functions 

--DatePart(DatePart, Date) - Return an integer representing the specified DatePart. This function is similar to DateName().
--DateName() returns nvarchar, where as DatePart() returns an integer.
--Example:
SELECT DATEPART(WEEKDAY, GETDATE())
SELECT DATENAME(WEEKDAY, GETDATE())

--DATEADD(datepart, NumberToAdd, date) - Returns the DateTime, after adding specified NumberToAdd, to the datepart specified of the given date
--Example:
SELECT DATEADD(DAY, 20, GETDATE())
SELECT DATEADD(DAY, -20, GETDATE())

--DATEDIFF(DATEPART, STARDATE, ENDDATE) - Return the count of the specified datepart boundaries crossed between the specified stardate and enddate
--Example:
SELECT DATEDIFF(MONTH, '11/30/2005', '01/31/2006')
SELECT DATEDIFF(DAY,'11/30/2005', '01/31/2006')

--Practical Example
DECLARE @DOB datetime, @tempdate datetime, @years INT, @months INT, @days INT
SET @DOB = '10/20/1998' -- NOTE: It is '10/20/1998' which is Month/Day/Year

SELECT @tempdate = @DOB

SELECT @years = DATEDIFF(YEAR, @tempdate, GETDATE()) -
                CASE   
                    WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR 
                    (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
                    THEN 1 ELSE 0
                END

SELECT @tempdate = DATEADD(YEAR, @years, @tempdate)

SELECT @months = DATEDIFF(MONTH, @tempdate, GETDATE()) -
                CASE 
                    WHEN (DAY(@DOB) > DAY(GETDATE()))
                    THEN 1 ELSE 0
                END

SELECT @tempdate = DATEADD(MONTH, @months, @tempdate)

SELECT @days = DATEDIFF(DAY, @tempdate, GETDATE())

SELECT @tempdate = DATEADD(DAY, @days, @tempdate)

SELECT @years AS Years, @months AS Months, @days AS [DAYS]
GO


--Converting this into a USER DEFINED FUNCTION
--Practical Example

SELECT [Employee ID], [First Name] + ' ' + [Last Name] AS [Full Name], [Date of Birth], dbo.fnComputeAge ([Date of Birth]) as Age
FROM tblPerson
GO

SELECT dbo.fnComputeAge ('11/30/2005')
GO

--Creating a User Defined Function (UDF)
CREATE FUNCTION fnComputeAge (@DOB DATETIME)
RETURNS NVARCHAR (50)
AS
BEGIN

    DECLARE  @tempdate datetime, @years INT, @months INT, @days INT --@DOB datetime
    --  SET @DOB = '10/20/1998' -- NOTE: It is '10/20/1998' which is Month/Day/Year

    SELECT @tempdate = @DOB

    SELECT @years = DATEDIFF(YEAR, @tempdate, GETDATE()) -
                    CASE   
                        WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR 
                        (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
                        THEN 1 ELSE 0
                    END

    SELECT @tempdate = DATEADD(YEAR, @years, @tempdate)

    SELECT @months = DATEDIFF(MONTH, @tempdate, GETDATE()) -
                    CASE 
                        WHEN (DAY(@DOB) > DAY(GETDATE()))
                        THEN 1 ELSE 0
                    END

    SELECT @tempdate = DATEADD(MONTH, @months, @tempdate)

    SELECT @days = DATEDIFF(DAY, @tempdate, GETDATE())

    SELECT @tempdate = DATEADD(DAY, @days, @tempdate)

    DECLARE @Age NVARCHAR(50)
    SET @Age =  CONVERT(nvarchar(4), @years) + ' Years ' + CAST(@months AS nvarchar(10)) + ' Months ' + CONVERT(nvarchar(20), @days) + ' Days Old '
    
    RETURN @AGE
END
GO

--To drop function
DROP FUNCTION dbo.fnComputeAge
GO


--Part 28 - CAST and CONVERT Function
--To convert one data type to another, CAST and CONVERT functions can be used

--Example 1:
--For CAST function
 SELECT [Employee ID], [First Name], City, CAST([Date of Birth] AS nvarchar) AS DOB 
 FROM tblPerson

 --For CONVERT function
 --The CONVERT function has another parameter called the "Style"
 SELECT [Employee ID], [First Name], City, Convert(nvarchar(50),[Date of Birth],105) AS DOB 
 FROM tblPerson

--Style Options for CONVERT function
-- 101 : mm/dd/yyyy
-- 102 : yy.mm.dd
-- 103 : dd/mm/yyyy
-- 104 : dd.mm.yy
-- 105 : dd-mm-yy

--NOTE: To control the formatting of the Data part, DateTime has to be converted to NVARCHAR using the styles provided.

--To get just the date part, DateTime:
SELECT CONVERT(varchar(10), GETDATE(), 101) AS Date

--In SQL serevr, Date datatype is introduced, so you can also use:
--For CAST Function
SELECT CAST(GETDATE() AS date) AS Date
--For CONVERT Function
SELECT CONVERT(DATE, GETDATE()) AS Date

--Example: A query that will give total registration per day
SELECT  CAST([Registration Date] AS date) AS [Registration Date], COUNT(ID) AS [Registration Count]
FROM tblUKCustomers
GROUP BY CAST([Registration Date] AS date)


--Add Registration Date
ALTER TABLE tblUKCustomers
    ADD [Registration Date] /*new_column_name*/ DATETIME /*new_column_datatype*/ NULL /*new_column_nullability*/
GO

-- Update rows in table 'tblUKCustomers'
UPDATE tblUKCustomers
SET
    [Registration Date] = '05/03/2007'
    
WHERE ID = 1	/* add search conditions here */
GO


SELECT *
FROM tblUKCustomers
GO


--SKIP Part 29 - Mathematical Functions

--Part 30 - User Defined Functions (UDF)
--Types of UDF
--1.)Scaler Functions
--2.)Inline table-valued functions
--3.)Multi-statement table-valued functions

--Scaler Functions may or may not have parameters, but always return a single(scaler) value. The returned value can be 
--of any data type, except text, ntext, image, cursor and timestamp

--Example of Scaler Function
--Creating a User Defined Function (UDF)
--Create Age Function
CREATE FUNCTION CalculateAge (@DOB DATE)
RETURNS INT
AS
BEGIN
    --DECLARE @DOB DATE -- DELETE THIS... NOT REQUIRED
    DECLARE @AGE INT
    --SET @DOB = '10/20/1998' --DELETE THIS... NOT REQUIRED

    SET @AGE = DATEDIFF(YEAR, @DOB, GETDATE()) -
                CASE
                    WHEN
                        (MONTH(@DOB) > MONTH(GETDATE())) OR 
                        (MONTH(@DOB) = MONTH(GETDATE())) AND 
                        (DAY(@DOB) > DAY(GETDATE()))
                    THEN 1
                    ELSE 0
                END

    RETURN @AGE --Change 'SELECT' to 'RETURN'
END
GO
--Invoke Age Function
SELECT dbo.CalculateAge('10/20/1998') AS AGE
GO

--Example 2: 
--Getting an Age column using a User Defined Function (UDF)
--Using UDF in the SELECT CLAUSE
SELECT [Employee ID], [First Name],dbo.CalculateAge([Date of Birth]) AS Age
FROM tblPerson

--Example 3:
--Using UDF in the WHERE CLAUSE
SELECT [Employee ID], [First Name], [Date of Birth], Age, dbo.CalculateAge([Date of Birth]) AS [Calc Age]
FROM tblPerson
WHERE dbo.CalculateAge([Date of Birth]) > 25

--NOTE: If you want to get the SYNTAX for a procudure or function, just type
sp_helptext CalculateAge


-- Part 31 - Inline Table Valued Functions
-- A scaler function returns a scaler value
-- An Inline Table Value returns a table

SELECT *
FROM tblPerson

--Add a new column to tblperson table
ALTER TABLE tblperson
    ADD Gender NVARCHAR(50)
GO

-- Update rows in table 'tblperson'
UPDATE tblPerson
SET
    [Gender] = 'Female'
    
    -- add more columns and values here
WHERE [Employee ID] = 6	/* add search conditions here */
GO

--Example 1
CREATE FUNCTION fn_PersonByGender (@Gender nvarchar(20))
RETURNS TABLE
AS
RETURN 
    (
        SELECT [Employee ID], GenderID, Age, City, [Date of Birth], [First Name], Gender
        FROM tblPerson
        WHERE @Gender = Gender
    )
GO

DROP FUNCTION fn_PersonByGender

-- CALLING THE FUNCTION 'fn_PersonByGender'
SELECT *
FROM fn_PersonByGender('Male')
