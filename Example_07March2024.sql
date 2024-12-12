CREATE TABLE er.Patient(
	first_Name VARCHAR(50),
	Last_Name VARCHAR(50), 
	Patient_ID varchar(50) PRIMARY KEY,
	Age INT,
	MSP BOOLEAN
);

CREATE TABLE er.Doctor(
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Doctor_ID VARCHAR(50) PRIMARY KEY,
	Shift VARCHAR(50),
	Specialization VARCHAR(100)
);

ALTER TABLE er.Doctor
ADD COLUMN Age INT NOT NULL;


ALTER TABLE er.Patient
ADD COLUMN Phone varchar(50) not null;

CREATE TABLE er.Queue(
	DatetimeIn TIMESTAMP,
	DateTimeOut TIMESTAMP,
	Patient_ID VARCHAR,
	FOREIGN KEY (Patient_ID) REFERENCES er.patient(Patient_ID)
);
 
CREATE TABLE er.Diagnostics(
	Treatment VARCHAR(100), 
	Price DECIMAL (10,2),
	NextStep VARCHAR(100),
	Date TIMESTAMP,
	Patient_ID VARCHAR(50),
	Doctor_ID VARCHAR(50),
	FOREIGN KEY (Patient_ID) REFERENCES er.patient(Patient_ID),
	FOREIGN KEY (Doctor_ID) REFERENCES er.doctor(Doctor_ID)
);

CREATE TABLE er.Payment_Method(
	Insurance VARCHAR(100),
	Price DECIMAL (10,2),
	Date TIMESTAMP,
	Patient_ID VARCHAR(50),
	FOREIGN KEY (Patient_ID) REFERENCES er.patient(Patient_ID)
);
