/*

  Нормальные формы:
    - 1
    - 2
    - 3
    - Бойса-Кодда
    - 4
    - 5
    - Доменно-ключевая
    - 6
*/
-- @block 1 NF
-- отношение не в 1 NF
CREATE TABLE workers (
  id INT,
  name TEXT
);
-- отношение в 1 NF
CREATE TABLE workers (
  id INT PRIMARY KEY,
  name TEXT
);