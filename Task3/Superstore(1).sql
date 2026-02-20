create database superstore;
use superstore;
create table superstore (
order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2)
);

INSERT INTO superstore VALUES ('CA-2017-100006', '2017-09-08', '2017-09-13', 'Second Class',
 'CG-12520', 'Claire Gute', 'Consumer',
 'United States', 'Henderson', 'Kentucky', '42420', 'South',
 'Furniture', 'Bookcases', 'Bush Somerset Collection Bookcase',
 261.96, 2, 0.00, 41.91),

('CA-2017-100007', '2017-09-09', '2017-09-14', 'Standard Class',
 'DV-13045', 'Darrin Van Huff', 'Corporate',
 'United States', 'Los Angeles', 'California', '90036', 'West',
 'Technology', 'Phones', 'Apple iPhone 13',
 911.42, 1, 0.10, 91.14),

('CA-2017-100008', '2017-09-10', '2017-09-15', 'First Class',
 'SO-20335', 'Sean O’Donnell', 'Home Office',
 'United States', 'Fort Worth', 'Texas', '76106', 'Central',
 'Office Supplies', 'Binders', 'Cardinal Slant-D Ring Binder',
 22.72, 4, 0.20, -5.68),
 
 ('CA-2017-100009', '2017-09-11', '2017-09-16', 'Standard Class',
    'KM-16720', 'Ken Murray', 'Consumer',
    'United States', 'New York City', 'New York', '10024', 'East',
    'Technology', 'Accessories', 'Logitech Wireless Mouse',
    45.00, 3, 0.00, 12.50);
    
select * from superstore;

SELECT COUNT(*) FROM superstore;

SELECT * FROM superstore WHERE category = 'Technology';
                     &
SELECT product_name, sales FROM superstore ORDER BY sales DESC LIMIT 10;

SELECT category,SUM(sales) AS total_sales, AVG(profit) AS avg_profit, COUNT(*) AS total_orders FROM superstore GROUP BY category;
                     (or)
SELECT region, SUM(sales) AS total_sales FROM superstore GROUP BY region;

SELECT category, SUM(sales) AS total_sales FROM superstore GROUP BY category HAVING SUM(sales) > 100000;

SELECT SUM(sales) AS monthly_sales FROM superstore WHERE order_date BETWEEN '2017-01-01' AND '2017-01-31';
                           &
SELECT customer_name, sales FROM superstore WHERE customer_name LIKE 'A%';

SELECT category, SUM(sales) AS total_sales FROM superstore GROUP BY category INTO OUTFILE 'superstore_summary.csv'
FIELDS TERMINATED BY ','ENCLOSED BY '"'LINES TERMINATED BY '\n';



SELECT COUNT(*) FROM superstore;

SELECT category, SUM(sales) AS total_sales
FROM superstore
GROUP BY category;

SELECT region, SUM(sales)
FROM superstore
GROUP BY region;

SELECT product_name, sales
FROM superstore
ORDER BY sales DESC
LIMIT 10;

SELECT category, SUM(sales)
FROM superstore
GROUP BY category
HAVING SUM(sales) > 100000;

SELECT customer_name, SUM(sales) AS total_spend
FROM superstore
GROUP BY customer_name
ORDER BY total_spend DESC
LIMIT 5;






