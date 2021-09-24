USE quan_ly_sinh_vien;

-- Hiển thị danh sách tất cả các học viên
SELECT* FROM student;
-- Hiển thị danh sách các học viên đang theo học.
SELECT* FROM student
WHERE `status` = 1;
-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
SELECT* FROM `subject`
WHERE credit < 10;
-- Hiển thị danh sách học viên lớp A1
SELECT student.student_id ,student.student_name,class.class_name
FROM student
INNER JOIN class on student.class_id = class.class_id
WHERE class.class_name = 'A1';
-- Hiển thị điểm môn CF của các học viên.
SELECT S.student_id,S.student_name,Sub.sub_name,M.mark
FROM student S 
INNER JOIN mark M on S.student_id =M.student_id
INNER JOIN `subject` Sub on M.sub_id = Sub.sub_id
WHERE Sub.sub_name = 'CF';


