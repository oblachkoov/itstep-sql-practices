CREATE TABLE categories(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL
);
CREATE TABLE products(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	description TEXT,
	rating REAL DEFAULT 10,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	is_active BLOB DEFAULT 1,
	category_id INTEGER NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories(id)
);
ALTER TABLE products ADD COLUMN category_id INTEGER;

DROP TABLE categories;
DROP TABLE products;

INSERT INTO categories(name) VALUES(
	'Хоз-товары'
);
INSERT INTO categories(name) VALUES(
	'Электроника'
);
INSERT INTO categories(name) VALUES(
	'Хлебо-булочная'
);

SELECT * FROM categories;
SELECT * FROM products;

INSERT INTO products(name, description, price, rating, category_id)
VALUES('Веник', 'Веник обыкновенный', 999.99, 10, 1);

INSERT INTO products(name, description, price, rating, category_id)
VALUES('Холодильник', 'Холодильник большой', 776.88, 8, 2);

INSERT INTO products(name, description, price, rating, category_id)
VALUES('Кондиционер', 'Кондиционер сильный', 1.000.000, 8, 3);

INSERT INTO products(name, description, price, rating, category_id)
VALUES('Освежитель', 'Освежитель новенький', 988.88, 9, 1);

INSERT INTO products(name, description, price, rating, category_id)
VALUES('Телефон', 'Телефон новенький', 2100.00, 10, 1);

INSERT INTO products(name, description, price, rating, category_id)
VALUES('Курассаны', 'Курассаны вкусные', 50.000, 9, 2);

INSERT INTO products(name, description, price, rating, category_id)
VALUES('Булочки', 'Булочки свежие', 20.000, 7, 2);

INSERT INTO products(name, description, price, rating, category_id)
VALUES('Хлеб', 'Хлеб горячие', 10.000, 9, 1);


SELECT
 p.name AS 'Название продукта',
 c.name AS 'Название категорий'
FROM products p
INNER JOIN categories c ON c.id == p.category_id
WHERE p.category_id == 1;




