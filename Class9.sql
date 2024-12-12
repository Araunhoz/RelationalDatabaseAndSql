CREATE TABLE jacare.department(
    department_id INTEGER PRIMARY KEY,
    department_name TEXT
);

CREATE TABLE jacare.employee(
    employee_id INTEGER PRIMARY KEY,
    emp_name TEXT,
	department_id INTEGER,
	salary FLOAT
);

INSERT INTO jacare.department (department_id , department_name)
VALUES (1,'Finance'),(2,'HR'),(3,'IT'),(4,'Marketing')

INSERT INTO jacare.employee (employee_id , emp_name, department_id , salary)
VALUES (1,'E1',1,50000),(2,'E2',2,45000),(3,'E3',3,60000),(4,'E4',4,52000),(5,'E5',1,48000),
(6,'E6',3,58000),(7,'E7',4,54000),(8,'E8',2,47000),(9,'E9',3,62000),(10,'E10',1,51000)


-- Write a query to retrieve all employees from the "employees" table who work in the "IT" department.

SELECT emp_name, salary
FROM jacare.employee
WHERE department_id = (SELECT department_id FROM department WHERE department_name = 'IT');

-- Find the names and salaries of employees who earn more than the average salary in their respective departments.

SELECT emp_name, salary
FROM jacare.employee
WHERE (emp_name, salary) IN (
    SELECT emp_name, salary
    FROM (
        SELECT emp_name, salary, department_id,
               AVG(salary) OVER (PARTITION BY department_id) AS avg_salary
        FROM jacare.employee
    ) AS avg_salaries
    WHERE salary > avg_salary
);
-- Calculate the total number of employees for each department.

SELECT department_name, COUNT(employee_id) AS total_employees
FROM department
LEFT JOIN employee ON department.department_id = employee.department_id
GROUP BY department_name;

-- Display the names and salaries of the top 3 earning employees.

SELECT emp_name, salary
FROM employee
ORDER BY salary DESC
LIMIT 3; --not softquerries

-- Retrieve the department names along with the total number of employees in each department.

SELECT department_name, COUNT(employee_id) AS total_employees
FROM department
LEFT JOIN employee ON department.department_id = employee.department_id
GROUP BY department_name;

-- Find the average salary of employees in the "Finance" department.

SELECT AVG(salary) AS average_salary
FROM employee
WHERE department_id = (SELECT department_id FROM department WHERE department_name = 'Finance');

-- Get the names of employees who work in the "HR" department and have a salary greater than the average salary of employees in the "HR" department.

SELECT emp_name
FROM jacare.employee
WHERE department_id = (SELECT department_id FROM jacare.department WHERE department_name = 'HR')
AND salary > (
    SELECT AVG(salary)
    FROM jacare.employee
    WHERE department_id = (SELECT department_id FROM jacare.department WHERE department_name = 'HR')
);

-- Display the department name along with the employee who has the highest salary in each department.
ELECT d.department_name, e.emp_name, e.salary
FROM department d
INNER JOIN employee e ON d.department_id = e.department_id
INNER JOIN (
    SELECT department_id, MAX(salary) AS max_salary
    FROM employee
    GROUP BY department_id
) AS max_salaries ON e.department_id = max_salaries.department_id AND e.salary = max_salaries.max_salary;


/* 

E) 

SELECT department_name, count_per_dep FROM department d  JOIN (
SELECT department_id, COUNT(*) AS COUNT_PER_DEP
)

*/
