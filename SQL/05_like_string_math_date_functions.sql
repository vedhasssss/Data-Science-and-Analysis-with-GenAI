-- ============================================================
--  SQL LECTURE 5: LIKE, STRING FUNCTIONS, MATH FUNCTIONS,
--                 DATE FUNCTIONS
--  Databases used: classicmodels (customers), db4 (employees)
-- ============================================================

USE classicmodels;


-- ============================================================
-- 1. LIKE (search for a pattern in text)
-- ============================================================

-- % means "any number of characters (including none)"

SELECT * FROM customers WHERE customername LIKE "R%";     -- starts with R
SELECT * FROM customers WHERE customername LIKE "%h";     -- ends with h
SELECT * FROM customers WHERE customername LIKE "%re%";   -- contains "re" anywhere

-- LIKE is not case-sensitive in MySQL by default, so "r%" also matches names starting with R.


-- ============================================================
-- 2. STRING FUNCTIONS
-- ============================================================

-- UPPER(): convert to uppercase
SELECT customerName, UPPER(customerName) AS up_name FROM customers;

-- LOWER(): convert to lowercase
SELECT customerName, LOWER(customerName) AS low_name FROM customers;

-- LENGTH(): number of characters (bytes) in the string
SELECT customerName, LENGTH(customerName) AS len_name FROM customers;

-- SUBSTRING(text, start, length): take a part of the string
-- Positions start at 1, so (2, 4) means: start at the 2nd character, take 4 characters
SELECT customerName, SUBSTRING(customerName, 2, 4) AS sub_name FROM customers;

-- CONCAT(): join 2 or more strings together
SELECT contactlastname, contactfirstname,
       CONCAT(contactfirstname, " ", contactlastname) AS full_name
FROM customers;

-- REPLACE(text, old, new): replace part of a string
-- (only changes the output, the table itself is not modified)
SELECT customername, country,
       REPLACE(country, "France", "India") AS updated_country
FROM customers;


-- ============================================================
-- 3. MATH FUNCTIONS
-- ============================================================

-- Arithmetic inside SELECT
SELECT creditlimit, creditlimit / 3.1 AS updated_creditlimit, country
FROM customers
WHERE country = "France";

-- ROUND(): round to the nearest whole number
-- Increase the credit limit of USA customers by 4.9% and round it
SELECT creditlimit,
       creditlimit * 1.049        AS updated_creditlimit,
       ROUND(creditlimit * 1.049) AS round_credit_limit,
       country
FROM customers
WHERE country = "USA";

-- CEIL(): always round UP  |  FLOOR(): always round DOWN
SELECT CEIL(125.25) AS round_up, FLOOR(125.75) AS round_down;   -- 126 and 125


-- ============================================================
-- 4. DATE FUNCTIONS
-- ============================================================

-- switch to the database that has a date column (employees.joining_date)
USE db4;
SELECT * FROM employees;

-- CURRENT_DATE(): today's date
SELECT CURRENT_DATE() AS today;

-- CURRENT_TIMESTAMP(): today's date AND current time
SELECT CURRENT_TIMESTAMP() AS now;

-- YEAR(), MONTH(), DAY(): pull a part out of a date
SELECT name, joining_date,
       YEAR(joining_date)  AS year,
       MONTH(joining_date) AS month,
       DAY(joining_date)   AS day
FROM employees;
