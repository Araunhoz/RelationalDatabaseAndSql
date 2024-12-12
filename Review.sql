CREATE TABLE paulo.demo(
   ID_Number SERIAL PRIMARY KEY,
   First_Name VARCHAR(80),
   Last_NAME VARCHAR(80),
   BirthDay DATE	

);


INSERT INTO paulo.demo(first_name, last_name, birthday)
VALUES ('Paulo', 'Munhoz', '1992-06-02'), ('Maria', 'Cecilia', '1995-08-01'), ('Pedro', 'Santos', '2020-06-05') 

SELECT * FROM paulo.demo

DELETE FROM paulo.demo
WHERE First_Name = 'Pedro'

UPDATE paulo.demo
SET First_Name = 'Paulo Henrique'
Where First_Name = 'Paulo'