CREATE PROCEDURE check_number(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF n < 10 THEN
		RAISE NOTICE 'You are so small';
	ELSE 
		RAISE NOTICE 'You are coming ';
	END IF;
END;
$$;

CALL check_number(8);
CALL check_number(18);


CREATE PROCEDURE check_number(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF n < 10 THEN
		RAISE NOTICE 'You are so small';
	ELSIF n < 18 THEN
		RAISE NOTICE 'You are only student';
	ELSE 
		RAISE NOTICE 'You are coming ';
	END IF;
END;
$$;

DROP PROCEDURE check_number(INT);
CALL check_number(15);

--------------------------------------------------------------------------------------------------------------------------

---1.
CREATE PROCEDURE num(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF n % 2 =0 THEN
		RAISE NOTICE 'It is correct';
	ELSE 
		RAISE NOTICE 'It is not correct';
	END IF;
END;
$$;

CALL num(20);
CALL num(11);



---2.
CREATE PROCEDURE age(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF n < 18 THEN
		RAISE NOTICE 'You are so small';
	ELSIF n > 18 and n < 60 THEN
		RAISE NOTICE 'Of age';
	ELSIF n > 60 THEN
		RAISE NOTICE 'Pensioner';
	END IF;
END;
$$;
DROP PROCEDURE age(INT);
CALL age(21);


---3.
CREATE OR REPLACE PROCEDURE grade(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
    IF n BETWEEN 90 AND 100 THEN
        RAISE NOTICE 'Perfect';
    ELSIF n BETWEEN 70 AND 89 THEN
        RAISE NOTICE 'Good';
    ELSIF n BETWEEN 50 AND 69 THEN
        RAISE NOTICE 'Satisfactorily';
    ELSIF n < 50 THEN
        RAISE NOTICE 'Satisfactorily';
    END IF;
END;
$$;
DROP PROCEDURE grade(INT);
CALL grade(100);
CALL grade(60);
CALL grade(30);


---4.






---5.







CREATE TABLE users(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	username VARCHAR(320) UNIQUE NOT NULL,
	age INT NOT NULL CHECK (age > 0),
	fullname VARCHAR(512) NOT NULL
);


CREATE PROCEDURE add_update(u_username 	varchar(320), u_age INT, u_fullname VARCHAR(512))
LANGUAGE plpgsql
AS $$
DECLARE user_count BIGINT;
BEGIN
	---Узнали кол-во пользователей с таким username
	SELECT COUNT(*) INTO user_count FROM users WHERE username=u_username;
	IF user_count > 0 THEN 
		UPDATE users
		SET age=u_age, fullname=u_fullname
		WHERE username=u_username;
	ELSE 
		INSERT INTO users(username, age, fullname)
		VALUES(u_username, u_age, u_fullname);
	END IF;
END;
$$;

CALL add_update('Milan@2008', 20, 'Milana Smith');
CALL add_update('S@kim', 16, 'Smith Kim');
CALL add_update('Alex@Aliev', 25, 'Alex Alexeev');

SELECT * FROM users;





