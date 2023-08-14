-- @block данные о пользователях их количество заказов
SELECT u.*, count(*) "orders amount"
FROM users u
JOIN orders ON user_id = u.id
GROUP BY u.id;
-- @block VIEW
CREATE VIEW "users_with_orders_amount" AS (
  SELECT u.*, count(*) "orders amount"
  FROM users u
  JOIN orders ON user_id = u.id
  GROUP BY u.id
);
--
SELECT * FROM users_with_orders_amount
WHERE "orders amount" > 3;
-- @block MATERIALIZED VIEW
CREATE MATERIALIZED VIEW u_w_o_a
AS (
    SELECT u.*, count(*) "orders amount"
  FROM users u
  JOIN orders ON user_id = u.id
  GROUP BY u.id
);
-- обновить материализованое представление
REFRESH MATERIALIZED VIEW u_w_o_a;
--
INSERT INTO orders
(user_id) VALUES
(1),
(1),
(1);
-- @block
SELECT * from users_with_orders_amount
ORDER BY id;
-- @block
SELECT * from u_w_o_a
ORDER BY id;
-- @block
DROP VIEW users_with_orders_amount;
DROP MATERIALIZED VIEW u_w_o_a;