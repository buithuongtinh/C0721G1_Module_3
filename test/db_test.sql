CREATE DATABASE product_lam_them;

USE product_lam_them;

CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price DOUBLE NOT NULL,
    product_quantity INT NOT NULL,
    product_color VARCHAR(255) NOT NULL,
    product_description VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id)
        REFERENCES category (category_id)
);

INSERT INTO category (category_name)
VALUES
('Điện thoại'),
('Tivi'),
('Tủ lạnh'),
('Máy giặt'),
('Điều hòa');

SELECT * FROM product JOIN category ON product.category_id = category.category_id WHERE product_name LIKE 'P%';