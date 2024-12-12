/*
1) Create a table called students with the following columns(2 marks each):

id (integer, primary key)
name (text)
age (integer)
grade (text)
marks (integer)
*/

CREATE TABLE kc5.students(
    studentid INTEGER PRIMARY KEY,
    studentname TEXT,
    age INTEGER,
    grade TEXT,
    marks INTEGER
);

SELECT * FROM kc5.students;

/*
2) Insert sample data into the students table to work with(1 mark).
*/

INSERT INTO kc5.students(studentid, studentname, age, grade, marks) 
VALUES(001, 'Pedro', 20, 'A', 85), (002, 'Emilly', 21, 'B', 78), (003, 'Hevellyn', 22, 'B', 78), (004, 'Adam', 20, 'A', 90),(005, 'Lucky', 18, 'B', 88), (006, 'Fernando', 23, 'A', 99), (007, 'Suzana', 21, 'C', 75), (008, 'Ana', 19, 'C', 75), (009, 'Lasmin', 18, 'A', 85), (010, 'Kevin', 21, 'B', 79);

SELECT * FROM kc5.students;

/* 3.a) Retrieve the names of all students with an age greater than 18  */

SELECT studentname FROM kc5.students
WHERE age > 18;

/* 3.b) Retrieve the details of the top 5 students with the highest marks.  */

SELECT * FROM kc5.students
ORDER BY marks
DESC LIMIT 5;

/* 3.c) Retrieve the average marks for each grade.*/

SELECT grade, AVG(marks) AS averagemarks FROM kc5.students
GROUP BY grade;

/* 3.d) Retrieve the count of students in each grade having more than 80 marks.*/

SELECT grade, COUNT(*) AS countstudents FROM kc5.students 
WHERE marks > 80 
GROUP BY grade;

/* 3.e) Retrieve the details of the youngest student in each grade. */

SELECT * FROM kc5.students x 
WHERE age = (SELECT MIN(age) FROM kc5.students y WHERE x.grade = y.grade);

/* 3.f) Retrieve the top 3 students with the highest marks in grade A, sorted in descending order of marks. */

SELECT * FROM kc5.students
WHERE grade = 'A' ORDER BY marks DESC LIMIT 3;
