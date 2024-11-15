create database SQLTraining_Vanitha

use SQLTraining_Vanitha

create table Customers(First_name varchar(20), Last_name varchar(20), Email varchar(30), City varchar(20), DateOfPurchase date) 

alter table Customers add CustomerID int primary key

alter table Customers drop column City

alter table Customers add City varchar(20)

drop table Customers

INSERT INTO Customers VALUES ('Arun', 'Das', 'arun@gmail.com', '12-02-2012' , 1 , 'Chennai');  

select * from Customers

-- 1)Problem: Add a NOT NULL constraint to the name column in the Students table. Problem: Add a UNIQUE constraint to the email column in the Students table

create table Students(First_name varchar(20), Last_name varchar(20), Email varchar(30), City varchar(20), DateOfJoining date)

alter table Students drop column First_name

alter table Students add First_name varchar(20) not null

alter table Students add unique (Email)

--2)Problem: Use the ALTER TABLE command to add a column birthdate to the Students table.

alter table Students add birthdate date

--3)Problem: Drop a test table, if you created one, using DROP TABLE table_name;

drop table Customers

--4)Problem: Insert some sample data into the Courses table, then use TRUNCATE TABLE Courses; to remove all rows without deleting the table structure

create table Courses(First_name varchar(20), Last_name varchar(20), Email varchar(30), course varchar(20), DateOfJoining date)

alter table Students add StudentID int primary key

INSERT INTO Courses VALUES ('Arun', 'Das', 'arun@gmail.com', 'SQL' ,'12-02-2012');

alter table Courses add StudentID int 

select * from Courses

TRUNCATE TABLE Courses;

-- 5)Problem: Insert sample records into each table: Students table with sample student information. Courses table with at least three course entries. Enrollments table with at least two enrollment records, linking students to courses.

create table Enrollments(EnrollmentID int primary key, StudentID int, CourseID int , EnrollmentDate date)


INSERT INTO Enrollments VALUES 
(1, 1, 101, '2024-01-15'),
(2, 2, 102, '2024-01-16'),
(3, 3, 103, '2024-01-17'),
(4, 1, 102, '2024-01-18');

select * from Enrollments



--6)Problem: Update a student's email in the Students table using the UPDATE command. E.g., Change a student's email based on their student_id.

select * from Students

INSERT INTO Students VALUES
('Das', 'arun@gmail.com', 'Chennai' ,'12-04-2012','Arun', '02-03-1990', 111) ,
('Saksi', 'Bindu@gmail.com', 'Chennai' ,'12-04-2012','Bindu', '08-06-1992', 222)

update Students set Email='BinduSaksi@gamil.com' where StudentID = 111;

-- 7)Problem: Write a command to delete a specific student from the Students table. Use DELETE FROM Students WHERE student_id = X; 

DELETE FROM Students WHERE StudentID = 222