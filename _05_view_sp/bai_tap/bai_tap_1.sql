DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;
USE demo;
CREATE TABLE products(
	id INT PRIMARY KEY AUTO_INCREMENT,
	product_code VARCHAR(50),
	product_name VARCHAR(50),
	product_price INT,
	product_amount INT,
	product_description VARCHAR(50),
	product_status VARCHAR(50)
);
INSERT INTO products(product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES('x_001', 'xoài', 30, 2, 'màu vàng', 'còn hàng'),
	  ('c_001', 'cam', 60, 8, 'màu cam', 'hét hàng'),
	  ('t_001', 'táo', 80, 7, 'màu đỏ', 'còn hàng'),
	  ('o_001', 'ổi', 20, 5, 'màu xanh', 'còn hàng');

/*Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
So sánh câu truy vấn trước và sau khi tạo index*/
CREATE UNIQUE INDEX product_code_index ON products(product_code);
CREATE INDEX name_price_index ON products(product_name, product_price);
EXPLAIN SELECT *
FROM products
WHERE product_code ='t_001';

/*Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
Tiến hành sửa đổi view
Tiến hành xoá view*/
CREATE OR REPLACE VIEW product_view
AS 
	SELECT product_code, product_name, product_price, product_status
    FROM products;

UPDATE product_view
SET product_price =110
WHERE product_name ='táo';

SELECT* FROM product_view;
DROP VIEW product_view;

/*Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
*/

DELIMITER $$
CREATE PROCEDURE get_all()
	BEGIN
		SELECT* FROM products;
	END; $$
DELIMITER ;
CALL get_all();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER $$
CREATE PROCEDURE add_product(new_product_code  VARCHAR(50), new_product_name  VARCHAR(50), new_product_price INT, new_product_amount INT,
new_product_description VARCHAR(50),new_product_status VARCHAR(50))
	BEGIN
		INSERT INTO products(product_code,product_name, product_price, product_amount, product_description , product_status)
		VALUES(new_product_code,new_product_name,new_product_price,new_product_amount,new_product_description,new_product_status);
		SELECT * FROM products;
    END; $$
DELIMITER ;
DROP PROCEDURE add_product;
CALL add_product('n_001', 'nho', 150, 20, 'màu tím', 'còn hàng');

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER $$
CREATE PROCEDURE edit_product(new_product_id int,new_product_code  VARCHAR(50), new_product_name  VARCHAR(50), new_product_price INT, new_product_amount INT,
new_product_description VARCHAR(50),new_product_status VARCHAR(50))
	BEGIN
    UPDATE products
		SET product_code = new_product_code,
			product_name = new_product_name,
			product_price = new_product_price,
			product_amount = new_product_amount,
			product_description = new_product_description,
			product_status = new_product_status
		WHERE id =new_product_id;
        SELECT* FROM products;
	END; $$
DELIMITER ;
DROP PROCEDURE edit_product;
CALL edit_product(5 ,'n_002', 'nho mỹ', 180, 11, 'màu xanh', 'còn hàng');

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER $$
CREATE PROCEDURE delete_product(new_product_id int)
	BEGIN
		DELETE FROM products
        WHERE id = new_product_id;
		SELECT* FROM products;
	END; $$
DELIMITER ;
CALL delete_product(3);
        