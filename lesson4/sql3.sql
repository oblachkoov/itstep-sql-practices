--Фильтр
SELECT 
* 
FROM posts
WHERE user_id in (1, 4);

--Поиск
SELECT 
*
FROM users
WHERE fname LIKE '%Ki%';

--Сортировки desc and asc
SELECT
*
FROM posts
ORDER BY content DESC;

SELECT
*
FROM posts
ORDER BY content ASC;

--фИЛЬТР И СОРТИРОВКА
SELECT
*
FROM users
WHERE id in (1, 3)
ORDER BY birth_date ASC;

--Объединение двух таблиц
SELECT
*
FROM posts p
INNER JOIN users u ON u.id = p.user_id;


--ВЫВЕСТИ ТОЛЬКО ЭТИ
SELECT
p.id,
p.content,
p.created_at,
p.user_id,
u.fname || ' ' || u.lname AS "ФИО",
u.username
FROM posts p
INNER JOIN users u ON u.id = p.user_id;


--ПЕРЕВОД НА РУССКИЙ
SELECT
p.id AS "ИД",
p.content AS "КОНТЕНТ",
p.created_at AS "ДАТА СОЗДАНИЯ",
p.user_id AS "ИД ПОЛЬЗОВАТЕЛЯ",
u.fname || ' ' || u.lname AS "ФИО",
u.username AS "ИМЯ ПОЛЬЗОВАТЕЛЯ"
FROM posts p
INNER JOIN users u ON u.id = p.user_id --Объудинение
WHERE p.user_id in (1, 2, 4) AND p.id > 5 --Фильтрация
ORDER BY p.created_at ASC; -- Сортировка