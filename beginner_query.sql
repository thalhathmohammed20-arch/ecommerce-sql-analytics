/* ================================
   Beginner Queries (Q1 - Q10)
   ================================ */

-- Q1: Show all orders with customer names (INNER JOIN)
SELECT o.order_id, c.customer_name, o.order_date, o.status
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- Q2: List all customers and their orders (LEFT JOIN)
SELECT c.customer_name, o.order_id, o.status
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Q3: Show all orders and customers (RIGHT JOIN)
SELECT c.customer_name, o.order_id, o.status
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- Q4: Find customers who never placed an order
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q5: Count orders per status
SELECT status, COUNT(*) AS total_orders
FROM orders GROUP BY status;

-- Q6: Count customers per city
SELECT city, COUNT(*) AS total_customers
FROM customers GROUP BY city;

-- Q7: Average product price per category
SELECT category, AVG(price) AS avg_price
FROM products GROUP BY category;

-- Q8: Find categories with more than 5 products
SELECT category, COUNT(*) AS product_count
FROM products GROUP BY category
HAVING COUNT(*) > 5;

-- Q9: Find top 5 most expensive products
SELECT product_name, price FROM products ORDER BY price DESC LIMIT 5;

-- Q10: Show earliest order placed
SELECT * FROM orders ORDER BY order_date ASC LIMIT 1;


