create database global_superstore;

use global_superstore;

CREATE TABLE customer_dim (customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,customer_name VARCHAR(100)) ENGINE=InnoDB;
DROP TABLE customer_dim;

CREATE TABLE product_dim (product_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(100),category VARCHAR(50)) ENGINE=InnoDB;

CREATE TABLE date_dim (date_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,order_date DATE) ENGINE=InnoDB;

CREATE TABLE region_dim (region_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,region VARCHAR(50)) ENGINE=InnoDB;


DROP TABLE IF EXISTS product_dim;
DROP TABLE IF EXISTS date_dim;
DROP TABLE IF EXISTS region_dim;

CREATE TABLE sales_fact (
    sales_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    customer_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    date_id INT UNSIGNED NOT NULL,
    region_id INT UNSIGNED NOT NULL,

    sales DECIMAL(10,2),
    quantity INT,
    profit DECIMAL(10,2),

    FOREIGN KEY (customer_id)
        REFERENCES customer_dim(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES product_dim(product_id),

    FOREIGN KEY (date_id)
        REFERENCES date_dim(date_id),

    FOREIGN KEY (region_id)
        REFERENCES region_dim(region_id)
) ENGINE=InnoDB;


INSERT INTO Customer_Dim(customer_name)
SELECT DISTINCT customername
FROM global_superstore;

INSERT INTO Product_Dim(product_name, category)
SELECT DISTINCT product, category
FROM global_superstore;

INSERT INTO Date_Dim(order_date)
SELECT DISTINCT orderdate
FROM global_superstore;

INSERT INTO Region_Dim(region)
SELECT DISTINCT region
FROM global_superstore;






