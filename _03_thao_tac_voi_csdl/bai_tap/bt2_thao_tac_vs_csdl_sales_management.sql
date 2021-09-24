USE sales_management;
INSERT INTO customer(c_name,c_age)
VALUES ('Minh Quan',10),
        ('Ngoc Oanh',20),
        ('Hong Ha',50);
SELECT* FROM customer;
INSERT INTO `order`(c_id,o_date)
VALUES (1, '2006/3/21'),
		(2, '2006/3/23'),
        (1, '2006/3/17');
SELECT* FROM `order`;
INSERT INTO product(p_name,p_price)
VALUES('May Giat',3),
      ('Tu Lanh',5),
      ('Dieu Hoa',7),
      ('Quat',1),
      ('Bep Dien',2);
SELECT* FROM product;
INSERT INTO order_detail(o_id,p_id,od_qty)
VALUES(1,1,3),
      (1,3,7),
      (1,4,2),
      (2,1,1),
      (3,1,8),
      (2,5,4),
      (2,3,3);
SELECT* FROM order_detail;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng order
SELECT o_id,o_date,o_total_price
FROM `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c_name C ,p_name P
FROM order_detail Od 
INNER JOIN product P on Od.p_id = P.p_id
INNER JOIN `order` O on O.o_id = Od.o_id
INNER JOIN customer C on C.c_id = O.c_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

SELECT C.c_name as ten_khanh_hang , COUNT(Od.o_id) as so_lan_mua_san_pham
FROM order_detail Od 
INNER JOIN product P on Od.p_id = P.p_id
INNER JOIN `order` O on O.o_id = Od.o_id
RIGHT JOIN customer C on C.c_id = O.c_id
GROUP BY C.c_id
HAVING COUNT(Od.o_id)= 0;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán
--  của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT O.o_id , O.o_date , sum(Od.od_qty* P.p_price) as tong_gia
FROM order_detail Od 
INNER JOIN product P on Od.p_id = P.p_id
INNER JOIN `order` O on O.o_id = Od.o_id
GROUP BY Od.o_id;

