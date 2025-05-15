--- КОЛ-ВО
SELECT 	COUNT(*) FROM orders;

--Общая сумма заказов
SELECT SUM(price) FROM orders;

---------------------------------------------------------------------------------------------------------------------------

--- Общая сумма заказов каждого клиента
SELECT
customer_id
FROM orders
GROUP BY customer_id
ORDER BY SUM(price) ASC;

--- Общая сумма заказов каждого клиента
SELECT
customer_id,
SUM(price * quantity)
FROM orders
GROUP BY customer_id
ORDER BY SUM(price) ASC;



SELECT
product,
SUM(quantity)
FROM orders
GROUP BY product
ORDER BY SUM(quantity) ASC;

SELECT
id,
AVG(quantity * price)
FROM orders
GROUP BY id;


SELECT 
order_date,
COUNT(*)
FROM orders
GROUP BY order_date;


SELECT * FROM orders;


SELECT
c.fullname,
SUM(o.price * o.quantity)
FROM orders o
INNER JOIN customer o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY total_spent;



