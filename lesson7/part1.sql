CREATE TABLE students(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(512) NOT NULL,
	date_of_birth DATE NOT NULL
);

CREATE TABLE grades(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	grade INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	student_id BIGINT REFERENCES students(id) ON DELETE CASCADE
);


INSERT INTO students(fullname, date_of_birth) VALUES
('Ruslan', '2008-11-25'),
('Jahangir', '2009-10-06'),
('Ruslan', '2008-07-13'),
('Malika', '2007-02-21');

SELECT * FROM students;


INSERT INTO grades(grade, student_id) VALUES
---Ruslan
(12, 1),
(11, 1),
(12, 1),

--Jahangir
(12, 2),
(8, 2),
(7, 2),
(0, 2),
(12, 2),

--Rashid
(8, 3),
(5, 3),
(11, 3),
(4, 3),

--Malika
(12, 4),
(12, 4),
(12, 4),
(12, 4);

SELECT * FROM grades;

SELECT COUNT(*) FROM students; --Возвращает только 4 студента

--AVG  нфходит сред значение
SELECT
AVG(g.grade)
FROM students s
JOIN grades g ON g.student_id=s.id;


SELECT
s.fullname,
AVG(g.grade)
FROM students s
JOIN grades g ON g.student_id=s.id
GROUP BY s.fullname
HAVING AVG(g.grade) > 7;  

