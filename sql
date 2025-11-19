CREATE DATABASE UniversityDB;
USE UniversityDB;
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Professor (
    professor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    department_id INT,
    professor_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (professor_id) REFERENCES Professor(professor_id)
);
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    semester VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Mechanical'),
(3, 'Electronics'),
(4, 'Civil'),
(5, 'IT');
INSERT INTO Student VALUES
(101, 'Payal', 20, 'Female', 1),
(102, 'Ravi', 21, 'Male', 2),
(103, 'Neha', 19, 'Female', 1),
(104, 'Sahil', 22, 'Male', 3),
(105, 'Aditi', 20, 'Female', 5),
(106, 'Manish', 23, 'Male', 4);

INSERT INTO Professor VALUES
(201, 'Dr. Sharma', 'AI', 1),
(202, 'Dr. Kumar', 'Thermodynamics', 2),
(203, 'Dr. Neeraj', 'Circuits', 3),
(204, 'Dr. Ritu', 'Data Science', 5);

INSERT INTO Subject VALUES
(301, 'DBMS', 1, 201),
(302, 'Machine Design', 2, 202),
(303, 'Electronics Circuits', 3, 203),
(304, 'Data Analytics', 5, 204);
INSERT INTO Book VALUES
(401, 'Operating Systems', 'Galvin', 1),
(402, 'Fluid Mechanics', 'Cengel', 2),
(403, 'Digital Electronics', 'Morris Mano', 3),
(404, 'Data Mining Concepts', 'Han & Kamber', 5);
INSERT INTO Enrollment VALUES
(501, 101, 301, 'Sem-4'),
(502, 102, 302, 'Sem-5'),
(503, 103, 301, 'Sem-4'),
(504, 104, 303, 'Sem-6'),
(505, 105, 304, 'Sem-5'),
(506, 106, 302, 'Sem-7');

SELECT s.name, d.dept_name
FROM Student s
JOIN Department d ON s.department_id = d.department_id;

SELECT p.name AS Professor, s.subject_name AS Subject
FROM Professor p
JOIN Subject s ON p.professor_id = s.professor_id;

SELECT st.name, sub.subject_name, e.semester
FROM Enrollment e
JOIN Student st ON e.student_id = st.student_id
JOIN Subject sub ON e.subject_id = sub.subject_id;

SELECT d.dept_name, COUNT(*) AS total_students
FROM Student s
JOIN Department d ON s.department_id = d.department_id
GROUP BY d.dept_name;

SELECT d.dept_name, b.title 
FROM Book b
JOIN Department d ON b.department_id = d.department_id;
