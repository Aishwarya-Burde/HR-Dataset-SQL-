# HR-Dataset-SQL-
SQL Project

💼 HR Dataset SQL Analysis Project

    This project showcases the end-to-end analysis of an HR dataset using SQL. The analysis aims to extract meaningful insights about employees, organizational structure, performance, and attrition using SQL queries on structured data.

📌 Project Overview

    Dataset Source: Employee dataset stored in SQL (uploaded and structured into employees table).

Database Used: MySQL

Objective: Perform data cleaning, transformation, and analysis to derive insights such as attrition rate, employee distribution, average salary, and more.

🗂️ Dataset Fields

    Key columns in the dataset include:

    EmpID, Employee_Name, GenderID, DeptID, Salary, DOB, DateofHire, DateofTermination, Position, Department, ManagerName, PerformanceScore, EngagementSurvey, Absences, and others.

🔧 SQL Operations Performed

📌 Database & Table Setup

    CREATE DATABASE hrdata;
    USE hrdata;
    SELECT * FROM employees;
 
📊 Core Analysis Queries
Total Current Employees

    SELECT COUNT(*) AS Total_Current_Employees
    FROM employees
    WHERE DateofTermination = '';
    Total Terminated Employees

    SELECT COUNT(*) AS Total_Exited_Employees
    FROM employees
    WHERE DateofTermination != '';
    Average Salary

    SELECT AVG(Salary) AS Avg_Salary
    FROM Employees;
    Average Age of Employees

    SELECT AVG(TIMESTAMPDIFF(YEAR,STR_TO_DATE(DOB,'%d-%m-%Y'),CURDATE())) AS Avg_Age
    FROM Employees;
    Average Years in Company

    SELECT AVG(TIMESTAMPDIFF(YEAR,STR_TO_DATE(DateOfHire,'%d-%m-%Y'),CURDATE())) AS Avg_Years_in_Company
    FROM Employees;

🧹 Data Cleaning & Transformation

    Converted DOB, DateofHire, LastPerformanceReview_Date into proper DATE format.

    Handled empty/null DateofTermination values.

    Changed Salary data type to DECIMAL(10,2) for precision.

    Added a new column EmployeeCurrentStatus to indicate current (1) or exited (0) employees.

    ALTER TABLE employees
    ADD EmployeeCurrentStatus INT;

    UPDATE employees
    SET EmployeeCurrentStatus = CASE
    WHEN DateofTermination = '' THEN 1
    ELSE 0
    END;

📈 Attrition Rate Calculation

    SELECT
    (CAST(COUNT(CASE WHEN EmployeeCurrentStatus = 0 THEN 1 END) AS FLOAT)/COUNT(*))*100 AS Attrition_Rate
    FROM employees;
    
📊 Additional Insights
 
    Employees by Marital Status

    SELECT MaritalDesc, COUNT(*) AS count
    FROM Employees
    GROUP BY MaritalDesc
    ORDER BY count DESC;
    Employees by Department

    SELECT Department, COUNT(*) AS count
    FROM Employees
    GROUP BY Department
    ORDER BY count DESC;
    Employees by Position

    SELECT Position, COUNT(*) AS count
    FROM Employees
    GROUP BY Position
    ORDER BY count DESC;
    Employees under Each Manager

    SELECT ManagerName, COUNT(*) AS count
    FROM Employees
    GROUP BY ManagerName
    ORDER BY count DESC;

📌 Sample Output Queries

    SELECT * FROM employees LIMIT 5;
    Last 5 Rows by EmpID

    SELECT * FROM employees ORDER BY EmpID DESC LIMIT 5;

🧠 Key Learnings
    
    Performed data cleaning and formatting using SQL functions.

    Implemented real-time metrics like attrition, average salary, and employee tenure.

    Transformed raw data into business-ready analytics using SQL queries.

    Improved query efficiency and readability with appropriate formatting and functions.

📁 Tools Used

    SQL (MySQL Workbench / XAMPP / DBeaver)
 
    Structured Data in Table Format

    Manual Data Upload and Formatting

✅ Outcomes

    Cleaned and well-structured employee dataset.

    Calculated KPIs like attrition rate, average age, and tenure.

    Useful HR insights ready for dashboard visualization or further BI tools like Power BI.
    

