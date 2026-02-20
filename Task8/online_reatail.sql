create database online_retail;
use online_retail;

CREATE TABLE online_retail (
    invoice_no VARCHAR(20),
    customer_id VARCHAR(20),
    region VARCHAR(20),
    category VARCHAR(50),
    product VARCHAR(100),
    order_date DATE,
    quantity INT,
    price NUMERIC(10,2),
    sales NUMERIC(10,2)
);

INSERT INTO online_retail VALUES
('1001','C101','North','Electronics','Phone','2023-01-01',2,500,1000),
('1002','C102','South','Furniture','Chair','2023-02-01',1,200,200),
('1003','C101','North','Electronics','Laptop','2023-03-01',1,900,900),
('1004','C103','East','Clothing','T-Shirt','2023-04-01',3,30,90),
('1005','C104','West','Furniture','Table','2023-05-01',2,250,500),
('1006','C102','South','Furniture','Sofa','2023-06-01',1,400,400),
('1007','C105','North','Electronics','Tablet','2023-07-01',2,450,900),
('1008','C101','North','Electronics','Headphones','2023-08-01',1,150,150),
('1009','C103','East','Clothing','Jeans','2023-09-01',2,40,80),
('1010','C104','West','Furniture','Desk','2023-10-01',1,300,300);


SELECT customer_id, SUM(sales) AS total_sales FROM online_retail GROUP BY customer_id ORDER BY total_sales DESC;

SELECT region, customer_id, SUM(sales) AS total_sales, 
ROW_NUMBER() OVER (PARTITION BY region ORDER BY SUM(sales) DESC) AS row_num FROM online_retail GROUP BY region, customer_id;

SELECT customer_id, SUM(sales) AS total_sales, RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank, 
DENSE_RANK() OVER (ORDER BY SUM(sales) DESC) AS dense_sales_rank FROM online_retail GROUP BY customer_id;


SELECT order_date, sales, SUM(sales) OVER (ORDER BY order_date) AS running_total FROM online_retail;

WITH monthly_sales AS (SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS month, SUM(sales) AS total_sales
FROM online_retail GROUP BY DATE_FORMAT(order_date, '%Y-%m-01'))

SELECT month, total_sales, LAG(total_sales) OVER (ORDER BY month) AS prev_month,
total_sales - LAG(total_sales) OVER (ORDER BY month) AS mom_growth FROM monthly_sales;

SELECT customer_id, 
       SUM(sales) AS total_sales
FROM online_retail
GROUP BY customer_id
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_sales.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';












