---DROP Удаление ПРОЦЕДУРЫ
DROP PROCEDURE add_user(VARCHAR, VARCHAR);

CREATE TABLE balances(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	amount NUMERIC(10, 2) DEFAULT 0
);

---Переводы
CREATE TABLE transactions(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	amount NUMERIC(10, 2) CHECK (amount > 1), 
	sender_id BIGINT REFERENCES balances(id),
	getter_id BIGINT REFERENCES balances(id)
);

--- ADD_BALANCE() процедура


CREATE PROCEDURE add_balance(b_amount NUMERIC(10, 2) DEFAULT 0)
LANGUAGE plpgsql 
AS $$
DECLARE new_user_id BIGINT;
BEGIN 
	INSERT INTO balances(amount)
	VALUES(b_amount);
END;
$$;

CALL add_balance(5000);
CALL add_balance(700);

SELECT * FROM balances;



CREATE PROCEDURE perevod(t_amount NUMERIC(10, 2), t_sender_id BIGINT, t_getter_id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO transactions (amount, sender_id, getter_id)
	VALUES(t_amount, t_sender_id, t_getter_id);
	---Отняли деньги
	UPDATE balances 
	SET amount=amount - t_amount
	WHERE id=t_sender_id;
	---Получение денег
	UPDATE balances 
	SET amount=amount + t_amount
	WHERE id=t_getter_id;
END;
$$;


---ID 1 5000
---ID 2 700

CALL perevod(200, 1, 2);
SELECT * FROM transactions;
SELECT * FROM balances;

