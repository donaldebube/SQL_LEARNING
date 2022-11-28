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
-- GO

--Left Self Join
SELECT E.[First Name] AS [Employee Name], M.[First Name] AS [Manager Name]
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

-- When can we use Inline Table Valued Functions:
-- 1.) Inline Table Vauled functions can be used to achieve the functionality of parametized views.
-- 2.) The table returned by the table valued function can also be used in joins with other tables.

-- NOTE: YOU CAN UPDATE THE INFORMATION IN A TABLE WITH INLINE TABLE VALUED FUNCTIONS
-- IT IS BETTER TO USE INLINE TABLE VALUED FUNCTIONS OVER MULTI-STATEMENT VALUED FUNCTION

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

-- Syntax to drop function
DROP FUNCTION fn_PersonByGender
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

-- CALLING THE FUNCTION 'fn_PersonByGender'
SELECT *
FROM fn_PersonByGender()
GO

-- Creating another inline table valued function
CREATE FUNCTION fn_ILTVF_PersonByGender()
RETURNS TABLE
AS
RETURN 
    (
        SELECT [Employee ID], GenderID, Age, City, [Date of Birth], [First Name], Gender
        FROM tblPerson
    )
GO

-- CALLING THE 'fn_ILTVF_PersonByGender()' FUNCTION
SELECT *
FROM fn_ILTVF_PersonByGender()

-- How to update info using inline table valued functions
UPDATE fn_ILTVF_PersonByGender()
SET
    City = 'Imo'
WHERE [Employee ID] = 1
GO



-- Part 32 - Multi- Statement Table Valued Functions
-- NOTE: In Inline Table Valued Function, you dont dpecify the structure of a table.
-- Multi Statement Table Valued Function, you specify the structure of a table.

-- Example
CREATE FUNCTION fn_mstvf_GetEmployees()
RETURNS @Table TABLE ([Employee ID] INT, [First Name] nvarchar(50), [Date of Birth] DATE, Gender nvarchar(50))
AS
    BEGIN
        INSERT INTO @Table
            SELECT [Employee ID], [First Name], CONVERT(DATE, [Date Of Birth]), Gender
            FROM tblPerson
        RETURN
    END
GO

-- CALLING THE FUNCTION 'fn_mstvf_GetEmployees()'
SELECT *
FROM fn_mstvf_GetEmployees()

-- Part 33 - Functions (Important Concepts)

-- Deterministic Functions always return the same result anytime they are called with a specific set of input values and given the same state of the database.
-- Examples are: Square(), Power(), Sum(), AVG() and Count()
-- Basically, all aggregate functions are Deterministic Functions

-- Non-deterministic Functions may return different results each time they are called with a specific set of input values even if the database state that their access remains the same.
-- Examples are: GetDate() and CURRENT_TIMESTAMP

--Rand() Function is a NON-DETERMINISTIC FUNCTION, but if you provide the seed value, the function becomes deterministic, as the same value gets returned for the same seed value 

SELECT*
FROM tblPerson
GO

--Example: Using a scaler function, create a simple function to provide the name of an employee with the ID
CREATE FUNCTION fn_GetNameWithEmployeeID(@ID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN
        (
            SELECT [First Name]
            FROM tblPerson
            WHERE [Employee ID] = @ID
        )
END
GO

-- IF YOU WANT TO ALTER A FUNCTION, SIMPLY EXCHANGE CREATE WITH ALTER
--  TO ENCRYPT A FUNCTION
ALTER FUNCTION fn_GetNameWithEmployeeID(@ID INT)
RETURNS NVARCHAR(100)
WITH ENCRYPTION
AS
BEGIN
    RETURN
    (
        SELECT [First Name]
        FROM tblPerson
        WHERE [Employee ID] = @ID
    )
END
GO


-- EXECUTE FUNCTION
SELECT dbo.fn_GetNameWithEmployeeID (1)

-- To get the definition of a function, do the following
sp_helptext fn_GetNameWithEmployeeID
GO

-- Creating a function WITH SCHEMABINDING OPTION
ALTER FUNCTION fn_GetNameWithEmployeeID(@ID INT)
RETURNS NVARCHAR(100)
-- WITH ENCRYPTION -- Remove encrytion 
AS
BEGIN
    RETURN
    (
        SELECT [First Name]
        FROM tblPerson
        WHERE [Employee ID] = @ID
    )
END
GO

-- SCHEMABINDING OPTION makes it impossible for a table that is being used by a function to get deleted.

--Example:
ALTER FUNCTION fn_GetNameWithEmployeeID(@ID INT)
RETURNS NVARCHAR(50)
WITH SCHEMABINDING
AS
    BEGIN
        RETURN
        (
            SELECT [First Name]
            FROM dbo.tblPerson
            WHERE [Employee ID] = @ID
        )
    END
GO

-- TESTING THE SCHEMABINDING OPTION AND IT WORKS!
DROP TABLE tblPerson



-- Part 34 - Temp Tables

-- Temp Tables get created in the TempDB and are automaticaly deleted when they are no longer used.
-- Types of Temporary Tables
-- 1.) Local Temp Tables
-- 2.) Global Temp Tables

