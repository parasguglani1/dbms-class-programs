--cursor based detail information of employee table
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

insert into employee values(2,'Paras2','delhi1',80000,DATE'2020-08-22');
insert into employee values(3,'Paras3','delhi2',90000,DATE'2021-08-22');
insert into employee values(4,'Paras4','delhi3',10003,DATE'2022-08-22');
insert into employee values(5,'Paras5','delhi4',100001,DATE'2023-08-22');
insert into employee values(6,'Paras6','delhi5',100002,DATE'2024-08-22');

--cursor based detail information of employee table


--cursor based detail information of employee table
DECLARE
    emp_id number(5);
    Fname varchar2(10);
    Eaddress varchar2(10);
    salary number;
    hiredate date;
    CURSOR c1 IS
    SELECT * FROM employee;
BEGIN


    OPEN c1;
    LOOP
        FETCH c1 INTO emp_id,Fname,Eaddress,salary,hiredate;
        EXIT WHEN c1%NOTFOUND;
        dbms_output.put_line('emp_id: '||emp_id||' Fname: '||Fname||' Eaddress: '||Eaddress||' salary: '||salary||' hiredate: '||hiredate);
    END LOOP;
    CLOSE c1;
END;
