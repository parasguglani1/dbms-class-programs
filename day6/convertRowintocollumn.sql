drop table employee;
create table employee
(
emp_id    number ,
Fname  varchar2(10) NOT NULL,
Eaddress  varchar2(10),
salary    number,
hiredate DATE,
CONSTRAINT PK PRIMARY KEY(emp_id)
);


desc employee;

insert into employee values(1,'Paras','Meerut',40000,DATE'2001-08-22');

insert into employee values(2,'Paras7','delhi1',80000,DATE'2020-08-22');
insert into employee values(3,'Paras3','delhi2',90000,DATE'2021-08-22');
insert into employee values(4,'Paras4','delhi3',10003,DATE'2022-08-22');
insert into employee values(5,'Paras5','delhi4',100001,DATE'2023-08-22');
insert into employee values(6,'Paras6','delhi5',100002,DATE'2024-08-22');

insert into employee values(7,'Paras11','delhi1',80000,DATE'2020-08-22');
insert into employee values(8,'Paras8','delhi1',90000,DATE'2020-08-22');
insert into employee values(10,'Paras9','delhi1',90000,DATE'2020-08-22');


select * from employee;
select * from
 (select trunc(hiredate,'mon') emp_id,Fname,Eaddress,salary from employee)
pivot(sum(salary)for (salary ) in (80000,90000,100001))
order by emp_id;

-- listagg function


select listagg(Eaddress,',') within group (order by Eaddress) "salaries" from employee;