-- HOW TO CREATE A LOCAL TEMP TABLE
-- To create a temp table, all you need to do in input a # (hash) symbol in front of the temp table name
-- LOCAL TEMP TABLE IS AVAILABLE ONLY FOR THE CONNECTION THAT HAS CREATED THE TABLE

-- HOW TO CREATE A GLOBAL TEMP TABLE
-- To create a temp table, all you need to do in input TWO # (hash) symbol in front of the temp table name e.g. ##PrinterName
-- GLOBAL TEMP TABLE ARE VISIBLE TO ALL THE NEW QUERY CONNECTIONS OF THE SQL SERVER AND ARE ONLY DESTROYED WHEN THE LAST CONNECTION REFERENCING THE TABLE IS CLOSED.

-- DIFFERENCES BETWEEN LOCAL AND GLOBAL TEMP TABLES
-- 1.) LOCAL TEMP TABLES are prefixed with the single pound (#) symbol, where as the global temp tables are prefixed with 2 pound (##) symbols
-- 2.) SQL Server appends some random numbers at the end of the local temp table name, where this is not done for the global table name.
-- 3.) Local Temp Tables are only visible to that session of the SQL Server which has created it, where as Global Temp Tables are visible to all the SQL server sessions
-- 4.) Local Temp Tables are automatically dropped, when the session that created the temp tables is closed, where as GLOBAL TEMP TABLES ARE DESTROYED WHEN THE LAST CONNECTION THAT IS REFERENCING THE GLOBAL TEMP IS CLOSED.

-- Example 1:
--Create Temp Table
CREATE TABLE #PersonDetails ([Employee ID] INT, Name NVARCHAR(50))

-- Insert info into temp table
-- Insert rows into table '#PersonDetails'
INSERT INTO #PersonDetails
( -- columns to insert data into
 [Employee ID], [Name]
)
VALUES
( -- first row: values for the columns in the list above
    1, 'Mike'
),
( -- second row: values for the columns in the list above
    2, 'Donald'
),
(-- third row: values for the columns in the list above
    3, 'Amanda'
)
GO

-- CALLING A TEMP TABLE
SELECT *
FROM #PersonDetails


-- Part 35 -Indexes

-- How to Create an Index
CREATE INDEX IX_EmployeeSalary_Salary
ON EmployeeSalary (Salary ASC)
GO

-- How to get the definition of an INDEX
sp_helpindex EmployeeSalary

-- How to drop an index
DROP INDEX IX_EmployeeSalary_Salary
GO


-- Part 36 - Clustered & Non- Clustered Indexes

-- Clustered Index determines the physical order of the data in a table. For this reason, a table can have only one clustered index.

-- Create new table for index purpose
CREATE TABLE tblEmployees1
    (
        ID int PRIMARY KEY,
        NAME NVARCHAR(50),
        SALARY INT,
        GENDER NVARCHAR(50),
        CITY NVARCHAR(50)
    )
GO

INSERT INTO tblEmployees1
VALUES
(-- First row
    1, 'Becky', 45000, 'Female', 'Delta'
),
(-- Second row
    2, 'Kiki', 60000, 'Male', 'Edo'
),
(-- Third row
    3, 'Donald', 50000, 'Male', 'Lagos'
),
(-- Forth row
    4, 'Amanda', 70000, 'Female', 'Lagos'
),
(
    5, 'Michael', 40000, 'Male', 'Delta'
)
GO

-- Create an Index
CREATE INDEX IX_tblEmployees1_Salary
ON tblEmployees1 (Salary ASC)
GO
-- Creating a composite cluster index
-- NOTE: You can only have one cluster index on a table.
-- A composite cluster index has two or more columns as index keys e.g (ON tblEmployees1 (Salary ASC, GENDER DESC))
CREATE CLUSTERED INDEX IX_tblEmployees1_Salary1_Gender
ON tblEmployees1 (Salary DESC, GENDER ASC)
GO


-- DROP an Index
DROP INDEX tblEmployees1.IX_tblEmployees1_Salary1_Gender
GO

-- Query to drop a special Clustered index created by SQL
ALTER TABLE [dbo].[tblEmployees1] DROP CONSTRAINT [PK__tblEmplo__3214EC2750ABD784] WITH ( ONLINE = OFF )
GO

