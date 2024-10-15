create database s03_bt4;
use s03_bt4;
create table class(
	class_id int primary key auto_increment,
    class_name varchar(100),
    start_date datetime,
    status bit
);
create table students(
	student_id int primary key auto_increment,
    student_name varchar(100),
    address varchar(255),
    phone varchar(11),
    class_id int,
    CONSTRAINT lien_ket_01 FOREIGN KEY(class_id) REFERENCES class(class_id)
);
create table subject(
	subject_id int primary key auto_increment,
    subject_name varchar(100),
    credit int,
    status bit
);
create table mark(
	id int primary key auto_increment,
    subject_id int,
	CONSTRAINT lien_ket_02 FOREIGN KEY(subject_id) REFERENCES subject(subject_id),
    student_id int,
	CONSTRAINT lien_ket_03 FOREIGN KEY(student_id) REFERENCES students(student_id),
    point double,
    exam_time datetime
);
insert into class(class_name,start_date,status) values
('HN-JV231103',str_to_date("03/11/2023",'%d/%c/%Y'),True),('HN-JV231229',str_to_date("29/12/2023",'%d/%c/%Y'),True),
('HN-JV230615',str_to_date("15/06/2023",'%d/%c/%Y'),True);

insert into students(student_name,address,phone,class_id) values
('Lê Minh Quang','Hà Nội','09838442',1),('Trần Trọng Đức','Hải Phòng','9827374',1),
('Phan Đình Tạc','Thái Bình','123123',2);

insert into students(student_name,address,phone,class_id) values
('Nguyễn Thị Viện','Hải Dương','123123',2),('Nguyễn Đức Anh','Bắc Giang','322354',3),
('Lê Quang Tiệp','Bắc Ninh','65745',1),('Nguyễn Trường Sơn','Hưng Yên','123123',3);

insert into subject(subject_name,credit,status) values
('Toán',3,True),('Văn',3,True),('Anh',2,True);

insert into mark(student_id,subject_id,point,exam_time) values
(1,1,7,str_to_date("12/05/2024",'%d/%c/%Y')),(1,1,7,str_to_date("15/03/2024",'%d/%c/%Y')),
(2,2,8,str_to_date("15/05/2024",'%d/%c/%Y')),(2,3,9,str_to_date("08/03/2024",'%d/%c/%Y')),
(3,3,10,str_to_date("11/02/2024",'%d/%c/%Y'));

select * from class order by class_name desc;
select * from students where address = "Hà Nội";
select * from students as s 
inner join class as c on s.class_id = c.class_id
where c.class_name = "HN-JV231103";
select * from subject where credit > 2;
select * from students where phone like '09%';