/* ================================
   Intermediate Queries (Q11 - Q20)
   ================================ */

-- Q11: Find products more expensive than average
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Q12: Find customers who signed up before the earliest order date
SELECT * FROM customers
WHERE signup_date < (SELECT MIN(order_date) FROM orders);

-- Q13: Find customers who signed up in March and placed orders
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE MONTH(c.signup_date) = 3;

-- Q14: Find categories with average price > 10,000
SELECT category, AVG(price) AS avg_price
FROM products GROUP BY category HAVING AVG(price) > 10000;

-- Q15: Show latest order per customer
SELECT customer_id, MAX(order_date) AS latest_order
FROM orders GROUP BY customer_id;

-- Q16: Find customers who placed more than 2 orders
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name HAVING COUNT(o.order_id) > 2;

-- Q17: Find customers who signed up before Feb but ordered in April
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.signup_date < '2025-02-01' AND MONTH(o.order_date) = 4;

-- Q18: Count products per category
SELECT category, COUNT(*) AS product_count
FROM products GROUP BY category;

-- Q19: Find customers whose name starts with 'S' and placed orders
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_name LIKE 'S%';

-- Q20: Show orders with customer city
SELECT o.order_id, c.customer_name, c.city, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