sp_helpindex tblEmployees1
GO

SELECT *
FROM tblEmployees1


-- NON-CLUSTERED INDEX
-- A table can have more than one non-clustered index
-- A nonclustered index is analogous to an index in a textbook. The data is stored in one place, the index in another place.

-- Differences bewteen a Clustered Index and a NON-Clustered Index
-- 1.) Only one clustered index per table, where as you can have more than one non clustered index.
-- 2.) Clustered index is faster than a non clustered index, because , the clustered index has to refer back to the table, if the selected column is ot present in the index
-- 3.) Clusterd index determines the storage order of rows in the table and hence doesn't require additional disk space, but where as a Non Clustered index is stored seperately from the table. Additional torage is required.



-- Part 37 - Unique & Non-Unique Indexes

-- Unique Index is used to enforce uniqueness of key values in the index.
-- By default, a PRIMARY KEY constraint creates a unique clustered index.
-- UNIQUENESS is a property of an indexand both CLUSTERED and NON-CLUSTERED indexes can be UNIQUE

-- Unique Constraints are the same as Unique Index
SELECT *
FROM tblEmployees1

ALTER TABLE tblEmployees1
ADD CONSTRAINT UQ_tblEmployees1_ID
UNIQUE CLUSTERED (ID)

-- Useful points to remember:
-- 1.) By default, a PRIMARY constraint, creates a unique clustered index, where as a UNIQUE Constarint creates a unique Non-clustered index. These defaults can be changed if you wish to.
-- 2.) A UNIQUE constraint or a UNIQUE index cannot be created on an existing table, if the tabke contains duplicate values in the key columns. Obviously, to solve this, remove the key columns from the index definition or delete or update the duplicate values



-- Part 38 - Advantages and Disadvantages of Indexes (SKIP THIS)


-- Part 39 - Views in SQL Server
-- A veiw is nothing more than a saved SQL query. 
-- A view can also be considered as a virtual table.

-- Create a new table
CREATE TABLE tblDepartment
(
    [Department ID] INT NOT NULL PRIMARY KEY, -- primary key column
    [Departmnent Name] [NVARCHAR](50) NOT NULL,
);
GO

-- Insert rows into table 'tblDepartment'
INSERT INTO tblDepartment
( -- columns to insert data into
 [Department ID], [Departmnent Name]
)
VALUES
( -- first row: values for the columns in the list above
    1, 'IT'
),
( -- second row: values for the columns in the list above
    2, 'Payroll'
),
( -- third row: values for the columns in the list above
    3, 'HR'
),
( -- forth row: values for the columns in the list above
    4, 'Admin'
)

GO

SELECT *
FROM tblEmployees1

-- Add New Column
ALTER TABLE tblEmployees1
ADD [Department ID] INT
GO

-- Update rows in table 'tblEmployees1'
UPDATE tblEmployees1
SET
    [Department ID] = 3
WHERE ID = 6	/* add search conditions here */
GO


SELECT E.NAME, E.SALARY, D.[Department ID] ,D.[Departmnent Name], E.CITY
FROM tblEmployees1 AS E
INNER JOIN tblDepartment AS D
    ON E.[Department ID] = D.[Department ID]
GO

-- To create a VIEW
CREATE VIEW VWEmployeesByDepartment
AS
SELECT E.NAME, E.SALARY, D.[Department ID] ,D.[Departmnent Name], E.CITY
FROM tblEmployees1 AS E
INNER JOIN tblDepartment AS D
    ON E.[Department ID] = D.[Department ID]
GO

-- Advantages of using Views
--1.) Views can be used to reduce the complexity of the database
-- 2.) Views can be used as a mechanism to implement row and column level security.
-- 3.) Views can be used to present aggregated data and hide detailed data.

-- To modify a view - ALTER VIEW Statement
-- To Drop a view - DROP VIEW VWNAME

-- Call a View
SELECT *
FROM VWEmployeesByDepartment



-- Part 40 - Updateable Views
-- A view ia stored select statement
-- When you update a view, it will also update the underline base table from which it is getting its data

-- Updating a view
UPDATE VWEmployeesByDepartment
SET 
    NAME = 'Rebecca'
WHERE NAME = 'Becky'

-- Verify if it changed in the view
SELECT *
FROM VWEmployeesByDepartment

-- Verify if it changed in the ACTUAL TABLE
SELECT *
FROM tblEmployees1

-- IT CHANGED!

-- Delete date
DELETE FROM VWEmployeesByDepartment
WHERE [NAME] = 'Donald'

sp_helpindex VWEmployeesByDepartment

ALTER TABLE [dbo].[tblEmployees1] DROP CONSTRAINT [UQ_tblEmployees1_ID] WITH ( ONLINE = OFF )
GO



