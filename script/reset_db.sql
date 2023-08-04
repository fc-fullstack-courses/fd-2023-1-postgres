DROP TABLE IF EXISTS users;
--
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL CHECK (first_name != ''),
  last_name VARCHAR(64) NOT NULL CHECK (last_name != ''),
  email VARCHAR(128) NOT NULL UNIQUE CONSTRAINT "email must be valid" 
  CHECK (email ~ '[A-Za-z0-9]{3,32}@[a-z]{2,8}\.[a-z]{2,8}'),
  birthday DATE CHECK (birthday BETWEEN '1900-01-01' AND current_date),
  is_male BOOLEAN,
  current_balance NUMERIC(10,2) NOT NULL DEFAULT 0 CONSTRAINT "current_balance cant be negative" CHECK (current_balance >= 0),
  height NUMERIC(5, 2) DEFAULT 1.65 CONSTRAINT "height error" CHECK (
    height BETWEEN 0.3 AND 3
  ),
  weight NUMERIC(5,2) CONSTRAINT "weight error" CHECK (weight BETWEEN 0.5 AND 800),
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);