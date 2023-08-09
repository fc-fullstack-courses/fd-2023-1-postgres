-- @block базовый приемер. Получить емейлы всех ползователей с заказами
SELECT email, orders.id FROM users, orders
WHERE user_id = users.id;