-- Part 41 - Indexed Views
-- What happens when you create an index on a view?
-- A standard or non-standard view us just a stored SQL query. When we try to retrieve data from the view, the data is actually retrieved from the underlying base tables.
-- A VIEW id just a virtual table that does not store any data, by default.
-- However, when you create an index pn a VIEW, the view gets materialized. This means, the view is now capable of storing data.
-- In SQL server, we call them Indexed views and in Oracle, Materialized Views

-- Example 1:

-- Create two new tables.

-- Create first table
CREATE TABLE tblProduct
    (
        [Product ID] INT PRIMARY KEY,
        [Name] NVARCHAR(50),
        [Unit Price] INT
    )
GO

-- Change Table Name
EXEC sp_rename 'tblProductSales', 'tblProduct'
GO


-- Insert Values into Table
-- Insert rows into table 'tblProduct'
INSERT INTO tblProduct
( -- columns to insert data into
 [Product ID], [Name], [Unit Price]
)
VALUES
( -- first row: values for the columns in the list above
    1, 'Books', 20
),
( -- second row: values for the columns in the list above
    2, 'Pens', 14
),
( -- third row: values for the columns in the list above
    3, 'Pencils', 11
),
( -- forth row: values for the columns in the list above
    4, 'Clips', 10
)
GO

-- Verify if table created is correct
SELECT *
FROM tblProduct
GO


-- Create second table
CREATE TABLE tblProductSale
    (
        [Product ID] INT,
        [Quantity Sold] INT
    )
GO

-- Insert rows into table 'tblProductSales'
INSERT INTO tblProductSale
    (
        [Product ID], [Quantity Sold]
    )
VALUES
(
    1, 10
),
(
    3, 23
),
(
    4, 21
),
(
    2, 12
),
(
    1, 13
),
(
    3, 12
),
(
    4, 13
),
(
    1, 11
),
(
    2, 12
),
(
    1, 14
)
GO

-- Verify if table created is correct
SELECT *
FROM tblProductSale
GO

-- Create View 
CREATE VIEW VWTotalSalesByProduct
WITH SCHEMABINDING
AS
    SELECT 
        p.Name, 
        SUM(ISNULL((PS.[Quantity Sold] * P.[Unit Price]), 0)) AS [Total Sales],
        COUNT(PS.[Quantity Sold]) AS [Total Transactions]
    FROM dbo.tblProductSale AS PS
    INNER JOIN dbo.tblProduct AS P
        ON PS.[Product ID] =P.[Product ID]
    GROUP BY P.Name
GO

-- Change COUNT FUNCTION TO COUNT_BIG (*) FUNCTION
ALTER VIEW VWTotalSalesByProduct
WITH SCHEMABINDING
AS
    SELECT 
        p.Name, 
        SUM(ISNULL((PS.[Quantity Sold] * P.[Unit Price]), 0)) AS [Total Sales],
        COUNT_BIG(*) AS [Total Transactions]
    FROM dbo.tblProductSale AS PS
    INNER JOIN dbo.tblProduct AS P
        ON PS.[Product ID] =P.[Product ID]
    GROUP BY P.Name
GO


-- Verify if the view created is correct
SELECT *
FROM VWTotalSalesByProduct
GO

-- Guidelines for creating Indexed Views
-- 1.) The view should be created with SchemaBinding option.
-- 2.) If an aggregate function is the SELECT LIST, references an expression, and if there is a possibility for that expression to become NULL, then a replacement value should be specified.
-- 3.) If GROUP BY specified, the view select list must contain a COUNT_BIG(*) expression
-- 4.) The base tables in the view, should be referenced with 2 part name, i.e (dbo.tablename)

-- CREATE AN INDEX ON THE VIEW
CREATE UNIQUE CLUSTERED INDEX UIX_VWTotalSalesByProduct_Name
    ON VWTotalSalesByProduct (Name)
GO




-- Part 42 - View Limitations

-- 1.) You cannot pass parameters to a view. Table valued functions are excellent replacement for parameterized views.
-- 2.) Rules and defaults cannot be associated with views.
-- 3.) The ORDER BY clause is invalid in VIEW unless TOP or FOR XML is also specified.
-- 4.) VIEWS cannot be based on temporary tables


-- Part 43 - DML Triggers

-- In SQL Server, there are 3 types of triggers
-- 1.) DML Triggers
-- 2.) DDL Triggers
-- 3.) Logon Trigger

-- DML (Data Manipulation Language) Triggers are fired automatically in response to DML events (INSERT, UPDATE & DELETE)

