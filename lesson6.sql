SELECT * FROM users;
SELECT * FROM profiles;

SELECT 
* 
FROM users u
INNER JOIN profiles p
ON u.id = p.user_id;


SELECT 
u.first_name || ' ' || u.last_name AS fullname,
u.username AS Username,
u.id AS "ID",
p.bio AS "BIO",
p.avatar AS "Photo",
p.is_verified AS "Verified"
FROM users u
INNER JOIN profiles p
ON u.id = p.user_id;

SELECT * FROM categories;
SELECT * FROM products;

SELECT 
*
FROM products p
INNER JOIN categories c
ON p.category_id = c.id;


SELECT
p.name AS "название",
p.price AS "цена",
p.category_id AS "категория"
FROM products p 
INNER JOIN categories d
ON p.id = d.id;



---ID заказ. название продукта. кол-во. полное фио
SELECT 
*
FROM orders o
INNER JOIN order_products op ON o.id = op.order_id
INNER JOIN products p ON op.product_id = p.id
INNER JOIN users u ON o.user_id = u.id;


SELECT 
o.id AS "ID Заказа",
p.name AS "Название продукта",
op.quantity AS "Кол-во",
u.first_name || ' ' || u.last_name AS "ФИО"
FROM orders o
INNER JOIN order_products op ON o.id = op.order_id
INNER JOIN products p ON op.product_id = p.id
INNER JOIN users u ON o.user_id = u.id;


.














