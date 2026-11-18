create database ecom;
use ecom;
create table customers(
customer_id int primary key,
customer_name varchar(50),
city varchar(20),
state varchar(30),
gender enum('Male','Female'),
registration_date date);

create table products(
product_id int primary key,
product_name varchar(50),
category varchar(100),
price decimal,
cost_price decimal,
stock_quantity int);

create table orders(
order_id int primary key,
customer_id int ,
foreign key (customer_id) references customers(customer_id),
order_date date , 
order_status enum('Delivered','Shipped','Cancelled','Processing'),
payment_method enum('UPI','Card','COD'));

create table order_details(
order_id int,
foreign key (order_id) references orders(order_id),
product_id int,
foreign key (product_id) references products(product_id),
quantity int,
unit_price decimal);



create table payments(
payment_id int primary key,
order_id int,
foreign key (order_id) references orders(order_id),
payment_amount decimal,
payment_date date,
payment_status enum('Successfull','Unsuccessfull','Processing'));

show tables;
select * from customers;
select * from orders;
select * from order_details;
select * from payments;
select * from products;

-- Questions ==============================================================================================
--  List all unique product categories.
select distinct category from products;

-- Find orders whose status is either Delivered or Processing.
select * from orders where order_status='Delivered'or order_status='Processing';

-- Find products priced between 500 and 2,000
select product_name , price from products where price between 500 and 2000;

--  Find customers whose names begin with A
select customer_name from customers where customer_name like 'A%';

--  Display products from highest to lowest price.
select product_name , price from products order by price desc ;

-- Show the 10 most recently registered customers
select * from customers order by registration_date desc limit 10;

-- Count all customers.
select count(customer_id) from customers;

-- . Find minimum, maximum, and average product price
select min(price),max(price),avg(price) from products;

-- Count orders for each order_status
select order_status , count(order_id) from orders group by order_status;

--  Find average product price for each category
select category , avg(price) from products group by category;

-- Find total quantity sold for each product_id.
select product_id , sum(stock_quantity) from products group by product_id;

--  Find customers who placed more than 3 orders
select * from order_details;
select * from orders;

select customer_id,count(order_id) as total_orders from orders group by customer_id having total_orders>3;

--  Find categories whose average product price is above 1,000.
select category,avg(price) as avg_price from products group by category having avg_price>1000;

--  Use CASE to label products Budget (<n500), Mid-Range (n500–n2,000), or Premium (>n2,000)
SELECT 
    product_name,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price BETWEEN 500 AND 2000 THEN 'Mid-Range'
        WHEN price > 2000 THEN 'Preminum'
        ELSE 'Invalid'
    END AS price_category
FROM
    products;

-- Find customers whose city is NULL
select * from customers where city is null;

--  Display NULL city values as 'Not Provided' using an appropriate function.
select customer_name ,city , ifnull(city,'Not procided') as Null_city from customers ;

--  Find customers who have never placed an order
select * from customers;
select * from orders;
select c.customer_name , o.order_id from customers c left join orders o on c.customer_id=o.customer_id where o.order_id is null;

--  Find products that have never appeared in order_details
select * from products;
select * from order_details;
select p.product_id , p.product_name , order_id from products p left join order_details o on p.product_id=o.product_id where o.order_id is null;

-- Show each customer and their order count, including customers with zero orders
select c.customer_name , count(o.order_id) as order_count from customers c left join orders o on c.customer_id=o.customer_id group by c.customer_name order by order_count asc;

--  Find delivered revenue for each product category
select * from products;
select * from orders;
select * from order_details;


SELECT
    p.category,
    SUM(p.price * od.quantity) AS delivered_revenue
FROM products p
INNER JOIN order_details od
    ON p.product_id = od.product_id
INNER JOIN orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY delivered_revenue DESC;

