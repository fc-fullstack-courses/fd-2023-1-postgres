-- @block базовый приемер. Получить емейлы всех ползователей с заказами
SELECT email, orders.id FROM users, orders
WHERE user_id = users.id;
-- @block JOIN example
SELECT email, orders.id
FROM users
JOIN orders ON user_id = users.id;
-- @block JOIN example 2
SELECT email, orders.id
FROM orders
JOIN users ON user_id = users.id;
-- @block все продукты с отзывами и оценками
SELECT name, body, rating 
FROM products
JOIN reviews ON product_id = products.id
JOIN ratings ON rating_id = ratings.id;
-- @block данные о всех заказах и входящих в них продуктах
SELECT name, price, products_to_orders.quantity, orders.id FROM orders
JOIN products_to_orders ON order_id = orders.id
JOIN products ON product_id = products.id;