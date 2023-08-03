-- @block select
-- вернуть все записи из таблицы users
SELECT * FROM users;
-- 
SELECT id, first_name, last_name, email, birthday, is_male
FROM users;
-- Все юзеры с четными айди
SELECT * FROM users
WHERE id % 2 = 0;
-- Найти всех юзеров с нечетными id И при этом мужчин
SELECT * FROM users
WHERE id % 2 != 0 AND is_male;
--
SELECT * FROM users
WHERE first_name = 'Test' OR first_name = 'Test 1' OR first_name = 'Test 0';
--
SELECT * FROM users
WHERE first_name IN ('Test', 'Test 1', 'Test 2');
--
SELECT * FROM users
WHERE id BETWEEN 9 AND 12;