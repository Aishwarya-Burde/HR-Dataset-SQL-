CREATE DATABASE hrdata;
USE hrdata;
SELECT * FROM EMPLOYEES;

-- Total current employees
SELECT COUNT(*) AS Total_Current_Employees
FROM employees
WHERE DateofTermination = '';

-- Total old employees
SELECT COUNT(*) AS Total_Current_Employees
FROM employees
WHERE DateofTermination != '';

-- Average salary
SELECT AVG(Salary) AS Avg_Salary
FROM Employees;

-- Average age
SELECT AVG(TIMESTAMPDIFF(YEAR,STR_TO_DATE(DOB,'%d-%m-%Y'),CURDATE())) AS Avg_Age
FROM Employees;

-- Average Years in Componey
SELECT AVG(TIMESTAMPDIFF(YEAR,STR_TO_DATE(DateOfHire,'%d-%m-%Y'),CURDATE())) AS Avg_Years_in_Company
FROM Employees;

-- ADDING A NEW COLUMN --
-- Adding new column for employee current status
ALTER TABLE employees
ADD EmployeeCurrentStatus INT;

-- Updating value for new column
SET SQL_SAFE_UPDATES=0;
UPDATE employees
SET EmployeeCurrentStatus = CASE
 WHEN DateofTermination = ''THEN 1
 ELSE 0
END;

-- CALCLATE ATTRITION RATE --
-- Calculate attrition rate based on custom EmpStatusID values
SELECT
     (CAST(COUNT(CASE WHEN EmployeeCurrentStatus = 0 THEN 1 END) AS FLOAT)/COUNT(*))*100 AS Attrition_Rate
FROM employees;

-- Get column Names and data types --
Describe employees;
-- (or) SHOW COLUMNS FROM employees;

-- Print 1st  5 Rows
SELECT * FROM employees
LIMIT 5;

-- Print Last  5 Rows
SELECT * FROM employees
ORDER BY EmpID DESC
LIMIT 5;

-- Changing DATA type of salary
ALTER TABLE employees
MODIFY COLUMN Salary DECIMAL(10,2);

-- FORMATING COLUMN FOR PROPER DATES --
-- Convert all date columns in proper dates
UPDATE employees
SET DOB = STR_TO_DATE(DOB,'%d-%m-%Y');
UPDATE employees
SET DateofHire = STR_TO_DATE(dateofHire,'%d-%m-%Y');
UPDATE employees
SET LastPerformanceReview_Date = STR_TO_DATE(LastPerformanceReview_Date,'%d-%m-%Y');

-- ALTER TABLE --
ALTER TABLE employees
MODIFY COLUMN DOB DATE,
MODIFY COLUMN DateofHire DATE,
MODIFY COLUMN LastPerformanceReview_Date DATE;

-- Read columns to check changes
SELECT DOB, DateofHire,DateofTermination,LastPerformanceReview_Date
FROM employees;
-- (or)describe employees;

-- FILL EMPTY VALUES IN DATE OF TERMINATION
UPDATE employees
SET DateofTermination = 'Currently Working'
WHERE DateofTermination IS NULL OR DateofTermination='';

-- COUNT EMPLOYEES MARITAL STATUS WISE --
-- Count of each unique value in the MaritalDesc
SELECT MaritalDesc, count(*) AS count
FROM Employees
GROUP BY MaritalDesc
ORDER BY Count DESC;
-- COUNT EMPLOYEES IN DEPARTMENT --
-- Count of each unique value in the Department
SELECT Department, count(*) AS count
FROM Employees
GROUP BY Department
ORDER BY Count DESC;

-- COUNT EMPLOYEES POSITion WISE --
-- Count of each unique value in the Position
SELECT Position, count(*) AS count
FROM Employees
GROUP BY Position
ORDER BY Count DESC;

-- COUNT EMPLOYEES UNDER MANAGER --
-- Count of each unique value in the Manager
SELECT ManagerName, count(*) AS count
FROM Employees
GROUP BY ManagerName
ORDER BY Count DESC;
