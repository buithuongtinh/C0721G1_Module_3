DROP DATABASE IF EXISTS students_management;
CREATE DATABASE students_management;
USE students_management;

CREATE TABLE students (
 id INT,
 `name` VARCHAR(45) NULL,
 `age` INT NULL,
 country VARCHAR(45) NULL,
 PRIMARY KEY(id)
 );






