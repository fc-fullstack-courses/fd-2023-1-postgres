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
-- @block 2 NF
-- отношение не в 2 NF
CREATE TABLE teachers_to_course (
  teacher_id INT,
  course TEXT,
  teachers_birthday DATE,
  PRIMARY KEY (teacher_id, course)
);
--  отношение в 2 NF
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teachers_birthday DATE
);
--
CREATE TABLE teachers_to_course (
  teacher_id INT REFERENCES teachers,
  course TEXT,
  PRIMARY KEY (teacher_id, course)
);
