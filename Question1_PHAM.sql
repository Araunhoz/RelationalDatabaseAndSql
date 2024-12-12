/* PART A: Write Queries to Define Data Models

1) Create the Patients table with the following fields

patient_id (primary key)
name (text)
age (integer)
gender (text)
address (text)
disease (text)
admission_date (date)
discharge_date (date) 
*/

CREATE TABLE Patients (
	patientid INT PRIMARY KEY,
	patientname TEXT,
	age INT,
	gender TEXT,
	address TEXT,
	disease TEXT,
	admissiondate DATE,
	dischargedate DATE
	
);

SELECT * FROM Patients;
/*
2. Create the Doctors table with the following fields:

doctor_id (primary key)
name (text)
specialization (text)
experience (integer)
hospital (text)
salary (float)

*/

CREATE TABLE Doctors (
	doctorid INT PRIMARY KEY,
	doctorname TEXT,
	specialization TEXT,
	experience INT,
	hospital TEXT,
	salary FLOAT
);

SELECT * FROM Doctors;


/*3) Insert 5 rows into the Patients table */

INSERT INTO Patients (patientid, patientname, age, gender, address, disease, admissiondate, dischargedate)
VALUES (1, 'Paulo Henrique', 40, 'Male', ' 6462 Fraser Street', 'Flu', '2024-01-14', '2024-01-16'),
(2, 'Mariana Joaquina', 80, 'Female', ' 5253 King Eduward', 'Acne', '2023-03-23', '2024-03-25'),
(3, 'Moacir Francisco', 40, 'Male', ' 1212 Prince Stuart', 'Allergies', '2020-04-01', '2023-12-24'),
(4, 'Tereza Martins', 16, 'Female', '8989 comlombus', 'Bulimia', '2024-01-14', '2024-01-16'),
(5, 'Suzana Ferreira', 19, 'Female', '2325 OaK', 'Chlamydia', '2024-02-14', '2024-04-23');

/*4) Insert 5 rows into the Doctors table */

INSERT INTO Doctors (doctorid, doctorname, specialization, experience, hospital, salary)
VALUES(1, 'Darth Vader', 'Dermatology', 10, 'Void', 10000),
(2, 'Anakin skywalker', 'Anesthesiology', 5, 'Constellation', 5000),
(3, 'Amanda Albuquerque', 'Surgeon', 15, 'TheWayforJesus', 20000),
(4, 'Candido Portinary', 'Clinical immunology/allerg', 20, 'Hello', 30000),
(5, 'Obiwan Kenobi', 'Cardiology', 3, 'StarWars', 1500)

/*PART B: Write Queries to Get Following Information: 
 
1) Retrieve the names and ages of all patients */

SELECT patientname, age FROM Patients;

-- 2) Retrieve the names and specializations of all doctors

SELECT doctorname, specialization FROM Doctors;

-- 3) Retrieve the names and addresses of male patients

SELECT patientname, address FROM Patients WHERE gender='Male';

-- 4) Retrieve the names and hospitals of doctors with more than 10 years of experience

SELECT doctorname, hospital FROM Doctors WHERE experience > 10;

--5) Retrieve the count of patients by gender

SELECT gender, COUNT(*) FROM Patients GROUP BY gender;
    