-- DML Triggers can be gain classified into 2 types.
-- 1.) After triggers (Sometimes called as FOR triggers)
-- 2.) Instead of triggers

-- 1.) After Triggers, fires after the triggering action. The INSERT, UPDATE and DELETE statements, causes an after trigger to fire the respective statements complete execution.
-- 2.) INSTEAD OF Triggers, fires instead of the triggering action. The INSERT, UPDATE and DELETE statements causes an INSTEAD OF Trigger to fire INSTEAD OF the respective statement execution

-- Example 1:

-- First, create a new tablecalled "tblEmployeeAudit"
CREATE TABLE tblEmployeeAudit
(
    [AUDIT DATA] NVARCHAR (500)
)


DROP TABLE tblEmployeeAudit

-- Use tblEmployees1 for the example
SELECT *
FROM tblEmployees1
GO

SELECT *
FROM tblEmployeeAudit
GO

-- CREATE A TRIGGER
-- For Insert Action
CREATE TRIGGER tr_tblEmployees1_ForInsert
ON tblEmployees1
FOR INSERT
AS 
BEGIN
    DECLARE @ID INT

    SELECT @ID = ID
    FROM inserted

    INSERT INTO tblEmployeeAudit
    (
        [AUDIT DATA]
    )
    VALUES 
    (
        'New employee with ID, ' +  CAST(@ID AS NVARCHAR(5))  + ' is added at ' +  CAST(GETDATE() AS NVARCHAR(50))
    )
END
GO

-- Insert value
INSERT INTO tblEmployees1 
    (
        ID, NAME, SALARY, GENDER, CITY, [Department ID]
    )

VALUES 
    (6, 'Jane', 20000, 'Female', 'Edo', 3)
GO

-- For Delete Action
CREATE TRIGGER tr_tblEmployees1_ForDelete
ON tblEmployees1
FOR DELETE
AS 
BEGIN
    DECLARE @ID INT

    SELECT @ID = ID 
    FROM deleted

    INSERT INTO tblEmployeeAudit
    (
        [AUDIT DATA]
    )
    VALUES
    (
        'An existing employee with ID ' + CAST(@ID AS nvarchar(50)) + ' is deleted at ' + CONVERT(nvarchar(50), GETDATE())
    )
END

DELETE FROM tblEmployees1 
WHERE ID = 6

-- Part 44 - After Update Triggers

-- Use the tblEmployees table for the update action
SELECT *
FROM tblEmployees1
GO

-- For UPDATE action
CREATE TRIGGER tr_tblEmployees1_ForUpdate
ON tblEmployees1
FOR UPDATE
AS
BEGIN
    SELECT *
    FROM deleted
    SELECT *
    FROM deleted
END

-- Update row
UPDATE tblEmployees1 
SET 
    NAME = 'Tosin',
    SALARY = 20000,
    GENDER = 'Female'
WHERE ID = 3
GO  

DROP TRIGGER tr_tblEmployees1_ForUpdate
GO
-- Example
ALTER TRIGGER tr_tblEmployees1_ForUpdate
ON tblEmployees1
FOR UPDATE
AS 
BEGIN
    DECLARE @ID INT
    DECLARE @OldName NVARCHAR(50), @NewName NVARCHAR(50)
    DECLARE @OldSalary INT, @NewSalary INT
    DECLARE @OldGender NVARCHAR(50), @NewGender NVARCHAR(50)
    DECLARE @OldCity NVARCHAR(50), @NewCity NVARCHAR(50)
    DECLARE @OldDepartmentId INT, @NewDepartmentId INT

    DECLARE @AuditString NVARCHAR(1000)

    SELECT *
    INTO #TempTable
    FROM inserted

    WHILE 
        (
            EXISTS 
            (
                SELECT ID 
                FROM #TempTable  
            )
        )
    BEGIN
        SET @AuditString = ''

        SELECT TOP 1 
            @ID = ID, 
            @NewName = NAME,
            @NewGender = GENDER, 
            @NewSalary = SALARY,
            @NewCity = CITY,
            @NewDepartmentId = [DEPARTMENT ID]
        FROM #TempTable

        SELECT 
            @OldName = NAME,
            @NewGender = GENDER, 
            @NewSalary = SALARY,
            @NewCity = CITY,
            @NewDepartmentId = [DEPARTMENT ID]
        FROM deleted
        WHERE ID = @ID

        SET @AuditString = 'Employee with ID = ' + CAST(@ID AS nvarchar(50)) + ' changed '
            IF (@OldName != @NewName)
                SET @AuditString = @AuditString + ' Name from ' + @OldName + ' to ' + @NewName
        
            IF (@OldCity != @NewCity)
                SET @AuditString = @AuditString + ' City from ' + @OldCity + ' to ' + @NewCity
            
            IF(@OldDepartmentId <> @NewDepartmentId)
                SET @AuditString = @AuditString + ' Department ID from ' + @OldDepartmentId + ' to ' + @NewDepartmentId
            
            IF(@OldGender <> @NewGender)
                SET @AuditString = @AuditString + ' Gender from ' + @OldGender + ' to ' + @NewGender

            IF(@OldSalary <> @NewSalary)
                SET @AuditString = @AuditString + ' Salary from ' + @OldSalary + ' to ' + @NewSalary

        INSERT INTO tblEmployeeAudit
        (
            [AUDIT DATA]
        )
        VALUES
        (
            @AuditString
        )

        DELETE 
            FROM #TempTable 
            WHERE ID = @ID
    END
