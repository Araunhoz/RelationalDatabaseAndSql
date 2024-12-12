CREATE TABLE pa10.Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    CategoryID INT,
    Quantity INT
);

CREATE TABLE pa10.Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE pa10.Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE pa10.Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES pa10.Customers(CustomerID)
);

INSERT INTO pa10.Products (ProductID, Name, Price, CategoryID, Quantity)
VALUES
    (1, 'Product A', 20.50, 1, 50),
    (2, 'Product B', 30.25, 2, 150),
    (3, 'Product C', 25.75, 1, 200),
    (4, 'Product D', 11.11, 3, 300);


INSERT INTO pa10.Categories (CategoryID, Name)
VALUES
    (1, 'Category 1'),
    (2, 'Category 2'),
    (3, 'Category 3');


INSERT INTO pa10.Customers (CustomerID, Name)
VALUES
    (1, 'Geroge Maison'),
    (2, 'Alzimira Marques');


INSERT INTO pa10.Orders (OrderID, CustomerID, OrderDate)
VALUES
    (1, 1, '2023-03-19'),
    (2, 2, '2022-04-01');


-- 1) Create a View: Create a view named "ProductCatalog" that includes the ProductID, Name, and Price columns from the "Products" table.
CREATE VIEW pa10.ProductCatalog AS
SELECT ProductID, Name, Price
FROM pa10.Products;


-- 2) Update a View: Update the "ProductCatalog" view to include an additional column "Category" from the "Categories" table.
--Assume the "Categories" table has a "CategoryID" and "Name" columns.

CREATE VIEW ProductCatalogWithCategory AS
SELECT pc.ProductID, pc.Name, pc.Price, c.Name AS Category
FROM pa10.Products pc
JOIN pa10.Categories c ON pc.CategoryID = c.CategoryID;

-- 3) Delete a View: Delete the "ProductCatalog" view.

DROP VIEW IF EXISTS ProductCatalog;

-- 4) Complex View: Create a view named "HighRevenueProducts" that includes the ProductID, Name, Price, and Quantity columns from the "Products" table and the "Revenue" column,
--which is the result of multiplying Price and Quantity.

CREATE VIEW HighRevenueProducts AS
SELECT ProductID, Name, Price, Quantity, (Price * Quantity) AS Revenue
FROM pa10.Products;


--5) Using Joins in a View: Create a view named "CustomerOrders" that combines data from the "Customers" and "Orders" tables.
--Include the CustomerID, Name, OrderID, and OrderDate columns.

CREATE VIEW CustomerOrders AS
SELECT c.CustomerID, c.Name, o.OrderID, o.OrderDate
FROM pa10.Customers c
JOIN pa10.Orders o ON c.CustomerID = o.CustomerID;
