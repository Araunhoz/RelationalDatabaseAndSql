CREATE TABLE ij.customer(
   Customer_ID VARCHAR(100) PRIMARY KEY,
   Name_Customer VARCHAR(80),
   EMAIL VARCHAR(80)
)


CREATE TABLE ij.order(
   Order_ID VARCHAR(100) PRIMARY KEY,
   Customer_ID VARCHAR(80),
   Amount FLOAT,
   Order_Date TIMESTAMP	
)

INSERT INTO ij.customer (customer_id, name_customer, email)
VALUES ('1', 'John Smith', 'john@example.com'), ('2', 'Alice Lee', 'alice@example.com'), ('3', 'Bob Johnson', 'bob@example.com')

INSERT INTO ij.order (order_id, customer_id, amount, order_date)
VALUES('101', '2', 150.50, '07-01-2023'), ('102', '1', 75.20, '07-02-2023'), ('103', '3', 220, '07-03-2023'), ('104', '2', 120, '07-04-2023')

SELECT name_customer FROM ij.customer
INNER JOIN ij.order
ON ij.order.customer_id = ij.order.customer_id


SELECT * FROM ij.customer 

SELECT * FROM ij.customer
LEFT JOIN ij.order
ON ij.order.customer_id = ij.customer.customer_id

SELECT * FROM ij.customer
FROM ij.order
FULL JOIN ij.order.customer_id = ij.customer.customer_id
