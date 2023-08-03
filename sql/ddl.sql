-- опредлеяем структуру данных
-- @block create table ib db
/*
CREATE TABLE table_name(
  first_column data_type_1,
  second_column data_type_2
);
*/
CREATE TABLE users(
  -- id UUID NOT NULL UNIQUE DEFAULT gen_random_uuid(),
  id SERIAL PRIMARY KEY,
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
-- ALTER TABLE
-- @block add column
ALTER TABLE users
ADD COLUMN height NUMERIC(3,2) CHECK(height BETWEEN 0.3 AND 3);
-- @block add columns
ALTER TABLE users
ADD COLUMN weight NUMERIC(5,2) CHECK(weight BETWEEN 0.5 AND 800),
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp;
-- @block remove column
ALTER TABLE users
DROP COLUMN current_balance;
-- @block cascade remove
ALTER TABLE users
DROP COLUMN updated_at CASCADE;
-- @block add constraint
ALTER TABLE users
-- ADD CHECK (created_at <= current_timestamp);
ADD CONSTRAINT "correct_created_at" CHECK (created_at <= current_timestamp);
-- NOT NULL
ALTER TABLE users
ALTER COLUMN birthday
SET NOT NULL;
-- @block delete constraint
ALTER TABLE users
DROP CONSTRAINT "correct_created_at";
-- NOT NULL
ALTER TABLE users
ALTER COLUMN last_name
DROP NOT NULL;
-- @block "change" constraint
ALTER TABLE users
DROP CONSTRAINT users_first_name_check,
ADD CHECK (first_name ~ '.{1,64}');
-- @block change default value
ALTER TABLE users
ALTER COLUMN is_male
SET DEFAULT true;
-- @block "delete" default value
ALTER TABLE users
ALTER COLUMN is_male
DROP DEFAULT;
-- @block change column type
ALTER TABLE users
ALTER COLUMN first_name
TYPE VARCHAR(50);