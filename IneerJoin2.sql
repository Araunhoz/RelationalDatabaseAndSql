--------
-- JOINS
--------
-- Create a sample 'employees' table
CREATE TABLE ij2.employees (
	id   INT PRIMARY KEY,
	name VARCHAR(30),
	age  INT,
	department_id INT REFERENCES ij2.departments(id)
);
--DROP TABLE ij2.employees;
SELECT * FROM employees;

-- Create a sample 'departments' table
CREATE TABLE ij2.departments (
	id INT PRIMARY KEY,
	name VARCHAR(30)
);
--DROP TABLE ij2.departments;
SELECT * FROM ij2.departments;

-- Insert sample data into 'employees' and 'departments' tables
INSERT INTO ij2.employees(id, name, age, department_id) VALUES(1, 'John', 31, 101);
INSERT INTO ij2.employees(id, name, age, department_id) VALUES(2, 'Jake', 25, 102);
INSERT INTO ij2.employees(id, name, age, department_id) VALUES(3, 'Mike', 29, 103);
INSERT INTO ij2.employees(id, name, age, department_id) VALUES(4, 'Bob', 31, 102);
INSERT INTO ij2.employees(id, name, age, department_id) VALUES(5, 'Tina', 37, 104);
INSERT INTO ij2.employees(id, name, age, department_id) VALUES(6, 'Logan', 20, NULL);

INSERT INTO ij2.departments(id, name) VALUES(101, 'HR');
INSERT INTO ij2.departments(id, name) VALUES(102, 'SALES');
INSERT INTO ij2.departments(id, name) VALUES(103, 'MARKETING');
INSERT INTO ij2.departments(id, name) VALUES(104, 'IT');
INSERT INTO ij2.departments(id, name) VALUES(105, 'FINANCE');
INSERT INTO ij2.departments(id, name) VALUES(106, 'DEV.');

--Performance an inner to retrieve employee information along with department names


SELECT * FROM ij2.employees
INNER JOIN ij2.departments
ON ij2.employees.department_id = ij2.departments.id

-- DO RIGHT JOIN AND FULL JOIN AND SEE THE DIFERENCES
-- WHAT SHOULD I DO TO MAKE THE FINAL VIEW MORE CLEAR

SELECT * FROM ij2.employees
RIGHT JOIN ij2.departments
ON ij2.employees.department_id = ij2.departments.id

SELECT ij2.departments.id AS department_id, ij2.departments.name As department_name , age FROM ij2.employees
FULL JOIN ij2.departments
ON ij2.employees.department_id = ij2.departments.id


--SHOW ME EMPLOYEE NAME AND AGE FOR ALL EMPLOYEE IN HR OR SALE

SELECT ij2.employees.name As employees_name , age FROM ij2.employees
INNER JOIN ij2.departments
ON ij2.employees.department_id = ij2.departments.id
WHERE (ij2.departments.name IN ('HR, 'SALES'))
