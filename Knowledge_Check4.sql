/*
Question#1: Create a database 'College' with the following tables,

1. Student table with the following fields - Student ID (PK), Student Name, Date of joining

2. Course table with the following fields - Course ID (PK), Course Name, Course Start Date

3. Teacher table with the following fields - Teacher ID (PK), Teacher Name

*/

-- Student Table
CREATE TABLE kc.Student(
    StudentID SERIAL PRIMARY KEY,
    StudentName VARCHAR(255) NOT NULL,
    DateJoining TIMESTAMP
);

-- Course table
CREATE TABLE kc.Course(
    CourseID SERIAL PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    CourseStartDate TIMESTAMP
);

-- Teacher table
CREATE TABLE kc.Teacher(
    TeacherID SERIAL PRIMARY KEY,
    TeacherName VARCHAR(255) NOT NULL
);

/*

Question#2: Insert a minimum of 5 rows in Student, Course and Teacher Table. 

 */

INSERT INTO kc.student(studentname, datejoining)
VALUES('Paulo Henrique', CURRENT_TIMESTAMP), ('Joao Paulo', CURRENT_TIMESTAMP), ('Maria Clara', CURRENT_TIMESTAMP), ('Fernanda Oliveira', CURRENT_TIMESTAMP), ('Pedro Henrique', CURRENT_TIMESTAMP);

SELECT * FROM kc.student;

INSERT INTO kc.course(coursename, courseStartDate)
VALUES('Math', CURRENT_TIMESTAMP), ('Biology', CURRENT_TIMESTAMP), ('History', CURRENT_TIMESTAMP), ('Geography', CURRENT_TIMESTAMP), ('Portuguese', CURRENT_TIMESTAMP);

SELECT * FROM kc.course;

INSERT INTO kc.teacher(teachername)
VALUES('Peter Parker'), ('Roger Rivan'), ('David Banner'), ('Martin Mistery'), ('Luck Skywalker')

SELECT * FROM kc.teacher;

