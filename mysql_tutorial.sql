-- SELECT
-- UPDATE
-- DISTINCT
-- FROM
-- WHERE
-- ORDER BY
-- BETWEEN
-- LIKE
-- REGEXP
-- IS NULL
-- AND, OR
-- LIMIT

/* 
** -- Use of IN and NOT IN (With ANSI commenting style
** SELECT *
** FROM products
** WHERE quantity_in_stock IN (49, 38, 72) */
/* 
-- Use of between
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990/01/01'AND '2000/01/01'; */

/* -- Select customers whose address has trail or avenue
SELECT *
FROM customers
WHERE address LIKE "%trail%" OR
	address LIKE "%avenue%"; */

/* -- Select customers whose address end with 9
-- NOT LIKE can also be used to mean the opposite
SELECT *
FROM customers
WHERE phone LIKE '%9'; */

/* -- Use of REGEXP
-- ^ beginning
-- $ end
-- | loggical or
-- []  having letters inside the brackets
-- [a-z] range of values
-- Get a customer whose first name is Elka or Ambur
SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR'; */

/* -- Get a customer whose last name end with EY OR ON
SELECT *
FROM customers
WHERE last_name REGEXP "ey$|on$"; */

/* -- Get a customer whose last name start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP "^MY|SE"; */

/* -- Get a customer whose last name contain B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP "B[RU]"; */

/* -- The use of IS NULL and NOT NULL
SELECT *
FROM customers
WHERE phone IS NULL; */

/* -- Get orders that are not processed
SELECT *
FROM orders
WHERE shipped_date IS NULL; */

/* -- SELECT the first top three layal customers
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3; */

/*USE sql_store;

-- Use the count function in sql
SELECT state, COUNT(*)
FROM customers
GROUP BY state
ORDER BY state;*/

/* -- use of inner join
SELECT order_id, orders.customer_id, first_name, last_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id; */

/* SELECT order_id, p.product_id, name, quantity, oi.unit_price 
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id; */

/* USE  sql_inventory;
SELECT *
FROM sql_store.order_items oi
JOIN products p ON oi.product_id = p.product_id; */

/* -- Joining multiple tables
USE sql_store;
SELECT 
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_statuses os ON o.status = os.order_status_id
ORDER BY order_id; */

/* USE sql_invoicing;
SELECT
	p.payment_id,
    p.date,
    c.name,
    pm.name as 'Payment Method'
FROM payments p
JOIN clients c ON p.client_id = c.client_id
JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
ORDER BY payment_id; */

/* -- Use of OUTER join  
USE sql_store;
SELECT 
	p.product_id,
    p.name,
    oi.quantity
FROM products p
LEFT JOIN order_items oi 
ON p.product_id = oi.product_id
ORDER BY product_id DESC */

/* USE sql_store;
SELECT 
	o.order_date,
    o.order_id,
    c.first_name,
    sh.name AS shipper,
    o.status
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
LEFT JOIN shippers sh
ON o.shipper_id = sh.shipper_id
ORDER BY order_id; */

/*USE sql_store;
SELECT 
	c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    s.shipper_id,
    s.name AS "shipper_name"
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
LEFT JOIN shippers s
ON o.shipper_id = s.shipper_id
ORDER BY customer_id;*/

USE sql_store;
SELECT first_name, COUNT(*)
FROM customers
GROUP BY first_name