USE furama_resort_management;
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO nhan_vien(ho_ten_nv,ngay_sinh,so_cmnd,luong,sdt,email,dia_chi,id_vi_tri,id_bo_phan,id_trinh_do)
VALUES('Bui Thuong Tinh','2000-06-28','1223456','10000','123345666','thuongtinh@gmail,com','Quang Binh',2,3,2),
('Dinh Van Dung','2000-05-25','3323456','15000','111345666','dung@gmail,com','Quang Binh',5,1,1),
('Bui Quoc Hung','2000-07-23','1223259','13000','122225666','hung@gmail,com','Da Nang',1,3,3),
('Nguyen Van Khanh','1999-06-22','9877456','17000','999345666','khanh@gmail,com','Quang Tri',6,4,4),
('Nguyen Hong Son','2000-06-11','3323456','19000','222345666','son@gmail,com','Hue',4,2,3);
SELECT * FROM khach_hang;
SET SQL_SAFE_UPDATES = 0;


INSERT INTO khach_hang(ho_ten_kh,ngay_sinh_kh,sdt_kh,email,dia_chi,id_loai_khach)
VALUES('Bui Thanh Tung','2004-04-27','0987654','tung@gmail.com','Da Nang',5),
('Hoang Hong Ngoc','2000-01-22','0933654','ngoc@gmail.com','Quang Binh',3),
('Ho Quang Hieu','1991-11-12','0982224','hieu@gmail.com','Quang Tri',1),
('Nguyen Thi Van','2000-09-27','0987004','tvan@gmail.com','Da Nang',2),
('Ngo Ba Hai','1997-07-27','0982124','bhai@gmail.com','Da Nang',1);
INSERT INTO kieu_thue(ten_kieu_thue,gia_kieu_thue)
VALUES('Nam','24000'),('Thang','2000'),('Ngay','100'),('Gio','15');
INSERT INTO loai_dich_vu(ten_loai_dv)
VALUES('Villa'),('House'),('Room');
INSERT INTO dich_vu_di_kem(ten_dv_di_kem,gia_dvdk,don_vi,trang_thai_kha_dung)
VALUES('massage',20,'$','kha dung'),
	  ('thuc an',10,'$','khong kha dung'),
      ('nuoc uong',7,'$','kha dung'),
      ('xe dua don',50,'$','kha dung'),
      ('don dep',30,'$','khong kha dung');
INSERT INTO loai_khach(ten_loai_khach)
VALUES ('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');

INSERT INTO dich_vu(ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,trang_thai,id_kieu_thue,id_loai_dv)
VALUES('Villa trên núi',400,3,20,'5000','kha dung',2,1),
	  ('House trên núi',200,3,10,'2000','kha dung',3,2),
      ('Room vip',100,1,5,'1000','kha dung',4,3),
      ('Villa hướng biển',450,4,25,'7000','kha dung',3,1),
      ('Room thường',50,1,4,'500','kha dung',1,3);
      
INSERT INTO hop_dong(ngay_lam_hd,ngay_ket_thuc,tien_dat_coc,tong_tien,id_dich_vu,id_khach_hang,id_nhan_vien)
VALUES ('2019-01-01','2019-01-08',2000,10000,4,3,2),
       ('2016-06-01','2016-07-01',3000,15000,1,5,3),
       ('2020-10-01','2020-10-08',2000,10000,2,3,4),
       ('2020-01-21','2020-03-21',1000,7000,3,4,1);

INSERT INTO hop_dong_chi_tiet(so_luong,id_hop_dong,id_dv_di_kem)
VALUES(2,1,1),
	  (3,2,1),
      (4,3,4),
      (5,4,3);
	
SELECT* FROM hop_dong_chi_tiet;
DELETE FROM hop_dong ;

INSERT INTO vi_tri(ten_vi_tri)
VALUES('Le Tan'),
	('Phuc vu'),
    ('Chuyen Vien'),
    ('Giam sat'),
    ('Quan Ly'),
    ('Giam Doc');
INSERT INTO trinh_do(trinh_do)
VALUES ('Trung Cap'),
	   ('Cao Dang'),
       ('Dai hoc'),
	   ('Sau Dai hoc');
INSERT INTO bo_phan(ten_bo_phan)
VALUES('Sale_Marketing'),
	  ('Hanh Chinh'),
	  ('Phuc vu'),
	  ('Quan ly');

