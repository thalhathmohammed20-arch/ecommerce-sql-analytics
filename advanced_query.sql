/* ================================
   Advanced Queries (Q21 - Q30)
   ================================ */

-- Q21: Find customers who placed more orders than average
SELECT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > (SELECT AVG(order_count) 
                            FROM (SELECT COUNT(order_id) AS order_count 
                                  FROM orders GROUP BY customer_id) t);

-- Q22: Rank products by price within each category
SELECT category, product_name, price,
RANK() OVER (PARTITION BY category ORDER BY price DESC) AS rank_in_category
FROM products;

-- Q23: Show cumulative count of orders by date
SELECT order_date, COUNT(*) AS daily_orders,
SUM(COUNT(*)) OVER (ORDER BY order_date) AS cumulative_orders
FROM orders GROUP BY order_date;

-- Q24: Show customers ranked by number of orders
SELECT c.customer_name, COUNT(o.order_id) AS total_orders,
RANK() OVER (ORDER BY COUNT(o.order_id) DESC) AS rank_by_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Q25: Create a view for monthly order summary
CREATE VIEW monthly_order_summary AS
SELECT MONTH(order_date) AS month, COUNT(*) AS total_orders
FROM orders GROUP BY MONTH(order_date);

-- Q26: Create a view for average product price per category
CREATE VIEW category_avg_price AS
SELECT category, AVG(price) AS avg_price
FROM products GROUP BY category;

-- Q27: Stored procedure to get customer order history
DELIMITER //
CREATE PROCEDURE get_customer_history(IN cust_id INT)
BEGIN
  SELECT o.order_id, o.order_date, o.status
  FROM orders o
  WHERE o.customer_id = cust_id;
END //
DELIMITER ;

-- Q28: Find categories with max product price
SELECT category, MAX(price) AS max_price
FROM products GROUP BY category;

-- Q29: Show customers and number of orders sorted descending
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name ORDER BY total_orders DESC;

-- Q30: Find orders placed by customers from Hyderabad
SELECT o.order_id, c.customer_name, o.order_date, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'Hyderabad';




