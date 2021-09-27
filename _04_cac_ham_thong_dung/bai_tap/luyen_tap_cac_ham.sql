USE quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *,MAX(credit)
FROM `subject` ;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT Sub.sub_id, Sub.sub_name, MAX(mark) as "số điểm cao nhất"
FROM `subject` Sub
INNER JOIN mark on Sub.sub_id = mark.sub_id
WHERE mark =(SELECT MAX(mark) FROM mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.student_id,S.student_name , AVG(mark)
FROM student S
INNER JOIN mark on S.student_id = mark.student_id
GROUP BY S.student_id , S.student_name
ORDER BY mark desc;
