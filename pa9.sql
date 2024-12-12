-- TABLE DEFINITIONS & DATA

CREATE TABLE pa9.customers (
  customer_id SERIAL PRIMARY KEY,
  customer_name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(20)
);

 

CREATE TABLE pa9.products (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(255),
  price DECIMAL(10, 2)
);

 

CREATE TABLE pa9.orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers (customer_id),
  product_id INT REFERENCES products (product_id),
  order_date DATE
);

INSERT INTO pa9.customers (customer_name, email, phone_number)
VALUES
  ('John Doe', 'john@example.com', '1234567890'),
  ('Jane Smith', 'jane@example.com', '9876543210'),
  ('Alice Johnson', 'alice@example.com', '5555555555'),
  ('Bob Williams', 'bob@example.com', '1111111111'),
  ('Eve Brown', 'eve@example.com', '9999999999');

  

INSERT INTO pa9.products (product_name, price)
VALUES
  ('Product A', 10.99),
  ('Product B', 19.99),
  ('Product C', 7.50),
  ('Product D', 15.00),
  ('Product E', 5.99);

  

INSERT INTO pa9.products (product_name, price)
VALUES
  ('Product D', 11.99),
  ('Product E', 29.99);

  

INSERT INTO pa9.orders (customer_id, product_id, order_date)
VALUES
  (1, 3, '2023-07-01'),
  (2, 1, '2023-07-02'),
  (3, 4, '2023-07-03'),
  (4, 2, '2023-07-04'),
  (5, 5, '2023-07-05');

INSERT INTO pa9.orders (customer_id, product_id, order_date)
VALUES
  (1, 3, '2023-07-01'),
  (2, 2, '2023-07-01'),
  (3, 1, '2023-07-01');


-- Q1: Print names of all customers that placed an order on 2023-07-01

SELECT customer_name
FROM pa9.customers
WHERE customer_id IN (SELECT customer_id FROM pa9.orders WHERE order_date = '2023-07-01');

-- Q2: Print product names that have been ordered

SELECT product_name
FROM pa9.products
WHERE product_id IN (SELECT product_id FROM pa9.orders);

-- Q3: Print name of the customer who ordered a product with product id 3

SELECT customer_name
FROM pa9.customers
WHERE customer_id IN (SELECT customer_id FROM pa9.orders WHERE product_id = 3);

-- Q4: Print names of products that have a price higher than the average price of all the products

SELECT product_name
FROM pa9.products
WHERE price > (SELECT AVG(price) FROM pa9.products);

-- Q5: Print names of customers who have placed orders for products with a price higher than 10

SELECT customer_name
FROM pa9.customers
WHERE customer_id IN (SELECT customer_id FROM pa9.orders WHERE product_id IN (SELECT product_id FROM pa9.products WHERE price > 10));


CREATE VIEW Tabajara AS
SELECT customer_name, email
FROM pa9.customers

SELECT * FROM Tabajara

--SELECT DISTINCT