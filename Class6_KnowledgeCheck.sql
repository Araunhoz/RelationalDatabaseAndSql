CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Price NUMERIC,
    Quantity INT,
    SaleDate DATE
);

INSERT INTO Sales(Product, Category, Price, Quantity, SaleDate)
VALUES('Laptop', 'Electronics', 1200.00, 3, '2023-07-10'), ('Smartphone', 'Electronics', 800.00, 5, '2023-07-11'), ('Shirt', 'Fashion', 30.00, 10, '2023-07-10'), ('Dress', 'Fashion', 50.00, 7, '2023-07-12'), ('Headphones', 'Electronics', 50.00, 8, '2023-07-13'), ('Watch', 'Fashion', 100.00, 4, '2023-07-10'), ('Tablet', 'Electronics', 300.00, 2, '2023-07-12'), ('Shoes', 'Fashion', 70.00, 6, '2023-07-11');

SELECT * FROM Sales;

/* 6) Find the total revenue (total price * quantity) for each product, and display only those products where the revenue
is greater than 500. */

SELECT Product, SUM(Price * Quantity) AS revenue
FROM Sales
GROUP BY Product
HAVING SUM(Price * Quantity) > 500;

/* 7) Calculate the total quantity sold for each category, but only include categories where the total quantity sold is greater
than 10. */

SELECT Category, SUM(Quantity) AS totalquantity
FROM Sales
GROUP BY Category
HAVING SUM(Quantity) > 10;

/* 8) List the top 3 most expensive products (highest price) in each category. */

SELECT * FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS x FROM Sales) AS ranked
WHERE x <= 3;

/* 9) Retrieve the product with the maximum price and the product with the minimum price in the "Electronics" category.  */

--Maximum price
SELECT * FROM Sales
WHERE Category = 'Electronics'
ORDER BY Price DESC
LIMIT 1; 

--Minimum price
SELECT * FROM Sales
WHERE Category = 'Electronics'
ORDER BY Price
LIMIT 1; 

/* 10) Find the products with the highest total revenue (total price * quantity) and the products with the lowest total revenue 
across all categories. */

--The highest total revenue
SELECT Product, SUM(Price * Quantity) AS revenue FROM Sales
GROUP BY Product
ORDER BY revenue DESC
LIMIT 1;

-- The lowest total revenue
SELECT Product, SUM(Price * Quantity) AS revenue FROM Sales
GROUP BY Product
ORDER BY revenue
LIMIT 1;
