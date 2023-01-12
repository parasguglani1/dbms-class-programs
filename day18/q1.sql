-- | Column Name | Type |
-- +---------------+---------+
-- | order_id | int |
-- | customer_id | int |
-- | order_date | date |
-- | item_id | varchar |
-- | quantity | int |
-- +---------------+---------+
-- (ordered_id, item_id) is the primary key for this table.
-- This table contains information of the orders placed.
-- order_date is the date when item_id was ordered by the customer with id customer_id.

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    item_id VARCHAR(255),
    quantity INT,
    PRIMARY KEY (order_id, item_id)
);

CREATE TABLE Items (
    item_id VARCHAR2(255) PRIMARY KEY,
    item_name VARCHAR2(255),
    item_category VARCHAR2(255)
);


INSERT INTO Orders
VALUES (1, 1, DATE'2020-06-01', 1, 10);

INSERT INTO Orders
VALUES (2, 1, DATE'2020-06-08', 2, 10);

INSERT INTO Orders
VALUES (3, 2, DATE'2020-06-02', 1, 5);

INSERT INTO Orders
VALUES (4, 3, DATE'2020-06-03', 3, 5);

INSERT INTO Orders
VALUES (5, 4, DATE'2020-06-04', 4, 1);

INSERT INTO Orders
VALUES (6, 4, DATE'2020-06-05', 5, 5);

INSERT INTO Orders
VALUES (7, 5, DATE'2020-06-05', 1, 10);

INSERT INTO Orders
VALUES (8, 5, DATE'2020-06-14', 4, 5);

INSERT INTO Orders
VALUES (9, 5, DATE'2020-06-21', 3, 5);


INSERT INTO Items
VALUES (1, 'LC Alg. Book', 'Book');

INSERT INTO Items
VALUES (2, 'LC DB. Book', 'Book');

INSERT INTO Items
VALUES (3, 'LC SmarthPhone', 'Phone');

INSERT INTO Items
VALUES (4, 'LC Phone 2020', 'Phone');

INSERT INTO Items
VALUES (5, 'LC SmartGlass', 'Glasses');

INSERT INTO Items
VALUES (6, 'LC T-Shirt XL', 'T-Shirt');



-- Write an SQL query to report how many units in each category have been ordered on each day of the week.


v_day := to_char(DATE'2023-01-01', 'd');


SELECT
    category,
    to_char(order_date,'d') AS day_of_week,
    SUM(units) AS units_ordered
FROM
    orders
GROUP BY
    category,
    to_char(order_date,'d')
ORDER BY
    category,
    to_char(order_date,'d');

-- Write an SQL query to report how many units in each category have been ordered on each day of the week.




SELECT
    item_category,
    TO_CHAR(order_date, 'd') AS day_of_week,
    SUM(quantity) AS units_sold
FROM
    Orders
JOIN
    Items
ON
    Orders.item_id = Items.item_id
GROUP BY
    item_category,
    TO_CHAR(order_date, 'd'),
    order_date
ORDER BY
    item_category,
    TO_CHAR(order_date, 'd');


select to_char(o.order_date,'d') as dayofweek,i.Item_category,sum(o.quantity) as quantity
from orders o
Inner Join Items i On o.item_id=i.item_id
group by to_char(o.order_date,'d'),i.Item_category
order By i.item_category;



SELECT i.item_category AS category,
    SUM(CASE WHEN to_char(o.order_date,'d') = 2 THEN o.quantity ELSE 0 END) AS Monday,
    SUM(CASE WHEN to_char(o.order_date,'d') = 3 THEN o.quantity ELSE 0 END) AS Tuesday,
    SUM(CASE WHEN to_char(o.order_date,'d') = 4 THEN o.quantity ELSE 0 END) AS Wednesday,
    SUM(CASE WHEN to_char(o.order_date,'d') = 5 THEN o.quantity ELSE 0 END) AS Thursday,
    SUM(CASE WHEN to_char(o.order_date,'d') = 6 THEN o.quantity ELSE 0 END) AS Friday,
    SUM(CASE WHEN to_char(o.order_date,'d') = 7 THEN o.quantity ELSE 0 END) AS Saturday,
    SUM(CASE WHEN to_char(o.order_date,'d') = 1 THEN o.quantity ELSE 0 END) AS Sunday
FROM Items i
LEFT JOIN Orders o ON i.item_id = o.item_id
GROUP BY i.item_category
ORDER BY i.item_category;


