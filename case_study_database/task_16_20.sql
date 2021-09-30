USE furama_resort_management;
 /*task 16:Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
*/
DELETE nv
FROM nhan_vien nv 
INNER JOIN hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
WHERE year(hd.ngay_lam_hd) NOT IN (2017,2018,2019);
/*17: Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng
 đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.*/
 CREATE TEMPORARY TABLE temp_table
( SELECT SUM(dv.chi_phi_thue+(hdct.so_luong*dvdk.gia_dvdk)) AS 'tong'
 FROM khach_hang kh 
 INNER JOIN hop_dong hd on hd.id_khach_hang =kh.id_khach_hang
 INNER JOIN dich_vu dv on dv.id_dich_vu = hd.id_dich_vu
 INNER JOIN hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
 INNER JOIN dich_vu_di_kem dvdk ON dvdk.id_dv_di_kem = hdct.id_dv_di_kem
 WHERE year(ngay_lam_hd) =2019 and kh.id_loai_khach = 2
 GROUP BY hd.id_khach_hang
 HAVING tong > 700);
 
 UPDATE khach_hang 
 SET id_loai_khach = 1
 WHERE id_khach_hang in (SELECT* FROM temp_table);
 
 drop temporary table temp_table;
 
 /*18: Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).*/
 SET SQL_SAFE_UPDATES = 0;
DELETE FROM hop_dong
WHERE id_hop_dong in (SELECT* FROM(SELECT id_hop_dong
								   FROM hop_dong hd
                                   WHERE year(hd.ngay_lam_hd)< 2016)as t);
SET SQL_SAFE_UPDATES = 1;

 /*19:Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
*/
CREATE TEMPORARY TABLE temp_table(
SELECT hdct.id_dv_di_kem 'id_dv_di_kem', sum(so_luong) as 'so_lan_su_dung'
FROM hop_dong_chi_tiet hdct
INNER JOIN hop_dong hd on hd.id_hop_dong = hdct.id_hop_dong
INNER JOIN dich_vu_di_kem dvdk on dvdk.id_dv_di_kem = hdct.id_dv_di_kem
WHERE year(ngay_lam_hd) = 2019
GROUP BY dvdk.id_dv_di_kem
HAVING so_lan_su_dung > 10);

UPDATE dich_vu_di_kem
SET gia_dvdk= (gia_dvdk*2)
WHERE id_dv_di_kem in ( SELECT id_dv_di_kem FROM temp_table);

DROP TEMPORARY TABLE temp_table;



/*20:Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị 
bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.*/
 
 SELECT id_nhan_vien , ho_ten_nv,email,sdt,ngay_sinh,dia_chi
 FROM nhan_vien
 UNION ALL
 SELECT id_khach_hang ,ho_ten_kh,email,sdt_kh,ngay_sinh_kh,dia_chi
 FROM khach_hang;
 
 
 
 
 
 
 