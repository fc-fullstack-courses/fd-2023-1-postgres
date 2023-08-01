-- Комментарий
/*
многострочный комментарий

  наименование в SQL
  обычно делаем в snake_case
  стараемся не использовать ключевые слова в качестве идентификаторов
*/
-- @block create users table
CREATE TABLE table();
-- CREATE
-- TABLE
-- users();
-- CREATE, TABLE - ключевые слова
-- users - идентификатор (название переменной)
-- "users" - идентификатор в кавычках (обязательно двойные)
-- @block delete users table
DROP TABLE users_data;
-- @block constants
'some text' -- строковая константа
'user''s grant' -- строка с экранированным '
--
'part '
'of text'
--
'part of text'
--
$$user's grant$$ '-- уникально для PostgreSQL
-- Приведение типов
-- тип_данных 'строка'
-- 'строка'::тип_данных Postgres olny
-- CAST ('строка' AS тип_данных)