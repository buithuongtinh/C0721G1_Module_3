USE quan_ly_sinh_vien;
-- Hiển thị số lượng sinh viên ở từng nơi
SELECT address , COUNT(student_id) as 'Số lượng học viên'
FROM student
GROUP BY address;
-- Tính điểm trung bình các môn học của mỗi học viên
SELECT S.student_id,S.student_name , AVG(mark)
FROM student S
INNER JOIN mark on S.student_id = mark.student_id
GROUP BY S.student_id , S.student_name;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT S.student_id,S.student_name , AVG(mark)
FROM student S
INNER JOIN mark on S.student_id = mark.student_id
GROUP BY S.student_id , S.student_name
HAVING  AVG(mark) > 15;
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.student_id,S.student_name , AVG(mark)
FROM student S
INNER JOIN mark on S.student_id = mark.student_id
GROUP BY S.student_id , S.student_name
HAVING  AVG(mark) >= ALL(SELECT AVG(mark) FROM mark GROUP BY mark.student_id );