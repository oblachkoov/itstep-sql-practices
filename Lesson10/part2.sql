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
------------------------------------------------------------------------------------------------------------



CREATE TABLE students(
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  fullname VARCHAR(255) NOT NULL,
  age INT NOT NULL CHECK (age > 0)
);

CREATE TABLE student_logs(
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  student_id BIGINT REFERENCES students(id),
  action VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE FUNCTION log_student_insert()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO student_logs(student_id, action)
  VALUES (NEW.id, 'Add');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_log_insert
AFTER INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION log_student_insert();

INSERT INTO students(fullname, age)
VALUES ('Timur', 19);

SELECT * FROM students;
SELECT * FROM student_logs;

CREATE OR REPLACE FUNCTION capitalize_name()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fullname := INITCAP(NEW.fullname);  -- 'john smith' → 'John Smith'
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_capitalize_name
BEFORE INSERT OR UPDATE ON students
FOR EACH ROW
EXECUTE FUNCTION capitalize_name();

INSERT INTO students(fullname, age)
VALUES ('jahangir nuratdinov', 15);
SELECT * FROM students;

CREATE OR REPLACE FUNCTION block_minor_students()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.age < 18 THEN
        RAISE EXCEPTION 'Студенты младше 18 лет не допускаются';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_block_minor
BEFORE INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION block_minor_students();

DROP TRIGGER trg_log_insert ON students;
DROP FUNCTION log_student_insert;
