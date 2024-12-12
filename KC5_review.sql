CREATE TABLE kc5.students (
	id INT PRIMARY KEY,
	name TEXT,
	age INT, 
	grade TEXT, 
	marks INT
);

INSERT INTO kc5.students (id, name, age, grade, marks)
VALUES(1, 'Paulo Henrique', 19, 'A', 90 ),
(2, 'Helena', 20, 'C', 70 ),
(3, 'Pedro', 15,'B', 80 ),
(4, 'Joaquim', 18, 'A', 90 ),
(5, 'Lisa', 20, 'C', 60 ),
(6, 'Suzana',17, 'B', 83 ),
(7, 'Miriam',17, 'A', 99 ),
(8, 'Sandra',19, 'C', 55 ),
(9, 'Kariny',20, 'B', 88 ),
(10, 'Oliver',20, 'A', 92 );

-- Retrieve the names of all students with an age greater than 18.
SELECT * FROM kc5.students
WHERE age < 18;

--Retrieve the details of the top 5 students with the highest marks.

SELECT * FROM kc5.students
WHERE marks >= 90 
LIMIT 5;

--Retrieve the average marks for each grade.

SELECT ROUND(AVG(marks),2) FROM kc5.students
GROUP by grade;

--Retrieve the count of students in each grade having more than 80 marks

SELECT COUNT(name) FROM kc5.students
WHERE marks > 80

-- Retrieve the details of the youngest student in each grade

SELECT grade, MIN(age) AS youngest
FROM kc5.students
GROUP BY grade


--Retrieve the top 3 students with the highest marks in grade A, sorted in descending order of marks.

SELECT name, grade FROM kc5.students
ORDER BY(grade='A') DESC
LIMIT 3

