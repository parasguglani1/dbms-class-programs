
create table orders(order_id number, cust_id number
);

desc orders;


Insert into orders values(1,9360);
Insert into orders values(2,9350);
Insert into orders values(3,9370);
Insert into orders values(4,9360);
Insert into orders values(5,9370);
Insert into orders values(6,9360);


Select * from orders;
SELECT cust_id
FROM orders
GROUP BY cust_id
ORDER BY COUNT(order_id) DESC
