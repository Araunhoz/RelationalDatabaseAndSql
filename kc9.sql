-- TABLE DEFINITIONS & DATA

CREATE TABLE kc9.customers (
  customer_id SERIAL PRIMARY KEY,
  customer_name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(20)
);

CREATE TABLE kc9.products (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(255),
  price DECIMAL(10, 2)
);

CREATE TABLE kc9.orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers (customer_id),
  product_id INT REFERENCES products (product_id),
  order_date DATE
);

INSERT INTO kc9.customers (customer_name, email, phone_number)
VALUES
  ('John Doe', 'john@example.com', '1234567890'),
  ('Jane Smith', 'jane@example.com', '9876543210'),
  ('Alice Johnson', 'alice@example.com', '5555555555'),
  ('Bob Williams', 'bob@example.com', '1111111111'),
  ('Eve Brown', 'eve@example.com', '9999999999');

INSERT INTO kc9.products (product_name, price)
VALUES
  ('Product A', 10.99),
  ('Product B', 19.99),
  ('Product C', 7.50),
  ('Product D', 15.00),
  ('Product E', 5.99);

INSERT INTO kc9.products (product_name, price)
VALUES
  ('Product D', 11.99),
  ('Product E', 29.99);
 
INSERT INTO kc9.orders (customer_id, product_id, order_date)
VALUES
  (1, 3, '2023-07-01'),
  (2, 1, '2023-07-02'),
  (3, 4, '2023-07-03'),
  (4, 2, '2023-07-04'),
  (5, 5, '2023-07-05');

INSERT INTO kc9.orders (customer_id, product_id, order_date)
VALUES
  (1, 3, '2023-07-01'),
  (2, 2, '2023-07-01'),
  (3, 1, '2023-07-01');

-- Q6: Print name of customers who placed alteast one order

SELECT DISTINCT customer_name
FROM kc9.customers
WHERE customer_id IN (SELECT customer_id FROM kc9.orders);

-- Q7: Print names of products that were ordered on 2023-07-01

SELECT product_name
FROM kc9.products
WHERE product_id IN (SELECT product_id FROM kc9.orders WHERE order_date = '2023-07-01');


-- Q8: Print names of customers who have placed and order on or after 2023-07-01

SELECT customer_name
FROM kc9.customers
WHERE customer_id IN (SELECT customer_id FROM kc9.orders WHERE order_date >= '2023-07-01');

-- Q9: Print name of product with highest price

SELECT product_name
FROM kc9.products
WHERE price >= (SELECT price FROM kc9.products ORDER BY price DESC LIMIT 1);
 
-- Q10: Print name of customers who placed more than two orders

SELECT customer_name
FROM kc9.customers
JOIN (
    SELECT customer_id, COUNT(*) AS num_orders
    FROM kc9.orders
    GROUP BY customer_id
    HAVING COUNT(*) > 2
) AS order_counts ON customers.customer_id = order_counts.customer_id;

-- Q11: Print name of customers who placed higher than average number of orders

SELECT c.customer_name
FROM kc9.customers c
JOIN (
    SELECT customer_id, COUNT(*) AS num_orders
    FROM kc9.orders
    GROUP BY customer_id
) o ON c.customer_id = o.customer_id
WHERE o.num_orders > (SELECT AVG(num_orders) FROM ( SELECT COUNT(*) AS num_orders FROM kc9.orders GROUP BY customer_id) AS avg_orders);

