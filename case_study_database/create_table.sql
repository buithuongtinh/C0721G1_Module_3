DROP DATABASE IF EXISTS furama_resort_management;
CREATE DATABASE furama_resort_management;
USE furama_resort_management;

CREATE TABLE vi_tri(
id_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
ten_vi_tri VARCHAR(45)
);
CREATE TABLE trinh_do(
id_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
trinh_do VARCHAR(45)
);
CREATE TABLE bo_phan(
id_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
ten_bo_phan VARCHAR(45)
);
CREATE TABLE nhan_vien(
id_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
ho_ten_nv VARCHAR(45),
ngay_sinh DATE,
so_cmnd VARCHAR(45),
luong VARCHAR(45),
sdt VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR(45),
id_vi_tri INT,
id_bo_phan INT,
id_trinh_do INT,
FOREIGN KEY(id_vi_tri) REFERENCES vi_tri(id_vi_tri) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(id_bo_phan) REFERENCES bo_phan(id_bo_phan) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(id_trinh_do) REFERENCES trinh_do(id_trinh_do) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE loai_khach(
id_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
ten_loai_khach VARCHAR(45)
);
CREATE TABLE khach_hang(
id_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
ho_ten_kh VARCHAR(45),
ngay_sinh_kh DATE ,
sdt_kh VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR(45),
id_loai_khach INT ,
FOREIGN KEY (id_loai_khach) REFERENCES loai_khach(id_loai_khach) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE kieu_thue(
id_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
ten_kieu_thue VARCHAR(45),
gia_kieu_thue INT
);
CREATE TABLE loai_dich_vu (
id_loai_dv INT PRIMARY KEY AUTO_INCREMENT,
ten_loai_dv VARCHAR(45)
);
CREATE TABLE dich_vu(
id_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
ten_dich_vu VARCHAR(45),
dien_tich INT,
so_tang INT,
so_nguoi_toi_da INT,
chi_phi_thue VARCHAR(45),
trang_thai VARCHAR(45),
id_kieu_thue INT,
id_loai_dv INT,
FOREIGN KEY (id_kieu_thue) REFERENCES kieu_thue(id_kieu_thue) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (id_loai_dv) REFERENCES loai_dich_vu(id_loai_dv) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE dich_vu_di_kem(
id_dv_di_kem INT PRIMARY KEY AUTO_INCREMENT,
ten_dv_di_kem VARCHAR(45),
gia_dvdk INT,
don_vi VARCHAR(45),
trang_thai_kha_dung VARCHAR (45)
);
CREATE TABLE hop_dong(
id_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
ngay_lam_hd DATE,
ngay_ket_thuc DATE,
tien_dat_coc INT,
tong_tien INT,
id_dich_vu INT,
id_khach_hang INT,	
id_nhan_vien INT,
FOREIGN KEY(id_nhan_vien) REFERENCES nhan_vien(id_nhan_vien) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(id_khach_hang) REFERENCES khach_hang(id_khach_hang) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(id_dich_vu) REFERENCES dich_vu (id_dich_vu) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE hop_dong_chi_tiet(
id_hdct INT PRIMARY KEY AUTO_INCREMENT,
so_luong INT,
id_hop_dong INT,
id_dv_di_kem INT,
FOREIGN KEY (id_dv_di_kem) REFERENCES dich_vu_di_kem(id_dv_di_kem) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(id_hop_dong) REFERENCES hop_dong(id_hop_dong) ON UPDATE CASCADE ON DELETE CASCADE
);



