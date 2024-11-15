         --       Session-3
		 select * from students
		 alter table courses add CourseID int primary key
		 create table Assignments(
		 AssignmentID int primary key,
		 CourseID int,
		 title varchar(100),
		 Duedate date,
		 Foreign key (CourseID) references Courses(CourseID)
		 )

		 create table Grades(
		 GradeID int primary key,
		 StudentID int,
		 AssignmentID int,
		 Score decimal(5,2),
		 Foreign key (AssignmentID) references Assignments(AssignmentID),
		 Foreign key (StudentID) references students(StudentID)
		 )


		 create table Instructor(
		InstructorID int primary key,
		 CourseID int,
		 Name varchar(50),
		 Email varchar(100),
		 Foreign key (CourseID) references Courses(CourseID)
		 )

		 CREATE table Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT ,
    CourseID INT,
    Attendancedate DATE ,
    Status VARCHAR(10) CHECK (Status IN ('Present', 'Absent')),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Attendance
VALUES 
    (1, 101, 501, '2024-11-01', 'Present'),
    (2, 102, 501, '2024-11-01', 'Absent'),
    (3, 101, 501, '2024-11-02', 'Present'),
    (4, 103, 502, '2024-11-02', 'Present'),
    (5, 104, 503, '2024-11-03', 'Absent');

	INSERT INTO Students
VALUES 
    ('Doe', 'johndoe@example.com', 'New York', '2022-09-01', 'John', '2000-05-15', 101),
    ('Smith', 'janesmith@example.com', 'Los Angeles', '2021-10-20', 'Jane', '1999-08-23', 102),
    ('Brown', 'michaelbrown@example.com', 'Chicago', '2023-02-11', 'Michael', '2001-12-03', 103),
    ('White', 'emilywhite@example.com', 'San Francisco', '2020-06-25', 'Emily', '2002-03-10', 104),
    ('Davis', 'davidsusan@example.com', 'Miami', '2024-01-10', 'Susan', '1998-11-30', 105);

	select * from Courses

	INSERT INTO Courses (First_name, Last_name, Email, course, DateOfJoining, StudentID, CourseID)
VALUES 
    ('John', 'Doe', 'johndoe@example.com', 'Database Management', '2022-09-01', 101, 501),
    ('Jane', 'Smith', 'janesmith@example.com', 'Software Engineering', '2021-10-20', 102, 502),
    ('Michael', 'Brown', 'michaelbrown@example.com', 'Data Structures', '2023-02-11', 103, 503),
    ('Emily', 'White', 'emilywhite@example.com', 'Network Security', '2020-06-25', 104, 504),
    ('Susan', 'Davis', 'davidsusan@example.com', 'Machine Learning', '2024-01-10', 105, 505);

	select * from Assignments

	INSERT INTO Assignments
VALUES 
    (1, 501, 'Database Normalization', '2024-11-15'),
    (2, 502, 'Software Design Patterns', '2024-11-20'),
    (3, 503, 'Algorithms and Sorting', '2024-11-25'),
    (4, 504, 'Network Security Basics', '2024-12-01'),
    (5, 505, 'Machine Learning Models', '2024-12-05');

	INSERT INTO Grades 
VALUES 
    (1, 101, 1, 85.50),
    (2, 102, 1, 92.00),
    (3, 103, 2, 78.00),
    (4, 104, 3, 88.75),
    (5, 105, 5, 94.50);

	INSERT INTO Instructor
VALUES 
    (1, 501, 'Dr. John Anderson', 'janderson@gmail.com'),
    (2, 502, 'Prof. Sarah Lee', 'slee@gmail.com'),
    (3, 503, 'Dr. Michael Harris', 'mharris@gmail.com'),
    (4, 504, 'Prof. Emily Clark', 'eclark@gmail.com'),
    (5, 505, 'Dr. Susan Davis', 'sdavis@gmail.com');



	--1)Retrieve a list of students along with the names of courses they are enrolled in.
	--Use INNER JOIN between Students and Enrollments, then between Enrollments and Courses to get course names.

	select * from Students

	select * from Courses

	select * from Enrollments

	Update Enrollments set CourseID = 501 where EnrollmentID=1


	select Students.StudentID,Courses.course from Students
	join Enrollments on Students.StudentID=Enrollments.StudentID
	join Courses on Enrollments.CourseID=Courses.CourseID


	--2)List all students and the courses they are enrolled in, including students who are not enrolled in any course.
	--Use LEFT JOIN between Students and Enrollments, then Courses.

	select Students.StudentID,Courses.course from Students
	left join Enrollments on Students.StudentID=Enrollments.StudentID
	left join Courses on Enrollments.CourseID=Courses.CourseID


	--3)list all courses and the students enrolled in each course, including courses with no students.
        --Use RIGHT JOIN between Courses and Enrollments, then Students.


		select Courses.CourseID,Courses.course from Courses
	right join Enrollments on Courses.CourseID=Enrollments.CourseID
	left join Students on Enrollments.StudentID= Students.StudentID

--4)Full Outer Join: Retrieve a list of all students and courses, including students without any courses and courses without any students.

select Students.StudentID,Courses.course from Students
	FULL OUTER JOIN Enrollments on Students.StudentID=Enrollments.StudentID
	FULL OUTER JOIN Courses on Enrollments.CourseID=Courses.CourseID

	--5)Retrieve each student's name along with their course name and instructor’s name.

	select Students.StudentID,Courses.course,Instructor.Name from Students
	join Courses on Students.StudentID=Courses.StudentID
	join Instructor on Courses.CourseID=Instructor.CourseID

	--6)Use LEFT JOIN to find students who are not enrolled in any course.

	select Students.StudentID,Courses.course from Students
	left join Enrollments on Students.StudentID=Enrollments.StudentID
	left join Courses on Enrollments.CourseID=Courses.CourseID
	WHERE 
    Enrollments.CourseID IS NULL;

	--7)Retrieve the title of each assignment along with the student’s name and their score.

	select Assignments.title,CONCAT(Students.First_name, ' ', Students.Last_name) AS student_name,Grades.Score from Grades
	join Assignments on Grades.AssignmentID=Assignments.AssignmentID
	join Students on Grades.StudentID=Students.StudentID


	--8)List each course name, the total number of enrolled students, and the instructor's name.

	select Courses.course,COUNT(Enrollments.StudentID) as total_enrolled_students ,Instructor.Name as InstructorName from Courses
	 left join Enrollments on Courses.CourseID=Enrollments.CourseID
	join Instructor on Courses.CourseID=Instructor.CourseID
	Group by Courses.course,Instructor.Name


	--9)Calculate the average attendance rate for each course (percentage of "Present" status).

	select Courses.course,(SUM(CASE WHEN Attendance.Status = 'Present' THEN 1 ELSE 0 END) / COUNT(Attendance.AttendanceID)) * 100 AS average_attendance_rate from Attendance
	join Courses on Attendance.CourseID=Courses.CourseID
	group by Courses.course

