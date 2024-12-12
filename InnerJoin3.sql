-- DEFINING DATA MODELS
CREATE TABLE ij3.customers_v2 (
	id      SERIAL PRIMARY KEY,
	name    VARCHAR(30) NOT NULL,
	age     INT NOT NULL,
	address VARCHAR(50) NOT NULL
);

CREATE TABLE ij3.products_v2(
	id       SERIAL PRIMARY KEY,
	name     VARCHAR(50) NOT NULL,
	price    FLOAT NOT NULL,
	quantity INT NOT NULL
);

CREATE TABLE ij3.orders_v2 (
	id          SERIAL PRIMARY KEY,
	date        DATE NOT NULL,
	delivered   BOOL NOT NULL,
	customer_id INT REFERENCES ij3.customers_v2(id),
	product_id  INT REFERENCES ij3.products_v2(id)
);

-- DATA INSERTIONS
INSERT INTO ij3.products_v2 (name, price, quantity)
VALUES
('p1', 10.34, 10),
('p2', 50.21, 7),
('p3', 19.99, 35),
('p4', 21.99, 21),
('p5', 99.99, 5);

INSERT INTO ij3.orders_v2 (date, delivered, customer_id, product_id)
VALUES
('2023-06-01', FALSE, 1, 1),
('2023-02-01', TRUE,  3, 1),
('2023-06-01', FALSE, 5, 2),
('2023-06-01', FALSE, 1, 2),
('2023-03-01', TRUE,  1, 3),
('2023-07-01', TRUE,  3, 3),
('2023-06-01', FALSE, 1, 4),
('2023-06-01', FALSE, 3, 4),
('2023-02-01', TRUE,  5, 5),
('2023-06-01', FALSE, 6, 5),
('2023-06-01', FALSE, 7, 3),
('2023-06-01', FALSE, 7, 2),
('2023-01-01', TRUE,  4, 3);

INSERT INTO ij3.customers_v2 (name, age, address)
VALUES
('c1', 20, 'Delta'),
('c2', 25, 'Vancouver'),
('c3', 31, 'Montreal'),
('c4', 20, 'Vancouver'),
('c5', 32, 'Delta'),
('c6', 19, 'Vancouver'),
('c7', 50, 'Surrey');

-- Questions
-- ques: print all the products, order_v2, customers_2
SELECT * FROM ij3.products_v2;
SELECT * FROM ij3.orders_v2;
SELECT * FROM ij3.customers_v2;

-- ques: print all the orders with customers name
SELECT o.id, o.date, o.delivered, o.customer_id, c.name, o.product_id
FROM ij3.orders_v2 as o
INNER JOIN ij3.customers_v2 as c
ON o.customer_id = c.id;

-- ques: print all the orders with products name
SELECT o.id, o.date, o.delivered, o.customer_id, o.product_id, p.name
FROM ij3.orders_v2 as o
INNER JOIN ij3.products_v2 as p
ON o.product_id = p.id;

-- ques: print all the orders with customers & products name
SELECT o.id, o.date, o.delivered, o.customer_id, c.name, o.product_id, p.name
FROM ij3.orders_v2 as o
INNER JOIN ij3.customers_v2 as c ON o.customer_id = c.id
INNER JOIN ij3.products_v2 as p ON o.product_id = p.id;


--WHAT IS THE ADDRESS AND PRODUCTS NAME FROM ORDER 4,5,6



