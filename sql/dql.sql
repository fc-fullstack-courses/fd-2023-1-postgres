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
-- @block псевдонимы
SELECT id, first_name AS "имя", last_name фамилия, email "Электронная почта", birthday, is_male
FROM users;
-- @block пользовательские столбцы
SELECT id, first_name || ' ' || last_name AS "Full name"
FROM users;
-- @block пример подзапроса
SELECT * FROM (
  SELECT id, first_name || ' ' || last_name AS "Full name"
  FROM users
) AS users_with_full_names
WHERE char_length("Full name") > 15;
/*
    Поиск по шаблону
*/
-- @block LIKE pattern
-- _ - любой 1 символ (? в глоббинге)
-- % - любое количество любых символов (* в глоббинге)
SELECT * FROM users
WHERE first_name LIKE 'S%';
-- все имена, заканчивающиеся на s
SELECT * FROM users
WHERE first_name LIKE '%s';
-- все имена, в середине которых есть буква о
SELECT * FROM users
WHERE first_name LIKE '%_o_%';
-- ILIKE - регистронезавесимая версия LIKE
SELECT * FROM users
WHERE first_name ILIKE '%s%';
-- @block регулярки в SQL
/*
  ~ - с учетом регистра
  ~* - без учета регистра

  !~ - несооответствие с учетом регистра
  !~* - несооответствие без учета регистра
*/
SELECT * FROM users
WHERE first_name !~* '^s.{0,}';