END
GO

 
-- Test Update
UPDATE tblEmployees1 
SET 
    NAME = 'Donald',
    SALARY = 50000,
    GENDER = 'Male',
    CITY = 'DELTA'
WHERE ID =4
GO

SELECT *
FROM tblEmployeeAudit
GO

SELECT *
FROM tblEmployees1
GO

-- Figure out the problem later today and Happy Birthday Donald.

-- Skip Part 45, 46 and 47.

-- Start at Part 48
-- Part 48 - Derived Tables and Common Table Expressions

-- NOTE: Views get saved in the database and can be available to othere queries and stored procedures.
-- However, if this view is only used at this one place, it can be easily eliminated using other options, like CTE, derived tables, temp tables, table variables.

-- Using Views
CREATE VIEW VWEmployeeCount
AS
SELECT
    D.[Departmnent Name], 
    D.[Department ID], 
    COUNT(*) AS [Total Employees] 
FROM tblEmployees1 AS E
INNER JOIN tblDepartment AS D
 ON E.[Department ID] = D.[Department ID]
GROUP BY    D.[Department ID], D.[Departmnent Name]
GO

SELECT [Departmnent Name], [Total Employees]
FROM VWEmployeeCount
WHERE [Total Employees] < 2
GO


-- NOTE: Temporary tables are stored in TempDB. Local temporary tables are visible only in the current session and 
-- can be shared between nested stored procedures calls.
-- Global temp tables are visible to other sessions and are destroyed when the last connection referencing the table is closed.


-- Using Temp Tables
SELECT 
    D.[Department ID],
    D.[Departmnent Name],
    COUNT(*) AS [Total Employees]
INTO #TempEmployeeCount
FROM tblEmployees1 AS E
INNER JOIN tblDepartment AS D
    ON E.[Department ID] = D.[Department ID]
GROUP BY D.[Department ID], D.[Departmnent Name]

SELECT *
FROM #TempEmployeeCount
WHERE [Total Employees] < 2

DROP TABLE #TempEmployeeCount


-- NOTE: Derived Tables are available only in the context of the current query
-- Using Derived Table

SELECT [Departmnent Name], [Total Employees]
FROM 
    (
        SELECT 
            D.[Departmnent Name], 
            D.[Department ID], 
            COUNT(*) AS [Total Employees]
        FROM tblEmployees1 AS E
        INNER JOIN tblDepartment AS D
            ON E.[Department ID] = D.[Department ID]
        GROUP BY D.[Departmnent Name], D.[Department ID]
    )
AS [Employee Count] -- This is a DERIVED TABLE.
WHERE [Total Employees] < 2
GO



-- NOTE: A CTE can be thought of as a temporary result set that is defined within the execution scope of a single SELECT, INSERT, UPDATE, DELETE or CREATE VIEW statement.
-- A CTE is similar to a derived table in that it is not stored as an object and lasts only for the duration of the query

-- Using CTE (Common Table Expressions)
WITH [Employee Count]
AS
    (
        SELECT 
            D.[Department ID], 
            D.[Departmnent Name], 
            COUNT(*) AS [Total Employees]
        FROM tblEmployees1 AS E
        INNER JOIN tblDepartment AS D
            ON E.[Department ID] = D.[Department ID]
        GROUP BY D.[Department ID],D.[Departmnent Name]
    )
SELECT [Departmnent Name], [Total Employees]
FROM [Employee Count]
WHERE [Total Employees] < 2
GO

SELECT *
FROM tblDepartment

SELECT * 
FROM tblEmployees1

-- Part 49 -- CTE (Common Table )
-- Common Table Expression (CTE) is introduced in SQL server 2005. 
-- A CTE is a TEMPORARY result set, that can be referenced within a SELECT, INSERT, UPDATE or DELETE statement, that immediately follows the CTE.

SELECT *
FROM tblEmployees1

-- SELECT *
-- FROM tblDepartment

