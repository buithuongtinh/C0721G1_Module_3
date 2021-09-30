USE furama_resort_management;
-- task 2:Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu 
-- là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự
/*SUBSTR( string, start_position, [ length ] ) 
start_position là một số âm, thì hàm SUBSTR bắt đầu từ cuối chuỗi và đếm ngược.*/
SELECT *
FROM nhan_vien
WHERE(substring_index(ho_ten_nv,' ',-1) LIKE '%T%'
        OR substring_index(ho_ten_nv,' ',-1) LIKE '%H%'
        OR substring_index(ho_ten_nv,' ',-1) LIKE '%K%')
        AND length(ho_ten_nv) <= 15;
-- task 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT * 
FROM khach_hang 
WHERE (18 < (year(curdate())- year(ngay_sinh_kh)) < 50) AND dia_chi = 'Da Nang' OR 'Quang Tri';
/* task 4:Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần
 theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. */
 
SELECT kh.id_khach_hang, kh.ho_ten_kh , lk.ten_loai_khach , COUNT(hd.id_hop_dong) as 'số lần đặt phòng'
FROM khach_hang kh
INNER JOIN hop_dong hd ON hd.id_khach_hang = kh.id_khach_hang
INNER JOIN loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
WHERE lk.ten_loai_khach ='Diamond'
GROUP BY kh.id_khach_hang
ORDER BY COUNT(hd.id_hop_dong);
/* task 5: Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, 
TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, 
với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. 
(Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
*/

SELECT kh.id_khach_hang ,kh.ho_ten_kh ,lk.ten_loai_khach ,hd.id_hop_dong, dv.ten_dich_vu,hd.ngay_lam_hd ,hd.ngay_ket_thuc ,
	SUM(dv.chi_phi_thue +( hdct.so_luong*dvdk.gia_dvdk)) as 'tong_tien'
FROM khach_hang kh
LEFT JOIN loai_khach lk on lk.id_loai_khach = kh.id_loai_khach
LEFT JOIN hop_dong hd on hd.id_khach_hang = kh.id_khach_hang
LEFT JOIN dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id_hop_dong
LEFT JOIN dich_vu_di_kem dvdk on dvdk.id_dv_di_kem = hdct.id_dv_di_kem
GROUP BY kh.id_khach_hang;

/* task 6:Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ 
chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).*/
SELECT dv.id_dich_vu ,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dv 
FROM dich_vu dv 
INNER JOIN hop_dong hd on hd.id_dich_vu = dv.id_dich_vu
INNER JOIN loai_dich_vu ldv on ldv.id_loai_dv = dv.id_loai_dv
WHERE not( month(ngay_lam_hd) IN (1,2,3) and year(ngay_lam_hd) = 2019);
/*task 7:Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại 
dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.*/

SELECT dv.id_dich_vu ,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dv 
FROM dich_vu dv
INNER JOIN hop_dong hd on hd.id_dich_vu = dv.id_dich_vu
INNER JOIN loai_dich_vu ldv on ldv.id_loai_dv = dv.id_loai_dv
WHERE year(ngay_lam_hd) = 2018 AND dv.id_loai_dv 
NOT IN (SELECT dv.id_dich_vu
	    FROM dich_vu dv 
        INNER JOIN hop_dong hd on hd.id_dich_vu = dv.id_dich_vu
		WHERE year(hd.ngay_lam_hd)= 2019);












