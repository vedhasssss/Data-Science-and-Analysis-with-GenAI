-- ============================================================
--  SQL LECTURE 2: SELECT, WHERE, UPDATE, DELETE, AND, COUNT
--  Database used: classicmodels (MySQL sample database)
-- ============================================================

USE classicmodels;
SHOW TABLES;


-- ============================================================
-- 1. SELECT
-- ============================================================

SELECT * FROM customers;            -- all columns, all rows

-- pick only the columns you need
SELECT customernumber, customername, country, city, phone, creditlimit
FROM customers;


-- ============================================================
-- 2. WHERE (filter rows)
-- ============================================================

SELECT * FROM customers WHERE country = "USA";


-- ============================================================
-- 3. UPDATE (change existing data)
-- ============================================================

-- always SELECT first to check which row you're about to change
SELECT * FROM customers WHERE customernumber = 125;

UPDATE customers SET creditlimit = 10000 WHERE customernumber = 125;
UPDATE customers SET phone = '9000000000' WHERE customernumber = 103;

-- Without WHERE, UPDATE changes EVERY row in the table!


-- ============================================================
-- 4. DELETE (remove rows)
-- ============================================================

DELETE FROM customers WHERE customernumber = 125;

-- Without WHERE, DELETE removes EVERY row in the table!
-- (DELETE removes rows you choose; TRUNCATE empties the whole table)


-- ============================================================
-- 5. AND (combine conditions)
-- ============================================================

-- USA customers with a credit limit between 100000 and 200000
SELECT * FROM customers
WHERE country = "USA" AND creditlimit >= 100000 AND creditlimit <= 200000;


-- ============================================================
-- 6. COUNT
-- ============================================================

-- how many customers have a credit limit of 0?
SELECT COUNT(*) FROM customers WHERE creditlimit = 0.00;
