DROP DATABASE IF EXISTS exam_mod_3;
CREATE DATABASE exam_mod_3;
USE exam_mod_3;

CREATE TABLE loai_mat_bang (
 id_loai_mat_bang INT PRIMARY KEY AUTO_INCREMENT,
 ten_loai_mat_bang VARCHAR(225)
);

CREATE TABLE mat_bang (
id_mat_bang INT PRIMARY KEY AUTO_INCREMENT,
dien_tich DOUBLE,
trang_thai BIT,
tang INT,
mo_ta_chi_tiet VARCHAR(225),
gia_cho_thue DOUBLE ,
ngay_bat_dau DATE,
ngay_ket_thuc DATE ,
id_loai_mat_bang INT,
FOREIGN KEY (id_loai_mat_bang) REFERENCES loai_mat_bang(id_loai_mat_bang)
);

INSERT INTO loai_mat_bang(ten_loai_mat_bang)
VALUE ('Văn phòng chia sẻ'),
	('Văn phòng trọn gói');
    
    
SELECT * FROM loai_mat_bang;


SELECT * FROM mat_bang 
      JOIN loai_mat_bang ON mat_bang.id_loai_mat_bang = loai_mat_bang.id_loai_mat_bang;
      
      INSERT INTO `exam_mod_3`.`mat_bang` (`id_mat_bang`, `dien_tich`, `trang_thai`, `tang`, `mo_ta_chi_tiet`, `gia_cho_thue`, `ngay_bat_dau`, `ngay_ket_thuc`, `id_loai_mat_bang`) VALUES ('1', '200', '0', '2', 'gg', '9999999','2020-01-01', '2020-01-03', '1');