/*
As a Database Architect design a database for a Movie Theatre with at-least 3 Entities and insert atleast 3 rows in each table.

Using the template.

-- ===========
-- 1. Entities(3pts)
-- ===========

-- client
-- movie
-- check
-- ...

-- ============
-- 2. Relations(3pts)
-- ============

-- Entity 1 [relation] Entity 2
-- M client x N movie
-- 1 client x 1 check

-- ==========
-- 3. Columns(3pts)
-- ==========

-- Entity client: name, id, phone
-- Entity movie: id, name, date, price
-- Entity checkmovie: quantity
-- ...

-- =====================================
-- 4. Columns with Relations/Foriegn Key(3pts)
-- =====================================

-- Entity 1: COLUMN 1, COLUMN 2, COLUMN 3, ..., (FK)
-- Entity 2: COLUMN 1, COLUMN 2, COLUMN 3, ..., (FK)
-- Entity 3: COLUMN 1, COLUMN 2, COLUMN 3, ..., (FK)
-- ...
   Entity Check: idclient, idmovie 
   
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

CREATE TABLE movie (
	id INT PRIMARY KEY,
	name VARCHAR,
	date DATE,
	price FLOAT    
);

CREATE TABLE checkmovie (
	idclient INT,
	idmovie INT,
	quantity INT,
	FOREIGN KEY (idclient) REFERENCES client(id),
	FOREIGN KEY (idmovie) REFERENCES movie(id)
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
  ('', '');

*/

INSERT INTO client (name, id, phone)
VALUES('Ana ',1,  '9999999'),
('Arnold ',2,  '888888'),
('Vitoria', 3, '66666');

INSERT INTO movie (id, name, date, price)
VALUES(1, 'Godzilla', '2024-01-01', 60.00),
(2, 'King Kong', '2024-02-02', 10.00),
(3, 'Godzilla x King Kong', '2024-03-03', 100.00);

INSERT INTO checkmovie (idclient, idmovie, quantity)
VALUES(3, 3, 23),
(2,2,1),
(1,1,10);

SELECT * FROM client;
SELECT * FROM movie;
SELECT * FROM checkmovie;
