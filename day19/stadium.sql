CREATE TABLE Stadium (
    id INT,
    visit_date DATE,
    people INT,
    PRIMARY KEY (visit_date)
);

INSERT INTO Stadium VALUES (1, DATE'2017-01-01', 10);

INSERT INTO Stadium
VALUES(2, DATE'2017-01-02', 109);

INSERT INTO Stadium
VALUES(3, DATE'2017-01-03', 150);

INSERT INTO Stadium
VALUES(4, DATE'2017-01-04', 99);

INSERT INTO Stadium
VALUES(5, DATE'2017-01-05', 145);

INSERT INTO Stadium
VALUES(6, DATE'2017-01-06', 1455);

INSERT INTO Stadium
VALUES(7, DATE'2017-01-07', 199);

INSERT INTO Stadium
VALUES(8, DATE'2017-01-09', 188);

SELECT DISTINCT one.*
FROM stadium one, stadium two, stadium three
WHERE one.people >= 100 AND two.people >= 100 AND three.people >= 100
AND ((one.id = two.id -1 AND one.id = three.id - 2)
     OR (one.id = two.id + 1 AND one.id = three.id -1)
     OR (one.id = two.id + 2 AND one.id = three.id +1 ))
ORDER BY one.id;
