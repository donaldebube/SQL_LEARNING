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
    1002, 'Uju', 'Obi', 27, 'Female', 'Enugu'
),
(
    1003, 'Tommy', 'Shelby', 30, 'Male', 'Kogi'
),
-- add more rows here

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




