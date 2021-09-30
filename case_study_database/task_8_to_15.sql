USE furama_resort_management;
-- task 8:(dùng 3 cách) Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- c1
SELECT DISTINCT ho_ten_kh
FROM khach_hang;

SELECT  ho_ten_kh
FROM khach_hang
GROUP BY ho_ten_kh;
-- c2
SELECT ho_ten_kh
FROM khach_hang
UNION
SELECT ho_ten_kh
FROM khach_hang;
-- c3
SELECT ho_ten_kh , COUNT(ho_ten_kh) as 'so_ten_co_trong_he_thong'
FROM khach_hang
GROUP BY ho_ten_kh
HAVING (COUNT(ho_ten_kh) >= 1);
/*task 9:Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019
 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.*/
 
 SELECT month(ngay_lam_hd) AS 'tháng' , COUNT(id_hop_dong) AS 'số khách đặt phòng'
 FROM hop_dong 
 WHERE year(ngay_lam_hd) = 2019
 GROUP BY MONTH (ngay_lam_hd);
 
 /*task 10: Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
 Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
 (được tính dựa trên việc count các IDHopDongChiTiet)*/
 
 SELECT hd.id_hop_dong , hd.ngay_lam_hd, hd.ngay_ket_thuc,hd.tien_dat_coc, COUNT(hdct.id_dv_di_kem) AS 'SoLuongDichVuDiKem'
 FROM hop_dong hd
 INNER JOIN hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
 GROUP BY hd.id_hop_dong;
 
 /*task 11:Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond”
 và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.*/ 
 
 SELECT dvdk.id_dv_di_kem , dvdk.ten_dv_di_kem, dvdk.gia_dvdk
 FROM dich_vu_di_kem dvdk
 INNER JOIN hop_dong_chi_tiet hdct on hdct.id_dv_di_kem = dvdk.id_dv_di_kem 
 INNER JOIN hop_dong hd ON hd.id_hop_dong = hdct.id_hop_dong
 INNER JOIN khach_hang kh ON kh.id_khach_hang = hd.id_khach_hang
 INNER JOIN loai_khach lk ON lk.id_loai_khach = kh.id_loai_khach
 WHERE lk.ten_loai_khach = "Diamond" AND( kh.dia_chi = "Vinh"OR"Quang Ngai" );
 
 /*task12:Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
 (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 
 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.*/
 
SELECT hd.id_hop_dong ,nv.ho_ten_nv , kh.ho_ten_kh, kh.sdt_kh, dv.ten_dich_vu,COUNT(hdct.id_dv_di_kem) AS'SoLuongDichVuDikem' 
        , hd.tien_dat_coc
FROM nhan_vien nv
INNER JOIN hop_dong hd ON hd.id_nhan_vien = nv.id_nhan_vien
INNER JOIN khach_hang kh ON kh.id_khach_hang = hd.id_khach_hang
INNER JOIN dich_vu dv ON dv.id_dich_vu = hd.id_dich_vu
INNER JOIN hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
INNER JOIN dich_vu_di_kem dvdk ON dvdk.id_dv_di_kem = hdct.id_dv_di_kem
WHERE hd.ngay_lam_hd
	in (
		SELECT hd.ngay_lam_hd 
        FROM hop_dong hd
        WHERE ( year(ngay_lam_hd) = 2019 AND month(ngay_lam_hd) in (10,11,12)))
	AND hd.ngay_lam_hd 
    NOT in( SELECT hd.ngay_lam_hd 
            FROM hop_dong hd
            where (year(ngay_lam_hd) = 2019 and month(ngay_lam_hd) in (1,2,3,4,5,6)));
/*task 13:Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
*/ 

SELECT dvdk.ten_dv_di_kem ,COUNT(hdct.id_hop_dong) AS 'số lần đc sử dụng nhiều nhất'
FROM hop_dong_chi_tiet hdct 
INNER JOIN dich_vu_di_kem dvdk on dvdk.id_dv_di_kem = hdct.id_dv_di_kem
GROUP BY dvdk.id_dv_di_kem
HAVING COUNT(hdct.id_hop_dong) >= all(
			SELECT COUNT(hdct.id_hop_dong)
            FROM hop_dong_chi_tiet hdct 
			INNER JOIN dich_vu_di_kem dvdk on dvdk.id_dv_di_kem = hdct.id_dv_di_kem
            GROUP BY dvdk.id_dv_di_kem);
/*
Task 14:Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị 
bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.*/

SELECT dvdk.id_dv_di_kem, ldv.ten_loai_dv , dvdk.ten_dv_di_kem ,COUNT(hdct.id_hop_dong) AS 'So_Lan_Su_Dung'
FROM dich_vu_di_kem dvdk
INNER JOIN hop_dong_chi_tiet hdct ON hdct.id_dv_di_kem = dvdk.id_dv_di_kem
INNER JOIN hop_dong hd on hd.id_hop_dong = hdct.id_hop_dong
INNER JOIN dich_vu dv ON dv.id_dich_vu = hd.id_dich_vu
INNER JOIN loai_dich_vu ldv ON ldv.id_loai_dv = dv.id_loai_dv
GROUP BY dvdk.id_dv_di_kem
HAVING COUNT(hdct.id_hop_dong) = 1;

/*
task 15:Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai,
 DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.*/
 SELECT nv.id_nhan_vien , nv.ho_ten_nv , td.trinh_do, bp.ten_bo_phan ,nv.sdt ,nv.dia_chi ,COUNT(hd.ngay_lam_hd) as 'số lượng hd đã làm'
 FROM nhan_vien nv
 INNER JOIN hop_dong hd ON nv.id_nhan_vien = hd.id_nhan_vien
 INNER JOIN trinh_do td on td.id_trinh_do = nv.id_trinh_do
 INNER JOIN bo_phan bp on bp.id_bo_phan = nv.id_bo_phan
 WHERE(year(hd.ngay_lam_hd) in (2018,2019))
 GROUP BY nv.id_nhan_vien
 HAVING COUNT(hd.ngay_lam_hd) <= 3;


 
 
 
 
 
 
 
 
 
