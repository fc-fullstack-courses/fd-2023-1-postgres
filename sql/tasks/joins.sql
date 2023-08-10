/*
  -- все товары в определенном заказе

  -- количество уникальных товаров определенной категории в определенном заказе

  -- количество отзывов о конкретном товаре с оценкой выше 4

  -- стоимость определенного заказа

  -- Найти товар, который покупали в наибольшем количестве уникальных заказов

  --* данные пользователей (емейл ...) и количество уникальных товаров, которые эти пользователи купили (через подзапросы)

  --** отобразить все заказы, итоговая стоимость которых выше средней стоимости заказа (через подзапросы)
*/

-- @block все товары в определенном заказе
SELECT name, manufacturer, price, pto.quantity
FROM products p
JOIN products_to_orders pto ON product_id = p.id
WHERE order_id = 4;
-- @block количество уникальных товаров определенной категории в определенном заказе
SELECT count(*) "уникальные товары из группы хобби"
FROM products p
JOIN products_to_orders pto ON product_id = p.id
WHERE order_id = 1 AND category = 'hobby';
-- @block количество отзывов о конкретном товаре с оценкой выше 4
SELECT name, count(product_id)
FROM reviews rev
JOIN ratings rat ON review_id = rev.id
JOIN products p ON product_id = p.id
WHERE rating > 4 AND product_id = 192
GROUP BY p.id;
-- @block стоимость определенного заказа
SELECT sum( price * pto.quantity)
FROM products_to_orders pto
JOIN products p ON p.id = product_id
WHERE order_id = 115;
--
SELECT  price, pto.quantity
FROM products_to_orders pto
JOIN products p ON p.id = product_id
WHERE order_id = 115;
-- 93038 + 102220 + 140065
