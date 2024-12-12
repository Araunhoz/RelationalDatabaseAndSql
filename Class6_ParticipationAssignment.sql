CREATE TABLE pa6.Sales (
    SaleID SERIAL PRIMARY KEY,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Price NUMERIC,
    Quantity INT,
    SaleDate DATE
);

INSERT INTO pa6.Sales (Product, Category, Price, Quantity, SaleDate)
VALUES
    ('Laptop', 'Electronics', 1200.00, 3, '2023-07-10'),
    ('Smartphone', 'Electronics', 800.00, 5, '2023-07-11'),
    ('Shirt', 'Fashion', 30.00, 10, '2023-07-10'),
    ('Dress', 'Fashion', 50.00, 7, '2023-07-12'),
    ('Headphones', 'Electronics', 50.00, 8, '2023-07-13'),
    ('Watch', 'Fashion', 100.00, 4, '2023-07-10'),
    ('Tablet', 'Electronics', 300.00, 2, '2023-07-12'),
    ('Shoes', 'Fashion', 70.00, 6, '2023-07-11');

-- 1) Find the total number of sales in the "Sales" table.

SELECT COUNT(*) AS totalsales
FROM pa6.Sales;

-- 2) Retrieve the products with a price greater than 100.

SELECT Product
FROM pa6.Sales
WHERE Price > 100;

-- 3) Calculate the average price of products in the "Electronics" category.

SELECT AVG(Price) AS averageprice
FROM pa6.Sales
WHERE Category = 'Electronics';

-- 4) List the products and their quantities sold on or after '2023-07-11', sorted by sale date in ascending order.

SELECT Product, Quantity
FROM pa6.Sales
WHERE SaleDate >= '2023-07-11'
ORDER BY SaleDate ASC;

-- 5) Count the number of sales in each category.

SELECT Category, COUNT(*) AS salescount
FROM pa6.Sales
GROUP BY Category;
