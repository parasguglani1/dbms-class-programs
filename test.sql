CREATE TABLE Customer_details (
  CUST_CODE varchar(10),
  CUST_NAME varchar(50),
  CUST_CITY varchar(50),
  WORKING_AREA varchar(50),
  CUST_COUNTRY varchar(50),
  GRADE int,
  OPENING_AMT decimal(10,2),
  RECEIVE_AMT decimal(10,2),
  PAYMENT_AMT decimal(10,2),
  OUTSTANDING_AMT decimal(10,2),
  PHONE_NO varchar(20),
  AGENT_CODE varchar(10)
);

desc Customer_details;

INSERT INTO Customer_details
VALUES
  ('C00013', 'Holmes', 'London', 'London', 'UK', 2, 6000.00, 5000.00, 7000.00, 4000.00, 'BBBBBBB', 'A003');
INSERT INTO Customer_details
VALUES
  ('C00001', 'Micheal', 'New York', 'New York', 'USA', 2, 3000.00, 5000.00, 2000.00, 6000.00, 'CCCCCCC', 'A008');
  INSERT INTO Customer_details
VALUES
  ('C00020', 'Albert', 'New York', 'New York', 'USA', 3, 5000.00, 7000.00, 6000.00, 6000.00, 'BBBBSBB', 'A008');

INSERT INTO Customer_details
VALUES
  ('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', 2, 5000.00, 7000.00, 4000.00, 8000.00, 'AVAVAVA', 'A011');


truncate table Customer_details;
ALTER TABLE Customer_details
MODIFY PHONE_NO number;


desc Customer_details;


INSERT INTO Customer_details
VALUES
  ('C00013', 'Holmes', 'London', 'London', 'UK', 2, 6000.00, 5000.00, 7000.00, 4000.00, 'BBBBBBB', 'A003');
INSERT INTO Customer_details
VALUES
  ('C00001', 'Micheal', 'New York', 'New York', 'USA', 2, 3000.00, 5000.00, 2000.00, 6000.00, 'CCCCCCC', 'A008');
  INSERT INTO Customer_details
VALUES
  ('C00020', 'Albert', 'New York', 'New York', 'USA', 3, 5000.00, 7000.00, 6000.00, 6000.00, 'BBBBSBB', 'A008');

INSERT INTO Customer_details
VALUES
  ('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', 2, 5000.00, 7000.00, 4000.00, 8000.00, 'AVAVAVA', 'A011');


UPDATE Customer_details
SET PHONE_NO = TO_NUMBER(PHONE_NO)
WHERE PHONE_NO IS NOT NULL;

ALTER TABLE Customer_details
ADD GENDER char(1);

desc Customer_details;


ALTER TABLE Customer_details
ADD ORDER_TIME timestamp;


desc Customer_details;

UPDATE Customer_details
SET OUTSTANDING_AMT = 0
WHERE CUST_COUNTRY = 'India';

SELECT *
FROM Customer_details
WHERE CUST_COUNTRY = 'UK' AND OUTSTANDING_AMT > 7000;


ALTER TABLE Customer_details
ADD FEEDBACK CLOB;


desc Customer_details;

DELETE FROM Customer_details
WHERE GRADE = 2;
