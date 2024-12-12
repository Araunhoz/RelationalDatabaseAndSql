CREATE TABLE kc6.Sales (
    SaleID SERIAL PRIMARY KEY,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Price NUMERIC,
    Quantity INT,
    SaleDate DATE
);

INSERT INTO kc6.Sales (Product, Category, Price, Quantity, SaleDate)
VALUES
    ('Laptop', 'Electronics', 1200.00, 3, '2023-07-10'),
    ('Smartphone', 'Electronics', 800.00, 5, '2023-07-11'),
    ('Shirt', 'Fashion', 30.00, 10, '2023-07-10'),
    ('Dress', 'Fashion', 50.00, 7, '2023-07-12'),
    ('Headphones', 'Electronics', 50.00, 8, '2023-07-13'),
    ('Watch', 'Fashion', 100.00, 4, '2023-07-10'),
    ('Tablet', 'Electronics', 300.00, 2, '2023-07-12'),
    ('Shoes', 'Fashion', 70.00, 6, '2023-07-11');
	

--Find the total revenue (total price * quantity) for each product, and display only those products where the revenue
--is greater than 500.

SELECT (Price* Quantity) AS Revenue  FROM kc6.Sales
WHERE (Price * Quantity) > 500;

--Calculate the total quantity sold for each category, but only include categories where the total quantity sold is greater than 10.
SELECT Category, SUM(Quantity) AS Quantity_Sold FROM kc6.Sales
WHERE Quantity >= 10
GROUP By Category

--List the top 3 most expensive products (highest price) in each category.

SELECT Category, PRICE FROM kc6.Sales 
ORDER By PRICE
DESC
LIMIT 3

--Retrieve the product with the maximum price and the product with the minimum price in the "Electronics" category.


SELECT	
(SELECT Product FROM kc6.Sales WHERE Price = MAX(o.Price) AND Category = 'Electronics') AS X,
(SELECT Product FROM kc6.Sales WHERE Price = MIN(o.Price) AND Category = 'Electronics') AS Y
FROM kc6.Sales o
WHERE Category = 'Electronics'

--Find the products with the highest total revenue (total price * quantity) and the products with the lowest total 
--revenue across all categories.