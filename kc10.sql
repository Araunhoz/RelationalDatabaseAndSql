CREATE TABLE kc10.Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    CategoryID INT,
    Quantity INT
);

CREATE TABLE kc10.Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE kc10.Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE kc10.Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES kc10.Customers(CustomerID)
);

INSERT INTO kc10.Products (ProductID, Name, Price, CategoryID, Quantity)
VALUES
    (1, 'Product A', 20.50, 1, 50),
    (2, 'Product B', 30.25, 2, 150),
    (3, 'Product C', 25.75, 1, 200),
    (4, 'Product D', 11.11, 3, 300);


INSERT INTO kc10.Categories (CategoryID, Name)
VALUES
    (1, 'Category 1'),
    (2, 'Category 2'),
    (3, 'Category 3');


INSERT INTO kc10.Customers (CustomerID, Name)
VALUES
    (1, 'Geroge Maison'),
    (2, 'Alzimira Marques');


INSERT INTO kc10.Orders (OrderID, CustomerID, OrderDate)
VALUES
    (1, 1, '2023-03-19'),
    (2, 2, '2022-04-01');


--1) View with Aggregations: Create a view named "CategoryStats" that shows the 
--total number of products, average price, and maximum price for each category.

CREATE VIEW CategoryStats AS
SELECT c.CategoryID, c.Name AS CategoryName,
       COUNT(p.ProductID) AS TotalProducts,
       AVG(p.Price) AS AvgPrice,
       MAX(p.Price) AS MaxPrice
FROM kc10.Categories c
LEFT JOIN kc10.Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.Name;


--2) Using a View with a Subquery: Create a view named "TopSellingCategories" that shows the top 3 
--categories with the highest total quantity sold. Use a subquery in the view definition.

SELECT CategoryID, TotalQuantitySold
FROM (
    SELECT CategoryID, SUM(Quantity) AS TotalQuantitySold
    FROM kc10.Products
    GROUP BY CategoryID
    ORDER BY TotalQuantitySold DESC
    LIMIT 3
) AS TopCategories;


-- 3) View with Conditions: Create a view named "DiscountedProducts" that includes the ProductID, Name, Price, and Category 
--columns from the "Products" table but only for products where the Price is less than 50.

CREATE VIEW DiscountedProducts AS
SELECT ProductID, Name, Price, CategoryID
FROM kc10.Products
WHERE Price < 50;


--4) View with Sorting: Create a view named "LatestOrders" that shows the OrderID, CustomerID, and OrderDate columns from the 
--"Orders" table, sorted in descending order based on the OrderDate.

CREATE VIEW LatestOrders AS
SELECT OrderID, CustomerID, OrderDate
FROM kc10.Orders
ORDER BY OrderDate DESC;

--5) View with Group By and Having: Create a view named "CategorySales" that includes the CategoryID, CategoryName, 
--and total sales (sum of Price * Quantity) for each category.
--Only include categories where the total sales are greater than 1000.

CREATE VIEW CategorySales AS
SELECT p.CategoryID, c.Name AS CategoryName,
       SUM(p.Price * p.Quantity) AS TotalSales
FROM kc10.Products p
JOIN kc10.Categories c ON p.CategoryID = c.CategoryID
GROUP BY p.CategoryID, c.Name
HAVING SUM(p.Price * p.Quantity) > 1000;
