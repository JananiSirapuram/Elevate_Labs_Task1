create database northwind;

SELECT o.order_id, o.order_date, c.customer_id, c.company_name, c.country FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT COUNT(*) FROM orders;
               or
SELECT COUNT(*) FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.customer_id, c.company_name FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL;

SELECT p.product_name,SUM(od.unit_price * od.quantity * (1-od.discount)) AS total_revenue FROM order_details od INNER JOIN products p
ON od.product_id = p.product_id GROUP BY p.product_name ORDER BY total_revenue DESC;

SELECT c.category_name, SUM(od.unit_price * od.quantity * (1 - od.discount)) AS category_revenue FROM order_details od INNER JOIN products p ON od.product_id = p.product_id INNER JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name ORDER BY category_revenue DESC;

SELECT c.country, SUM(od.unit_price * od.quantity) AS total_sales FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id WHERE c.country = 'USA' AND o.order_date BETWEEN '1997-01-01' AND '1997-12-31'GROUP BY c.country;

c alias as customers,o alias as orders,p alias as products,od alias as order_details;

SELECT p.product_name, SUM(od.unit_price * od.quantity) AS total_revenue FROM order_details od JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name INTO OUTFILE '"C:\Users\Bala Ganesh\Documents\northwind"'FIELDS TERMINATED BY ','
ENCLOSED BY '"'LINES TERMINATED BY '\n';




