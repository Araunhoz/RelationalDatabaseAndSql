CREATE TABLE Patients (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(255),
    GENDER CHAR(1),
    DATE_OF_BIRTH DATE,
    ADDRESS VARCHAR(255),
    PHONE VARCHAR(20),
    EMAIL VARCHAR(50)
);

CREATE TABLE Doctors (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    GENDER CHAR(1),
    DATE_OF_BIRTH DATE,
    SPECIALIZATION VARCHAR(50),
    PHONE VARCHAR(20),
    EMAIL VARCHAR(50)
);

CREATE TABLE Appointments (
    ID SERIAL PRIMARY KEY,
    PATIENT_ID INT REFERENCES Patients(ID),
    DOCTOR_ID INT REFERENCES Doctors(ID),
    DATE DATE,
    START_TIME TIME,
    END_TIME TIME
);

CREATE TABLE Departments (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    DESCRIPTION VARCHAR(50)
);


CREATE TABLE MedicalRecords (
    ID SERIAL PRIMARY KEY,
    PATIENT_ID INT REFERENCES Patients(ID),
    DOCTOR_ID INT REFERENCES Doctors(ID),
    DEPARTMENT_ID INT REFERENCES Departments(ID),
    DATE DATE,
    DIAGNOSIS VARCHAR(50),
    TREATMENT VARCHAR(50)
);

-- Sample data for Patients table (10 additional rows)
INSERT INTO Patients (NAME, GENDER, DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL)
VALUES
    ('Alice Johnson', 'F', '1985-08-12', '456 Elm St', '555-5678', 'alice@example.com'),
    ('Bob Smith', 'M', '1978-03-19', '789 Oak St', '555-6789', 'bob@example.com'),
    ('Eva Williams', 'F', '1992-11-25', '123 Maple St', '555-7890', 'eva@example.com'),
    ('David Davis', 'M', '1982-06-07', '789 Pine St', '555-8901', 'david@example.com'),
    ('Sarah Miller', 'F', '1989-04-30', '234 Birch St', '555-9012', 'sarah@example.com'),
    ('Michael Wilson', 'M', '1975-01-15', '567 Cedar St', '555-0123', 'michael@example.com'),
    ('Linda Anderson', 'F', '1991-09-03', '345 Redwood St', '555-1234', 'linda@example.com'),
    ('Chris Martin', 'M', '1980-02-20', '678 Sequoia St', '555-2345', 'chris@example.com'),
    ('Grace Moore', 'F', '1987-07-22', '456 Walnut St', '555-3456', 'grace@example.com'),
    ('Daniel Lee', 'M', '1990-12-08', '123 Pineapple St', '555-4567', 'daniel@example.com');

-- Sample data for Doctors table (10 additional rows)
INSERT INTO Doctors (NAME, GENDER, DATE_OF_BIRTH, SPECIALIZATION, PHONE, EMAIL)
VALUES
    ('Dr. Lisa Johnson', 'F', '1976-04-18', 'Pediatrician', '555-3456', 'lisa@example.com'),
    ('Dr. Mark White', 'M', '1983-11-07', 'Dermatologist', '555-4567', 'mark@example.com'),
    ('Dr. Emily Taylor', 'F', '1988-09-28', 'Oncologist', '555-5678', 'emily@example.com'),
    ('Dr. James Clark', 'M', '1970-06-14', 'Neurologist', '555-6789', 'james@example.com'),
    ('Dr. Anna King', 'F', '1985-03-25', 'Orthopedic Surgeon', '555-7890', 'anna@example.com'),
    ('Dr. Andrew Hill', 'M', '1981-02-09', 'Cardiologist', '555-8901', 'andrew@example.com'),
    ('Dr. Jennifer Davis', 'F', '1979-07-11', 'Endocrinologist', '555-9012', 'jennifer@example.com'),
    ('Dr. Robert Turner', 'M', '1974-12-02', 'Gastroenterologist', '555-0123', 'robert@example.com'),
    ('Dr. Maria Garcia', 'F', '1987-05-19', 'Radiologist', '555-1234', 'maria@example.com'),
    ('Dr. Thomas Martinez', 'M', '1982-10-31', 'Urologist', '555-2345', 'thomas@example.com');

