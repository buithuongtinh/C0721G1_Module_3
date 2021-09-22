DROP DATABASE IF EXISTS students_management;
CREATE DATABASE students_management;
USE students_management;

CREATE TABLE class (
 id INT,
 `name` VARCHAR(45),
 PRIMARY KEY(id)
 );
 
CREATE TABLE teacher(
 id INT,
 `name` VARCHAR(45),
 `age` INT,
 country VARCHAR(45),
 PRIMARY KEY(id)
 );