/*
  функции, которые на основании множества записей получают единственный результат

    - avg - ищет среднее арифметическое
    - min
    - max
    - sum () - максимально приближена к arr.reduce в js при работе с числами
    - count  - количество строк (кортежей)
*/

-- @block min height
SELECT min( height ) AS "Min height"
FROM users;

-- @block max height
SELECT max( height ) AS "Max height"
FROM users;

-- @block avg height
SELECT avg( height ) AS "Average height"
FROM users;

-- @block count users
SELECT count(*) FROM users
WHERE height = 0.32;

-- @block bad aggregation usage
SELECT is_male, avg(height) AS "Average height"
FROM users;

-- @block average female height
SELECT avg(height) "Average height"
FROM users
WHERE NOT is_male;

-- @block average male height
SELECT avg(height) "Average height"
FROM users
WHERE is_male;

-- @block average height for both genders
SELECT is_male, avg(height) "Average height"
FROM users
GROUP BY is_male;

-- @block Средний вес пользователей
SELECT avg(weight) FROM users;
-- @block Средний вес мужчин и женщин
SELECT is_male, avg(weight) avg_weight
FROM users
GROUP BY is_male;
-- @block Минимальную баланс пользователей
SELECT min(current_balance) FROM users;
-- @block Минимальную, среднюю и максимальную баланс пользователей ( агрегатные функции друг другу не мешают)
SELECT min(current_balance) min_balance, avg(current_balance) avg_balance, max(current_balance) max_balance
FROM users;
-- @block Количество людей с определенным именем
SELECT count(*) amount FROM users
WHERE first_name = 'Sofia';

-- @block количество уникальных имен
-- SELECT count(first_name)
-- FROM users;
-- 1 обеспечить уникальность имен
-- SELECT first_name FROM users
-- GROUP BY first_name;
-- 2 Выполнить count над столбцом из реузультирующей таблицы из шага 1
SELECT count(first_name) FROM (
  SELECT first_name FROM users
  GROUP BY first_name
) AS unique_names;

--
-- SELECT count(first_name) 
-- FROM users
-- GROUP BY first_name

-- @block количество людей в возрасте 25 - 35 лет
SELECT count(*) FROM users
WHERE EXTRACT( YEAR FROM AGE(birthday)) BETWEEN 25 AND 35;
-- @block посчитать сколько из них какое количество лет (25,26,27)
SELECT EXTRACT( YEAR FROM AGE(birthday)) age,count(*) FROM users
WHERE EXTRACT( YEAR FROM AGE(birthday)) BETWEEN 25 AND 35
GROUP BY EXTRACT( YEAR FROM AGE(birthday));
-- @block как и раньше, но оставить только те возраста, в которых людей больше 3
SELECT EXTRACT( YEAR FROM AGE(birthday)) age,count(*) FROM users
WHERE EXTRACT( YEAR FROM AGE(birthday)) BETWEEN 25 AND 35
GROUP BY EXTRACT( YEAR FROM AGE(birthday))
HAVING count(*) > 3;

-- @block показать имя и количество пользователей с єтим именем. Убрать все записи где количество имен = 1
SELECT first_name, count(first_name) FROM users
GROUP BY first_name
HAVING count(first_name) > 1;

-- @block
-- bad
-- SELECT id, first_name
-- FROM users
-- GROUP BY first_name;
-- good
-- SELECT id, first_name
-- FROM users
-- GROUP BY id;