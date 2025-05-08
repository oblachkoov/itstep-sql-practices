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

