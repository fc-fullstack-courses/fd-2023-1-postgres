/*
    Типы связей в БД

      Количество сущностей в связи
        - унарные (ссылка на одну и ту же таблицу)
        - бинарные (две таблицы в связи, самый распространенный случай)
        - тернарные (три таблицы в связи, довольно редкие, часто можно привести к бинарным связям)

      Тип связи:
        - 1 : 1 (одна запись из одной таблицы соответвуэт одной записи из другой, гражданин - идентификационный код, тренер - команда, водитель - машина)
        - 1 : m (наиболее распростаненная, преподователь и группы, автор и книги, тимлид - проекты )
        - n : m (чаты - участники, заказы - товары )

      По обязательности:
        - жесткие (1, в другой таблице обязательно есть запись с которо вяжемся)
        - нежесткие (0, в другой таблице наличие записи не обязательно)

        тренер - команда ( 0 : 1)
*/
-- @block orders table (1 : m)
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
  id SERIAL PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users (id),
  created_at timestamp NOT NULL DEFAULT current_timestamp
);
-- оформление заказа
INSERT INTO orders 
(user_id)
VALUES
(5000),
(7),
(9),
(5);
-- @block products table
DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name varchar(300) NOT NULL,
  category varchar(100),
  description text,
  price numeric(9,2) NOT NULL CHECK (price > 0),
  quantity integer NOT NULL CHECK (quantity >= 0)
);
-- вставка товаров
INSERT INTO products
(name, category, description, price, quantity) VALUES
('Bike', 'hobby', 'Cool bike description', 10000, 138),
('Notebook', 'electronics', 'Powerfull notebook description', 64999, 250),
('UAV', 'hobby', 'It flies and makes boom', 30000, 15);
-- @block products_to_orders (n : m)
CREATE TABLE IF NOT EXISTS products_to_orders (
  product_id integer REFERENCES products (id),
  order_id integer REFERENCES orders (id),
  quantity integer NOT NULL CHECK (quantity > 0),
  PRIMARY KEY (product_id, order_id)
);
-- вставка товаров в заказы
INSERT INTO products_to_orders
(product_id, order_id, quantity) VALUES
(1, 2, 1),
(1,1,3),
(2,3,5),
(3,4,10);
