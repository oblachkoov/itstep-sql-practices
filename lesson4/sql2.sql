SELECT * FROM users;
SELECT * FROM posts;

--Добавляем лишь одну запись
INSERT INTO users(fname, lname, username, birth_date) VALUES(
	'Ali',
	'Amirov',
	'ali_amirov',
	'2008-12-17'
);

INSERT INTO users(fname, lname, username, birth_date)
VALUES
('Kim', 'Iosiv', 'kan', '2008-05-22'),
('Amir', 'Timurov', 'Amir_t', '2007-2-16'),
('Jan', 'Abbasov', 'J_Abbas', '2006-3-10');


--Добавляем посты
INSERT INTO posts(content, user_id) 
VALUES
('LAAAAAAAKEEERSS', 1),
('BAAAAAASKEEEEETS', 1),
('I AM NOT DOING MY HW', 1);

INSERT INTO posts(content, user_id) 
VALUES
('IELTS 8.5', 2),
('SAT WANT 1600', 2),
('CHAMGE me lname for Li', 2),
('I like football', 2);

INSERT INTO posts(content, user_id) 
VALUES
('Jump from the parashut', 3),
('Like play PUBG', 3);

INSERT INTO posts(content, user_id) 
VALUES
('I want to travel', 4);