-- Customer -

CREATE TABLE sqlpa.Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(100),
  City VARCHAR(100),
  Country VARCHAR(100)
);

-- Orders

CREATE TABLE sqlpa.Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT REFERENCES Customers(CustomerID),
  Product VARCHAR(100),
  Quantity INT,
  Price DECIMAL(10, 2)
);


-- INSERT - the data

INSERT INTO sqlpa.Customers(CustomerID, CustomerName, City, Country)
VALUES
  (1, 'John Smith', 'New York', 'USA'),
  (2, 'Jane Doe', 'London', 'UK'),
  (3, 'Peter Parker', 'Tokyo', 'Japan'),
  (4, 'Maria Garcia', 'Madrid', 'Spain');

INSERT INTO sqlpa.Customers(CustomerID, CustomerName, City, Country)
VALUES (5, 'Amir', 'Vancouver', 'Canada');          


INSERT INTO sqlpa.Orders(OrderID, CustomerID, Product, Quantity, Price)
VALUES
  (1, 1, 'Phone', 2, 500),
  (2, 2, 'Laptop', 1, 1000),
  (3, 1, 'Headphones', 3, 50),
  (4, 3, 'Shirt', 2, 30),
  (5, 2, 'Jeans', 1, 50),
  (6, 4, 'Watch', 1, 200),
  (7, 1, 'Sunglasses', 2, 80),
  (8, 4, 'Camera', 1, 800),
  (9, 2, 'Shoes', 2, 100),
  (10, 4, 'Backpack', 1, 70);
  
  
--1) Retrieve the customer names along with the total number of orders for each customer.

SELECT CustomerName, COUNT(OrderID) AS totalorders
FROM sqlpa.Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY CustomerName;

--2) Display the customer names, order quantities, and total order amounts (quantity * price) for all orders.

SELECT CustomerName, Quantity, Quantity * Price AS totalamount
FROM sqlpa.Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--3) Find the customer names and their respective countries for customers who have placed orders.

SELECT DISTINCT CustomerName, Country
FROM sqlpa.Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--4) List all customers and their total order amounts. Include customers who have not placed any orders as well, showing their total order amount as 0.

SELECT CustomerName, COALESCE(SUM(Quantity * Price), 0) AS totalorderamount
FROM sqlpa.Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY CustomerName;

--5) Find the customer names and the number of orders they have placed, including customers who have not placed any orders.

FROM sqlpa.Customers x
LEFT JOIN sqlpa.orders y ON x.CustomerID = y.CustomerID
GROUP BY x.CustomerID, x.CustomerName;

--6) Retrieve the customer names and the total quantity of products they have ordered, sorted in descending order of the total quantity.

--7) Display the customer names, product names, and total order amounts (quantity * price) for customers who have ordered phones.

--8) List the customer names and the average price of the products they have ordered.

--9) Find the customer names and the maximum quantity of products they have ordered.

--10) Retrieve the customer names and the total order amounts (quantity * price) for customers who have ordered more than three products.

FROM sqlpa.orders x
JOIN assignment7.customers y ON x.CustomerID = y.CustomerID
GROUP BY y.CustomerID, y.CustomerName
HAVING COUNT(x.OrderID) > 3;