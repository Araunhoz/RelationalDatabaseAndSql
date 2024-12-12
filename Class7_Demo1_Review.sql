-- Table definition
CREATE TABLE class7_review.employees (
  emp_id SERIAL PRIMARY KEY,
  emp_name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL
);

-- Data insertion
INSERT INTO class7_review.employees (emp_name, department, salary)
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
  
  /*
  



Display the employees' names along with their department names, ordered by department name and employee name.

Retrieve the department with the highest total salary expenditure.

Get the names of employees who work in the "HR" department and earn more than 45,000, ordered alphabetically.

Find the department that has the highest number of employees.

Retrieve the names of employees whose names start with the letter 'J' and are in the "Finance" department.

Calculate the average salary of employees and display it with a label "Average Salary".

Display the top 5 highest salaries from the "IT" department.
  
  */
-- 1) Retrieve all columns for all employees from the "employees" table.

SELECT *From employees;

-- 2) Get the names and salaries of employees who work in the "IT" department.

SELECT emp_name, salary FROM class7_review.employees
WHERE department = 'IT'


-- 3) Count the total number of employees in the "Finance" department.

SELECT COUNT(emp_name) AS Total_Number_Employees FROM class7_review.employees
WHERE department = 'Finance'

-- 4) Display the names and salaries of the top 3 earning employees.

SELECT emp_name, salary FROM class7_review.employees
ORDER BY (Salary)
DESC
LIMIT 3

-- 5) Retrieve the department names along with the total number of employees in each department.

SELECT department, COUNT(*) FROM class7_review.employees
GROUP BY department

-- 6) Find the average salary of employees in the "IT" department.

SELECT AVG(salary) FROM class7_review.employees
WHERE department = 'IT'

-- 7) Get the names and salaries of employees who earn more than the average salary.

SELECT emp_name, salary FROM class7_review.employees
WHERE salary > (SELECT AVG(Salary) FROM class7_review.employees)

-- 8) Calculate the total salary expenditure for each department and display only those departments
--where the total salary is above 150,000.

SELECT department, SUM(salary) FROM class7_review.employees
GROUP BY department
HAVING SUM(salary) > 150000
