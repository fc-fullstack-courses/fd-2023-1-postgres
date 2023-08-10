DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS products_to_orders CASCADE;
DROP TABLE IF EXISTS ratings CASCADE;
DROP TABLE IF EXISTS reviews CASCADE;
--
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL CHECK (first_name != ''),
  last_name VARCHAR(64) NOT NULL CHECK (last_name != ''),
  email VARCHAR(128) NOT NULL UNIQUE CONSTRAINT "email must be valid" 
  CHECK (email ~ '.{3,32}@[a-z]{2,8}\.[a-z]{2,8}'),
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
--
CREATE TABLE IF NOT EXISTS orders (
  id SERIAL PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users,
  created_at timestamp NOT NULL DEFAULT current_timestamp
);
--
CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name varchar(300) NOT NULL,
  category varchar(100),
  description text,
  manufacturer text,
  price numeric(9,2) NOT NULL CHECK (price > 0),
  quantity integer NOT NULL CHECK (quantity >= 0)
);
--
CREATE TABLE IF NOT EXISTS products_to_orders (
  product_id integer REFERENCES products,
  order_id integer REFERENCES orders,
  quantity integer NOT NULL CHECK (quantity > 0),
  PRIMARY KEY (product_id, order_id)
);
--
CREATE TABLE IF NOT EXISTS reviews (
  id SERIAL PRIMARY KEY,
  product_id int NOT NULL REFERENCES products,
  user_id int NOT NULL REFERENCES users,
  -- rating_id int NOT NULL UNIQUE REFERENCES ratings,
  body text
);
--
CREATE TABLE IF NOT EXISTS ratings (
  id SERIAL PRIMARY KEY,
  review_id int NOT NULL UNIQUE 
  REFERENCES reviews ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
  rating numeric (2,1)
);
--
ALTER TABLE reviews
ADD COLUMN rating_id int NOT NULL UNIQUE 
REFERENCES ratings ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;
