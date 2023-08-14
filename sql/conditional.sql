-- Условные выражения
-- @block получить все данные о пользователях 
SELECT * FROM users;
-- @block получить все данные о пользователях, вместо поля is_male вернуть поле gender
SELECT id, first_name, last_name, email,
CASE
  WHEN is_male = true THEN 'male'
  WHEN is_male = false THEN 'female'
  ELSE 'unknown gender'
END AS gender
FROM users;
--
-- UPDATE users SET is_male = NULL WHERE id = 2;
-- @block показать количество мужчин и женщин
SELECT CASE
  WHEN is_male = true THEN 'male'
  WHEN is_male = FALSE THEN 'female'
  ELSE 'unknown gender'
END gender,
count (*)
FROM users
GROUP BY gender;
-- @block в каком сезоне пользователи родились
SELECT id, birthday, 
CASE extract( month from birthday)
  WHEN 1 THEN 'Winter'
  WHEN 2 THEN 'Winter'
  WHEN 3 THEN 'Spring'
  WHEN 4 THEN 'Spring'
  WHEN 5 THEN 'Spring'
  WHEN 6 THEN 'Summer'
  WHEN 7 THEN 'Summer'
  WHEN 8 THEN 'Summer'
  WHEN 9 THEN 'Autumn'
  WHEN 10 THEN 'Autumn'
  WHEN 11 THEN 'Autumn'
  WHEN 12 THEN 'Winter'
END "season of birth"
FROM users;
-- @block покажите часть данных о пользователях, также отобразите столбец возрастной группы
/*
  люди до 25 лет - молодые
  от 25 до 55 - средний возраст
  все старше - пожилые
*/
SELECT id, email, birthday,
EXTRACT( YEAR from age(birthday)) age,
CASE
  WHEN EXTRACT( YEAR from age(birthday)) < 25 THEN 'young'
  WHEN EXTRACT( YEAR from age(birthday)) < 55 THEN 'middle-age'
  WHEN EXTRACT( YEAR from age(birthday)) >= 55 THEN 'old'
END "age group"
FROM users;
-- @block отобразить продукты со столбцом brand
/*
  Google -> Pixel
  Apple -> iSomething
  Samsung -> Galaxy
  остальное -> 'not important'
*/
SELECT id, name, manufacturer,
CASE manufacturer
  WHEN 'Google' THEN 'Pixel'
  WHEN 'Apple' THEN 'iSomething'
  WHEN 'Samsung' THEN 'Galaxy'
  ELSE 'not important'
END brand
FROM products;
-- @block показать все товары со столбцом ценовой диапазон
/*
  цена товара ниже средней - дешево
  цена товара выше средней - дорого
*/
SELECT id, name, price,
CASE
  WHEN price <= (SELECT avg(price) FROM products) THEN 'дешево'
  WHEN price > (SELECT avg(price) FROM products) THEN 'дорого'
END "price bracket"
FROM products;
--
SELECT id, name, price,
CASE price <= (SELECT avg(price) FROM products)
  WHEN true THEN 'дешево'
  ELSE 'дорого'
END "price bracket"
FROM products;
--
WITH avg_product_price AS (
  SELECT avg(price) FROM products
)
SELECT id, name, price,
CASE price <= (SELECT * FROM avg_product_price)
  WHEN true THEN 'дешево'
  ELSE 'дорого'
END "price bracket"
FROM products;
-- @block COALESCE
SELECT COALESCE(NULL, 100);
SELECT COALESCE('test', NULL);
SELECT COALESCE(NULL, 'value', NULL);
--
UPDATE products SET description = NULL WHERE id BETWEEN 1 AND 10;
--
SELECT * FROM products
ORDER BY id ASC;
-- @block
SELECT id, name, category, COALESCE(description, 'Description not provided') "description" ,manufacturer, name,price, quantity FROM products
ORDER BY id ASC;
-- @block NULLIF
SELECT NULLIF(50,50); -- null
SELECT NULLIF(NULL ,NULL); -- null
SELECT NULLIF(10,100); -- 10
SELECT NULLIF('test', 'test1'); -- test
SELECT NULLIF (NULL, 'test1'); -- null
-- @block COALESCE reverse
SELECT NULLIF(description, 'Description not provided') "real description" ,* FROM (
  SELECT id, name, category, COALESCE(description, 'Description not provided') "description" ,manufacturer, name,price, quantity FROM products
ORDER BY id ASC
) coalesce_res;