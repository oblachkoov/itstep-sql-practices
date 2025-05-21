CREATE TABLE authors (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    fullname VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    author_id BIGINT REFERENCES authors(id) ON DELETE CASCADE
);


CREATE PROCEDURE add_book_with_author(a_fullname VARCHAR(512), b_title VARCHAR(320))
LANGUAGE plpgsql 
AS $$
DECLARE author_id BIGINT;
BEGIN
    SELECT id INTO author_id
    FROM authors
    WHERE fullname = a_fullname;
	
       INSERT INTO authors (fullname)
       VALUES (a_fullname)
       RETURNING id INTO author_id;

    INSERT INTO books (title, author_id)
    VALUES (b_title, author_id);
END;
$$;