-- Sample data for Appointments table (10 additional rows)
INSERT INTO Appointments (PATIENT_ID, DOCTOR_ID, DATE, START_TIME, END_TIME)
VALUES
    (2, 2, '2023-11-06', '10:30', '11:30'),
    (3, 3, '2023-11-07', '14:00', '15:00'),
    (4, 4, '2023-11-08', '09:30', '10:30'),
    (5, 5, '2023-11-09', '11:00', '12:00'),
    (6, 6, '2023-11-10', '16:30', '17:30'),
    (7, 7, '2023-11-11', '10:00', '11:00'),
    (8, 8, '2023-11-12', '15:30', '16:30'),
    (9, 9, '2023-11-13', '13:30', '14:30'),
    (10, 10, '2023-11-14', '11:30', '12:30');

-- Sample data for Departments table (10 additional rows)
INSERT INTO Departments (NAME, DESCRIPTION)
VALUES
    ('Orthopedics', 'Specializes in bone and joint health'),
    ('Ophthalmology', 'Specializes in eye care'),
    ('Dentistry', 'Specializes in dental health'),
    ('Neurology', 'Specializes in nervous system disorders'),
    ('Gynecology', 'Specializes in women''s health'),
    ('ENT', 'Specializes in ear, nose, and throat care'),
    ('Urology', 'Specializes in urinary system health'),
    ('Radiology', 'Specializes in medical imaging'),
    ('Psychiatry', 'Specializes in mental health'),
    ('Dermatology', 'Specializes in skin health');

-- Sample data for MedicalRecords table (10 additional rows)
INSERT INTO MedicalRecords (PATIENT_ID, DOCTOR_ID, DEPARTMENT_ID, DATE, DIAGNOSIS, TREATMENT)
VALUES
    (1, 1, 1, '2023-11-01', 'Headache', 'Prescribed pain relievers'),
    (2, 2, 2, '2023-11-02', 'Skin Rash', 'Prescribed topical cream'),
    (3, 3, 3, '2023-11-03', 'Flu', 'Prescribed rest and fluids'),
    (4, 4, 4, '2023-11-04', 'Back Pain', 'Recommended physical therapy'),
    (5, 5, 5, '2023-11-05', 'Pregnancy Checkup', 'Provided prenatal care'),
    (6, 6, 6, '2023-11-06', 'Ear Infection', 'Prescribed antibiotics'),
    (7, 7, 7, '2023-11-07', 'Kidney Stones', 'Recommended hydration and pain relief'),
    (8, 8, 8, '2023-11-08', 'X-ray Required', 'Ordered an X-ray examination'),
    (9, 9, 9, '2023-11-09', 'Anxiety', 'Counseling and therapy'),
    (1, 2, 1, '2023-11-10', 'Eczema', 'Prescribed medicated lotion');

-- -- 1. Retrieve the names and email addresses of all patients who have appointments with DoctorID = 1, 
--ordered by their names.

SELECT NAME, EMAIL, ID FROM Patients
WHERE ID = (SELECT patient_id FROM MedicalRecords WHERE doctor_id = 1)

--2. Count the number of appointments for each doctor, ordered by the count in descending order.

SELECT COUNT(*) as Appointments FROM Appointments
GROUP BY (DOCTOR_ID)

-- 3. Retrieve the names and email addresses of patients who have medical records for which the diagnosis is 'Hypertension'.

SELECT name, email FROM Patients
WHERE ID = (SELECT patient_id FROM MedicalRecords WHERE diagnosis = 'Hypertension'); 


