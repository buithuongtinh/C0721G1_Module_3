create database democ07;
use democ07;
create table category(
id_category int auto_increment primary key,
name_category varchar(50) 
);
create table product(
id_product int auto_increment primary key,
name_product varchar(50),
price decimal,
`status` bit,
id_category int, 
foreign key (id_category) references category(id_category) 
);
