INSERT INTO users(fname, lname, password, username)
VALUES
	('Rashid', 'Galiyev', '1234', 'r_ash'),
	('Yusuf', 'Ronaldo', 'cr7', 'cristiano'),
	('Malika', 'Rahimberdiyeva', '111', 'pashtet');

SELECT * FROM users;

INSERT INTO profiles(user_id)
VALUES (1), (2), (3);

INSERT INTO categories(name)
VALUES ('fruits'), ('vegetables'), ('drinks');

SELECT * FROM categories;

--Fruits
INSERT INTO products(name, price, category_id)
VALUES
	('banan', 10000, 1),
	('mango', 80000, 1),
	('ananas', 40000, 1);

--Vegetables
INSERT INTO products(name, price, category_id)
VALUES
	('tomato', 5000, 2),
	('cucumber', 25000, 2),
	('carrot', 10000, 2);

INSERT INTO products(name, price, category_id)
VALUES
	('cola', 18000, 3),
	('fanta', 10000, 3),
	('moxito', 15000, 3),
	('RedBull', 27000, 3);

SELECT * FROM products;

INSERT INTO orders(user_id)
VALUES(1), (1), (3), (3), (3);

SELECT * FROM orders;


INSERT INTO order_products(product_id, order_id, quantity)
VALUES
	(1, 1, 5), ---Rashid buy 5 banana in first order
	(10, 1, 2), --- Rashid but 2 RedBulls first order
	(6, 2, 1), --Rashid buy 1 carrot in second order
	(5, 3, 10), ---Makika buy 10 cucumbers in first order
	(4, 4, 55), ---M buy 55 tomatoes in second order
	(7, 5, 15), ---M but 15 cola in third order
	(9, 5, 1) ---M buy 2 moxito in fourth order

SELECT * FROM order_products;


SELECT * FROM profiles;
DELETE FROM users WHERE id=1;


DELETE FROM categories WHERE id=3;





