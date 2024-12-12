/*As a Database Architect design a database for Restaurant with at-least 3 Entities and insert atleast 3 rows in each table.

Using the template.

-- ===========
-- 1. Entities(3pts)
-- ===========

-- client
-- dish
-- checktable
-- ...

-- ============
-- 2. Relations(3pts)
-- ============

-- Entity 1 [relation] Entity 2
-- M client x N dish
-- 1 client x 1 checktable

-- ==========
-- 3. Columns(3pts)
-- ==========

-- Entity client: name, id, phone
-- Entity dish: name, id, price
-- Entity checktable: quantity
-- ...

-- =====================================
-- 4. Columns with Relations/Foriegn Key(3pts)
-- =====================================
-- Entity check: idclient(FK) and iddish(FK)
-- ...

-- --------------------------------
-- EXTRA TABLE(if required)
-- --------------------------------
-- Table Name: COLUMN 1, COLUMN 2, COLUMN 3, ...

-- =====================
-- Defining Table in SQL(3pts)
-- =====================
-- Entity 1
CREATE TABLE Enitity1 (
);

-- Entity 2
CREATE TABLE Enitity2 (
);

-- Entity 3...
*/
CREATE TABLE client (
	name VARCHAR(400),
	id INT PRIMARY KEY, 
	phone VARCHAR(400)
);

SELECT * FROM client;

CREATE TABLE dish (
	name VARCHAR(400),
	id INT Primary Key,
	price FLOAT	
);

CREATE TABLE checktable (
	idclient INT,
	iddish INT,
	quantity INT,
	FOREIGN KEY (idclient) REFERENCES client(id),
	FOREIGN KEY (iddish) REFERENCES dish(id)
);


/*
-- ==========================
-- Inserting Date Into Tables(3pts)
-- ==========================

-- Insert into Entity 1
INSERT INTO Enitity1 (COLUMN_1, COLUMN_2)
VALUES
  ('', ''),
  ('', '');
  
-- Insert into Entity 2
INSERT INTO Enitity2 (COLUMN_1, COLUMN_2)
VALUES
  ('', ''),
  ('', '');

-- Insert into Entity 3...
INSERT INTO Enitity3 (COLUMN_1, COLUMN_2)
VALUES
  ('', ''),
  ('', ''); */
  
INSERT INTO client (name, id, phone)
VALUES('Ana ',1,  '9999999'),
('Arnold ',2,  '888888'),
('Vitoria', 3, '66666');
  
INSERT INTO dish (name, id, price)
VALUES('Fish Boiled',3,  9.99),
('Meat Toasted',2,  6.50),
('Chicken Fries', 1, 100);  


INSERT INTO checktable (idclient, iddish, quantity)
VALUES(3, 3, 2),
(2, 1, 5),
(1, 2, 12);

SELECT * FROM client;
SELECT * FROM dish;
SELECT * FROM checktable;
