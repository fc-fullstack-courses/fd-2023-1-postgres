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
  email VARCHAR(128) NOT NULL CONSTRAINT "email must be valid" 
  CHECK (email ~ '[A-Za-z0-9]{3,32}@[a-z]{2,8}\.[a-z]{2,8}'),
  first_name VARCHAR(64) NOT NULL CHECK (first_name != ''),
  last_name VARCHAR(64) NOT NULL,
  -- birthday DATE CHECK (birthday >= '1900-01-01' AND birthday <= current_date),
  birthday DATE CHECK (birthday BETWEEN '1900-01-01' AND current_date),
  is_male BOOLEAN,
  current_balance NUMERIC(10,2) NOT NULL CONSTRAINT "current_balance cant be negative" CHECK (current_balance >= 0),
  CONSTRAINT "Email must be unique" UNIQUE (email) -- ограничение таблицы
);
-- @block delete users table
DROP TABLE users;