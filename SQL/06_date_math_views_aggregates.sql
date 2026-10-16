-- ============================================================
--  SQL LECTURE 6: DATE ARITHMETIC, VIEWS, AGGREGATE FUNCTIONS
--  Database used: db4 (employees table)
-- ============================================================

USE db4;
SELECT * FROM employees;

-- (CURRENT_DATE, CURRENT_TIMESTAMP, YEAR, MONTH, DAY were covered in
--  05_like_string_math_date_functions.sql)


-- ============================================================
-- 1. DATE_ADD() / DATE_SUB() (move a date forward or backward)
-- ============================================================

-- Syntax: DATE_ADD(date, INTERVAL number unit)   unit = DAY, MONTH, YEAR

-- add 10 days
SELECT name, joining_date,
       DATE_ADD(joining_date, INTERVAL 10 DAY) AS after_10_days
FROM employees;

-- subtract 10 days
SELECT name, joining_date,
       DATE_SUB(joining_date, INTERVAL 10 DAY) AS before_10_days
FROM employees;

-- add 2 months
SELECT name, joining_date,
       DATE_ADD(joining_date, INTERVAL 2 MONTH) AS after_2_months
FROM employees;

-- subtract 2 months
SELECT name, joining_date,
       DATE_SUB(joining_date, INTERVAL 2 MONTH) AS before_2_months
FROM employees;

-- add 1 year
SELECT name, joining_date,
       DATE_ADD(joining_date, INTERVAL 1 YEAR) AS after_1_year
FROM employees;

-- subtract 2 years
SELECT name, joining_date,
       DATE_SUB(joining_date, INTERVAL 2 YEAR) AS before_2_years
FROM employees;

-- combine with WHERE: add 10 days to the joining date of IT employees only
SELECT name, joining_date, department,
       DATE_ADD(joining_date, INTERVAL 10 DAY) AS after_10_days
FROM employees
WHERE department = "IT";


-- ============================================================
-- 2. DATEDIFF() (number of days between two dates)
-- ============================================================

-- Syntax: DATEDIFF(later_date, earlier_date)

-- days since each employee joined
SELECT name, joining_date,
       DATEDIFF(CURRENT_DATE, joining_date) AS diff_days
FROM employees;

-- years since each employee joined (days / 365, rounded to 1 decimal)
-- This is an approximation, since leap years make some years 366 days.
SELECT name, joining_date,
       ROUND(DATEDIFF(CURRENT_DATE, joining_date) / 365, 1) AS diff_years
FROM employees;


-- ============================================================
-- 3. VIEWS (a saved query that you can use like a table)
-- ============================================================

-- A view stores the query, not the data. Every time you SELECT from it,
-- MySQL runs the query again, so the result is always up to date.
CREATE VIEW diff_emp AS
SELECT name, joining_date,
       ROUND(DATEDIFF(CURRENT_DATE, joining_date) / 365, 1) AS diff_years
FROM employees;

-- use the view like a normal table
SELECT * FROM diff_emp;

-- DROP VIEW diff_emp;     -- delete the view (the employees table is untouched)


-- ============================================================
-- 4. AGGREGATE FUNCTIONS (SUM, AVG, MIN, MAX)
-- ============================================================

-- They squash many rows into one value.
-- All of these look only at IT employees because of the WHERE.

SELECT SUM(salary) AS total_salary FROM employees WHERE department = "IT";   -- total
SELECT AVG(salary) AS avg_salary   FROM employees WHERE department = "IT";   -- average
SELECT MIN(salary) AS min_salary   FROM employees WHERE department = "IT";   -- lowest
SELECT MAX(salary) AS max_salary   FROM employees WHERE department = "IT";   -- highest

-- With GROUP BY: one result per group
-- total salary of each department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;


-- ============================================================
-- COMING NEXT: window functions, e.g. RANK()
-- ============================================================
-- Started in class, to be completed in the next lecture.
