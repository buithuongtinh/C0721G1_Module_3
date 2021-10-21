drop database if exists jsp_case_study;
CREATE DATABASE jsp_case_study;

USE jsp_case_study;

CREATE TABLE `position` (
position_id INT PRIMARY KEY AUTO_INCREMENT,
position_name VARCHAR(45)
);
CREATE TABLE education_degree (
education_degree_id INT PRIMARY KEY AUTO_INCREMENT,
education_degree_name VARCHAR(45)
);
CREATE TABLE division (
division_id INT PRIMARY KEY AUTO_INCREMENT,
division_name VARCHAR(45) 
);
CREATE TABLE `user`(
username VARCHAR(255) PRIMARY KEY,
`password` VARCHAR(255)
);
CREATE TABLE employee (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
employee_name VARCHAR(45),
employee_birthday DATE,
employee_id_card VARCHAR(45),
employee_salary DOUBLE,
employee_phone VARCHAR(45),
employee_email VARCHAR(45), 
position_id INT,
education_degree_id INT,
division_id INT,
username VARCHAR(255),
FOREIGN KEY(position_id) REFERENCES position (position_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(education_degree_id) REFERENCES education_degree (education_degree_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(division_id) REFERENCES division (division_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(username) REFERENCES `user`(username) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `role`(
role_id int PRIMARY KEY AUTO_INCREMENT,
role_name VARCHAR(255)
);
CREATE TABLE user_role(
role_id INT,
username VARCHAR(255),
PRIMARY KEY(role_id,username),
FOREIGN KEY (role_id) REFERENCES `role`(role_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (username) REFERENCES `user`(username)  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE customer_type (
customer_type_id INT PRIMARY KEY AUTO_INCREMENT,
customer_type_name VARCHAR(45)
);
CREATE TABLE customer(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(45),
customer_code varchar(50),
customer_birthday DATE,
customer_gender BIT(1),
customer_id_card VARCHAR(45),
customer_phone VARCHAR(45),
customer_email VARCHAR(45),
customer_adress VARCHAR(45),
customer_type_id INT,
FOREIGN KEY(customer_type_id) REFERENCES customer_type(customer_type_id)  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE service_type (
service_type_id INT PRIMARY KEY AUTO_INCREMENT,
service_type_name VARCHAR(45)
);
CREATE TABLE rent_type (
rent_type_id INT PRIMARY KEY AUTO_INCREMENT,
rent_type_name VARCHAR(45),
rent_type_cost DOUBLE
);

CREATE TABLE service (
service_id INT PRIMARY KEY AUTO_INCREMENT,
service_name VARCHAR(45),
service_code varchar(50),
service_area INT,
service_cost DOUBLE,
service_max_people INT,
rent_type_id INT,
service_type_id INT,
standard_room VARCHAR(45),
description_other_convenience VARCHAR(45),
pool_area DOUBLE,
number_of_floors INT,
FOREIGN KEY(rent_type_id) REFERENCES rent_type(rent_type_id)  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(service_type_id) REFERENCES service_type(service_type_id)  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE contract (
contract_id INT PRIMARY KEY AUTO_INCREMENT,
contract_start_date DATETIME,
contract_end_date DATETIME,
contract_deposit DOUBLE,
contract_total_money DOUBLE,
employee_id INT,
service_id INT,
customer_id INT,
FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(service_id) REFERENCES service(service_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE attach_service (
attach_service_id INT PRIMARY KEY AUTO_INCREMENT,
attach_service_name VARCHAR(45),
attach_service_cost DOUBLE,
attach_service_unit INT,
attach_service_statust VARCHAR(45)
);
CREATE TABLE contract_detail (
contract_detail_id INT PRIMARY KEY AUTO_INCREMENT,
attach_service_id INT ,
contract_id INT,
quantity INT,
FOREIGN KEY(attach_service_id) REFERENCES attach_service(attach_service_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(contract_id) REFERENCES contract(contract_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO customer_type(customer_type_name)
VALUES ('Diamond'),
		('Platinium'),
        ('Gold'),
        ('Silver'),
        ('Member');

INSERT INTO position (position_name)
VALUES ('Le tan'),
		('Phuc vu'),
        ('Chuyen vien'),
        ('Giam sat'),
        ('Quan ly'),
        ('Giam doc');
        
INSERT INTO education_degree (education_degree_name)
VALUES ('Trung cap'),
		('Cao dang'),
        ('Dai hoc'),
        ('Sau dai hoc');
        
INSERT INTO division(division_name)
VALUES ('Sale Makerting'),
		('Hanh chinh'),
        ('Phuc vu'),
        ('Quan ly');

SELECT * FROM customer;

UPDATE `jsp_case_study`.`customer` SET `customer_id` = '2', `customer_name` = 'thuong tinh', `customer_code` = 'tinhbt', `customer_birthday` = '2000-06-28', `customer_id_card` = '239333', `customer_phone` = '0799596322', `customer_email` = 'thuongtinh2000@gmail.com', `customer_adress` = 'quang binh', `customer_type_id` = '2' WHERE (`customer_id` = '1');

SELECT * FROM customer WHERE customer_name = "thanh tung";

INSERT INTO `jsp_case_study`.`customer` (`customer_id`, `customer_name`, `customer_code`, `customer_birthday`, `customer_gender`, `customer_id_card`, `customer_phone`, `customer_email`, `customer_adress`, `customer_type_id`) VALUES ('1', 'thanh tung', 'tungbt', '2004-04-27', b'1', '334344', '3434343434', 'thanhtung2004@gmail.com', 'quang binh', '1');


