-- @block tables
CREATE TABLE table_a (
  x VARCHAR(4),
  y int
);
--
CREATE TABLE table_b (
  x VARCHAR(4),
  v BOOLEAN
);
-- @block inserts
INSERT INTO table_a
(x, y) VALUES
('AAAA', 1),
('AAAB', 2),
('AAAC', 3),
('AAAD', 4),
('AABA', 5),
('AABB', 6),
('AABC', 7),
('AABD', 8),
('ABAA', 9),
('ABAB', 10),
('ABCD', 11),
('DCBA', 12);
--
INSERT INTO table_b
(x , v) VALUES
('AAAA', true),
('AAAB', true),
('ABAA', false),
('ABBB', true),
('DDDD', false),
('DACD', false),
('BCBC', false),
('AABB', false);
-- @block get data from tables
-- SELECT * FROM table_a;
--
-- SELECT * FROM table_b;
--
SELECT * FROM table_a, table_b;
-- @block union - обьединение запросов
SELECT x FROM table_a
UNION
SELECT x FROM table_b;
-- @block intersect - общие записи из обоих запросов (пересечение запросов)
SELECT x FROM table_b
INTERSECT
SELECT x FROM table_a;
-- @block except - возвращает все результаты первого запроса, отсутствующее во втором
SELECT x FROM table_b
EXCEPT
SELECT x FROM table_a;
-- @block найти все айдишники пользователей, которые совершали заказы
SELECT user_id FROM orders
INTERSECT
SELECT id FROM users;
-- @block найти все айдишники пользователей, которые не делали заказов
SELECT id FROM users
EXCEPT
SELECT user_id FROM orders;