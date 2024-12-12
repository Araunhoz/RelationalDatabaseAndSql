/*Consider the table below */

-- Table definition
CREATE TABLE demo1.employees (
  emp_id SERIAL PRIMARY KEY,
  emp_name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL
);

-- Data insertion
INSERT INTO demo1.employees (emp_name, department, salary)
VALUES
  ('John Doe', 'Finance', 50000),
  ('Jane Smith', 'HR', 45000),
  ('Michael Johnson', 'IT', 60000),
  ('Emily Brown', 'Marketing', 52000),
  ('William Lee', 'Finance', 48000),
  ('Sophia Kim', 'IT', 58000),
  ('James Wilson', 'Marketing', 54000),
  ('Olivia Lee', 'HR', 47000),
  ('Oliver Davis', 'IT', 62000),
  ('Emma Martinez', 'Finance', 51000);
  
  
/* Write SQL query to get the following results:

1) Retrieve all columns for all employees from the "employees" table.

*/

SELECT * FROM demo1.employees;

-- 2) Get the names and salaries of employees who work in the "IT" department.

SELECT emp_name, salary FROM demo1.employees 
WHERE department = 'IT';

--3) Count the total number of employees in the "Finance" department.

SELECT COUNT(*) AS total_employees FROM demo1.employees
WHERE department = 'Finance';

--4) Display the names and salaries of the top 3 earning employees.

SELECT emp_name, salary FROM demo1.employees 
ORDER BY salary DESC 
LIMIT 3;

--5) Retrieve the department names along with the total number of employees in each department.

SELECT department, COUNT(*) AS total_employees FROM demo1.employees
GROUP BY department;

-- 6) Find the average salary of employees in the "IT" department.

SELECT AVG(salary) AS average_salary FROM demo1.employees
WHERE department = 'IT';

-- 7) Get the names and salaries of employees who earn more than the average salary.

SELECT emp_name, salary FROM demo1.employees
WHERE salary > (SELECT AVG(salary) FROM demo1.employees);

-- 8) Calculate the total salary expenditure for each department and display only those departments where the total salary is above 150,000.

SELECT department, SUM(salary) AS total_salary FROM demo1.employees
GROUP BY department
HAVING SUM(salary) > 150000;

-- 9) Display the employees' names along with their department names, ordered by department name and employee name.

SELECT emp_name, department FROM demo1.employees
ORDER BY department, emp_name;

-- 10) Retrieve the department with the highest total salary expenditure.

SELECT department FROM demo1.employees
GROUP BY department
ORDER BY SUM(salary) DESC
LIMIT 1;

-- 11) Get the names of employees who work in the "HR" department and earn more than 45,000, ordered alphabetically.

SELECT emp_name FROM demo1.employees
WHERE department = 'HR' AND salary > 45000
ORDER BY emp_name;

-- 12) Find the department that has the highest number of employees.

SELECT department FROM demo1.employees
GROUP BY department
ORDER BY COUNT(*) DESC
LIMIT 1;

--13) Retrieve the names of employees whose names start with the letter 'J' and are in the "Finance" department.

SELECT emp_name FROM demo1.employees
WHERE emp_name LIKE 'J%' AND department = 'Finance';

--14) Calculate the average salary of employees and display it with a label "Average Salary".

SELECT AVG(salary) AS "Average Salary" FROM demo1.employees;

--15) Display the top 5 highest salaries from the "IT" department.   

SELECT emp_name, salary FROM demo1.employees
WHERE department = 'IT'
ORDER BY salary DESC
LIMIT 5;
