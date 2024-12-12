/*PART A: Write Queries to Define Data Models

1. Create the Customers table with the following fields:

customer_id (integer, primary key)
name (varchar(100))
email (varchar(100))
address (varchar(200)) 

*/

CREATE TABLE Customers(
	customerid INT PRIMARY KEY,
	customername VARCHAR(100),
	email VARCHAR(100),
	adress VARCHAR(200)
);

SELECT * FROM Customers;

/*

2) Create the Orders table with the following fields:

order_id (integer, primary key)
customer_id (integer, foreign key referencing customer_id in Customers table)
product_id (integer, foreign key referencing product_id in Products table)
quantity (integer)
order_date (date)

*/

CREATE TABLE Orders(
	orderid INT PRIMARY KEY,
	customerid INT,
	productid INT, 
	quantity INT,
	orderdate DATE,
	FOREIGN KEY (customerid) REFERENCES Customers(customerid),
	FOREIGN KEY (productid) REFERENCES Products(productid)	
);

SELECT * FROM Orders;

/*

3. Create the Products table with the following fields:

product_id (integer, primary key)
name (varchar(100))
price (decimal)

*/

CREATE TABLE Products(
	productid INT PRIMARY KEY,
	Productname VARCHAR(100),
	Price DECIMAL(10,2)
);

SELECT * FROM Products; 

/*

4. Insert 5 rows into the Customers table:

5. Insert 5 rows into the Products table:

6. Insert 5 rows into the Orders table:
*/
INSERT INTO Customers ( customerid, customername, email, adress)
VALUES(1, 'Paulo Henrique', 'aaa@gmail.com', '6462 Fraser Street'),
   (2, 'Joana Sousa', 'sdsdsda@gmail.com', '5253 King Eduward'),
   (3, 'Merlim M', 'xdzxda@gmail.com', '1212 Prince Stuart'),
   (4, 'Geovana Amaral', 'bbbb@gmail.com', '8989 comlombus'),
   (5, 'Emilly Milly', 'zzz@gmail.com', '2325 OaK');
   
INSERT INTO Products(productid, Productname, Price)
VALUES(1, 'banana', 15),
	(2, 'banana2', 20),
	(3, 'limon', 40),
	(4, 'limon2', 50),
	(5, 'avocado', 64);
	
INSERT INTO Orders( orderid, customerid, productid, quantity, orderdate)
VALUES (1, 5, 5, 50, '2024-06-01'),
(2, 4, 4, 90, '2024-06-01'),
(3, 2, 2, 50, '2024-06-01'),
(4, 3, 3, 50, '2024-06-01'),
(5, 1, 1, 50, '2024-06-01');


-- 1) Retrieve the names and email addresses of all customers

SELECT customername, email FROM Customers;

-- 2) Retrieve the names and prices of all products

SELECT productname, price FROM Products;

--3) Retrieve the names of products whose prices are more than 20

SELECT productname FROM Products WHERE price > 20;

