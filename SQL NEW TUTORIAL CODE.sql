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

