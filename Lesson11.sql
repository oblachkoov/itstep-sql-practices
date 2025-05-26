---1.
CREATE TABLE students(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(512) NOT NULL,
	birth_date DATE NOT NULL,
	email VARCHAR(512)
);

CREATE TABLE courses(	
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title VARCHAR(512) NOT NULL,
	description TEXT
);

CREATE TABLE enrollments(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	student_id BIGINT REFERENCES students(id) ON DELETE CASCADE,
	course_id BIGINT REFERENCES courses(id) ON DELETE CASCADE,
	enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO students(full_name, birth_date, email)
VALUES
('Amir', '2008-05-16', 'A@mir' ),
('Kim', '2007-12-12', 'Kim@Ar'),
('Pak', '2006-09-12', 'P@2007Ak')


INSERT INTO courses(title, description)
VALUES
('IT-program', 'For write cods'),
('Math', 'For doing some Tasks')


INSERT INTO enrollments(student_id, course_id)
VALUES
(1, 1),
(2, 1)

SELECT * FROM students;

UPDATE students
SET email = 'k2007@A'
WHERE id = 2;


DELETE FROM students
WHERE id = 2;


SELECT 
    s.id AS student_id,
    s.full_name AS student_name,
    c.title AS course_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
ORDER BY s.id, c.title;



SELECT 
    s.id,
    s.full_name,
    s.email
FROM students s
LEFT JOIN enrollments e ON s.id = e.student_id
WHERE e.student_id IS NULL;



SELECT
    c.id AS course_id,
    c.title AS course_title,
    COUNT(e.student_id) AS student_count
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.title
ORDER BY student_count DESC, c.title;



SELECT
    c.title AS course_title,
    COUNT(e.student_id) AS students_count
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.title
ORDER BY students_count DESC;



SELECT
    s.id AS student_id,
    s.full_name,
    COUNT(e.course_id) AS courses_count
FROM students s
LEFT JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id, s.full_name
ORDER BY courses_count DESC, s.full_name;




                        


