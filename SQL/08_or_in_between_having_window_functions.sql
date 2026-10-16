-- ============================================================
--  SQL SELF-STUDY: OR, IN, BETWEEN, HAVING, WINDOW FUNCTIONS
--  (extra topics that were not covered in class)
-- ============================================================
--
--  Needs MySQL 8.0 or newer (window functions don't exist in MySQL 5.7).
--  The file is self-contained: it creates its own table and data.
--
--  Topics:
--    1. OR
--    2. IN / NOT IN
--    3. BETWEEN
--    4. HAVING (and how it differs from WHERE)
--    5. Window functions: ROW_NUMBER, RANK, DENSE_RANK, SUM() OVER


-- ============================================================
-- 0. SETUP: practice table with sample data
-- ============================================================

CREATE DATABASE db8;
USE db8;

CREATE TABLE employees (
    employee_id  INT PRIMARY KEY,
    name         VARCHAR(20),
    department   VARCHAR(20),
    salary       DECIMAL(10,2),
    city         VARCHAR(20),
    joining_date DATE,
    manager_id   INT
);

-- Some salaries are repeated on purpose (ties), so we can see how RANK() behaves.
INSERT INTO employees (employee_id, name, department, salary, city, joining_date, manager_id)
VALUES
(1,  "Asha",  "IT",    70000, "Mumbai", "2022-03-15", NULL),
(2,  "Ravi",  "IT",    55000, "Pune",   "2023-06-01", 1),
(3,  "Meera", "HR",    45000, "Mumbai", "2021-09-10", NULL),
(4,  "Karan", "Sales", 52000, "Delhi",  "2022-11-20", 8),
(5,  "Neha",  "IT",    55000, "Mumbai", "2024-01-08", 1),
(6,  "Arjun", "HR",    48000, "Pune",   "2023-02-14", 3),
(7,  "Sana",  "Sales", 60000, "Mumbai", "2021-05-30", 8),
(8,  "Dev",   "Sales", 75000, "Delhi",  "2020-08-19", NULL),
(9,  "Rohan", "IT",    62000, "Pune",   "2022-07-04", 1),
(10, "Isha",  "HR",    48000, "Delhi",  "2024-04-22", 3),
(11, "Kabir", "Sales", 52000, "Mumbai", "2023-09-12", 8),
(12, "Tara",  "IT",    70000, "Delhi",  "2021-12-01", 1);

SELECT * FROM employees;


-- ============================================================
-- 1. OR (at least ONE condition must be true)
-- ============================================================

-- AND needs ALL conditions to be true, OR needs ANY ONE of them.

-- employees in IT or HR
SELECT * FROM employees
WHERE department = "IT" OR department = "HR";

-- earning above 65000 OR living in Pune
SELECT * FROM employees
WHERE salary > 65000 OR city = "Pune";

-- Mixing AND with OR: use brackets, otherwise AND is evaluated first!
-- IT or Sales employees who live in Mumbai
SELECT * FROM employees
WHERE (department = "IT" OR department = "Sales") AND city = "Mumbai";

-- Without the brackets it means something different:
-- "all IT employees" OR "Sales employees who live in Mumbai"
SELECT * FROM employees
WHERE department = "IT" OR department = "Sales" AND city = "Mumbai";


-- ============================================================
-- 2. IN / NOT IN (a shortcut for many ORs)
-- ============================================================

-- Same result as the OR query above, but shorter
SELECT * FROM employees
WHERE department IN ("IT", "HR");

SELECT * FROM employees
WHERE city IN ("Mumbai", "Pune", "Goa");     -- a value with no matches (Goa) is fine

-- NOT IN: everything except the listed values
SELECT * FROM employees
WHERE department NOT IN ("IT", "HR");        -- only Sales

-- Careful: if the list contains NULL, NOT IN returns nothing.
-- Use IS NULL / IS NOT NULL for NULL checks (see lecture 3).


-- ============================================================
-- 3. BETWEEN (a range, both ends INCLUDED)
-- ============================================================

-- salary from 50000 to 60000, including 50000 and 60000
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 60000;

-- same as: WHERE salary >= 50000 AND salary <= 60000

-- works with dates too
SELECT name, joining_date FROM employees
WHERE joining_date BETWEEN "2022-01-01" AND "2022-12-31";    -- joined in 2022

-- NOT BETWEEN: outside the range
SELECT * FROM employees
WHERE salary NOT BETWEEN 50000 AND 60000;

-- combine with IN
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 70000 AND department IN ("IT", "Sales");


-- ============================================================
-- 4. HAVING (filter AFTER grouping)
-- ============================================================

-- WHERE filters individual ROWS, before GROUP BY.
-- HAVING filters whole GROUPS, after GROUP BY.
-- You can't use SUM(), COUNT(), AVG() etc. inside WHERE, only inside HAVING.

-- total salary per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- only departments whose total salary is above 150000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 150000;                 -- IT and Sales (HR is 141000)

-- only departments with 4 or more employees
SELECT department, COUNT(*) AS total_emp
FROM employees
GROUP BY department
HAVING COUNT(*) >= 4;

-- only cities with an average salary above 55000
SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city
HAVING AVG(salary) > 55000;

-- WHERE and HAVING together:
-- ignore employees earning 50000 or less, then keep departments with 2+ people left
SELECT department, COUNT(*) AS total_emp, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 50000                         -- 1st: filter rows
GROUP BY department                          -- 2nd: make groups
HAVING COUNT(*) >= 2                         -- 3rd: filter groups
ORDER BY avg_salary DESC;                    -- 4th: sort the result

-- Order MySQL runs a query in:
--   FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT


-- ============================================================
-- 5. WINDOW FUNCTIONS
-- ============================================================

-- GROUP BY squashes many rows into one row per group.
-- A window function does a calculation across a set of rows
-- but KEEPS every row, adding the result as a new column.
--
-- Syntax:  function() OVER (PARTITION BY col ORDER BY col)
--   PARTITION BY : split rows into groups (optional, like GROUP BY)
--   ORDER BY     : the order inside each group

-- ------------------------------------------------------------
-- 5.1 ROW_NUMBER(): 1, 2, 3, 4 ... no ties, always unique
-- ------------------------------------------------------------
SELECT name, department, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- ------------------------------------------------------------
-- 5.2 RANK() and DENSE_RANK(): handle ties
-- ------------------------------------------------------------
--   RANK()       : ties share a rank, then the next ranks are SKIPPED  (1, 2, 2, 4)
--   DENSE_RANK() : ties share a rank, NO ranks are skipped             (1, 2, 2, 3)
SELECT name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
       RANK()       OVER (ORDER BY salary DESC) AS rnk,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rnk
FROM employees;

-- With this data:
--   Dev       75000  -> rank 1, dense 1
--   Asha/Tara 70000  -> rank 2, dense 2   (tie)
--   Rohan     62000  -> rank 4, dense 3   (RANK skipped 3, DENSE_RANK did not)

-- ------------------------------------------------------------
-- 5.3 PARTITION BY: rank inside each department
-- ------------------------------------------------------------
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_in_dept
FROM employees;

-- ------------------------------------------------------------
-- 5.4 Top N per group (top 2 earners in each department)
-- ------------------------------------------------------------
-- You can't use a window function in WHERE, so wrap the query
-- in a subquery and filter on its result.
SELECT name, department, salary, rank_in_dept
FROM (
    SELECT name, department, salary,
           DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_in_dept
    FROM employees
) AS ranked
WHERE rank_in_dept <= 2;

-- ------------------------------------------------------------
-- 5.5 Aggregates as window functions: SUM() / AVG() OVER
-- ------------------------------------------------------------
-- Compare each person with their department, without losing any rows
SELECT name, department, salary,
       SUM(salary) OVER (PARTITION BY department)                AS dept_total,
       ROUND(AVG(salary) OVER (PARTITION BY department), 2)      AS dept_avg,
       salary - ROUND(AVG(salary) OVER (PARTITION BY department), 2) AS diff_from_avg
FROM employees;

-- Running total of salary, in order of joining date
SELECT name, joining_date, salary,
       SUM(salary) OVER (ORDER BY joining_date) AS running_total
FROM employees;
