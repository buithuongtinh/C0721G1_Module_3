DROP DATABASE IF EXISTS sales_management;
CREATE DATABASE sales_management;
USE sales_management;

CREATE TABLE customer(
c_id INT PRIMARY KEY,
c_name VARCHAR(45),
c_age VARCHAR(45)
);
CREATE TABLE `order`(
o_id INT PRIMARY KEY,
c_id INT ,
o_date DATE,
o_total_price VARCHAR(45),
FOREIGN KEY(c_id) REFERENCES customer(c_id)
);
CREATE TABLE product(
p_id INT PRIMARY KEY,
p_name VARCHAR(45),
p_price VARCHAR(45)
);
CREATE TABLE order_detail(
o_id INT,
p_id INT,
od_qty VARCHAR(45),
FOREIGN KEY(o_id) REFERENCES `order`(o_id),
FOREIGN KEY(p_id) REFERENCES product(p_id)
);