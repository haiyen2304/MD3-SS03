create database s03_bt1;
use s03_bt1;
create table color(
	id int primary key auto_increment,
    name varchar(100),
    status bit
);
create table product(
	id int primary key auto_increment,
    name varchar(100),
    created date
);
create table size(
	id int primary key auto_increment,
    name varchar(100),
    status bit
);
create table product_detail(
	id int primary key auto_increment,
    product_id int,
    color_id int,
    size_id int,
    price double,
    stock int,
    status bit,
    constraint fk_pro_detail01 foreign key (product_id) references product(id),
    constraint fk_pro_detail02 foreign key (color_id) references color(id),
    constraint fk_pro_detail03 foreign key (size_id) references size(id)
);
insert into color(name,status) values
('red',1),('blue',1),('green',1);
insert into size(name,status) values
('X',1),('M',1),('L',1),('XL',1),('XXL',1);
insert into product(name,created) values
('Quần dài',str_to_date('12/5/1990','%d/%c/%Y')),('Áo dài',str_to_date('05/10/2005','%d/%c/%Y')),('Mũ phớt',str_to_date('07/07/1995','%d/%c/%Y'));
insert into product_detail(product_id,color_id,size_id, price,stock,status) values
(1,1,1,1200,5,1),(2,1,1,1500,2,1),(1,2,3,500,3,1),(1,2,3,1600,3,0),(3,1,4,1200,5,1),(3,3,5,1200,6,1),(2,3,5,2000,10,0);
select p.name,c.name,s.name,price,pd.stock,IF(pd.status = 1,'True','False') from product_detail as pd
inner join product as p on p.id = pd.product_id
inner join size as s on s.id = pd.size_id
inner join color as c on c.id = pd.color_id
WHERE price > 1200;
select name, IF(status = 1,'True','False') status from color;
select * from size;
select p.name,c.name,s.name,price,pd.stock,IF(pd.status = 1,'True','False') from product_detail as pd
inner join product as p on p.id = pd.product_id
inner join size as s on s.id = pd.size_id
inner join color as c on c.id = pd.color_id
WHERE pd.product_id = 1;
