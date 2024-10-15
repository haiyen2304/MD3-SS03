create database s03_bt5;
use s03_bt5;
create table account(
	id int primary key auto_increment,
    user_name varchar(100) unique not null,
    password varchar(255) not null,
    address varchar(255) not null,
    status bit default True
);
create table bill(
	id int primary key auto_increment,
    bill_type bit default True,
    acc_id int not null,
    created datetime,
    auth_date datetime,
    constraint fk_bill01 foreign key (acc_id) references account(id) 
);
create table product(
	id int primary key auto_increment,
    name varchar(255) not null unique,
    created date not null,
    price double check(price > 0),
    stock int not null,
    status bit default True
);
create table bill_detail(
	id int primary key auto_increment,
    bill_id int not null,
    product_id int not null,
    quantity int not null,
    price double check(price>0),
    constraint fk_bd01 foreign key (bill_id) references bill(id),
    constraint fk_bd02 foreign key (product_id) references product(id)
);

insert into account(user_name,password,address,status) values
('Hùng','123456','Hà Nội',True),('Cường','654321','Hà Nội',True),('Bách','135790','Bắc Ninh',True);

insert into bill(bill_type,acc_id,created,auth_date) values
(0,1,str_to_date("11/02/2022",'%d/%c/%Y'),str_to_date("12/03/2022",'%d/%c/%Y')),
(0,1,str_to_date("05/10/2023",'%d/%c/%Y'),str_to_date("10/10/2023",'%d/%c/%Y')),
(1,2,str_to_date("15/05/2024",'%d/%c/%Y'),str_to_date("20/05/2024",'%d/%c/%Y')),
(1,3,str_to_date("01/02/2022",'%d/%c/%Y'),str_to_date("10/02/2022",'%d/%c/%Y'));

insert into product(name,created,price,stock,status) values
('Quần dài',str_to_date("12/03/2022",'%d/%c/%Y'),1200,5,True),
('Áo dài',str_to_date("15/03/2023",'%d/%c/%Y'),1500,8,True),
('Mũ cối',str_to_date("08/03/1999",'%d/%c/%Y'),1600,10,True);

insert into bill_detail(bill_id,product_id,quantity,price) values
(1,1,3,1200),(1,2,4,1500),(2,1,1,1200),(3,2,4,1500),(4,3,7,1600);

select * from account order by user_name desc;
select * from bill where created between str_to_date("11/02/2023",'%d/%c/%Y') and str_to_date("15/05/2023",'%d/%c/%Y');
select * from bill_detail as bd 
inner join bill as b on bd.bill_id = b.id;
select * from product order by name desc;
select * from product  as p 
inner join bill_detail as bd on p.id = bd.product_id
where quantity > 10;
select * from product where status = True;