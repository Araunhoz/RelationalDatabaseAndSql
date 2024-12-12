CREATE TABLE study.employees(
	id INT,
	name VARCHAR(500),
	age INT,
	department VARCHAR(300)	
);

INSERT INTO study.employees ( id, name, age, department)
VALUES (1, 'Paulo Henrique', 30, 'IT'),
(2, 'Paulo Henrique', 30, 'IT'),
(3, 'Kariny Marques', 30, 'IT'),
(4, 'Hevellyn', 25, 'IT');

SELECT * FROM study.employees;

UPDATE study.employees
SET age = 31
WHERE age = 30;

DROP TABLE study.employees;

DROP TABLE study.departments;

ALTER TABLE study.employees
DROP department;

ALTER TABLE study.employees
ADD COLUMN salary DECIMAL(10,2);

ALTER TABLE study.employees
ADD CONSTRAINT pk_employees PRIMARY KEY (id);

CREATE TABLE study.departments(
	deptid INT,
	deptname VARCHAR(400),
	FOREIGN KEY (deptid) REFERENCES study.employees(id)
);

INSERT INTO study.departments (deptid, deptname)
VALUES(1, 'IT'),
(2, 'Sales'),
(3, 'IT'),
(4,'HR');

SELECT name, age, department
FROM study.employees c
INNER JOIN study.departments o ON c.id = o.deptid;

SELECT * FROM study.employees
WHERE age < 30

SELECT * FROM study.departments 
WHERE deptname = 'Sales';)



SELECT * FROM study.departments 
WHERE deptname = 'Sales';


SELECT name
FROM study.employees c
INNER JOIN study.departments o ON c.id = o.deptid
WHERE age = 30 AND deptname = 'IT';

SELECT DISTINCT name
FROM study.employees
WHERE name IN (SELECT name
FROM study.employees c
INNER JOIN study.departments o ON c.id = o.deptid
WHERE age = 30 AND deptname = 'IT') AND name LIKE 'P%'; --

SELECT name
FROM study.employees
WHERE name LIKE 'P%'