SELECT D.[Departmnent Name], D.[Department ID] , COUNT([Departmnent Name]) AS [Department/Staff]
FROM tblEmployees1 AS E
INNER JOIN tblDepartment AS D
    ON E.[Department ID] = D.[Department ID]
GROUP BY [Departmnent Name], D.[Department ID]
GO

-- Creating a CTE
WITH [Employee Count 2]
AS 
(
        SELECT 
            [Department ID], 
            COUNT(*) AS [Total Employees]
        FROM tblEmployees1
        GROUP BY [Department ID]
)
SELECT [Departmnent Name], [Total Employees]
FROM tblDepartment AS D
INNER JOIN [Employee Count 2] AS EC
    ON D.[Department ID] = EC.[Department ID]
ORDER BY [Total Employees]

-- MULTIPLE CTEs
-- It is possible to create more than one CTE using the WITH KEYWORD. Just use a comma to seperate the different CTE codes
--For example:
WITH [Employee Count 2] ([Department Name], Total) 
AS 
(
        SELECT 
            D.[Departmnent Name],
            COUNT(D.[Department ID]) AS [Total Employees]
        FROM tblEmployees1 AS E
        INNER JOIN tblDepartment AS D
            ON E.[Department ID] = D.[Department ID]
        WHERE [Departmnent Name] IN ('HR', 'IT')
        GROUP BY [Departmnent Name]
),
[Employee Count 3] ([Department Name], Total)
AS 
(
    SELECT 
        D.[Departmnent Name],
        COUNT(D.[Department ID]) AS [Total Employees]
    FROM tblEmployees1 AS E
    INNER JOIN tblDepartment AS D
       ON E.[Department ID] = D.[Department ID]
    WHERE [Departmnent Name] IN ('Admin', 'Payroll')
    GROUP BY [Departmnent Name]
)
SELECT *
FROM [Employee Count 2]
UNION
SELECT *
FROM [Employee Count 3]


-- Part 50 - Updatable CTEs
-- NOTE: If a CTE is created on one base table, then it is possible to UPDATE the CTE, which in turn will update the underlying table.

-- For example:
-- Creating a simple CTE
WITH Employee_Name_Gender
AS
(
    SELECT ID, NAME, GENDER
    FROM tblEmployees1
)
SELECT *
FROM Employee_Name_Gender

-- Updating a CTE
WITH Employee_Name_Gender
AS
(
    SELECT ID, NAME, GENDER
    FROM tblEmployees1
)
UPDATE Employee_Name_Gender
SET GENDER = 'Male' 
WHERE ID = 2

-- NOTE: If a CTE is based on more than one table, and if the UPDATE affects only one base table, then the update is allowed.
-- For example:
WITH Employee_by_Department
AS 
(
    SELECT ID, NAME, GENDER, [Departmnent Name]
    FROM tblEmployees1 AS E
    INNER JOIN tblDepartment AS D
        ON E.[Department ID] = D.[Department ID]
    
)
UPDATE Employee_by_Department
SET GENDER = 'Female'
WHERE ID = 2

-- NOTE: If a CTE is based on multiple tables and if the update table affects more than one base table, then the UPDATE is not allowed.
-- For example: 
WITH Employee_by_Department
AS 
(
    SELECT ID, NAME, GENDER, [Departmnent Name]
    FROM tblEmployees1 AS E
    INNER JOIN tblDepartment AS D
        ON E.[Department ID] = D.[Department ID]
    
)
-- This type of update statement is not updateble becaese the modification affects morethan one base table.
UPDATE Employee_by_Department
SET GENDER = 'Female', [Departmnent Name] = 'IT'
WHERE ID = 2
GO

-- NOTE: A CTE is based on more than one base table, and if the UPDATE affects only one base table, the UPDATE affects only one base tabke, the UPDATE succeeds (but not as expected always)


-- Part 51 - Recursive CTEs and the problems they solve
-- Joining a table with itself is called a self join

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Create the table in the specified schema
CREATE TABLE tblStaffInfo
(
 -- primary key column
    [Employee ID] INT,
    [Full Name] [NVARCHAR](50),
    [Manager ID] INT
    -- specify more columns here
);
GO
-- DROP TABLE tblStaffInfo
-- GO

-- Insert rows into table 'tblStaffInfo'
INSERT INTO tblStaffInfo
( -- columns to insert data into
    [Employee ID], 
    [Full Name], 
    [Manager ID]
)
VALUES
(1, 'Tom', 2),
(2, 'Josh', NULL),
(3, 'Mike', 2),
(4, 'John', 3),
(5, 'Pam', 1),
(6, 'Mary', 3),
(7, 'James', 1),
(8, 'Sam', 5),
(9, 'Simon', 1)
GO

