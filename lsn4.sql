--Создание табдицы если его нету
CREATE TABLE IF NOT EXISTS users(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, --Автоматически будет генерировать id
	fname VARCHAR(255) NOT NULL,
	lname VARCHAR(255) NOT NULL,
	username VARCHAR(512) UNIQUE NOT NULL, --Нужно давать уникольное значение
	birth_date DATE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp тот же самый Datetime
);

CREATE TABLE IF NOT EXISTS posts(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, --Автоматически будет генерировать id,
	content VARCHAR(2048) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp тот же самый Datetime,
	user_id BIGINT REFERENCES users(id) -- Связываем Users and Posts
)

SELECT * FROM users;
SELECT * FROM posts;

--Добавляем лишь одну запись
INSERT INTO users(fname, lname, username, birth_date) VALUES(
	'Ali',
	'Amirov',ssss
	'ali_amirov',
	'2008-12-17'
)

INSERT INTO users(fname, lname, username, birth_date)
VALUES
('Kim', 'Iosiv', 'kan', '2008-05-22'),
('Amir', 'Timurov', 'Amir_t', '2007-2-16'),s
('Jan', 'Abbasov', 'J_Abbas', '2006-3-10')