CREATE DATABASE CompanyDB;
USE CompanyDB;
/* 
==========================================================================
PART 2: DDL (Data Definition Language)
Description: Defining the structure (Tables, Data Types, Constraints).
Commands: CREATE TABLE, ALTER TABLE
==========================================================================
*/

-- 1. Create the Department table (Parent Table)
-- Note: We create this FIRST because the Employee table will refer to it (Foreign Key).
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,                  -- Unique ID for the department (PK)
    Dept_Name VARCHAR(50) NOT NULL,           -- Name cannot be empty
    Location VARCHAR(100) DEFAULT 'Main HQ'   -- Default location if none is provided
);

-- 2. Create the Employee table (Child Table)
-- Note: This table includes a Foreign Key connecting it to the Department table.
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,                   -- Unique ID for the employee
    Full_Name VARCHAR(100) NOT NULL,          -- Employee name is mandatory
    Hire_Date DATE,                           -- Date of joining
    Email VARCHAR(100) UNIQUE,                -- Email must be unique across the system
    Salary DECIMAL(10, 2) CHECK(Salary >= 2000 AND Salary <= 50000), -- Constraint: Salary Range
    City VARCHAR(50) DEFAULT 'Cairo',         -- Default city
    Gender CHAR(1) CHECK(Gender IN ('M', 'F')), -- Constraint: Only 'M' or 'F' allowed
    Dept_No INT,                              -- The link to the Department table
    
    -- Constraint: Foreign Key Relationship
    CONSTRAINT FK_Employee_Department FOREIGN KEY (Dept_No) REFERENCES Department(Dept_ID)
);