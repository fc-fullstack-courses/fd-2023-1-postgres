-- опредлеяем структуру данных
-- @block create table ib db
/*
CREATE TABLE table_name(
  first_column data_type_1,
  second_column data_type_2
);
*/
CREATE TABLE users(
  -- email VARCHAR(128) NOT NULL CONSTRAINT "Email must be unique" UNIQUE, -- ограничение столбца
  email VARCHAR(128) NOT NULL,
  first_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  birthday DATE,
  is_male BOOLEAN,
  current_balance NUMERIC(10,2) NOT NULL,
  CONSTRAINT "Email must be unique" UNIQUE (email) -- ограничение таблицы
);
-- @block delete users table
DROP TABLE users;