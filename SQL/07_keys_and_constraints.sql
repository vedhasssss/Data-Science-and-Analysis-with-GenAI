-- ============================================================
--  SQL LECTURE 7: KEYS AND CONSTRAINTS
--  PRIMARY KEY, UNIQUE, FOREIGN KEY
-- ============================================================

-- A key is a rule on a column that keeps the data clean and links tables.
--
--   PRIMARY KEY : uniquely identifies each row. No duplicates, no NULL. One per table.
--   UNIQUE      : no duplicates allowed (but NULL is allowed). A table can have many.
--   FOREIGN KEY : a column that points to the PRIMARY KEY of another table,
--                 so you can't add a value that doesn't exist there.


-- ============================================================
-- 1. SETUP: a parent table and a child table
-- ============================================================

CREATE DATABASE db7;
USE db7;

-- parent table: customer
CREATE TABLE customer (
    c_id  INT PRIMARY KEY,           -- PRIMARY KEY: unique + not NULL
    name  VARCHAR(20),
    city  VARCHAR(20),
    email VARCHAR(50) UNIQUE         -- UNIQUE: no two customers can share an email
);

-- child table: orders (each order belongs to a customer)
CREATE TABLE orders (
    o_id   INT PRIMARY KEY,
    o_date DATE,
    amount DECIMAL(10,2),
    c_id   INT,
    FOREIGN KEY (c_id) REFERENCES customer(c_id)   -- must match an existing customer
);

-- The parent table (customer) must exist BEFORE the child table (orders).


-- ============================================================
-- 2. INSERT DATA (parent first, then child)
-- ============================================================

INSERT INTO customer (c_id, name, city, email)
VALUES
(1, "Asha",  "Mumbai",    "asha@example.com"),
(2, "Ravi",  "Mumbai",    "ravi@example.com"),
(3, "Meera", "Bengaluru", "meera@example.com"),
(4, "Karan", "Pune",      "karan@example.com"),
(5, "Neha",  "Mumbai",    "neha@example.com");

INSERT INTO orders (o_id, o_date, amount, c_id)
VALUES
(101, "2026-10-12", 499.99, 1),
(102, "2026-10-12", 499.99, 2),
(103, "2026-08-10", 339.99, 3),
(104, "2026-07-22", 567.99, 4),
(105, "2026-01-17", 899.99, 5);

SELECT * FROM customer;
SELECT * FROM orders;


-- ============================================================
-- 3. WHAT THE KEYS PROTECT YOU FROM (these all fail on purpose)
-- ============================================================

-- PRIMARY KEY: duplicate c_id
-- INSERT INTO customer (c_id, name, city, email)
-- VALUES (1, "Dup", "Pune", "dup@example.com");
-- ERROR 1062: Duplicate entry '1' for key 'customer.PRIMARY'

-- UNIQUE: duplicate email
-- INSERT INTO customer (c_id, name, city, email)
-- VALUES (6, "Dup", "Pune", "asha@example.com");
-- ERROR 1062: Duplicate entry 'asha@example.com' for key 'customer.email'

-- FOREIGN KEY: order for a customer that doesn't exist
-- INSERT INTO orders (o_id, o_date, amount, c_id)
-- VALUES (106, "2026-10-16", 100.00, 99);
-- ERROR 1452: Cannot add or update a child row: a foreign key constraint fails


-- ============================================================
-- 4. TRUNCATE / DELETE ON A PARENT TABLE
-- ============================================================

-- TRUNCATE TABLE customer;
-- Fails: customer's c_id is referenced by orders as a foreign key.
-- ERROR 1701: Cannot truncate a table referenced in a foreign key constraint

-- DELETE FROM customer WHERE c_id = 1;
-- Also fails while order 101 still points to customer 1.

-- To remove a customer, delete the child rows first, then the parent row:
-- DELETE FROM orders   WHERE c_id = 1;
-- DELETE FROM customer WHERE c_id = 1;

-- (Another option, ON DELETE CASCADE, deletes the child rows automatically.
--  It is set on the foreign key when the table is created.)
