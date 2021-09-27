DROP DATABASE IF EXISTS quan_ly_sinh_vien;
CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE class(
class_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
class_name VARCHAR(60) NOT NULL,
start_date DATETIME NOT NULL,
`status` BIT
);
CREATE TABLE student(
student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(30) NOT NULL,
address VARCHAR(50),
phone VARCHAR(20),
`status` BIT,
class_id INT NOT NULL,
FOREIGN KEY (class_id) REFERENCES class(class_id)
);
CREATE TABLE `subject`(
sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sub_name VARCHAR(30) NOT NULL,
credit TINYINT NOT NULL DEFAULT 1 CHECK(credit >= 1 ),
`status` BIT DEFAULT 1	
);
CREATE TABLE mark(
mark_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
sub_id INT NOT NULL,
student_id INT NOT NULL,
mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 and 100),
exam_times TINYINT DEFAULT 1,
UNIQUE(sub_id,student_id),--  UNION kết hợp các dữ liệu lại nhưng loại bỏ trùng nhau
FOREIGN KEY (sub_id) REFERENCES `subject`(sub_id),
FOREIGN KEY (student_id) REFERENCES student(student_id)
);


