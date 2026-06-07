CREATE DATABASE hostel_db;
USE hostel_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    room_no VARCHAR(10),
    phone VARCHAR(15)
);

CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50),
    job VARCHAR(50)
);

CREATE TABLE complaints (
    complaint_id INT PRIMARY KEY,
    student_id INT,
    issue VARCHAR(100),
    status VARCHAR(20),   -- Pending / Fixed
    staff_id INT,
    date_reported DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);


INSERT INTO students VALUES
(1, 'Ali', 'A-101', '03001112222'),
(2, 'Sara', 'B-205', '03114445555'),
(3, 'Ahmed', 'C-310', '03219998877');

INSERT INTO staff VALUES
(1, 'Usman', 'Electrician'),
(2, 'Bilal', 'Plumber'),
(3, 'Hassan', 'Cleaner');

INSERT INTO complaints VALUES
(1, 1, 'Fan not working', 'Pending', 1, '2026-06-01'),
(2, 2, 'Water leakage', 'Fixed', 2, '2026-06-02'),
(3, 3, 'Light issue', 'Pending', 1, '2026-06-03');


SELECT * FROM complaints;

SELECT s.name, s.room_no, c.issue, c.status
FROM students s
JOIN complaints c ON s.student_id = c.student_id;


SELECT st.name, st.job, c.issue, c.status
FROM staff st
JOIN complaints c ON st.staff_id = c.staff_id;


UPDATE complaints
SET status = 'Fixed'
WHERE complaint_id = 1;


DELETE FROM complaints WHERE complaint_id = 3;