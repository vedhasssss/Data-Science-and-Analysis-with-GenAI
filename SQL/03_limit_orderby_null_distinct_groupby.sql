-- ============================================================
--  SQL LECTURE 3: LIMIT, ORDER BY, OFFSET, NULL, COALESCE,
--                 DISTINCT, GROUP BY, calculated columns
--  Uses a practice table: employees
-- ============================================================

CREATE DATABASE db4;
USE db4;

CREATE TABLE employees (
    employee_id  INT PRIMARY KEY,
    name         VARCHAR(20),
    department   VARCHAR(20),
    salary       DECIMAL(10,2),   -- 10 digits total, 2 after the decimal point
    city         VARCHAR(20),
    joining_date DATE,
    manager_id   INT              -- NULL for people with no manager
);

SELECT * FROM employees;


-- ============================================================
-- 1. LIMIT (restrict number of rows returned)
-- ============================================================

SELECT * FROM employees LIMIT 5;                         -- first 5 rows


-- ============================================================
-- 2. ORDER BY (sort results)
-- ============================================================

SELECT * FROM employees ORDER BY salary DESC LIMIT 5;    -- top 5 highest salaries
SELECT * FROM employees ORDER BY salary ASC  LIMIT 5;    -- top 5 lowest salaries


-- ============================================================
-- 3. OFFSET (skip rows)
-- ============================================================

SELECT * FROM employees LIMIT 5 OFFSET 2;                -- skip first 2 rows, then take 5

-- Employees 10 to 15
SELECT * FROM employees LIMIT 5 OFFSET 10;               -- option 1: skips 10 rows, so gives rows 11-15
SELECT * FROM employees WHERE employee_id >= 10 AND employee_id <= 15;   -- option 2: exact range by id


-- ============================================================
-- 4. Multiple conditions with AND
-- ============================================================

-- salary between 50k and 60k AND lives in Pune
SELECT * FROM employees
WHERE salary >= 50000 AND salary <= 60000 AND city = "Pune";


-- ============================================================
-- 5. NULL values (IS NULL / IS NOT NULL)
-- ============================================================

-- Use IS NULL, never "= NULL" (NULL is "unknown", so = never matches)
SELECT * FROM employees WHERE manager_id IS NULL;
SELECT COUNT(*) FROM employees WHERE manager_id IS NULL;           -- how many have no manager

SELECT * FROM employees WHERE manager_id IS NOT NULL;
SELECT COUNT(*) FROM employees WHERE manager_id IS NOT NULL;       -- how many have a manager


-- ============================================================
-- 6. COALESCE() (replace NULL with a default value)
-- ============================================================

-- shows 0 wherever manager_id is NULL (the table itself is not changed)
SELECT name, COALESCE(manager_id, 0) AS manager FROM employees;


-- ============================================================
-- 7. COUNT with a condition
-- ============================================================

SELECT COUNT(*) FROM employees WHERE department = "IT";            -- employees in IT


-- ============================================================
-- 8. DISTINCT (unique values only)
-- ============================================================

SELECT DISTINCT department FROM employees;                         -- unique departments
SELECT COUNT(DISTINCT department) FROM employees;                  -- how many unique departments

SELECT DISTINCT city FROM employees;                               -- unique cities
SELECT COUNT(DISTINCT city) FROM employees;                        -- how many unique cities

SELECT COUNT(DISTINCT manager_id) FROM employees;                  -- how many unique managers (NULL is ignored)


-- ============================================================
-- 9. GROUP BY (group rows, then aggregate each group)
-- ============================================================

-- number of employees in each department
SELECT department, COUNT(department) AS total_emp
FROM employees
GROUP BY department;

-- number of employees in each city
SELECT city, COUNT(city) AS total_emp
FROM employees
GROUP BY city;


-- ============================================================
-- 10. Calculated columns with AS (alias)
-- ============================================================

-- report: salary increased by 10% for the IT department
SELECT name, department, salary, salary + (salary / 100) * 10 AS updated_salary
FROM employees
WHERE department = "IT";

-- report: salary decreased by 10% for the IT department
SELECT name, department, salary, salary - (salary / 100) * 10 AS updated_salary
FROM employees
WHERE department = "IT";

-- These are only reports. To actually change salaries you would use UPDATE.
