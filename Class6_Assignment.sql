-- Create the "students" table
CREATE TABLE a6.students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    grade VARCHAR(1),
    marks INT
);

-- Insert sample data into the "students" table
INSERT INTO a6.students (name, age, grade, marks) VALUES
    ('John Doe', 20, 'A', 95),
    ('Jane Smith', 21, 'B', 87),
    ('Michael Johnson', 19, 'A', 92),
    ('Emily Davis', 22, 'C', 78),
    ('Robert Brown', 20, 'B', 88),
    ('Sarah Johnson', 20, 'A', 94),
    ('Daniel Wilson', 22, 'B', 86),
    ('Olivia Lee', 19, 'A', 91),
    ('William Martinez', 21, 'C', 79),
    ('Sophia Anderson', 20, 'B', 88),
    ('Ethan Taylor', 19, 'A', 93),
    ('Ava White', 22, 'B', 87),
    ('Liam Harris', 21, 'C', 75),
    ('Mia Wilson', 20, 'A', 96),
    ('James Garcia', 19, 'B', 89),
    ('Charlotte Davis', 21, 'C', 77),
    ('Benjamin Turner', 22, 'A', 94),
    ('Amelia Lewis', 19, 'B', 85),
    ('Henry Johnson', 20, 'A', 92),
    ('Emma Miller', 21, 'C', 74),
    ('Michael Clark', 22, 'B', 87),
    ('Ella Scott', 19, 'A', 95),
    ('Alexander Hall', 20, 'C', 76),
    ('Sofia Young', 21, 'A', 90),
    ('Matthew Adams', 22, 'B', 86);

/* Answer each query below:
a) Retrieve the names of all students who are 20 years old. */

SELECT name FROM a6.students WHERE age = 20;

-- b) Retrieve the details of the first 3 students in the table.

SELECT * FROM a6.students LIMIT 3;

-- c) Retrieve the average marks for students in grade B.

SELECT AVG(marks) FROM a6.students WHERE grade = 'B';

-- a)  Retrieve the names and ages of the top 5 oldest students.

SELECT name, age FROM a6.students ORDER BY age DESC LIMIT 5;

-- b) Retrieve the grades with more than 3 students and calculate the average marks for each grade.

SELECT grade, AVG(marks) as avg_marks
FROM a6.students
GROUP BY grade
HAVING COUNT(grade) > 3;

-- c) Retrieve the details of the students with the highest marks in each grade. 

SELECT * FROM a6.students x
WHERE marks = (
    SELECT MAX(marks)
    FROM a6.students y
    WHERE x.grade = y.grade
);
