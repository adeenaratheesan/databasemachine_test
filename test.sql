-- ************************************* MACHINE TEST 1 ****************************************
create database test;
\c test;
create table tbl_stock(
    pk_int_stock_id serial primary key not null,
    vchr_name varchar(20),
    int_quantity int,
    int_price int
    );



alter table tbl_stock alter column int_price type float;
create table tbl_supplier (
    pk_int_supplier_id serial primary key ,
    vchr_supplier_name varchar(20)
);

alter table tbl_stock add column fk_int_supplier int;

alter table tbl_stock add foreign key(fk_int_supplier)references tbl_supplier(pk_int_supplier_id);

create table tbl_dept(pk_int_dept_id serial primary key,vchr_dept_name varchar(25));
create table tbl_classes(pk_int_class_id serial primary key,vchr_class_name varchar(20),fk_int_dept_id int,foreign key(fk_int_dept_id)references tbl_dept(pk_int_dept_id)on delete cascade on update cascade);
create table tbl_enrollment(pk_int_enrollment_id serial primary key,int_count int, fk_int_class_id int,foreign key(fk_int_class_id)references tbl_classes(pk_int_class_id)on delete cascade on update cascade);
alter table tbl_classes add unique(vchr_class_name);
alter table tbl_dept add column vchr_dept_description  varchar(20);
insert into tbl_supplier(vchr_supplier_name)values('Logitech');
insert into tbl_supplier(vchr_supplier_name)values('Samsung');
insert into tbl_supplier(vchr_supplier_name)values('Iball');
insert into tbl_supplier(vchr_supplier_name)values('LG');
insert into tbl_supplier(vchr_supplier_name)values('Creative');


-- ************************************* MACHINE TEST 2 ****************************************


insert into tbl_stock(vchr_name,int_quantity,int_price,fk_int_supplier) values ('Mouse',10,500,1),('Keyboard',5,450,3),('Modem',10,1200,2),('Memory',100,1500,5),('Headphone',50,750,4),('Memory',2,3500,4);
update tbl_stock set int_price = 501.50 where pk_int_stock_id = 1;
update tbl_stock set int_price = 451.50 where pk_int_stock_id = 2;
update tbl_stock set int_price = 1201.50 where pk_int_stock_id = 3;
update tbl_stock set int_price = 1501.50 where pk_int_stock_id = 4;
update tbl_stock set int_price = 751.50 where pk_int_stock_id = 5;
update tbl_stock set int_price = 3501.50 where pk_int_stock_id = 6;
select * from tbl_stock where int_price >1000;
select * from tbl_stock order by vchr_name asc; 
select * from tbl_stock order by vchr_name asc limit 3; 
select * from tbl_stock order by vchr_name desc limit 3; 
select int_quantity,int_price,int_quantity * int_price as total_price from tbl_stock;
delete from tbl_stock where fk_int_supplier=5;
insert into tbl_dept (vchr_dept_name,vchr_dept_description) values ('Computer Science','CS'),('Electronics','EC'),('Commerce','CC'),('Arts','AR');


-- ************************************ MACHINE TEST 3 ****************************************


create table tbl_stock(
    pk_int_stock_id serial primary key,
    vchr_name varchar(100),
    int_quantity int,
    int_price float,
    fk_int_supplier int
 );

alter table tbl_stock add foreign key(fk_int_supplier)references tbl_supplier(pk_int_supplier_id) on delete cascade on update cascade;
insert into tbl_stock(vchr_name,int_quantity,int_price,fk_int_supplier) values ('Mouse',10,501.5,1),('Keyboard',5,451.5,3),('Modem',10,1201.5,2),('Memory',100,1501.5,5),('Headphone',50,751.5,4),('Memory',2,3501.5,4);
SELECT * FROM TBL_STOCK;
select sum(int_quantity * int_price) as totalcost from tbl_stock;
select count(*) as total_no_product from tbl_stock;
select round(int_price) from tbl_stock;
select  count(distinct vchr_name) as items from tbl_stock;
select vchr_name,int_price from tbl_stock where int_price= (select max(int_price)from tbl_stock);
SELECT sum(int_count) as total_enrollment from tbl_enrollment;
select count(distinct vchr_class_name) as no_of_classes from tbl_classes;
select concat(vchr_name,int_price) as product_price from tbl_stock;
create table tbl_student(
   enrl_no int,
   pk_roll_no int PRIMARY KEY,
   student_name varchar(100),
   city_name varchar(100),
   mobile bigint,
   dob date
 );
 insert into tbl_student (enrl_no,
    pk_roll_no,
    student_name,
    city_name,
    mobile,
    dob) values(11,2,'akhil','delhi',98756579,'1986-01-12'),(6,4,'maya','banglore',98734534,'1987-11-12'),(1,8,'anoop','banglore',93456535,'1990-12-22'),(20,1,'paul','cochin',96754555,'1991-03-13'),
    (3,5,'sandeep','delhi',84865644,'1993-06-14');


select * from tbl_student;
create table tbl_grade(
    fk_roll_no int,
    course varchar,
    grade varchar,
    foreign key (fk_roll_no) references tbl_student(pk_roll_no)on delete cascade on update cascade
);

insert into tbl_grade(fk_roll_no,course,grade)values (2,'c','A'),(2,'java','B'),(1,'C','B'),(1,'java','A'),(4,'PHP','A'),
(4,'java','A'),(4,'C','B'),(8,'java','B'),(5,'PHP','A'),(5,'java','D');


select student_name,course,grade from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no where grade='A';
 select count(distinct student_name) from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no where grade = 'B';
select student_name,pk_roll_no,count(distinct course) as no_of_courses from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no group by pk_roll_no;
select student_name from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no where city_name = 'banglore' and course = 'java';
select student_name,course from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no where student_name like 'a%';
select student_name,age(current_date,dob)from tbl_student;
select student_name, to_char(dob,'dd-mon-yyyy')as date_of_birth from tbl_student;
