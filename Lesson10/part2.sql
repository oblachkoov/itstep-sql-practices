CREATE TABLE students(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(255) NOT NULL,
	age INT NOT NULL CHECK (age > 0)
);
DROP TABLE students;

CREATE TABLE student_logs(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	student_id BIGINT REFERENCES students(id),
	action VARCHAR(20) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE student_logs;

CREATE FUNCTION log_student_insert()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO student_logs(student_id, action)
	VALUES(NEW.id, 'Add');
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_log_insert
AFTER INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION log_student_insert();

INSERT INTO students(fullname, age)
VALUES
('Alex', 18);

SELECT * FROM students;
SELECT * FROM student_logs;

