-- =====================================================
-- SQL BASICS (MySQL) - Beginner-Friendly Notes
-- Topic: Database, Table, Primary Key, Insert, Select,
--        Delete, Truncate
-- =====================================================


-- -----------------------------------------------------
-- 1. WORKING WITH DATABASES
-- -----------------------------------------------------

show databases; -- used to list or find all available databases on the server

-- Create a database
create database db1; -- db1 is the name of the database

use db1; -- selecting/using the created database (all next commands run inside db1)

-- Tip: to avoid an error if the database already exists, use:
-- create database if not exists db1;


-- -----------------------------------------------------
-- 2. CREATING A TABLE (with PRIMARY KEY)
-- -----------------------------------------------------

-- A table stores data in rows and columns
-- Syntax: create table table_name (column_name datatype, ...);
create table table1 (
    id int primary key,                      -- primary key = uniquely identifies each row
                                             -- rules: no duplicate values, and cannot be empty (NULL)
    name varchar(20),                        -- varchar(20) = text up to 20 characters
    phone_no varchar(20),                    -- phone numbers are stored as text (keeps leading 0 and + sign)
    dept enum("Hr", "IT", "Sales", "Other")  -- enum = only these listed values are allowed
);                                           -- table1 is the name of the table

show tables;     -- lists all tables inside the current database
describe table1; -- shows the structure of the table (columns, data types, key)


-- -----------------------------------------------------
-- 3. INSERTING DATA (adding rows)
-- -----------------------------------------------------

-- Insert a single row
-- Syntax: insert into table_name (columns) values (values);
insert into table1 (id, name, phone_no, dept)
values (1, "Rahul", "9876543210", "IT"); -- text values go inside quotes, numbers don't need quotes

-- Insert multiple rows in one go (separate each row with a comma)
insert into table1 (id, name, phone_no, dept)
values
    (2, "Priya", "9123456780", "Hr"),
    (3, "Amit", "9988776655", "Sales"),
    (4, "Sneha", "9090909090", "IT"),
    (5, "Karan", "9812345670", "Other"),
    (6, "Neha", "9345678123", "Hr");

-- Primary key in action: this will give an ERROR (Duplicate entry '1')
-- because id 1 already exists. Uncomment and try it yourself.
-- insert into table1 (id, name, phone_no, dept) values (1, "Rohan", "9000000000", "IT");


-- -----------------------------------------------------
-- 4. READING DATA (select)
-- -----------------------------------------------------

select * from table1; -- * means "all columns", this shows the full table


-- -----------------------------------------------------
-- 5. DELETE vs TRUNCATE (removing all rows)
-- -----------------------------------------------------

drop table table1; -- drop will delete the whole table 

truncate table table1; -- trruncate will empty the rows 
