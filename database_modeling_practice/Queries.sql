-- all orders with customer names and total amounts

WITH customers_orders AS(
SELECT 
	c.name,
	o.id
FROM customers c
JOIN orders o
ON c.id = o.customer_id
)

SELECT 
	c.name,
	c.id AS order_id,
	SUM(o.price * o.quantity) AS total
FROM customers_orders c
JOIN order_items o
ON c.id = o.order_id
GROUP BY c.id;

-- Find the most popular product by total quantity sold

WITH product_ids_total_quantity AS(
SELECT 
	product_id,
	SUM(quantity) AS total_quantity
FROM order_items 
GROUP BY product_id
),
product_id_max_total_quantity AS (
SELECT 
	product_id,
	total_quantity 
FROM product_ids_total_quantity
WHERE total_quantity = (SELECT MAX(total_quantity) FROM product_ids_total_quantity)
)

SELECT 
	b.name,
	a.total_quantity
FROM product_id_max_total_quantity a
JOIN products b
ON a.product_id = b.id;

-- Show current stock left for each product

WITH product_ids_total_quantity AS(
SELECT 
	product_id,
	SUM(quantity) AS total_quantity
FROM order_items 
GROUP BY product_id
)

SELECT 
	b.name,
	(b.stock - a.total_quantity) AS left_in_stock
FROM product_ids_total_quantity a
JOIN products b
ON a.product_id = b.id;

-- List customers who haven’t placed any orders

SELECT * FROM customers 
WHERE id NOT IN (SELECT customer_id FROM orders); 