-- Find the top 10 customers by delivered spending.
select * from customers;
select * from orders;
select * from order_details;

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(od.unit_price * od.quantity) AS total_spending,
    o.order_status
FROM
    customers c
        INNER JOIN
    orders o ON c.customer_id = o.customer_id
        INNER JOIN
    order_details od ON o.order_id = od.order_id
WHERE
    order_status = 'Delivered'
GROUP BY c.customer_id , c.customer_name
ORDER BY total_spending DESC
LIMIT 10;
    
    
--  Count orders in each month of 2025, showing month number and month name.

select * from orders;
SELECT 
    COUNT(*) AS orders_count,
    MONTHNAME(order_date) AS month_name,
    MONTH(order_date) AS month_number
FROM
    orders
WHERE
    YEAR(order_date) = 2025
GROUP BY MONTHNAME(order_date) , MONTH(order_date)
ORDER BY MONTH(order_date) ASC;

--  Display customer names in uppercase and their character lengths
select customer_name , upper(customer_name), length(customer_name) from customers;

--  Calculate days between registration_date and each customer's first order date
select * from customers;
select * from orders;
select c.customer_id , datediff(min(o.order_date),c.registration_date ) diff_days from customers c inner join orders o on c.customer_id=o.customer_id group by c.customer_id;

--  Find products priced above the overall average product price
select product_id , product_name , price from products where price>(select avg(price) from products);

-- Find the most expensive product in each category, returning product_name and ties.
select * from products;
select p1.category , p1.product_name, p1.price from products p1 where p1.price=(select max(p2.price) from products p2 where p1.category=p2.category) ; 

--  Find customers whose total spending is greater than average customer spending
select * from order_details;
with customer_spending as (select c.customer_id , c.customer_name , sum(od.quantity*od.unit_price) as total_spending from customers c inner join orders o on c.customer_id = o.customer_id inner join order_details od on o.order_id=od.order_id group by c.customer_id,c.customer_name ) select * from customer_spending where total_spending>(select avg(total_spending) from customer_spending);

-- . Find customers with at least one order using EXISTS
select c.* from customers c where exists (select 1 from orders o where c.customer_id=o.customer_id);

-- Find products priced above the average price in their own category.
select p1.product_name, p1.category, p1.price from products p1 where price>(select avg(p2.price) from products p2 where p1.category=p2.category);

--  Find the second-highest distinct product price.
select distinct product_name,price from products order by price  desc limit 1 offset 1;

-- . Find customers with no orders using NOT EXISTS.
select * from orders;
select * from customers;
select c.* from customers c where not exists ( select order_id from orders o where c.customer_id=o.customer_id);

--  Rank products by total quantity sold using RANK().
select * from products;
select * from order_details;
select p.product_name , sum(od.quantity) , rank() over(order by sum(od.quantity) desc) from products p inner join order_details od on p.product_id=od.product_id group by product_name;

--  Rank products by total quantity sold using DENSE_RANK(); compare with RANK()
select p.product_name , sum(od.quantity), dense_rank() over(order by sum(od.quantity) desc), rank() over(order by sum(od.quantity) desc) from products p inner join order_details od on p.product_id=od.product_id group by p.product_name;

-- Assign a unique row number to products ordered by price descending.
select product_name , price , row_number() over(order by price desc) from products;

-- Rank customers by delivered spending.
select c.customer_id , sum(od.quantity*od.unit_price) as total_spending , rank() over (order by sum(od.quantity*od.unit_price) desc) as ranking from customers c inner join orders o on c.customer_id=o.customer_id inner join order_details od on o.order_id=od.order_id where o.order_status="Delivered"group by customer_id;

-- select c.customer_id , sum(od.quantity*od.unit_price) as total_spending , rank() over (order by sum(od.quantity*od.unit_price) desc) as ranking from customers c inner join orders o on c.customer_id=o.customer_id inner join order_details od on o.order_id=od.order_id where o.order_status="Delivered"group by customer_id;
