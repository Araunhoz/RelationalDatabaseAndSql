/* PART A: Write Queries to Define Data Models

1. Create the Employees table with the following fields:

employee_id (primary key)
name (text)
age (integer)
gender (text)
address (text)
department_id (foreign key)

*/

CREATE TABLE Employess(
	employeeid INT PRIMARY KEY,
	employeename TEXT,
	age INT, 
	gender TEXT,
	address TEXT,
	departmentid INT, 
	FOREIGN KEY (departmentid) REFERENCES Departments(departmentid)
);


/* 

2. Create the Departments table with the following fields:

department_id (primary key)
name (text)
location (text)

*/

CREATE TABLE Departments(
	departmentid INT PRIMARY KEY,
	departmentname TEXT,
	location TEXT	
);

SELECT * FROM Departments; 

-- 3) Insert 5 rows into the Employees table:

INSERT INTO Departments (departmentid, departmentname, location)
VALUES(1, 'IT', 'New York'),
(2,'Sales', 'Vancouver' ), 
(3, 'Finance', 'Manaus'),
(4, 'Security', 'Paris'),
(5, 'Sales', 'Manitoba');


-- 4) Insert 5 rows into the Departments table:

INSERT INTO Employess(employeeid, employeename, age, gender, address, departmentid)
VALUES(1, 'Ricardo Lima', 45, 'Male', '6462 Fraser Street', 5), 
(2, 'Joana Dark', 19, 'Female', '5253 King Eduward', 4),
(3, 'Pitolomeu Kuan', 90, 'Male', '1212 Prince Stuart', 3),
(4, 'Geovana Amorim', 22, 'Female', '8989 comlombus', 2),
(5, 'Roberto Roberto Robertoson', 25, 'Male', '2325 OaK', 1);
	
SELECT * FROM Employess;


/* PART B: Write Queries to Get Following Information:

1) Retrieve the names and ages of all employees */

SELECT employeename, age FROM employess;

-- 2) Retrieve the names and locations of all departments

SELECT departmentname, location FROM Departments;

--3) Retrieve the names and addresses of male employees

SELECT employeename, address FROM employess WHERE gender = 'Male';

-- 4) Retrieve the names and locations of departments with the location 'New York'

SELECT departmentname, location FROM Departments WHERE location = 'New York';

-- 5) Retrieve the count of employees by department

SELECT Departments.departmentname, COUNT(Employess.employeeid) 
FROM Employess 
JOIN Departments 
ON Employess.departmentid = Departments.departmentid
GROUP BY Departments.departmentname;

-- 6) Retrieve average age of employees in each department

SELECT Departments.departmentname, ROUND(AVG(Employess.age),2) 
FROM Employess 
JOIN Departments
ON Employess.departmentid = Departments.departmentid
GROUP BY Departments.departmentname;