SELECT *
FROM tblStaffInfo
GO

-- Using the tblStaffInfo database, we want to map different employees to their respective managers while showing the hierarchy level of each employee
-- Using Recursive CTEs, this can be easily done.

-- A recursive CTE is a CTE that referneces itself.

WITH EmployeesCTE ([Employee ID], [Full Name], [Manager ID], [Level])
AS 
(
    SELECT [Employee ID], [Full Name], [Manager ID], 1
    FROM tblStaffInfo
    WHERE [Manager ID] IS NULL

    UNION ALL

    SELECT 
        SI.[Employee ID], 
        SI.[Full Name], 
        SI.[Manager ID], 
        EC.[Level] + 1
    FROM tblStaffInfo AS SI
    INNER JOIN EmployeesCTE AS EC
    ON SI.[Manager ID] = EC.[Employee ID]
)
SELECT 
    Emp.[Full Name] AS [Employee Name], 
    ISNULL(Mgr.[Full Name], 'Super Boss') AS [Manager Name],
    Emp.[Level]
FROM EmployeesCTE AS Emp
LEFT JOIN EmployeesCTE AS Mgr
ON Emp.[Manager ID] = Mgr.[Employee ID]
GO


-- Part 52 - Database Normalization
-- DATABASE NORMALIZATION is the process of organizing data to minimize data redundancy (data duplication), which in turn ensures data consistency.

-- PROBLEMS OF DATA REDUNDANCY
-- 1.) Disk Space Wastage
-- 2.) Data Inconsistency
-- 3.) DML queries can become slow.
-- Examples of DML queries are INSERT, UPDATE & DELETE

-- First Normal Form (1NF)
-- A table is said to be in 1NF, if 
-- 1.) The data in each column should be atomic. No multiple values, separated by comma.
-- 2.) The table does not contain any repeating column groups.
-- 3.) Identify each record uniquely using primary key.

-- Example of a First Normal Form (1NF)
-- Table 1
SELECT *
FROM tblEmployees1

-- Table 2
SELECT *
FROM tblDepartment

-- First Normal Form (1NF) Table
SELECT 
    E.NAME,
    E.SALARY,
    E.GENDER,
    E.CITY,
    D.[Departmnent Name]
FROM tblEmployees1 AS E
INNER JOIN tblDepartment AS D
ON E.[Department ID] = D.[Department ID]
GO

-- Part 53 - 2NF & 3NF

-- For Second Normal Form (2NF)
-- A table is said to be in the 2NF, if 
-- 1.) The table meets all the conditions of 1NF
-- 2.) Move redundant data to a seperate table
-- 3.) Create relationships between these tables using foreign keys.

-- PROBLEMS OF DATA REDUNDANCY
-- 1.) Disk Space Wastage
-- 2.) Data Inconsistency
-- 3.) DML queries can become slow.
-- Examples of DML queries are INSERT, UPDATE & DELETE

-- For Third Normal Form (3NF)
-- A table is said to be in 3NF, if the table
-- 1.) Meets all the conditions of 1NF and 2NF
-- 2.) Does not contain columns (attributes) that are not fully dependent upon the primary key.


-- Part 54 - Pivot Operator in SQL Server 2008
-- Pivot is a SQL operator that can be used to turn unique values from one column, into multiple columns in the output, there by effectively rotating a table.

-- Create a new table for Pivot example
CREATE TABLE tblEmployeeProductSales
(
    [Sales Agent] [NVARCHAR](50),
    [Sales Country] [NVARCHAR](50),
    [Sales Amount] INT
);
GO

-- Add values to the table
-- Insert rows into table 'tblEmployeeProductSales'
INSERT INTO tblEmployeeProductSales
( -- columns to insert data into
 [Sales Agent], [Sales Country], [Sales Amount]
)
VALUES
('Tom', 'US', 200),
('John', 'US', 180),
('John', 'UK', 260),
('David', 'India', 450),
('Tom', 'India', 350),
('David', 'US', 200),
('Tom', 'US', 130),
('John', 'India', 540),
('John', 'UK', 120),
('David', 'UK', 220),
('John', 'UK', 420),
('David', 'US', 320),
('Tom', 'US', 340),
('Tom', 'UK', 660),
('John', 'India', 430),
('David', 'India', 230),
('David', 'India', 280),
('Tom', 'UK', 480),
('John', 'US', 360),
('David', 'UK', 140)
GO

SELECT *
FROM tblEmployeeProductSales

-- Using the Group BY query.
SELECT 
    [Sales Country], 
    [Sales Agent], 
    SUM([Sales Amount]) AS Total
FROM tblEmployeeProductSales
GROUP BY [Sales Country], [Sales Agent]
ORDER BY [Sales Country]

