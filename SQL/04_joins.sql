-- ============================================================
--  SQL LECTURE 4: JOINS
--  INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN (via UNION)
-- ============================================================

-- A JOIN combines rows from two tables using a matching column.
--
--   INNER JOIN : only rows that match in BOTH tables
--   LEFT JOIN  : ALL rows from the left table + matching rows from the right
--                (no match on the right -> NULL)
--   RIGHT JOIN : ALL rows from the right table + matching rows from the left
--                (no match on the left -> NULL)
--   FULL JOIN  : ALL rows from BOTH tables, matched where possible
--                (MySQL has no FULL JOIN, so we do LEFT JOIN + UNION + RIGHT JOIN)


-- ============================================================
-- 1. SETUP: two related tables
-- ============================================================

CREATE DATABASE db5;
USE db5;

-- table1: customers
CREATE TABLE table1 (
    c_id  INT PRIMARY KEY,
    Name  VARCHAR(20),
    City  VARCHAR(20),
    email VARCHAR(50)
);

INSERT INTO table1 (c_id, Name, City, email)
VALUES
(101, "Riya",     "Mumbai",      "riya@example.com"),
(102, "Miya",     "Pune",        "miya@example.com"),
(103, "Roy",      "Mumbai",      "roy@example.com"),
(104, "Joy",      "Goa",         "joy@example.com"),
(105, "Ramesh",   "Bengaluru",   "ramesh@example.com"),
(106, "Suresh",   "Bengaluru",   "suresh@example.com"),
(107, "Narendra", "Navi Mumbai", "narendra@example.com");

SELECT * FROM table1;

-- table2: orders (c_id links each order to a customer in table1)
CREATE TABLE table2 (
    order_id     INT PRIMARY KEY,
    c_id         INT,
    Order_date   DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO table2 (order_id, c_id, Order_date, total_amount)
VALUES
(1, 101, "2026-04-28", 456.78),
(2, 102, "2026-05-18", 456.08),
(3, 103, "2026-07-08", 906.29),
(4, 104, "2026-10-10", 546.99),
(5, 105, "2026-11-09", 456.69),
(6, 106, "2026-01-05", 126.88),
(7, 108, "2026-04-15", 438.54),   -- c_id 108 does NOT exist in table1
(8, 107, "2026-09-19", 560.23);

-- two more orders from customers that also don't exist in table1
-- (added on purpose, to see how each join treats unmatched rows)
INSERT INTO table2 (order_id, c_id, Order_date, total_amount)
VALUES
(9,  109, "2026-04-28", 456.78),
(10, 110, "2026-04-28", 456.78);

SELECT * FROM table2;

-- Result of the setup:
--   table1: 7 customers (101 to 107)
--   table2: 10 orders, but 3 of them (c_id 108, 109, 110) have no customer


-- ============================================================
-- 2. INNER JOIN (only the matching rows)
-- ============================================================

SELECT table1.c_id, table1.Name,
       table2.total_amount, table2.order_id
FROM table1
INNER JOIN table2 ON table1.c_id = table2.c_id;

-- Returns 7 rows. Orders with c_id 108, 109, 110 are left out,
-- because there is no customer to match them with.


-- ============================================================
-- 3. LEFT JOIN (all rows from the left table)
-- ============================================================

SELECT table1.c_id, table1.Name, table1.City,
       table2.total_amount, table2.order_id
FROM table1
LEFT JOIN table2 ON table1.c_id = table2.c_id;

-- Every customer from table1 appears.
-- A customer with no orders would show NULL in the order columns.
-- (Here all 7 customers have an order, so no NULLs appear.)


-- ============================================================
-- 4. RIGHT JOIN (all rows from the right table)
-- ============================================================

SELECT table1.c_id, table1.Name, table1.City,
       table2.total_amount, table2.order_id
FROM table1
RIGHT JOIN table2 ON table1.c_id = table2.c_id;

-- Every order from table2 appears (10 rows).
-- Orders 7, 9 and 10 have no matching customer, so c_id, Name and City are NULL.


-- ============================================================
-- 5. FULL JOIN (everything from both tables)
-- ============================================================

-- MySQL doesn't support FULL JOIN, so combine LEFT JOIN and RIGHT JOIN with UNION.
SELECT table1.c_id, table1.Name, table1.City,
       table2.total_amount, table2.order_id
FROM table1
LEFT JOIN table2 ON table1.c_id = table2.c_id

UNION

SELECT table1.c_id, table1.Name, table1.City,
       table2.total_amount, table2.order_id
FROM table1
RIGHT JOIN table2 ON table1.c_id = table2.c_id;

-- UNION removes duplicate rows, which is why the matched rows
-- (found by both joins) appear only once.
-- UNION ALL would keep the duplicates.
