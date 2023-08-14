-- выражения подзапросов
-- @block все пользователи, которые делали заказы
SELECT users.*
FROM users
JOIN orders ON user_id = users.id
GROUP BY users.id;
-- @block IN
SELECT *
FROM users
WHERE id IN (SELECT user_id FROM orders);
-- @block все пользователи, которые не делали заказы
SELECT *
FROM users
WHERE id NOT IN (SELECT user_id FROM orders);
-- @block EXISTS
SELECT *
FROM users
WHERE id = 150;
--
SELECT EXISTS(SELECT * FROM users WHERE users.id = 1500);
--
SELECT *
FROM users
WHERE EXISTS (
  SELECT *
  FROM orders
  WHERE orders.user_id = users.id
);
-- @block ANY / SOME
SELECT * 
FROM users
WHERE id = ANY(SELECT user_id FROM orders);
-- @block ALL
SELECT *
FROM users
WHERE id != ALL (SELECT user_id FROM orders);
