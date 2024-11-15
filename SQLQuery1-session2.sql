----------                 Session2

select * from Customers

INSERT INTO Customers values
('Babu','Raj','babu@gmail.com','04-06-2013',2,'Salem'), 
('Charu','latha','charu@gamil.com','09-11-2013',3,'Salem'),
('David','Raj','david@gamil.com','04-06-2013',4,'Chennai')

select * from Customers

select First_name, Email from Customers

select First_name, Email from Customers where city='Chennai'

select First_name, Email from Customers where CustomerID>1

select First_name, Email from Customers where CustomerID>1 AND city='Chennai'

select First_name, Email from Customers where CustomerID>1 OR city='Chennai'

select First_name, Email from Customers where NOT city='Chennai'

select First_name, Email from Customers where city IN('Chennai')

select First_name, Email from Customers where city IN('Chennai') ORDER BY First_name DESC

select * from Customers ORDER BY First_name offset 2 rows

select * from Customers ORDER BY First_name offset 2 rows fetch next 3 rows only


select TOP 3 First_name, Email from Customers ORDER BY City

select DISTINCT City from Customers ORDER BY City

select COUNT(CustomerID),City from Customers GROUP BY City

select MAX(CustomerID),City from Customers GROUP BY City


--1)Retrieve all assignments with due dates in the next 7 days

select * from Assignments

Select title from Assignments where Duedate BETWEEN '2024-11-14' AND '2024-11-24'

--2)Find the average score of all students on a specific assignment

select * from Grades

select AVG(Score) from Grades where AssignmentID=1


--3)Count the total number of days each student was marked "Present". 

select * from Attendance

select COUNT(StudentID) as NoOfDaysPresent from Attendance where status='Present'

--4)Retrieve a list of instructors who have an email address ending with "@gmail.com". 

select * from Instructor

select Name, Email from Instructor where Email like'%gmail.com'

--5)List all students who scored above 90 on any assignment

select * from Grades

select * from Grades where Score>90.00

--6)Retrieve the names of all instructors who have not assigned a course

select * from Instructor

select Name from Instructor where CourseID IS NULL

--. 7)Find students who have more than three absences


select * from Attendance

select StudentID,COUNT(*) from Attendance where status='Absent' GROUP BY StudentID  HAVING COUNT(*) > 3

--. 8)For each assignment, find the highest score achieved by any student.

select * from Grades

select MAX(Score) as Highestscore from Grades GROUP BY AssignmentID

--9)Retrieve all assignments that were due more than a month ago


--10)Count the total number of assignments for each course

select * from Assignments

Select CourseID,COUNT(*) from Assignments GROUP BY CourseID;

--11)Retrieve a list of instructors, sorted by name in descending order

select * from Instructor

select Name from Instructor ORDER BY Name DESC

--12)List all students and their highest score across all assignments.


select * from Grades

select MAX(Score) as Highestscore,StudentID from Grades GROUP BY StudentID